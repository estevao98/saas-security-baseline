# Fontes do Lote 5 - Scripts

Data de acesso: **9 de junho de 2026**.

## Escopo

Este registro documenta fontes internas, decisoes, validacoes, incertezas e limites usados na reconciliacao do Lote 5 - Scripts.

O lote validou e reconciliou wrappers locais de auditoria com fixtures ficticias, stubs de ferramentas, preflight, paths, stdout/stderr indiretos, exit codes e criacao temporaria de `reports/raw/` e `reports/sanitized/`. Nao executou rede externa real, scanner real contra alvo real, DAST externo, upload, deploy, workflow ativo, instalacao automatica ou publicacao de relatorio cru.

## Fontes internas consultadas

| Fonte | Uso na reconciliacao |
|---|---|
| `AGENTS.md` | Regras obrigatorias de escopo, evidencias, fontes, dados sensiveis e atualizacao de progresso. |
| `README.md` | Estado publico declarado para scripts, ferramentas, evidencias e limites. |
| `SECURITY.md` | Limites para reporte, segredos, evidencias sensiveis e divulgacao. |
| `CONTRIBUTING.md` | Validacoes proporcionais, escopo do lote de scripts e proibicao de evidencia sensivel. |
| `research/codex-execution-plan.md` | Escopo, criterios, riscos e proibicoes do Lote 5. |
| `research/coverage-audit.md` | Lacuna historica: scripts passaram apenas em `bash -n`, sem teste funcional. |
| `research/prompts.md` | Origem dos oito scripts e criterios dos chunks. |
| `research/progress.md` | Historico e estado antes da reconciliacao. |
| `research/task-queue.md` | Fila corretiva e pendencias vindas dos Lotes 7 e 9. |
| `research/repository-inventory.md` | Classificacao dos scripts antes do Lote 5. |
| `research/sources/chunk-16.md` | Fontes oficiais e decisoes originais dos scripts. |
| `research/sources/chunk-19.md` | Auditoria de cobertura e limites das validacoes anteriores. |
| `research/sources/lote-02.md`, `research/sources/lote-07.md`, `research/sources/lote-08.md`, `research/sources/lote-09.md` | Estado anterior de documentos, Frappe/Python, LGPD e acessibilidade. |
| `docs/security-tools-catalog.md` | Comandos, riscos de relatorios, preflight e limites por ferramenta. |
| `docs/evidence-and-reporting-policy.md` | Politica de `reports/raw/`, `reports/sanitized/`, redaction e artifacts. |
| `docs/github-actions-strategy.md` | Limites de CI/CD, logs, artifacts, secrets e gates; workflows nao foram alterados. |
| `docs/frappe-python-security-audit.md` | Fixture e limites de triagem Frappe/Python. |
| `docs/accessibility-audit.md` | Fixture e limites de automacao/manual de acessibilidade. |
| `testing/frappe-python/` | Fixture ficticia usada como alvo local dos stubs de Python/Frappe. |
| `testing/accessibility/` | Fixture ficticia usada para URL loopback controlada nos testes de acessibilidade. |
| `scripts/*.sh` e `scripts/README.md` | Artefatos reconciliados e validados. |
| `reports/README.md` | Confirmacao da separacao entre cru local e resumo sanitizado. |

## Fontes oficiais

Nao foram consultadas novas fontes externas neste lote. A reconciliacao usou as fontes oficiais ja registradas em `research/sources/chunk-16.md` para Gitleaks, detect-secrets, Bandit, pip-audit, Semgrep, npm, pnpm, OSV-Scanner, Trivy, Grype, Checkov, Syft, CycloneDX, Pa11y, Lighthouse, Schemathesis, ZAP Baseline e ripgrep.

## Artefatos criados ou alterados

| Arquivo | Decisao |
|---|---|
| `scripts/README.md` | Adicionada documentacao de exit codes, preflight e suite local segura dos wrappers. |
| `scripts/run-frappe-audit.sh` | Adicionado `exit 0` explicito apos conclusao da triagem. |
| `scripts/generate-sbom.sh` | Ajustada mensagem final para distinguir sucesso de alerta/falha quando Syft retorna exit code diferente de zero. |
| `tests/scripts/run-script-smoke-tests.sh` | Criada suite de smoke tests com workspace temporario, stubs locais e fixtures ficticias. |
| `research/progress.md`, `research/task-queue.md`, `research/repository-inventory.md` | Atualizados para refletir o fechamento real do Lote 5. |

## Decisoes

- A suite testa comportamento dos wrappers, nao a eficacia completa dos scanners.
- Os scripts sao copiados para um diretorio temporario antes da execucao dos testes; relatorios crus e resumos gerados pela suite nao ficam no repositorio.
- Stubs locais substituem ferramentas reais para impedir rede externa, instalacao automatica, pull de imagem, upload, deploy ou scan agressivo.
- O teste de Node autoriza `ALLOW_NETWORK=1` somente contra stub local, para validar o caminho do wrapper sem chamada real a registry ou advisory service.
- O teste de acessibilidade usa URL loopback ficticia; nao inicia servidor real nem acessa URL externa.
- O teste de API usa schema OpenAPI ficticio temporario e stub de Schemathesis; nao executa requests reais.
- ShellCheck foi tratado como validacao desejavel, mas nao estava disponivel no ambiente.

## Validacoes locais seguras executadas

| Validacao | Resultado |
|---|---|
| `bash -n scripts/*.sh tests/scripts/run-script-smoke-tests.sh` | Executado sem erro. |
| `./tests/scripts/run-script-smoke-tests.sh` | Executado sem erro, com stubs e diretorio temporario. |
| Preflight de URL externa em acessibilidade | Bloqueado com exit code `2`. |
| Preflight de Node sem `ALLOW_NETWORK=1` | Bloqueado com exit code `2`. |
| Preflight de `rg` ausente | Bloqueado com exit code `2` neste ambiente. |
| Execucao controlada de Python, Frappe, acessibilidade, API, Node, container/IaC, SBOM e secrets | Concluida com exit code `0` usando stubs. |
| Criacao de `reports/raw/` e `reports/sanitized/` | Confirmada apenas no workspace temporario da suite: 8 diretorios crus e 8 resumos. |
| `git diff --check` | Executado sem erro. |
| `git status --ignored --short reports/raw reports/sanitized` | Confirmou `reports/raw/` ignorado. |

## Validacoes nao executadas

- ShellCheck nao foi executado porque a ferramenta nao estava disponivel no ambiente.
- Ferramentas reais nao foram executadas: Gitleaks, detect-secrets, Bandit, pip-audit, Semgrep, npm/pnpm audit, OSV-Scanner, Trivy, Grype, Checkov, Syft, Pa11y, Lighthouse, Schemathesis, ZAP e Docker.
- Nao houve scan de alvo externo, dominio, IP, tenant, app real, banco real, ambiente de producao ou URL fora de loopback.
- Nao houve validacao de versoes reais, checksums/provenance, licencas, telemetria, caches, bases, stdout/stderr completos, falsos positivos, imagens por digest ou politica de gate.

## Incertezas e pendencias

- Validar cada ferramenta real em projeto ficticio autorizado antes de uso em SaaS real ou gate.
- Fixar versoes, origem, integridade, imagem/digest e documentar stdout/stderr esperados por ferramenta.
- Confirmar comportamento sem rede e com rede aprovada, incluindo caches de Trivy/Grype, rules de Semgrep, registries npm/pnpm e advisory services.
- Integrar scripts a CI somente em tarefa propria, com permissao minima, logs reduzidos, sem upload automatico de `reports/raw/` e politica de falha aprovada.
- Consolidar controles preventivos de evidencias, risco auxiliar e secret scanning completo no Lote 10.

## Limites de seguranca

- Nao foram criados dados pessoais reais, dados de cliente, titulares, alunos, tenants, URLs internas, logs crus versionados, dumps, backups, payloads, PoCs, requests/responses, tokens, cookies, credenciais ou exemplos semelhantes a credenciais.
- Nao foram executados scanners reais, DAST real, rede externa, workflow, deploy, upload, publicacao de artifact, instalacao automatica, pull de imagem, servidor Frappe, migracao, banco ou coleta de evidencia real.
- Nao ha declaracao de ausencia de vulnerabilidades, conformidade, certificacao, acessibilidade integral, cobertura completa, aprovacao de release ou prontidao enterprise.
