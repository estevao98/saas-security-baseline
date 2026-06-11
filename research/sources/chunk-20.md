# Fontes do Chunk 20

## Escopo

O Chunk 20 é um plano de execução derivado do estado interno do repositório. Não foram consultadas novas fontes externas. Versões, comandos e requisitos técnicos não foram revalidados neste chunk; as futuras issues devem consultar documentação oficial no momento da implementação.

## Fontes internas principais

| Fonte | Uso no plano |
|---|---|
| `AGENTS.md` | Regras obrigatórias de segurança, evidências, fontes e execução. |
| `research/prompts.md` | Estrutura original dos 11 lotes e formato esperado das tarefas. |
| `research/coverage-audit.md` | Entrada obrigatória para lacunas, prioridades, inconsistências e recomendações. |
| `research/task-queue.md` e `research/progress.md` | Estado declarado e divergências a reconciliar. |
| `research/sources/chunk-19.md` | Métodos, evidências internas e limites da auditoria de cobertura. |
| `README.md`, `SECURITY.md`, `CONTRIBUTING.md`, `CODEOWNERS` | Promessas públicas e estado dos controles raiz. |
| Documentos principais em `docs/` solicitados no Chunk 20 | Fontes canônicas para roadmap, auditorias, ferramentas, CI/CD, backend, LGPD, acessibilidade, evidências e Git. |
| `risk/severity-and-prioritization.md` | Priorização, gates, risco, findings e revisão humana. |
| Todos os arquivos `checklists/*.md` | Confirmação de que o Chunk 15 permanece placeholder no estado auditado. |
| `scripts/README.md` e todos os `scripts/*.sh` | Estado dos scripts, limites e necessidade de testes com fixtures. |
| `templates/index.md` e todos os arquivos `templates/*` | Estado dos templates e requisitos de exemplos fictícios/sanitizados. |
| `.gitignore`, `.gitleaks.toml`, `.secrets.baseline`, `.github/workflows/security.yml` | Estado dos controles preventivos de segredos, evidências e CI. |
| `privacy/`, `accessibility/`, documentos auxiliares em `docs/`, `risk/risk-matrix.md`, `risk/risk-register.csv` e exemplos de workflows | Inventário dos placeholders e artefatos que exigem reconciliação futura. |

## Decisões de planejamento

- Os nomes dos lotes foram preservados conforme o prompt original.
- A ordem prática começa pelo Lote 3, pois a recuperação do Chunk 15 é a prioridade mais alta da auditoria.
- A reconciliação de status ocorre depois da entrega real, não antes.
- Workflows, scripts e controles são divididos em PRs pequenos e não devem virar gates antes de validação.
- Arquivos futuros são marcados explicitamente como **a criar**.

## Limites e incertezas

- Não houve consulta à internet nem revalidação de normas, ferramentas, actions, imagens ou versões.
- Plano GitHub, licenças, runners, branch protection e recursos enterprise dependem do repositório consumidor.
- LGPD, contratos, comunicação de incidentes, retenção e papéis exigem validação jurídica/contextual.
- WCAG e acessibilidade exigem avaliação humana; automação não comprova conformidade.
- Backend/Python depende das versões e da arquitetura do produto consumidor.
- O plano não declara conformidade, certificação, eficácia integral dos controles ou ausência de vulnerabilidades.
