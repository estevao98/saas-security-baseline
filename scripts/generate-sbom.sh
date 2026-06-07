#!/usr/bin/env bash
set -euo pipefail

# Objetivo: gerar SBOM local em CycloneDX JSON e SPDX JSON com Syft.
# Pre-requisitos: Syft instalado e alvo local dentro do repositorio ou imagem local existente.
# Seguranca: SBOM revela componentes e arquitetura; os arquivos crus nao devem ser commitados.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
SBOM_TARGET="${SBOM_TARGET:-$ROOT_DIR}"
SBOM_KIND="${SBOM_KIND:-directory}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RAW_DIR="$ROOT_DIR/reports/raw/sbom-$RUN_ID"
SUMMARY="$ROOT_DIR/reports/sanitized/sbom-summary-$RUN_ID.md"

fail(){ printf 'Erro: %s\n' "$1" >&2; exit 2; }
command -v syft >/dev/null 2>&1 || fail "ferramenta 'syft' nao instalada; valide a instalacao e integridade na documentacao oficial."
if [[ "$SBOM_KIND" == "directory" ]]; then
  SBOM_TARGET="$(cd "$SBOM_TARGET" 2>/dev/null && pwd -P)" || fail "SBOM_TARGET inexistente."
  case "$SBOM_TARGET" in "$ROOT_DIR"|"$ROOT_DIR"/*) ;; *) fail "o alvo directory deve permanecer dentro do repositorio." ;; esac
elif [[ "$SBOM_KIND" == "image" ]]; then
  [[ "$SBOM_TARGET" =~ ^[a-zA-Z0-9][a-zA-Z0-9._/:@-]{0,255}$ ]] || fail "referencia de imagem invalida."
  command -v docker >/dev/null 2>&1 || fail "Docker e necessario para confirmar a imagem local."
  docker image inspect "$SBOM_TARGET" >/dev/null 2>&1 || fail "imagem ausente localmente; o script nao faz pull."
else fail "SBOM_KIND deve ser 'directory' ou 'image'."; fi

mkdir -p -- "$RAW_DIR" "$(dirname "$SUMMARY")"
rc=0
syft "$SBOM_TARGET" -o "cyclonedx-json=$RAW_DIR/sbom.cdx.json" -o "spdx-json=$RAW_DIR/sbom.spdx.json" >"$RAW_DIR/syft.log" 2>&1 || rc=$?
status="SUCESSO"; ((rc==0)) || status="ALERTA_OU_FALHA (exit $rc)"
printf '# Resumo sanitizado - SBOM\n\n- Execucao UTC: `%s`\n- Gerador: `Syft`\n- Tipo de alvo: `%s`\n- Status: **%s**\n- Crus locais: `%s` e `%s`\n\n## Limites e proximos passos\n\n- O SBOM e inventario, nao prova ausencia de vulnerabilidades, licencas compativeis ou integridade.\n- Revise componentes internos, paths, fornecedores e metadados antes de compartilhar.\n- Valide o schema CycloneDX/SPDX exigido pelo consumidor e associe o SBOM ao digest/release correto.\n' "$RUN_ID" "$SBOM_KIND" "$status" "${RAW_DIR#$ROOT_DIR/}/sbom.cdx.json" "${RAW_DIR#$ROOT_DIR/}/sbom.spdx.json" > "$SUMMARY"
printf 'SBOM gerado. Revise %s e mantenha os documentos completos fora do Git.\n' "${SUMMARY#$ROOT_DIR/}"
exit "$rc"
