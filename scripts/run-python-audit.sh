#!/usr/bin/env bash
set -euo pipefail

# Objetivo: executar SAST e SCA Python sem alterar o codigo do produto.
# Pre-requisitos: Bash e as ferramentas selecionadas em PYTHON_TOOLS.
# Seguranca: saidas detalhadas ficam somente em reports/raw/ e nunca sao exibidas.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
TARGET="${PYTHON_TARGET:-$ROOT_DIR}"
REQUIREMENTS_FILE="${REQUIREMENTS_FILE:-$ROOT_DIR/requirements.txt}"
PYTHON_TOOLS="${PYTHON_TOOLS:-bandit}"
SEMGREP_CONFIG="${SEMGREP_CONFIG:-}"
ALLOW_NETWORK="${ALLOW_NETWORK:-0}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RAW_DIR="$ROOT_DIR/reports/raw/python-$RUN_ID"
SUMMARY="$ROOT_DIR/reports/sanitized/python-audit-$RUN_ID.md"

fail() { printf 'Erro: %s\n' "$1" >&2; exit 2; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || fail "ferramenta '$1' nao instalada; valide a instalacao na documentacao oficial."; }
inside_repo() {
  local resolved
  [[ -e "$1" ]] || fail "caminho inexistente: $1"
  resolved="$(cd "$(dirname "$1")" && pwd -P)/$(basename "$1")"
  case "$resolved" in "$ROOT_DIR"|"$ROOT_DIR"/*) printf '%s\n' "$resolved" ;; *) fail "o caminho deve permanecer dentro do repositorio." ;; esac
}
selected() { [[ ",$PYTHON_TOOLS," == *",$1,"* ]]; }
validate_tools() { local item; IFS=',' read -r -a items <<< "$PYTHON_TOOLS"; for item in "${items[@]}"; do [[ ",bandit,pip-audit,semgrep," == *",$item,"* ]] || fail "PYTHON_TOOLS contem valor nao permitido: $item"; done; }
record() { printf '| `%s` | %s | `%s` |\n' "$1" "$2" "$3" >> "$SUMMARY"; }
run_capture() {
  local name="$1" raw="$2"; shift 2
  local rc=0
  "$@" >"$raw" 2>&1 || rc=$?
  if (( rc == 0 )); then record "$name" "SUCESSO" "${raw#$ROOT_DIR/}"; else record "$name" "ALERTA_OU_FALHA (exit $rc)" "${raw#$ROOT_DIR/}"; fi
  return "$rc"
}

TARGET="$(inside_repo "$TARGET")"
[[ "$PYTHON_TOOLS" != "" ]] || fail "PYTHON_TOOLS nao pode ser vazio."
validate_tools
selected bandit && require_cmd bandit
selected pip-audit && { require_cmd pip-audit; [[ "$ALLOW_NETWORK" == "1" ]] || fail "pip-audit pode consultar indice/advisories; execute com ALLOW_NETWORK=1 apos revisar privacidade e proxy."; REQUIREMENTS_FILE="$(inside_repo "$REQUIREMENTS_FILE")"; }
selected semgrep && { require_cmd semgrep; [[ -n "$SEMGREP_CONFIG" ]] || fail "defina SEMGREP_CONFIG como arquivo local ou use 'auto' com ALLOW_NETWORK=1."; if [[ "$SEMGREP_CONFIG" == "auto" ]]; then [[ "$ALLOW_NETWORK" == "1" ]] || fail "Semgrep auto baixa regras e pode emitir telemetria; use ALLOW_NETWORK=1 conscientemente."; else SEMGREP_CONFIG="$(inside_repo "$SEMGREP_CONFIG")"; fi; }

mkdir -p -- "$RAW_DIR" "$(dirname "$SUMMARY")"
printf '# Resumo sanitizado - auditoria Python\n\n- Execucao UTC: `%s`\n- Escopo: repositorio local\n- Revisao humana: obrigatoria\n\n| Ferramenta | Status | Relatorio cru local |\n|---|---|---|\n' "$RUN_ID" > "$SUMMARY"

overall=0
if selected bandit; then run_capture bandit "$RAW_DIR/bandit.log" bandit -r "$TARGET" -f json -o "$RAW_DIR/bandit.json" || overall=1; fi
if selected pip-audit; then run_capture pip-audit "$RAW_DIR/pip-audit.log" pip-audit -r "$REQUIREMENTS_FILE" -f json -o "$RAW_DIR/pip-audit.json" || overall=1; fi
if selected semgrep; then
  if [[ "$SEMGREP_CONFIG" == "auto" ]]; then run_capture semgrep "$RAW_DIR/semgrep.log" semgrep scan --metrics off --config auto --json --json-output "$RAW_DIR/semgrep.json" "$TARGET" || overall=1
  else run_capture semgrep "$RAW_DIR/semgrep.log" semgrep scan --metrics off --config "$SEMGREP_CONFIG" --json --json-output "$RAW_DIR/semgrep.json" "$TARGET" || overall=1; fi
fi
printf '\n## Limites e proximos passos\n\n- Achados podem ser falsos positivos e nao provam explorabilidade.\n- Revise o relatorio cru localmente, classifique pelo contexto e publique apenas uma sintese redigida.\n- Ausencia de achados nao substitui revisao manual, testes de autorizacao, isolamento multi-tenant ou logica de negocio.\n' >> "$SUMMARY"
printf 'Auditoria Python concluida. Revise %s e os arquivos em %s.\n' "${SUMMARY#$ROOT_DIR/}" "${RAW_DIR#$ROOT_DIR/}"
exit "$overall"
