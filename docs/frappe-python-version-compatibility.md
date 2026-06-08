# Matriz de Compatibilidade Frappe/Python

## Objetivo

Registrar o que esta baseline consegue validar sem depender de site real, banco real, tenant real, credenciais reais ou ambiente de producao.

Esta matriz nao declara suporte oficial, compatibilidade completa, certificacao, prontidao enterprise ou ausencia de vulnerabilidades. O SaaS consumidor deve confirmar as versoes reais instaladas antes de usar qualquer resultado como evidencia.

## Estado validado neste repositorio

| Componente | Versao validada neste repositorio | Compatibilidade declarada pela baseline | O que o SaaS consumidor deve verificar |
|---|---|---|---|
| Frappe Framework | Nao validada em runtime. | Apenas triagem documental e sintatica de padroes descritos em `docs/frappe-python-security-audit.md`. | Branch/tag instalada, mudancas de API, hooks, permissoes, CSRF, rate limiting, scheduler, Server Scripts e Database API. |
| ERPNext | Nao validada em runtime. | Apenas checklist e orientacao para papeis, Company, User Permissions, financas, relatorios, exports e pagamentos. | Versao instalada, apps ativos, customizacoes, roles financeiros, gateways, relatorios, exportacoes e segregacao de funcoes. |
| Frappe Learning / Frappe LMS | Nao validada em runtime. | Apenas checklist e orientacao para cursos, aulas, matriculas, preview, SCORM, moderacao e relatorios. | Nome do produto na release instalada, papeis reais, DocTypes, preview publico, uploads, anexos e permissoes de curso/turma. |
| Python | Nao fixada nesta baseline. | Scripts e fixture usam apenas padroes de codigo estatico; nao executam aplicacao Frappe. | Versao do runtime, suporte do Frappe adotado, lockfiles, dependencias nativas, ferramentas de SAST/SCA e politica de atualizacao. |
| Node/build assets | Nao fixada nesta baseline. | O guia exige revisar assets, Client Scripts e dependencias quando aplicavel. | Versao Node suportada pela stack, lockfile, pipeline de build, assets gerados e bibliotecas frontend usadas pelo app. |
| Bandit, Ruff, pip-audit, Semgrep, ripgrep | Nao validadas funcionalmente neste lote. | `run-frappe-audit.sh` depende de `rg`; demais ferramentas pertencem a auditoria Python e ao Lote 5 para validacao funcional. | Versao instalada, flags, rede, telemetria, exit codes, formatos de saida, falsos positivos, cache e politica de artifacts. |

## Matriz de compatibilidade operacional

| Controle | Independe de versao? | Evidencia segura nesta baseline | Validacao obrigatoria no SaaS consumidor |
|---|---|---|---|
| Inventario de `@frappe.whitelist` e `allow_guest=True` | Parcialmente. A sintaxe e estavel, mas semantica e exposicao dependem da versao e app. | Fixture em `testing/frappe-python/fixture-app/` e comandos `rg` documentados. | Confirmar rota, metodo HTTP, autenticacao, CSRF, rate limit, autorizacao no objeto e saida retornada. |
| Revisao de `ignore_permissions=True` e `frappe.get_all` | Parcialmente. O padrao e detectavel, mas legitimidade depende do fluxo. | Marcadores sinteticos de triagem na fixture, sem dado real. | Confirmar justificativa, owner, alvo limitado, entrada confiavel, teste negativo e ausencia de retorno indevido ao usuario. |
| SQL direto com `frappe.db.sql` | Parcialmente. A chamada e detectavel; seguranca depende de parametrizacao e autorizacao. | Exemplo positivo parametrizado na fixture. | Confirmar parametros, tabela/campo permitidos, escopo de tenant, permissoes e regras de negocio. |
| Hooks, jobs e scheduler | Parcialmente. Nomes de hooks podem variar por release e apps instalados. | `hooks.py` sintetico com eventos e scheduler ficticios. | Validar ordem de apps, usuario de execucao, site correto, idempotencia, retry, timeout, logs e migracoes exigidas pela versao. |
| DocTypes e permissoes | Nao. JSON versionado nao cobre customizacoes reais por site. | DocType ficticio sem dados reais. | Exportar matriz sanitizada de permissoes efetivas, Custom DocPerm, User Permissions, Role Profiles e testes positivos/negativos. |
| Multi-tenant | Nao. Depende da arquitetura. | Checklist e guia diferenciam site por tenant, multi-company e tenant logico por campo. | Testar isolamento por site, Company, usuario, arquivo, relatorio, job, cache, fila, storage e integracao. |
| Frappe Learning e ERPNext | Nao. DocTypes e papeis mudam por release e custom app. | Orientacao documental, sem app real. | Confirmar papeis, permissoes, previews, conteudos, anexos, relatorios, financas, pagamentos e exportacoes na instalacao real. |

## Fixture documental do Lote 7

A fixture versionada em `testing/frappe-python/fixture-app/` e intencionalmente pequena e nao operacional.

Ela pode ir para o Git porque contem somente:

- nomes ficticios;
- DocTypes ficticios;
- comentarios de triagem;
- exemplos de codigo sem segredo, token, tenant real, site real, URL real, request/response real, payload ofensivo, banco ou dado pessoal.

Ela nao deve ser usada para:

- criar site Frappe;
- executar migracao;
- popular banco;
- validar runtime de Frappe;
- demonstrar explorabilidade;
- declarar que uma regra cobre todos os casos.

## Como preencher no SaaS consumidor

| Campo | Preencher com | Nao preencher com |
|---|---|---|
| Versao Frappe | Tag/branch instalada e fonte interna aprovada. | Suposicao baseada nesta baseline. |
| Versao ERPNext/Learning | Versao de cada app instalado e lista de custom apps. | Nome de cliente, tenant, site ou URL interna. |
| Python/Node | Versoes do runtime e gerenciadores usadas no release. | Dumps de ambiente ou logs crus. |
| Ferramentas | Nome, versao, origem, checksum quando aplicavel e data de validacao. | Relatorio integral de scanner. |
| Evidencia | IDs opacos e resumo sanitizado. | `site_config.json`, secrets, cookies, tokens, dados pessoais, requests/responses ou payloads. |

## Pendencias fora do Lote 7

- Validar funcionalmente os scripts, stdout/stderr, exit codes, ferramentas ausentes e criacao de relatorios no Lote 5.
- Integrar scanners em CI somente apos validar ferramentas, logs, artifacts, permissões e politica de falha.
- Confirmar versoes reais, semantica de permissao e arquitetura multi-tenant no SaaS consumidor.
- Registrar evidencias reais somente em armazenamento restrito, com resumo sanitizado quando aprovado.
