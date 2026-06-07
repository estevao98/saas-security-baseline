#!/usr/bin/env bash
set -euo pipefail

# Objetivo: executar verificacoes automatizadas de acessibilidade em aplicacao local/efemera.
# Pre-requisitos: Pa11y e/ou Lighthouse, navegador compativel e servico local iniciado.
# Seguranca: somente loopback HTTP e aceito; nao use sessao, cookie ou dado pessoal real.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
TARGET_URL="${TARGET_URL:-http://127.0.0.1:3000}"
ACCESSIBILITY_TOOLS="${ACCESSIBILITY_TOOLS:-pa11y,lighthouse}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RAW_DIR="$ROOT_DIR/reports/raw/accessibility-$RUN_ID"
SUMMARY="$ROOT_DIR/reports/sanitized/accessibility-audit-$RUN_ID.md"

fail(){ printf 'Erro: %s\n' "$1" >&2; exit 2; }
require_cmd(){ command -v "$1" >/dev/null 2>&1 || fail "ferramenta '$1' nao instalada; valide a versao e os pre-requisitos na documentacao oficial."; }
selected(){ [[ ",$ACCESSIBILITY_TOOLS," == *",$1,"* ]]; }
validate_tools(){ local item; IFS=',' read -r -a items <<< "$ACCESSIBILITY_TOOLS"; for item in "${items[@]}"; do [[ ",pa11y,lighthouse," == *",$item,"* ]] || fail "ACCESSIBILITY_TOOLS contem valor nao permitido: $item"; done; }
validate_url(){ [[ "$1" =~ ^http://(127\.0\.0\.1|localhost)(:[0-9]{1,5})?(/[A-Za-z0-9._~!$\&\(\)*+,;=:@%/-]*)?$ ]] || fail "TARGET_URL deve usar HTTP em 127.0.0.1 ou localhost, sem query, fragmento, credenciais ou host arbitrario."; }
record(){ printf '| `%s` | %s | `%s` |\n' "$1" "$2" "$3" >> "$SUMMARY"; }
run_capture(){ local n="$1" raw="$2" rc=0; shift 2; "$@" >"$raw" 2>&1 || rc=$?; if ((rc==0)); then record "$n" SUCESSO "${raw#$ROOT_DIR/}"; else record "$n" "ALERTA_OU_FALHA (exit $rc)" "${raw#$ROOT_DIR/}"; fi; return "$rc"; }

validate_url "$TARGET_URL"
validate_tools
selected pa11y && require_cmd pa11y
selected lighthouse && require_cmd lighthouse
mkdir -p -- "$RAW_DIR" "$(dirname "$SUMMARY")"
printf '# Resumo sanitizado - acessibilidade\n\n- Execucao UTC: `%s`\n- Alvo permitido: loopback local\n- Conformidade WCAG: nao determinada automaticamente\n\n| Ferramenta | Status | Relatorio cru local |\n|---|---|---|\n' "$RUN_ID" > "$SUMMARY"
overall=0
if selected pa11y; then
  rc=0
  pa11y --reporter json --standard WCAG2AA "$TARGET_URL" >"$RAW_DIR/pa11y.json" 2>"$RAW_DIR/pa11y.log" || rc=$?
  if ((rc==0)); then record pa11y SUCESSO "${RAW_DIR#$ROOT_DIR/}/pa11y.json"; else record pa11y "ALERTA_OU_FALHA (exit $rc)" "${RAW_DIR#$ROOT_DIR/}/pa11y.json"; overall=1; fi
fi
if selected lighthouse; then run_capture lighthouse "$RAW_DIR/lighthouse.log" lighthouse "$TARGET_URL" --only-categories=accessibility --output json --output-path "$RAW_DIR/lighthouse.json" --quiet --chrome-flags='--headless' || overall=1; fi
printf '\n## Limites e proximos passos\n\n- Automacao cobre somente parte das barreiras e pode produzir falsos positivos/negativos.\n- Execute revisao humana de teclado, foco, zoom/reflow, leitor de tela, conteudo e fluxos criticos.\n- Score agregado do Lighthouse nao prova conformidade WCAG 2.2 AA.\n- Revise DOM, seletores, screenshots e conteudo antes de produzir qualquer resumo versionavel.\n' >> "$SUMMARY"
printf 'Auditoria de acessibilidade concluida. Revise %s e complemente com testes manuais.\n' "${SUMMARY#$ROOT_DIR/}"
exit "$overall"
