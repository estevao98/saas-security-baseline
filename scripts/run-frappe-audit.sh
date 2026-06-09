#!/usr/bin/env bash
set -euo pipefail

# Objetivo: localizar padroes Frappe/Python que exigem revisao manual de seguranca.
# Pre-requisitos: ripgrep (rg) e codigo de app Frappe local, sem sites/configuracoes reais.
# Seguranca: resultados podem conter codigo e paths; somente contagens entram no resumo.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
FRAPPE_TARGET="${FRAPPE_TARGET:-$ROOT_DIR}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RAW_DIR="$ROOT_DIR/reports/raw/frappe-$RUN_ID"
SUMMARY="$ROOT_DIR/reports/sanitized/frappe-audit-$RUN_ID.md"

fail(){ printf 'Erro: %s\n' "$1" >&2; exit 2; }
command -v rg >/dev/null 2>&1 || fail "ferramenta 'rg' nao instalada; valide a instalacao oficial do ripgrep."
FRAPPE_TARGET="$(cd "$FRAPPE_TARGET" 2>/dev/null && pwd -P)" || fail "FRAPPE_TARGET inexistente."
case "$FRAPPE_TARGET" in "$ROOT_DIR"|"$ROOT_DIR"/*) ;; *) fail "FRAPPE_TARGET deve permanecer dentro do repositorio." ;; esac

mkdir -p -- "$RAW_DIR" "$(dirname "$SUMMARY")"
printf '# Resumo sanitizado - Frappe/Python\n\n- Execucao UTC: `%s`\n- Escopo: codigo local; sites, backups, logs e `site_config.json` devem estar ausentes\n\n| Categoria | Ocorrencias para triagem | Relatorio cru local |\n|---|---:|---|\n' "$RUN_ID" > "$SUMMARY"

scan(){
  local id="$1" pattern="$2" file="$RAW_DIR/$1.txt" rc=0 count=0
  rg --hidden --glob '!.git/**' --glob '!reports/**' --glob '!node_modules/**' --glob '!sites/**' --glob '!*.min.js' --line-number --color never "$pattern" "$FRAPPE_TARGET" >"$file" 2>&1 || rc=$?
  ((rc==0 || rc==1)) || fail "rg falhou na categoria $id; consulte $file."
  [[ -s "$file" ]] && count="$(wc -l < "$file" | tr -d ' ')"
  printf '| `%s` | %s | `%s` |\n' "$id" "$count" "${file#$ROOT_DIR/}" >> "$SUMMARY"
}

scan whitelisted '@frappe\.whitelist|allow_guest[[:space:]]*=[[:space:]]*True'
scan sql-and-db 'frappe\.db\.sql|frappe\.db\.set_value|frappe\.db\.delete'
scan permission-bypass 'ignore_permissions[[:space:]]*=[[:space:]]*True|frappe\.get_all\('
scan dynamic-evaluation 'safe_exec|exec\(|eval\(|frappe\.utils\.safe_exec'
scan subprocess-and-shell 'subprocess\.|os\.system\(|shell[[:space:]]*=[[:space:]]*True'
scan file-and-path 'get_site_path|private/files|public/files|save_file\(|File\('
scan hooks-and-jobs 'scheduler_events|doc_events|override_whitelisted_methods|enqueue\('
scan auth-and-session 'frappe\.session|set_user\(|LoginManager|auth_hooks'

printf '\n## Limites e proximos passos\n\n- Cada ocorrencia e apenas pista; wrappers seguros, constantes e controles anteriores podem gerar falso positivo.\n- `rg` nao entende fluxo de dados, roles, DocPerm, User Permission, hooks, tenant ou transacoes.\n- Revise autorizacao server-side, isolamento multi-tenant, SQL parametrizado, arquivos, jobs, integracoes e pagamentos.\n- Para SAST/SCA Python, execute `scripts/run-python-audit.sh` separadamente.\n' >> "$SUMMARY"
printf 'Triagem Frappe concluida. Revise %s sem copiar trechos crus para Git.\n' "${SUMMARY#$ROOT_DIR/}"
exit 0
