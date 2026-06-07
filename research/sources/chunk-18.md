# Fontes do Chunk 18

Data de acesso: **7 de junho de 2026**.

## Criterio de consolidacao

O README foi consolidado exclusivamente a partir dos documentos existentes e aprovados no repositorio. Nenhuma nova obrigacao, versao, certificacao ou configuracao foi inferida. Os detalhes permanecem nos documentos de origem para evitar duplicacao e facilitar revisao.

Nao houve nova consulta externa neste chunk. As fontes oficiais de cada tema, as datas de acesso e as incertezas continuam registradas nos arquivos anteriores de `research/sources/` e nas secoes de fontes dos documentos correspondentes.

## Fontes internas usadas

| Fonte | Uso no README |
|---|---|
| `AGENTS.md` | Objetivo, estilo, protecao de evidencias e limites de seguranca. |
| `README.md` anterior | Confirmacao de que o arquivo ainda era um placeholder do Chunk 18. |
| `SECURITY.md`, `CONTRIBUTING.md` e `CODEOWNERS` | Pontos de entrada atuais e limites de governanca do repositorio. |
| `research/prompts.md` | Estrutura obrigatoria original com 23 itens para o README. |
| `research/task-queue.md` | Criterios de aceite e restricao ao Chunk 18. |
| `research/progress.md` | Estado dos chunks anteriores e proximos passos. |
| `docs/repository-architecture.md` | Nome, estrutura, classificacao de artefatos e reutilizacao. |
| `docs/standards-and-frameworks-matrix.md` | Escopo de normas, leis, frameworks, certificacoes e incertezas. |
| `docs/security-roadmap.md` | Fases de maturidade e roadmap de 30, 60, 90 e 180 dias. |
| `docs/audit-types.md` | Tipos de auditoria, limites e gates. |
| `docs/audit-trigger-matrix.md` | Eventos, frequencias, revisores e decisoes Go/No-Go. |
| `docs/security-tools-catalog.md` | Categorias de ferramentas, limites, saidas e politica de gates. |
| `docs/github-actions-strategy.md` | Workflows, CI/CD, permissoes, artifacts, secrets e branch protection. |
| `docs/frappe-python-security-audit.md` | Estrategia para Frappe, ERPNext, Frappe Learning e Python. |
| `docs/lgpd-privacy-program.md` | Programa de LGPD, privacidade, terceiros e validacao juridica. |
| `docs/accessibility-program.md` | WCAG, avaliacao manual, automacao, evidencias e gates. |
| `docs/evidence-and-reporting-policy.md` | Classificacao, redaction, Git, artifacts, retencao e descarte. |
| `docs/security-audit-baseline.md` | Estrutura do relatorio final de auditoria. |
| `docs/git-security-workflow.md` | Findings, branches, commits, issues, PRs, releases e aceite. |
| `risk/severity-and-prioritization.md` | Severidade, prioridade, SLA, tratamento, aceite e reteste. |
| `checklists/index.md` e `checklists/*.md` | Inventario dos checklists existentes, sem alterar o Chunk 15. |
| `scripts/README.md` | Preparacao, execucao, interpretacao e limites dos scripts locais. |
| `templates/index.md` | Catalogo e regras de uso dos templates do Chunk 17. |

## Fontes oficiais herdadas

O README aponta para documentos cujas pesquisas priorizaram fontes oficiais de OWASP, OWASP Cheat Sheet Series, ISO, Catalogo ABNT, ANPD, W3C/WAI, NIST, CISA, CIS, GitHub Docs, documentacao oficial das ferramentas e documentacao oficial do Frappe.

Para URLs, edicoes, datas de acesso e decisoes tecnicas, consultar os registros existentes em `research/sources/chunk-01.md` a `research/sources/chunk-14.md`, `research/sources/chunk-16.md` e `research/sources/chunk-17.md`, conforme o tema.

## Incertezas e limites observados

- `checklists/index.md` ainda apresenta texto de placeholder, embora os arquivos dos 15 checklists estejam presentes. O README aponta diretamente para esses arquivos; nenhum checklist foi alterado neste chunk.
- `research/progress.md` menciona `research/sources/chunk-15.md`, mas esse arquivo nao estava presente na arvore durante a consolidacao. A lacuna preexistente nao foi corrigida porque o escopo esta limitado ao Chunk 18.
- `SECURITY.md` e `CONTRIBUTING.md` permanecem resumidos. O README direciona os detalhes de colaboracao para `docs/git-security-workflow.md` sem declarar que esses placeholders constituem processos completos.
- Apenas `.github/workflows/security.yml` esta ativo por padrao; os demais workflows existentes ficam em `examples/github-workflows/` e exigem adaptacao.
- Obrigacoes juridicas, exigencias enterprise, certificacoes, edicoes normativas, plano/licenca GitHub, retencao, SLA e ferramentas aplicaveis dependem do contexto e devem ser reconfirmados antes do uso formal.
