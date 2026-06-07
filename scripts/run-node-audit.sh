#!/usr/bin/env bash
set -euo pipefail

# Objetivo: auditar dependencias Node sem instalar, atualizar ou corrigir pacotes.
# Pre-requisitos: lockfile e npm/pnpm/OSV-Scanner conforme NODE_TOOLS.
# Seguranca: registries recebem metadados de dependencias somente com consentimento explicito.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
TARGET="${NODE_TARGET:-$ROOT_DIR}"
NODE_TOOLS="${NODE_TOOLS:-auto}"
ALLOW_NETWORK="${ALLOW_NETWORK:-0}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RAW_DIR="$ROOT_DIR/reports/raw/node-$RUN_ID"
SUMMARY="$ROOT_DIR/reports/sanitized/node-audit-$RUN_ID.md"

fail() { printf 'Erro: %s\n' "$1" >&2; exit 2; }
require_cmd() { command -v "$1" >/dev/null 2>&1 || fail "ferramenta '$1' nao instalada; valide a instalacao na documentacao oficial."; }
inside_repo_dir() { local p; p="$(cd "$1" 2>/dev/null && pwd -P)" || fail "diretorio inexistente: $1"; case "$p" in "$ROOT_DIR"|"$ROOT_DIR"/*) printf '%s\n' "$p" ;; *) fail "NODE_TARGET deve permanecer dentro do repositorio." ;; esac; }
selected() { [[ ",$NODE_TOOLS," == *",$1,"* ]]; }
validate_tools() { local item; IFS=',' read -r -a items <<< "$NODE_TOOLS"; for item in "${items[@]}"; do [[ ",npm,pnpm,osv-scanner," == *",$item,"* ]] || fail "NODE_TOOLS contem valor nao permitido: $item"; done; }
record() { printf '| `%s` | %s | `%s` |\n' "$1" "$2" "$3" >> "$SUMMARY"; }
run_capture() { local name="$1" raw="$2" rc=0; shift 2; "$@" >"$raw" 2>&1 || rc=$?; if ((rc==0)); then record "$name" SUCESSO "${raw#$ROOT_DIR/}"; else record "$name" "ALERTA_OU_FALHA (exit $rc)" "${raw#$ROOT_DIR/}"; fi; return "$rc"; }

TARGET="$(inside_repo_dir "$TARGET")"
if [[ "$NODE_TOOLS" == "auto" ]]; then
  if [[ -f "$TARGET/pnpm-lock.yaml" ]]; then NODE_TOOLS="pnpm"; elif [[ -f "$TARGET/package-lock.json" || -f "$TARGET/npm-shrinkwrap.json" ]]; then NODE_TOOLS="npm"; else fail "nenhum lockfile npm/pnpm encontrado; informe NODE_TOOLS apenas apos definir uma instalacao reproduzivel."; fi
fi
validate_tools
[[ "$ALLOW_NETWORK" == "1" ]] || fail "npm audit, pnpm audit e OSV-Scanner consultam servicos externos; use ALLOW_NETWORK=1 apos revisar os metadados enviados."
selected npm && { require_cmd npm; [[ -f "$TARGET/package-lock.json" || -f "$TARGET/npm-shrinkwrap.json" ]] || fail "npm audit exige package-lock.json ou npm-shrinkwrap.json."; }
selected pnpm && { require_cmd pnpm; [[ -f "$TARGET/pnpm-lock.yaml" ]] || fail "pnpm audit exige pnpm-lock.yaml."; }
selected osv-scanner && require_cmd osv-scanner

mkdir -p -- "$RAW_DIR" "$(dirname "$SUMMARY")"
printf '# Resumo sanitizado - auditoria Node\n\n- Execucao UTC: `%s`\n- Escopo: repositorio local\n- Rede autorizada: sim; revisar registry, proxy e politica de privacidade\n\n| Ferramenta | Status | Relatorio cru local |\n|---|---|---|\n' "$RUN_ID" > "$SUMMARY"
overall=0
run_json_stdout() { local n="$1" out="$2" log="$3" rc=0; shift 3; "$@" >"$out" 2>"$log" || rc=$?; if ((rc==0)); then record "$n" SUCESSO "${out#$ROOT_DIR/}"; else record "$n" "ALERTA_OU_FALHA (exit $rc)" "${out#$ROOT_DIR/}"; fi; return "$rc"; }
if selected npm; then run_json_stdout npm-audit "$RAW_DIR/npm-audit.json" "$RAW_DIR/npm-audit.log" bash -c 'cd "$1" && exec npm audit --json' _ "$TARGET" || overall=1; fi
if selected pnpm; then run_json_stdout pnpm-audit "$RAW_DIR/pnpm-audit.json" "$RAW_DIR/pnpm-audit.log" bash -c 'cd "$1" && exec pnpm audit --json' _ "$TARGET" || overall=1; fi
if selected osv-scanner; then
  rc=0
  osv-scanner scan source --format json --output "$RAW_DIR/osv-results.json" -r "$TARGET" >"$RAW_DIR/osv-scanner.log" 2>&1 || rc=$?
  if ((rc==0)); then record osv-scanner SUCESSO "${RAW_DIR#$ROOT_DIR/}/osv-results.json"; else record osv-scanner "ALERTA_OU_FALHA (exit $rc)" "${RAW_DIR#$ROOT_DIR/}/osv-results.json"; overall=1; fi
fi
printf '\n## Limites e proximos passos\n\n- Advisory e severidade nao demonstram alcance no produto.\n- Revise lockfile, dependencia transitiva, correcao disponivel e risco de supply chain.\n- Nunca use comandos `audit fix` automaticamente neste fluxo.\n' >> "$SUMMARY"
printf 'Auditoria Node concluida. Revise %s sem copiar o JSON cru para Git, issue ou PR.\n' "${SUMMARY#$ROOT_DIR/}"
exit "$overall"
