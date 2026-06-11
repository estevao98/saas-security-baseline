# Fontes do Chunk 8

Data de acesso: **6 de junho de 2026**.

## Critério de pesquisa

Foram priorizadas fontes oficiais de Python, OWASP e ferramentas de análise de aplicações web/backend. O documento sintetiza riscos práticos de autorização server-side, APIs, ORM/SQL, jobs, arquivos, integrações, logs, dependências e isolamento multi-tenant sem definir stack obrigatória.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Limites de escopo, fontes oficiais, evidências e dados sensíveis. |
| `research/prompts.md` | Entregáveis do Chunk 8 em linguagem de backend/Python. |
| `research/task-queue.md` | Critérios de aceite e status. |
| `research/progress.md` | Estado anterior e registro da execução. |
| `docs/security-tools-catalog.md` | Ferramentas Python, SAST, SCA, Semgrep, Bandit, pip-audit e limites de automação. |
| `docs/api-security-checklist.md` | Autenticação, autorização, objetos, propriedades, recursos e inventário de APIs. |
| `docs/audit-types.md` | Revisão manual, SAST, SCA, API testing e limitações de evidência. |
| `docs/evidence-and-reporting-policy.md` | Proteção de logs, reports, dados pessoais, segredos e evidências. |

## Fontes oficiais

| ID | Fonte | URL | Uso |
|---|---|---|---|
| P1 | Python documentation | https://docs.python.org/3/ | Referência geral para runtime, biblioteca padrão e cuidados dependentes da versão. |
| P2 | Python sqlite3 placeholders | https://docs.python.org/3/library/sqlite3.html#how-to-use-placeholders-to-bind-values-in-sql-queries | Princípio oficial de placeholders em vez de montagem de SQL por concatenação. |
| O1 | OWASP Application Security Verification Standard | https://owasp.org/www-project-application-security-verification-standard/ | Requisitos verificáveis para autenticação, autorização, validação, arquivos, APIs e logs. |
| O2 | OWASP API Security Top 10 | https://owasp.org/www-project-api-security/ | Riscos de APIs, objetos, propriedades, recursos, inventário e integrações. |
| O3 | OWASP Cheat Sheet Series | https://cheatsheetseries.owasp.org/ | Apoio para autorização, logs, upload, SQL injection, secrets e session management. |
| T1 | Bandit | https://bandit.readthedocs.io/en/latest/ | SAST Python e limites de achados sintáticos. |
| T2 | pip-audit | https://github.com/pypa/pip-audit | Auditoria de dependências Python e dependência de advisory/index. |
| T3 | Semgrep CLI | https://semgrep.dev/docs/cli-reference | Regras locais, saída JSON, métricas e limites de SAST. |

## Incertezas

- O comportamento de autorização, ORM, filas, jobs, cache e storage depende da stack adotada pelo SaaS consumidor.
- Versões reais de Python, bibliotecas, ferramentas e lockfiles devem ser confirmadas no ambiente autorizado.
- SAST/SCA não prova ausência de falhas de lógica de negócio, IDOR, isolamento multi-tenant ou autorização server-side.
- Plataformas educacionais SaaS e módulos financeiros/administrativos exigem revisão de papéis, dados restritos, relatórios, exportações e fluxos de negócio conforme arquitetura real.
