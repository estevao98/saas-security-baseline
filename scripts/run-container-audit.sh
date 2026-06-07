#!/usr/bin/env bash
set -euo pipefail

# Objetivo: verificar filesystem, imagem local e IaC sem executar containers do produto.
# Pre-requisitos: Trivy, Grype e/ou Checkov selecionados em CONTAINER_TOOLS.
# Seguranca: atualizacoes de bases sao bloqueadas por padrao; nenhuma imagem e baixada automaticamente.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
TARGET="${CONTAINER_TARGET:-$ROOT_DIR}"
IMAGE_REF="${IMAGE_REF:-}"
CONTAINER_TOOLS="${CONTAINER_TOOLS:-trivy,checkov}"
ALLOW_NETWORK="${ALLOW_NETWORK:-0}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RAW_DIR="$ROOT_DIR/reports/raw/container-iac-$RUN_ID"
SUMMARY="$ROOT_DIR/reports/sanitized/container-iac-audit-$RUN_ID.md"

fail(){ printf 'Erro: %s\n' "$1" >&2; exit 2; }
require_cmd(){ command -v "$1" >/dev/null 2>&1 || fail "ferramenta '$1' nao instalada; valide a instalacao na documentacao oficial."; }
selected(){ [[ ",$CONTAINER_TOOLS," == *",$1,"* ]]; }
validate_tools(){ local item; IFS=',' read -r -a items <<< "$CONTAINER_TOOLS"; for item in "${items[@]}"; do [[ ",trivy,grype,checkov," == *",$item,"* ]] || fail "CONTAINER_TOOLS contem valor nao permitido: $item"; done; }
record(){ printf '| `%s` | %s | `%s` |\n' "$1" "$2" "$3" >> "$SUMMARY"; }
run_capture(){ local n="$1" raw="$2" rc=0; shift 2; "$@" >"$raw" 2>&1 || rc=$?; if ((rc==0)); then record "$n" SUCESSO "${raw#$ROOT_DIR/}"; else record "$n" "ALERTA_OU_FALHA (exit $rc)" "${raw#$ROOT_DIR/}"; fi; return "$rc"; }
TARGET="$(cd "$TARGET" 2>/dev/null && pwd -P)" || fail "CONTAINER_TARGET inexistente."
case "$TARGET" in "$ROOT_DIR"|"$ROOT_DIR"/*) ;; *) fail "CONTAINER_TARGET deve permanecer dentro do repositorio." ;; esac
[[ -z "$IMAGE_REF" || "$IMAGE_REF" =~ ^[a-zA-Z0-9][a-zA-Z0-9._/:@-]{0,255}$ ]] || fail "IMAGE_REF invalida. Use apenas referencia local explicita, sem opcoes shell."
validate_tools
selected trivy && require_cmd trivy
selected grype && require_cmd grype
selected checkov && require_cmd checkov
if [[ -n "$IMAGE_REF" ]]; then require_cmd docker; docker image inspect "$IMAGE_REF" >/dev/null 2>&1 || fail "a imagem nao existe localmente; o script nao faz pull automatico."; fi

mkdir -p -- "$RAW_DIR" "$(dirname "$SUMMARY")"
printf '# Resumo sanitizado - containers e IaC\n\n- Execucao UTC: `%s`\n- Escopo: arquivos locais%s\n- Rede autorizada: `%s`\n\n| Verificacao | Status | Relatorio cru local |\n|---|---|---|\n' "$RUN_ID" "${IMAGE_REF:+ e imagem local informada}" "$ALLOW_NETWORK" > "$SUMMARY"
overall=0
if selected trivy; then
  trivy_flags=(--format json --output "$RAW_DIR/trivy-fs.json")
  [[ "$ALLOW_NETWORK" == "1" ]] || trivy_flags+=(--skip-db-update --skip-check-update)
  run_capture trivy-fs "$RAW_DIR/trivy-fs.log" trivy fs "${trivy_flags[@]}" --scanners vuln,misconfig,secret "$TARGET" || overall=1
  config_flags=(--format json --output "$RAW_DIR/trivy-config.json")
  [[ "$ALLOW_NETWORK" == "1" ]] || config_flags+=(--skip-check-update)
  run_capture trivy-config "$RAW_DIR/trivy-config.log" trivy config "${config_flags[@]}" "$TARGET" || overall=1
  if [[ -n "$IMAGE_REF" ]]; then image_flags=(--format json --output "$RAW_DIR/trivy-image.json"); [[ "$ALLOW_NETWORK" == "1" ]] || image_flags+=(--skip-db-update --skip-check-update); run_capture trivy-image "$RAW_DIR/trivy-image.log" trivy image "${image_flags[@]}" "$IMAGE_REF" || overall=1; fi
fi
if selected grype; then
  [[ -n "$IMAGE_REF" ]] || fail "Grype foi selecionado, mas IMAGE_REF nao foi definida."
  rc=0
  if [[ "$ALLOW_NETWORK" == "1" ]]; then grype "$IMAGE_REF" -o json >"$RAW_DIR/grype.json" 2>"$RAW_DIR/grype.log" || rc=$?
  else env GRYPE_DB_AUTO_UPDATE=false grype "$IMAGE_REF" -o json >"$RAW_DIR/grype.json" 2>"$RAW_DIR/grype.log" || rc=$?; fi
  if ((rc==0)); then record grype SUCESSO "${RAW_DIR#$ROOT_DIR/}/grype.json"; else record grype "ALERTA_OU_FALHA (exit $rc)" "${RAW_DIR#$ROOT_DIR/}/grype.json"; overall=1; fi
fi
if selected checkov; then
  rc=0
  checkov -d "$TARGET" -o json --skip-download --quiet --compact >"$RAW_DIR/checkov.json" 2>"$RAW_DIR/checkov.log" || rc=$?
  if ((rc==0)); then record checkov SUCESSO "${RAW_DIR#$ROOT_DIR/}/checkov.json"; else record checkov "ALERTA_OU_FALHA (exit $rc)" "${RAW_DIR#$ROOT_DIR/}/checkov.json"; overall=1; fi
fi
printf '\n## Limites e proximos passos\n\n- Bases locais desatualizadas podem omitir vulnerabilidades; rede autorizada pode baixar bases e checks.\n- Matching de pacote/CPE e regras IaC exigem triagem no contexto do build e runtime.\n- Confirme digest, origem da imagem, reachability, excecoes e severidade antes de bloquear release.\n' >> "$SUMMARY"
printf 'Auditoria de containers/IaC concluida. Revise %s.\n' "${SUMMARY#$ROOT_DIR/}"
exit "$overall"
