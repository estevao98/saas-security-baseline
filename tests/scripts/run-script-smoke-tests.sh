#!/usr/bin/env bash
set -euo pipefail

# Smoke tests for local audit wrappers.
# They use a temporary workspace and local stubs, not real scanners or network.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
WORK_DIR="$(mktemp -d)"
STUB_DIR="$WORK_DIR/stubs"
EMPTY_BIN="$WORK_DIR/empty-bin"
PATH_WITH_STUBS="$STUB_DIR:$PATH"

cleanup() {
  rm -rf -- "$WORK_DIR"
}
trap cleanup EXIT

log() {
  printf '%s\n' "$1"
}

fail() {
  printf 'Erro: %s\n' "$1" >&2
  exit 1
}

run_expect() {
  local expected="$1" name="$2" stdout_file stderr_file rc
  shift 2
  stdout_file="$WORK_DIR/${name//[^A-Za-z0-9_.-]/_}.stdout"
  stderr_file="$WORK_DIR/${name//[^A-Za-z0-9_.-]/_}.stderr"
  set +e
  "$@" >"$stdout_file" 2>"$stderr_file"
  rc=$?
  set -e
  if [[ "$rc" != "$expected" ]]; then
    printf 'Falha em %s: esperado exit %s, obtido %s\n' "$name" "$expected" "$rc" >&2
    printf 'stdout: %s\nstderr: %s\n' "$stdout_file" "$stderr_file" >&2
    return 1
  fi
  log "ok - $name (exit $expected)"
}

mkdir -p -- "$WORK_DIR/scripts" "$WORK_DIR/reports/sanitized" "$STUB_DIR" "$EMPTY_BIN" \
  "$WORK_DIR/testing/accessibility" "$WORK_DIR/tests/scripts/fixtures/api" \
  "$WORK_DIR/tests/scripts/fixtures/python" \
  "$WORK_DIR/tests/scripts/fixtures/node"

cp "$ROOT_DIR"/scripts/*.sh "$WORK_DIR/scripts/"
chmod +x "$WORK_DIR"/scripts/*.sh
cp "$ROOT_DIR/testing/accessibility/fixture-saas-flow.html" "$WORK_DIR/testing/accessibility/fixture-saas-flow.html"
cp "$ROOT_DIR/testing/accessibility/fixture-styles.css" "$WORK_DIR/testing/accessibility/fixture-styles.css"

cat >"$WORK_DIR/tests/scripts/fixtures/python/app.py" <<'EOF'
def handler(value):
    return {"ok": bool(value)}
EOF

cat >"$WORK_DIR/tests/scripts/fixtures/api/openapi.yaml" <<'EOF'
openapi: 3.0.3
info:
  title: API ficticia local
  version: "0.1"
paths:
  /health:
    get:
      responses:
        "200":
          description: OK ficticio
EOF

cat >"$WORK_DIR/tests/scripts/fixtures/node/package-lock.json" <<'EOF'
{
  "name": "fixture-node-local",
  "lockfileVersion": 3,
  "requires": true,
  "packages": {
    "": {
      "name": "fixture-node-local"
    }
  }
}
EOF

cat >"$STUB_DIR/bandit" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
out=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    -o) out="$2"; shift 2 ;;
    *) shift ;;
  esac
done
[[ -n "$out" ]] && printf '{"results":[]}\n' >"$out"
exit 0
EOF

cat >"$STUB_DIR/gitleaks" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
out=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --report-path) out="$2"; shift 2 ;;
    *) shift ;;
  esac
done
[[ -n "$out" ]] && printf '{"findings":[]}\n' >"$out"
printf 'stub gitleaks completed\n'
exit 0
EOF

cat >"$STUB_DIR/detect-secrets" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
printf '{"results":{}}\n'
exit 0
EOF

cat >"$STUB_DIR/npm" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
if [[ "${1:-}" == "audit" ]]; then
  printf '{"metadata":{"vulnerabilities":{}}}\n'
  exit 0
fi
exit 2
EOF

cat >"$STUB_DIR/trivy" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
out=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --output) out="$2"; shift 2 ;;
    *) shift ;;
  esac
done
[[ -n "$out" ]] && printf '{"Results":[]}\n' >"$out"
exit 0
EOF

cat >"$STUB_DIR/checkov" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
printf '{"results": {"failed_checks": []}}\n'
exit 0
EOF

cat >"$STUB_DIR/pa11y" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
printf '[]\n'
exit 0
EOF

cat >"$STUB_DIR/lighthouse" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
out=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --output-path) out="$2"; shift 2 ;;
    *) shift ;;
  esac
done
[[ -n "$out" ]] && printf '{"categories":{"accessibility":{"score":1}}}\n' >"$out"
exit 0
EOF

cat >"$STUB_DIR/st" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
report_dir=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --report-dir) report_dir="$2"; shift 2 ;;
    *) shift ;;
  esac
done
if [[ -n "$report_dir" ]]; then
  mkdir -p -- "$report_dir"
  printf '<testsuite tests="1" failures="0"/>\n' >"$report_dir/junit.xml"
fi
printf 'schemathesis stub completed\n'
exit 0
EOF

cat >"$STUB_DIR/syft" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
for arg in "$@"; do
  case "$arg" in
    cyclonedx-json=*) out="${arg#cyclonedx-json=}"; printf '{"bomFormat":"CycloneDX"}\n' >"$out" ;;
    spdx-json=*) out="${arg#spdx-json=}"; printf '{"spdxVersion":"SPDX-2.3"}\n' >"$out" ;;
  esac
done
printf 'syft stub completed\n'
exit 0
EOF

chmod +x "$STUB_DIR"/*

log 'Validando sintaxe Bash dos scripts versionados.'
bash -n "$ROOT_DIR"/scripts/*.sh "$ROOT_DIR/tests/scripts/run-script-smoke-tests.sh"
log 'ok - bash -n'

run_expect 2 'preflight URL externa bloqueada' env PATH="$PATH_WITH_STUBS" TARGET_URL='https://example.invalid' ACCESSIBILITY_TOOLS=pa11y bash "$WORK_DIR/scripts/run-accessibility-audit.sh"
run_expect 2 'preflight rede Node sem consentimento' env PATH="$PATH_WITH_STUBS" NODE_TARGET="$WORK_DIR/tests/scripts/fixtures/node" NODE_TOOLS=npm bash "$WORK_DIR/scripts/run-node-audit.sh"

run_expect 0 'python com stub bandit' env PATH="$PATH_WITH_STUBS" PYTHON_TARGET="$WORK_DIR/tests/scripts/fixtures/python" PYTHON_TOOLS=bandit bash "$WORK_DIR/scripts/run-python-audit.sh"
run_expect 0 'acessibilidade com fixture loopback stub' env PATH="$PATH_WITH_STUBS" TARGET_URL='http://127.0.0.1:3000/fixture-saas-flow.html' ACCESSIBILITY_TOOLS=pa11y,lighthouse bash "$WORK_DIR/scripts/run-accessibility-audit.sh"
run_expect 0 'api com schema ficticio e stub' env PATH="$PATH_WITH_STUBS" API_SCHEMA="$WORK_DIR/tests/scripts/fixtures/api/openapi.yaml" TARGET_URL='http://127.0.0.1:8000/health' API_TOOLS=schemathesis bash "$WORK_DIR/scripts/run-api-audit.sh"
run_expect 0 'node com lockfile ficticio e stub' env PATH="$PATH_WITH_STUBS" ALLOW_NETWORK=1 NODE_TARGET="$WORK_DIR/tests/scripts/fixtures/node" NODE_TOOLS=npm bash "$WORK_DIR/scripts/run-node-audit.sh"
run_expect 0 'container iac com stubs locais' env PATH="$PATH_WITH_STUBS" CONTAINER_TARGET="$WORK_DIR/tests/scripts/fixtures/python" CONTAINER_TOOLS=trivy,checkov bash "$WORK_DIR/scripts/run-container-audit.sh"
run_expect 0 'sbom com stub syft' env PATH="$PATH_WITH_STUBS" SBOM_KIND=directory SBOM_TARGET="$WORK_DIR/tests/scripts/fixtures/python" bash "$WORK_DIR/scripts/generate-sbom.sh"
run_expect 0 'orquestrador secrets com stubs' env PATH="$PATH_WITH_STUBS" AUDIT_COMPONENTS=secrets SECRET_TOOLS=gitleaks,detect-secrets bash "$WORK_DIR/scripts/run-security-audit.sh"

shopt -s nullglob
raw_dirs=("$WORK_DIR"/reports/raw/*)
summary_files=("$WORK_DIR"/reports/sanitized/*.md)
(( ${#raw_dirs[@]} >= 7 )) || fail "diretorios crus temporarios insuficientes: ${#raw_dirs[@]}"
(( ${#summary_files[@]} >= 7 )) || fail "resumos sanitizados temporarios insuficientes: ${#summary_files[@]}"

log "ok - reports/raw temporario: ${#raw_dirs[@]} diretorios"
log "ok - reports/sanitized temporario: ${#summary_files[@]} resumos"
log 'Smoke tests dos scripts concluidos sem rede externa real.'
