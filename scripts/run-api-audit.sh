#!/usr/bin/env bash
set -euo pipefail

# Objetivo: validar contrato e executar ZAP Baseline passivo contra API/aplicacao local autorizada.
# Pre-requisitos: Schemathesis e/ou Docker com imagem ZAP ja presente localmente.
# Seguranca: nao aceita headers, cookies, autenticacao, URL externa, HAR/VCR nem scan ativo.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
TARGET_URL="${TARGET_URL:-http://127.0.0.1:8000}"
API_SCHEMA="${API_SCHEMA:-$ROOT_DIR/openapi.yaml}"
API_TOOLS="${API_TOOLS:-schemathesis}"
ZAP_IMAGE="${ZAP_IMAGE:-ghcr.io/zaproxy/zaproxy:stable}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RAW_DIR="$ROOT_DIR/reports/raw/api-$RUN_ID"
SUMMARY="$ROOT_DIR/reports/sanitized/api-audit-$RUN_ID.md"

fail(){ printf 'Erro: %s\n' "$1" >&2; exit 2; }
require_cmd(){ command -v "$1" >/dev/null 2>&1 || fail "ferramenta '$1' nao instalada; valide a instalacao na documentacao oficial."; }
selected(){ [[ ",$API_TOOLS," == *",$1,"* ]]; }
validate_tools(){ local item; IFS=',' read -r -a items <<< "$API_TOOLS"; for item in "${items[@]}"; do [[ ",schemathesis,zap," == *",$item,"* ]] || fail "API_TOOLS contem valor nao permitido: $item"; done; }
validate_url(){ [[ "$1" =~ ^http://(127\.0\.0\.1|localhost)(:[0-9]{1,5})?(/[A-Za-z0-9._~!$\&\(\)*+,;=:@%/-]*)?$ ]] || fail "TARGET_URL deve ser loopback HTTP, sem query, fragmento ou credenciais."; }
record(){ printf '| `%s` | %s | `%s` |\n' "$1" "$2" "$3" >> "$SUMMARY"; }
run_capture(){ local n="$1" raw="$2" rc=0; shift 2; "$@" >"$raw" 2>&1 || rc=$?; if ((rc==0)); then record "$n" SUCESSO "${raw#$ROOT_DIR/}"; else record "$n" "ALERTA_OU_FALHA (exit $rc)" "${raw#$ROOT_DIR/}"; fi; return "$rc"; }

validate_url "$TARGET_URL"
validate_tools
if selected schemathesis; then
  require_cmd st
  [[ -f "$API_SCHEMA" ]] || fail "schema local inexistente: $API_SCHEMA"
  API_SCHEMA="$(cd "$(dirname "$API_SCHEMA")" && pwd -P)/$(basename "$API_SCHEMA")"
  case "$API_SCHEMA" in "$ROOT_DIR"/*) ;; *) fail "API_SCHEMA deve permanecer dentro do repositorio." ;; esac
fi
if selected zap; then require_cmd docker; [[ "$ZAP_IMAGE" =~ ^[a-zA-Z0-9][a-zA-Z0-9._/:@-]{0,255}$ ]] || fail "ZAP_IMAGE invalida."; docker image inspect "$ZAP_IMAGE" >/dev/null 2>&1 || fail "imagem ZAP ausente localmente; valide digest/origem e faca o pull manualmente com consentimento."; fi

mkdir -p -- "$RAW_DIR" "$(dirname "$SUMMARY")"
printf '# Resumo sanitizado - API\n\n- Execucao UTC: `%s`\n- Alvo: loopback local controlado\n- Dados: somente fixtures ficticias em ambiente efemero\n\n| Ferramenta | Status | Relatorio cru local |\n|---|---|---|\n' "$RUN_ID" > "$SUMMARY"
overall=0
if selected schemathesis; then run_capture schemathesis "$RAW_DIR/schemathesis.log" st run "$API_SCHEMA" --url "$TARGET_URL" --checks all --phases examples,coverage --generation-deterministic --request-timeout 5 --max-examples 10 --report junit --report-dir "$RAW_DIR/schemathesis-report" || overall=1; fi
if selected zap; then run_capture zap-baseline "$RAW_DIR/zap.log" docker run --rm --network host -v "$RAW_DIR:/zap/wrk:rw" -t "$ZAP_IMAGE" zap-baseline.py -t "$TARGET_URL" -J zap-baseline.json -r zap-baseline.html -s -m 1 -T 3 || overall=1; fi
printf '\n## Limites e proximos passos\n\n- Schemathesis pode enviar requests que alteram estado; use somente ambiente efemero e fixtures descartaveis.\n- As fases padrao deste script evitam fuzzing continuo e nao geram HAR/VCR, headers ou credenciais.\n- ZAP Baseline usa spider e analise passiva; nao e scan ativo nem prova ausencia de vulnerabilidades.\n- Revise efeitos colaterais, contrato incompleto, falsos positivos e isolamento antes de classificar findings.\n' >> "$SUMMARY"
printf 'Auditoria de API concluida. Revise %s; nao publique requests/responses crus.\n' "${SUMMARY#$ROOT_DIR/}"
exit "$overall"
