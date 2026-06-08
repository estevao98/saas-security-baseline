# Fontes do Lote 7 - Frappe/Python

Data de acesso: **8 de junho de 2026**.

## Escopo

Este registro documenta fontes internas, decisoes, incertezas e limites usados na reconciliacao do Lote 7 - Frappe/Python.

O lote criou uma matriz de compatibilidade e uma fixture Frappe/Python ficticia para triagem documental e validacoes locais seguras com `rg`. Nao criou site Frappe real, banco, usuario, tenant, `sites/`, `site_config.json`, logs, dumps, backups, credenciais, tokens, cookies, requests/responses, payloads ofensivos ou dados pessoais reais.

## Fontes internas consultadas

| Fonte | Uso na reconciliacao |
|---|---|
| `AGENTS.md` | Regras obrigatorias de fontes, evidencias, dados sensiveis e atualizacao de progresso. |
| `README.md` | Estado publico declarado para Frappe/Python, scripts, evidencias e limites. |
| `SECURITY.md` | Politica de reporte, triagem, segredos, evidencias e proibicao de detalhe exploravel. |
| `CONTRIBUTING.md` | Limites de contribuicao, validacoes proporcionais e escopo de PR. |
| `research/codex-execution-plan.md` | Escopo, criterios de aceite, riscos e proibicoes do Lote 7. |
| `research/coverage-audit.md` | Lacuna historica de fixture, matriz de versoes e validacao Frappe/Python. |
| `research/prompts.md` | Origem do Chunk 8 e do Lote 7. |
| `research/progress.md` | Historico e estado antes da reconciliacao. |
| `research/task-queue.md` | Fila corretiva e proximo lote. |
| `research/repository-inventory.md` | Estado reconciliado antes do Lote 7. |
| `research/sources/chunk-08.md` | Fontes oficiais ja registradas para Frappe, ERPNext, Frappe Learning e Python. |
| `research/sources/lote-01.md`, `research/sources/lote-02.md`, `research/sources/lote-04.md`, `research/sources/lote-06.md` | Estado anterior de estrutura, documentos, politicas, workflows e pendencias. |
| `docs/frappe-python-security-audit.md` | Guia canonico de revisao Frappe/Python. |
| `docs/security-tools-catalog.md` | Limites de Bandit, Ruff, pip-audit, Semgrep, secret scanning e `rg`. |
| `docs/evidence-and-reporting-policy.md` | Regras de evidencias, relatorios crus, resumos sanitizados e dados proibidos. |
| `docs/github-actions-strategy.md` | Limites para CI/CD, logs, artifacts, secrets e gates. |
| `checklists/frappe-security.md` | Checklist especifico de Frappe/Python. |
| `scripts/run-frappe-audit.sh`, `scripts/run-python-audit.sh`, `scripts/README.md` | Pontos de entrada existentes e limite de validacao funcional futura. |
| `testing/README.md`, `appsec/README.md`, `security/README.md` | Navegacao de dominio e pendencias relacionadas. |
| `templates/` | Confirmacao de que templates completos permanecem fora do escopo de edicao. |

## Fontes oficiais

Nao foram consultadas novas fontes externas neste lote, por restricao de nao executar rede externa.

As fontes oficiais de Frappe Framework, ERPNext, Frappe Learning, Python, Bandit, Ruff, pip-audit e Semgrep continuam registradas em `research/sources/chunk-08.md`. Este lote apenas operacionalizou parte segura e ficticia do dominio com base nessas fontes ja documentadas.

## Artefatos criados ou alterados

| Arquivo | Decisao |
|---|---|
| `docs/frappe-python-version-compatibility.md` | Criada matriz para separar o que esta baseline valida documentalmente do que deve ser confirmado no SaaS consumidor. |
| `testing/frappe-python/README.md` | Criado guia de uso seguro da fixture, comandos `rg` locais e limites. |
| `testing/frappe-python/fixture-app/` | Criada fixture ficticia positiva/negativa para triagem Frappe/Python, sem runtime real. |
| `docs/frappe-python-security-audit.md` | Adicionada navegacao para matriz e fixture do Lote 7. |
| `checklists/frappe-security.md` | Reconciliada referencia a matriz/fixture para nao manter como criacao futura. |
| `testing/README.md` e `appsec/README.md` | Ajustadas referencias objetivas para apontar aos novos artefatos e preservar Lote 5 como validacao funcional de scripts. |
| `research/progress.md`, `research/task-queue.md`, `research/repository-inventory.md` | Atualizados para refletir o fechamento documental do Lote 7. |

## Decisoes

- A matriz nao fixa versoes reais de Frappe, ERPNext, Frappe Learning, Python, Node ou ferramentas; o consumidor deve preencher e validar no contexto proprio.
- A fixture e textual e sintetica. Ela existe para validar documentacao e buscas locais, nao para criar app, site, banco, migracao ou prova de explorabilidade.
- Marcadores negativos como `allow_guest=True`, `ignore_permissions=True`, `frappe.get_all` e `frappe.db.set_value` foram mantidos como exemplos ficticios que exigem revisao humana, sem payload, request/response, segredo ou dado real.
- `scripts/run-frappe-audit.sh` e `scripts/run-python-audit.sh` nao foram alterados neste lote; validacao funcional de wrappers, stdout/stderr, ferramentas ausentes, exit codes e relatorios pertence ao Lote 5.
- Workflows ativos e exemplos em `examples/github-workflows/` nao foram alterados nem promovidos.

## Validacoes locais seguras executadas

| Validacao | Resultado |
|---|---|
| `bash -n scripts/run-frappe-audit.sh scripts/run-python-audit.sh` | Executado sem erro. |
| Buscas locais equivalentes na fixture para whitelisted/Guest, bypass de permissao, SQL/db e hooks/jobs | Executadas sem rede pela ferramenta interna de busca; retornaram somente arquivos da fixture. O binario `rg` nao estava instalado no shell local. |
| Busca por caminhos proibidos `sites/`, `site_config.json`, dumps, backups e logs dentro da fixture | Executada por glob local sem encontrar esses caminhos. |
| `git diff --check` | Executado sem erro. |

## Incertezas e pendencias

- Frappe, ERPNext, Frappe Learning, Python, Node e ferramentas precisam de versao real confirmada no SaaS consumidor.
- Custom DocPerm, User Permissions, Role Profiles, Server Scripts, Client Scripts, Property Setters e customizacoes por site nao podem ser provados por fixture versionada.
- Validacao funcional dos scripts, disponibilidade de `rg`, criacao de `reports/raw/`, resumos em `reports/sanitized/`, stdout/stderr, ferramentas ausentes e exit codes permanece no Lote 5.
- Integracao em CI, Semgrep como gate, secret scanning completo, artifacts e politica de falha permanecem dependentes de validacao posterior.
- Revisao de LGPD operacional, acessibilidade operacional, risco auxiliar e evidencias preventivas permanecem nos Lotes 8, 9 e 10.

## Limites de seguranca

- Nao foram criados dados pessoais, dados de cliente, tenants, sites, usuarios reais, URLs internas, logs crus, dumps, backups, payloads, PoCs, requests/responses, tokens, cookies, credenciais ou exemplos semelhantes a credenciais.
- Nao foram executados scanners agressivos, workflow, servidor Frappe, migracao, conexao a banco, chamada externa, teste ofensivo ou coleta de evidencia real.
- Nao ha declaracao de certificacao, conformidade formal, prontidao enterprise, cobertura completa de Frappe/Python ou ausencia de vulnerabilidades.
