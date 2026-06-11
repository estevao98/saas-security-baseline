#!/usr/bin/env bash
set -euo pipefail

# Objetivo: executar secret scanning local e orquestrar auditorias explicitamente selecionadas.
# Pre-requisitos: Gitleaks, detect-secrets e scripts especializados escolhidos.
# Seguranca: nao imprime findings, nao instala ferramentas, nao usa producao e nao faz upload.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
AUDIT_COMPONENTS="${AUDIT_COMPONENTS:-secrets}"
SECRET_TOOLS="${SECRET_TOOLS:-gitleaks,detect-secrets}"
RUN_ID="$(date -u +%Y%m%dT%H%M%SZ)"
RAW_DIR="$ROOT_DIR/reports/raw/security-$RUN_ID"
SUMMARY="$ROOT_DIR/reports/sanitized/security-audit-$RUN_ID.md"

fail(){ printf 'Erro: %s\n' "$1" >&2; exit 2; }
require_cmd(){ command -v "$1" >/dev/null 2>&1 || fail "ferramenta '$1' nao instalada; valide a instalacao na documentacao oficial."; }
selected_component(){ [[ ",$AUDIT_COMPONENTS," == *",$1,"* ]]; }
selected_secret(){ [[ ",$SECRET_TOOLS," == *",$1,"* ]]; }
validate_list(){ local value="$1" allowed="$2" label="$3" item; IFS=',' read -r -a items <<< "$value"; for item in "${items[@]}"; do [[ ",$allowed," == *",$item,"* ]] || fail "$label contem valor nao permitido: $item"; done; }
record(){ printf '| `%s` | %s | `%s` |\n' "$1" "$2" "$3" >> "$SUMMARY"; }
run_capture(){ local n="$1" raw="$2" rc=0; shift 2; "$@" >"$raw" 2>&1 || rc=$?; if ((rc==0)); then record "$n" SUCESSO "${raw#$ROOT_DIR/}"; else record "$n" "ALERTA_OU_FALHA (exit $rc)" "${raw#$ROOT_DIR/}"; fi; return "$rc"; }

validate_list "$AUDIT_COMPONENTS" "secrets,python,node,container,accessibility,api,sbom" AUDIT_COMPONENTS
validate_list "$SECRET_TOOLS" "gitleaks,detect-secrets" SECRET_TOOLS
if selected_component secrets; then selected_secret gitleaks && require_cmd gitleaks; selected_secret detect-secrets && require_cmd detect-secrets; fi
for component in python node container accessibility api sbom; do
  if selected_component "$component"; then [[ -x "$ROOT_DIR/scripts/run-$component-audit.sh" || "$component" == "sbom" ]] || fail "script do componente '$component' ausente ou sem permissao de execucao."; fi
done
selected_component sbom && [[ -x "$ROOT_DIR/scripts/generate-sbom.sh" ]] || { selected_component sbom && fail "scripts/generate-sbom.sh ausente ou sem permissao de execucao." || true; }

mkdir -p -- "$RAW_DIR" "$(dirname "$SUMMARY")"
printf '# Resumo sanitizado - auditoria de seguranca\n\n- Execucao UTC: `%s`\n- Componentes solicitados: `%s`\n- Relatorios crus: locais e ignorados pelo Git\n\n| Etapa | Status | Relatorio cru/log local |\n|---|---|---|\n' "$RUN_ID" "$AUDIT_COMPONENTS" > "$SUMMARY"
overall=0
if selected_component secrets; then
  if selected_secret gitleaks; then run_capture gitleaks "$RAW_DIR/gitleaks.log" gitleaks git "$ROOT_DIR" --redact --report-format json --report-path "$RAW_DIR/gitleaks.json" --no-banner --no-color || overall=1; fi
  if selected_secret detect-secrets; then
    rc=0
    detect-secrets scan --no-verify --exclude-files '(^|/)reports/(raw|sanitized)/' "$ROOT_DIR" >"$RAW_DIR/detect-secrets.json" 2>"$RAW_DIR/detect-secrets.log" || rc=$?
    if ((rc==0)); then record detect-secrets SUCESSO "${RAW_DIR#$ROOT_DIR/}/detect-secrets.json"; else record detect-secrets "ALERTA_OU_FALHA (exit $rc)" "${RAW_DIR#$ROOT_DIR/}/detect-secrets.json"; overall=1; fi
  fi
fi

run_component(){
  local name="$1" script="$2" log="$RAW_DIR/$1-orchestrator.log" rc=0
  "$script" >"$log" 2>&1 || rc=$?
  if ((rc==0)); then record "$name" SUCESSO "${log#$ROOT_DIR/}"; else record "$name" "ALERTA_OU_FALHA (exit $rc)" "${log#$ROOT_DIR/}"; overall=1; fi
}
selected_component python && run_component python "$ROOT_DIR/scripts/run-python-audit.sh"
selected_component node && run_component node "$ROOT_DIR/scripts/run-node-audit.sh"
selected_component container && run_component container "$ROOT_DIR/scripts/run-container-audit.sh"
selected_component accessibility && run_component accessibility "$ROOT_DIR/scripts/run-accessibility-audit.sh"
selected_component api && run_component api "$ROOT_DIR/scripts/run-api-audit.sh"
selected_component sbom && run_component sbom "$ROOT_DIR/scripts/generate-sbom.sh"

printf '\n## Interpretacao e proximos passos\n\n- `SUCESSO`: a ferramenta terminou; nao significa ausencia de risco.\n- `ALERTA_OU_FALHA`: pode indicar finding, erro de configuracao, base ausente ou falha tecnica; revise o cru localmente.\n- Segredo confirmado exige contencao, revogacao/rotacao e investigacao; nao copie o valor para o resumo.\n- Classifique achados segundo `risk/severity-and-prioritization.md` e reconstrua qualquer evidencia versionavel por allowlist.\n' >> "$SUMMARY"
printf 'Auditoria concluida. Revise %s e mantenha %s fora do Git.\n' "${SUMMARY#$ROOT_DIR/}" "${RAW_DIR#$ROOT_DIR/}"
exit "$overall"
