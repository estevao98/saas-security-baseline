# Fontes do Chunk 8

Data de acesso: **6 de junho de 2026**.

## Critério de pesquisa

Foram priorizadas documentações oficiais do Frappe Framework, ERPNext, Frappe Learning e dos scanners. Páginas sem versão fixa foram tratadas como documentação corrente e não como garantia para instalações antigas. O guia exige confirmar a tag/branch instalada antes de aplicar comportamento dependente de versão.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Regras de fontes, evidências, segredos e atualização da pesquisa. |
| `research/prompts.md` | Escopo e entregáveis exclusivos do Chunk 8. |
| `research/task-queue.md` | Critérios de aceite e limite de execução. |
| `research/progress.md` | Estado anterior da pesquisa. |
| `docs/security-tools-catalog.md` | Papel, limites, falsos positivos e saídas de Bandit, Ruff, pip-audit, Semgrep e scanners de segredo/dependência. |
| `docs/audit-types.md` | Limites de automação e política geral de bloqueio. |
| `docs/audit-trigger-matrix.md` | Gatilhos, evidências e critérios Go/No-Go. |
| `docs/security-roadmap.md` | Fases de maturidade e critérios de não avanço. |
| `docs/github-actions-strategy.md` | Gates, logs, artifacts e relatórios crus. |
| `docs/repository-architecture.md` | Separação entre `reports/raw/` e `reports/sanitized/`. |

## Frappe Framework

| ID | Fonte oficial | URL | Uso |
|---|---|---|---|
| F1 | Create an App | https://docs.frappe.io/framework/user/en/tutorial/create-an-app | Estrutura típica do app e função de `hooks.py`. |
| F2 | Create a DocType | https://docs.frappe.io/framework/user/en/tutorial/create-a-doctype | JSON, controller Python, client JS e teste do DocType. |
| F3 | Users and Permissions | https://docs.frappe.io/framework/user/en/basics/users-and-permissions | Papéis, permissões de DocType, níveis de campo, User Permissions, sessão e controles de login. |
| F4 | Customizing DocTypes | https://docs.frappe.io/framework/user/en/basics/doctypes/customize | Custom Field, Property Setter, Client Script, Server Script e Custom DocPerm por site. |
| F5 | Permission Types | https://docs.frappe.io/framework/permission-types | Tipos de permissão customizados, explicitamente disponíveis a partir do v16. |
| F6 | Hooks | https://docs.frappe.io/framework/user/en/python-api/hooks | `permission_query_conditions`, `has_permission`, auth hooks, overrides, eventos e ordem de hooks. |
| F7 | Database API | https://docs.frappe.io/framework/user/en/api/database | Diferenças entre `get_list` e `get_all`, SQL direto, `set_value` e mudanças indicadas para v16. |
| F8 | REST API | https://docs.frappe.io/framework/user/en/api/rest | CRUD de DocTypes, whitelist, autenticação, verbos e risco de `debug=True`. |
| F9 | REST integration guide | https://docs.frappe.io/framework/user/en/guides/integration/rest_api | Prefixos de API e diferença documentada a partir do v15. |
| F10 | Background Jobs | https://docs.frappe.io/framework/user/en/api/background_jobs | `frappe.enqueue`, `enqueue_doc`, filas, scheduler e execução agendada como Administrator. |
| F11 | Server Script | https://docs.frappe.io/framework/user/en/desk/scripting/server-script | APIs por Server Script, Guest, rate limit e RestrictedPython. |
| F12 | Rate Limiting | https://docs.frappe.io/framework/v14/user/en/rate-limiting | Modelo de rate limit documentado no v14; usado somente com alerta de versão. |
| F13 | Static Assets | https://docs.frappe.io/framework/user/en/basics/static-assets | Diferença entre assets, uploads públicos e privados. |
| F14 | Sites | https://docs.frappe.io/framework/user/en/basics/sites | Site como tenant, banco por site, diretórios e resolução por headers/host. |
| F15 | Request Lifecycle | https://docs.frappe.io/framework/user/en/python-api/routing-and-rendering | Roteamento de API, downloads públicos/privados e pré-processamento. |
| F16 | Integration Request | https://docs.frappe.io/framework/v13/user/en/guides/integration_request | Campos sensíveis de logs de integração e uso específico documentado de `ignore_permissions`. |

## ERPNext e Frappe Learning

| ID | Fonte oficial | URL | Uso |
|---|---|---|---|
| E1 | ERPNext Role Based Permissions | https://docs.frappe.io/erpnext/user/manual/en/users-and-permissions | Papéis, estágios, níveis, User Permissions, reports, exports e data masking v16. |
| E2 | Role and Role Profile | https://docs.frappe.io/erpnext/v14/user/manual/en/setting-up/users-and-permissions/role-and-role-profile | Role Profile como agrupador de papéis; página versionada v14. |
| E3 | User Permissions | https://docs.frappe.io/erpnext/v14/user/manual/en/setting-up/users-and-permissions/user-permissions | Restrições por Company, Customer, Supplier, grupos e território; página versionada v14. |
| E4 | Adding Users | https://docs.frappe.io/erpnext/adding-users | Diferença entre website e system users e gestão de acesso. |
| E5 | Accounting Overview | https://docs.frappe.io/erpnext/accounting/introduction | Multi-company, invoices, pagamentos, contas e relatórios financeiros. |
| E6 | Accounts Settings | https://docs.frappe.io/erpnext/accounts-settings | Papéis especiais e configurações contábeis sensíveis. |
| E7 | Payment Request | https://docs.frappe.io/erpnext/payment-request | Relação entre invoices/orders, gateways e links de pagamento. |
| L1 | Frappe Learning Roles | https://docs.frappe.io/learning/roles | Papéis atuais, alcance do Moderator e alerta sobre upload SCORM por Course Creator. |
| L2 | Add a Lesson | https://docs.frappe.io/learning/add-a-lesson | Preview Guest, notas de instrutor, uploads e conteúdo externo. |
| L3 | Frappe Learning Introduction | https://docs.frappe.io/learning/introduction | Escopo atual de cursos, aulas, quizzes, assignments e batches. |

## Python e ferramentas

| ID | Fonte oficial | URL | Uso |
|---|---|---|---|
| T1 | Bandit documentation | https://bandit.readthedocs.io/en/latest/ | Papel e limites do SAST Python. |
| T2 | Ruff linter and rules | https://docs.astral.sh/ruff/linter/ | Lint e regras de segurança `S`. |
| T3 | pip-audit | https://github.com/pypa/pip-audit | SCA Python, formatos e limites de segurança. |
| T4 | Semgrep rule syntax | https://semgrep.dev/docs/writing-rules/rule-syntax | Sintaxe das regras simples incluídas apenas em Markdown. |
| T5 | Python DB-API 2.0 | https://docs.python.org/3/library/sqlite3.html#how-to-use-placeholders-to-bind-values-in-sql-queries | Princípio oficial de placeholders em vez de montagem de SQL; a API concreta de Frappe foi validada em F7. |

## Decisões e incertezas

- “Frappe Learning” é o nome usado pela documentação corrente; instalações e repositórios anteriores podem usar “Frappe LMS”.
- Páginas correntes de Frappe/ERPNext podem refletir v16, enquanto páginas versionadas v14/v13 foram usadas apenas quando a página corrente não forneceu o mesmo detalhe. Toda conclusão deve ser conferida na release instalada.
- A Database API corrente indica mudanças em `get_list`/`get_all` no v16. O guia usa apenas a diferença estável explicitamente documentada: `get_list` aplica permissões e `get_all` não.
- Custom Permission Types são documentados para v16 em diante e não foram apresentados como disponíveis em versões anteriores.
- A página de rate limiting consultada é v14; chaves, intervalo e integração podem mudar. O documento exige validação local e não fixa configuração universal.
- A documentação de Background Jobs encontrada em um caminho de cópia foi normalizada para a URL oficial corrente no registro. Semântica de filas, scheduler e usuário de execução deve ser reconfirmada por versão.
- Papéis e DocTypes do Learning, permissões financeiras do ERPNext, gateways e integrações podem mudar por release e custom app.
- Não foi localizada uma página oficial única que prove todos os detalhes de CSRF em todas as versões. O guia, portanto, manda preservar o controle nativo e revisar qualquer bypass/override na versão instalada, sem inventar header ou API.
- As regras Semgrep são triagem sintática simples. Precisam ser testadas com a versão fixada do parser e não foram criadas como arquivo ou gate neste chunk.
- Nenhum script completo do Chunk 16 nem workflow completo do Chunk 7 foi criado ou alterado.
