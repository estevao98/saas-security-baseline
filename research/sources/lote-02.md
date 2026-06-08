# Fontes do Lote 2 - Documentos base

Data de acesso: **8 de junho de 2026**.

## Escopo

Este registro documenta fontes internas, decisões, incertezas e limites usados na reconciliação do Lote 2 - Documentos base.

O lote reconciliou documentos auxiliares em `docs/` e READMEs de domínio que ainda estavam como placeholders ou referências vencidas a chunks. O objetivo foi transformar esses arquivos em guias ou índices pequenos, apontando para documentos canônicos, checklists, templates e pendências, sem duplicar conteúdo operacional.

Não foram alterados scripts, workflows, exemplos de workflows, templates completos, checklists individuais, políticas raiz, `privacy/*.md`, `risk/risk-matrix.md` ou `risk/risk-register.csv`.

## Fontes internas consultadas

| Fonte | Uso na reconciliação |
|---|---|
| `AGENTS.md` | Regras obrigatórias de escopo, fontes, evidências, dados sensíveis e atualização de progresso. |
| `README.md` | Navegação pública, estado declarado e limites do baseline. |
| `SECURITY.md` | Reporte privado, triagem, resposta a segredos, divulgação e evidências. |
| `CONTRIBUTING.md` | Regras de contribuição, validações proporcionais e limites de escopo. |
| `research/codex-execution-plan.md` | Escopo, critérios, riscos e proibições do Lote 2. |
| `research/coverage-audit.md` | Lacunas históricas de documentos auxiliares e READMEs de domínio. |
| `research/prompts.md` | Origem dos chunks e artefatos esperados. |
| `research/progress.md` | Histórico antes da reconciliação. |
| `research/task-queue.md` | Fila corretiva e próximos lotes. |
| `research/repository-inventory.md` | Classificação dos documentos auxiliares e diretórios de domínio antes do Lote 2. |
| `research/sources/lote-01.md`, `research/sources/lote-04.md`, `research/sources/lote-06.md` | Estado anterior de estrutura, políticas, workflows e pendências contextuais. |
| `docs/` | Identificação de placeholders e documentos canônicos existentes. |
| `checklists/README.md` e `checklists/index.md` | Confirmação de checklists canônicos e navegação por domínio. |
| `templates/index.md` | Relação entre templates, guias e documentos de apoio. |

## Fontes oficiais

Não foram consultadas novas fontes externas neste lote. O conteúdo novo é navegação, consolidação interna e delimitação de escopo com base em fontes já registradas nos chunks e lotes anteriores.

Quando os guias apontam para LGPD, ANPD, OWASP, W3C/WAI, ISO, ABNT, GitHub Actions ou ferramentas, a fonte normativa ou técnica continua sendo o documento canônico e seu respectivo registro em `research/sources/chunk-*.md`.

## Decisões

- `docs/README.md` virou índice de navegação para documentos canônicos e auxiliares.
- `docs/incident-response-plan.md`, `docs/business-continuity-plan.md`, `docs/threat-model.md`, `docs/api-security-checklist.md`, `docs/cloud-security-checklist.md`, `docs/ai-governance-checklist.md`, `docs/accessibility-audit.md` e `docs/lgpd-gap-assessment.md` deixaram de ser placeholders e passaram a ser guias auxiliares.
- Os guias auxiliares apontam para checklists, templates e programas canônicos, em vez de repetir conteúdo completo.
- READMEs de domínio foram transformados em índices de navegação e limites: `accessibility/`, `ai-governance/`, `appsec/`, `business-continuity/`, `compliance/`, `devsecops/`, `incident-response/`, `policies/`, `security/`, `testing/`, `privacy/`, `risk/`, `reports/` e `templates/`.
- `privacy/README.md` foi reconciliado apenas como índice; os arquivos `privacy/*.md` continuam no Lote 8.
- `risk/README.md` foi reconciliado apenas como índice; `risk/risk-matrix.md` e `risk/risk-register.csv` continuam no Lote 10.
- `reports/README.md` foi reconciliado como índice; reforços preventivos e artefatos auxiliares de evidência continuam no Lote 10.
- `docs/repository-architecture.md`, `README.md` e `research/repository-inventory.md` foram atualizados somente para refletir o estado real após o Lote 2.

## Incertezas e pendências

- Frappe/Python operacional, fixture e matriz de versões permanecem no Lote 7.
- Artefatos `privacy/*.md`, decisões jurídicas, bases legais, RIPD/DPIA, direitos de titulares e transferências permanecem no Lote 8.
- Processo operacional de acessibilidade, fixture, automação/manual combinados e eventual CI permanecem no Lote 9.
- Validação funcional de scripts, ferramentas, rede, stdout/stderr e fixtures permanece no Lote 5.
- Risco auxiliar, registros sanitizados, controles preventivos adicionais e secret scanning completo permanecem no Lote 10.
- Verificação final de links, placeholders, fontes, scripts, workflows e arquivos sensíveis permanece no Lote 11.

## Limites de segurança

- Não foram criados dados pessoais, dados de cliente, tenants, URLs internas, logs crus, dumps, backups, payloads, PoCs, requests/responses, tokens, cookies, credenciais ou exemplos semelhantes a credenciais.
- Não foram executados scanners, workflows, scripts de auditoria, testes ofensivos ou coleta de evidências reais.
- Não foram publicados artifacts, relatórios crus, SARIF, JSON de scanner, HTML de DAST, SBOM ou evidências reais.
- Não há declaração de certificação, conformidade formal, prontidão enterprise, acessibilidade integral, pipeline seguro ou ausência de vulnerabilidades.
