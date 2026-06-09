# Inventário Reconciliado do Repositório

## Escopo

Este inventário foi criado no Lote 1 - Estrutura inicial e vem sendo atualizado somente quando um lote corretivo altera o estado real da árvore versionada.

Após o Lote 2 - Documentos base, documentos auxiliares e READMEs de domínio foram reconciliados como guias ou índices. O inventário não executa scanners, não valida ferramentas, não declara conformidade e não prova ausência de vulnerabilidades.

## Método

- Base: arquivos versionados retornados por `git ls-files` em 2026-06-07.
- Conferência de navegação: `README.md`, `docs/repository-architecture.md`, `checklists/README.md`, `checklists/index.md`, `research/progress.md` e `research/task-queue.md`.
- Conferência de lacunas: `research/coverage-audit.md` e `research/codex-execution-plan.md`.
- Conferência do Lote 3: `research/sources/chunk-15.md`, checklists existentes e registros de progresso.

Não foram lidos arquivos ignorados, relatórios crus, dumps, backups, configurações reais, logs ou material sensível.

## Critérios de status

| Status | Significado |
|---|---|
| Implementado | Conteúdo substantivo e navegável existe, dentro dos limites declarados. |
| Implementado com ressalvas | Existe conteúdo útil, mas faltam testes funcionais, validação externa, owner real ou configuração contextual. |
| Exemplo | Arquivo existe como modelo fictício ou referência copiável, não como controle ativo. |
| Placeholder | Arquivo existe com conteúdo mínimo, inicial ou explicitamente pendente. |
| Planejado | Trabalho previsto em lote corretivo posterior. |
| Não versionado | Caminho deve existir localmente ou em armazenamento restrito, mas não deve entrar no Git. |

## Inventário por área

| Área | Esperado no baseline | Existente versionado | Estado reconciliado | Próximo lote ou decisão |
|---|---|---|---|---|
| Raiz | README, políticas, ownership, ignore, configuração de segredos e instruções do agente. | `README.md`, `AGENTS.md`, `.gitignore`, `.gitleaks.toml`, `.secrets.baseline`, `SECURITY.md`, `CONTRIBUTING.md`, `CODEOWNERS`, `opencode.json`. | Implementado com ressalvas após o Lote 4. Políticas raiz e configuração inicial de segredos foram reconciliadas; canal privado real, owners reais, ferramentas instaladas e workflow de secret scanning continuam contextuais. | Lote 6 - GitHub Actions para integração de secret scanning. `opencode.json` é configuração do ambiente do agente e não foi alterado. |
| Arquitetura | Documento de estrutura e navegação coerente com a árvore. | `docs/repository-architecture.md`. | Implementado com ressalvas após esta reconciliação. | Manter sincronizado nos lotes seguintes quando arquivos forem promovidos de placeholder para implementados. |
| Documentos canônicos | Guias principais de normas, roadmap, auditorias, ferramentas, CI/CD, Frappe/Python, LGPD, acessibilidade, evidências, relatório, risco e Git. | Principais arquivos em `docs/` e `risk/severity-and-prioritization.md`. | Implementado com ressalvas. São guias e matrizes, não prova de operação. | Lotes 9, 10 e 11 conforme domínio restante; scripts no Lote 5. |
| Frappe/Python operacional | Guia, checklist, matriz de compatibilidade, fixture ficticia e validacoes documentais seguras. | `docs/frappe-python-security-audit.md`, `docs/frappe-python-version-compatibility.md`, `checklists/frappe-security.md`, `testing/frappe-python/`. | Implementado com ressalvas apos o Lote 7. A fixture e sintetica e nao executa runtime; matriz nao fixa versoes reais. | Lote 5 para validacao funcional dos scripts; SaaS consumidor para versoes reais, permissoes efetivas, site/tenant e testes autorizados. |
| Documentos auxiliares | Planos, modelos ou checklists auxiliares em `docs/`. | `docs/README.md`, `docs/incident-response-plan.md`, `docs/business-continuity-plan.md`, `docs/threat-model.md`, `docs/api-security-checklist.md`, `docs/cloud-security-checklist.md`, `docs/ai-governance-checklist.md`, `docs/accessibility-audit.md`, `docs/lgpd-gap-assessment.md`. | Implementado com ressalvas após o Lote 2. São guias/índices auxiliares que apontam para fontes canônicas, checklists e templates; não substituem artefatos operacionais de domínio. | Lote 9 para operacionalizar acessibilidade; Lote 10 para risco/evidências; revisão final para consistência geral. |
| Checklists | 15 checklists do Chunk 15, índice e README; checklist OWASP Top 10 adicional quando mantido. | `checklists/README.md`, `checklists/index.md` e 16 checklists de domínio. | Implementado. Lote 3 fechado e fonte `research/sources/chunk-15.md` presente. | Não alterar checklists individuais fora de erro objetivo de link, índice ou informação sensível. |
| Scripts | Oito pontos de entrada locais de auditoria. | `scripts/*.sh` e `scripts/README.md`. | Implementado com ressalvas. Sintaxe já foi validada; no Lote 7 apenas `run-frappe-audit.sh` e `run-python-audit.sh` foram conferidos com `bash -n`, sem exercitar ferramentas, rede, flags, saídas ou exit codes. | Lote 5 - Scripts. |
| Workflows ativos | Controles mínimos em `.github/workflows/`. | `.github/workflows/security.yml` e `.github/workflows/.gitkeep`. | Implementado com ressalvas após o Lote 6. O workflow ativo cobre política do repositório, arquivos sensíveis rastreados, padrões perigosos em workflows ativos e higiene básica de Markdown; não executa secret scanning completo nem scanners de stack. | Lote 10 para ampliação de controles preventivos; demais scanners dependem dos lotes de domínio e validação contextual. |
| Workflows de exemplo | Exemplos documentais em `examples/github-workflows/`. | 13 exemplos. | Parcial e não ativo. `dependency-review.yml`, `codeql.yml` e `zap-baseline.yml` são exemplos substantivos; os outros 10 permanecem placeholders e não foram promovidos no Lote 6. | Não copiar para `.github/workflows/` sem validação de plano, stack, SHA/digest, logs, artifacts, permissões e gate. |
| Templates | 14 templates do Chunk 17 e índice. | `templates/index.md`, `templates/README.md` e templates em `templates/`. | Implementado. | Validação ponta a ponta com SaaS fictício permanece melhoria futura. |
| Privacidade operacional | Artefatos auxiliares de LGPD em `privacy/`. | `privacy/README.md`, `privacy/*.md`. | Implementado com ressalvas apos o Lote 8. `privacy/*.md` foram reconciliados como guias operacionais pequenos para mapa de dados, ROPA, bases legais, RIPD/DPIA, direitos, retencao, terceiros, incidentes e privacy by design. O programa canonico permanece em `docs/lgpd-privacy-program.md`; registros reais ficam fora do Git. | SaaS consumidor para validacao juridica/contextual e registros reais restritos; Lote 11 para revisao final de consistencia. |
| Risco auxiliar | Registro e matriz auxiliares. | `risk/README.md`, `risk/risk-matrix.md`, `risk/risk-register.csv`. | Implementado com ressalvas para o README após o Lote 2; `risk/risk-matrix.md` e `risk/risk-register.csv` continuam placeholders. A fonte canônica atual é `risk/severity-and-prioritization.md`. | Lote 10 - Relatórios e evidências. |
| Relatórios | Separar cru local e resumo sanitizado. | `reports/README.md`, `reports/sanitized/.gitkeep`; `reports/raw/` é ignorado. | Implementado com ressalvas após o Lote 2. Material cru não deve ser versionado. | Lote 10 para reforço preventivo; Lote 11 para verificação final. |
| Research | Prompts, progresso, fila, auditoria, plano e fontes. | `research/prompts.md`, `research/progress.md`, `research/task-queue.md`, `research/coverage-audit.md`, `research/codex-execution-plan.md`, `research/sources/`. | Implementado com ressalvas. `coverage-audit.md` é histórico e reflete o estado antes dos fechamentos corretivos. | Atualizar somente ao final de cada lote executado. |
| Diretórios de domínio | READMEs por área para navegação futura. | `accessibility/`, `ai-governance/`, `appsec/`, `business-continuity/`, `compliance/`, `devsecops/`, `incident-response/`, `policies/`, `security/`, `testing/`, além de `privacy/`, `risk/`, `reports/` e `templates/`. | Implementado com ressalvas após o Lote 2; `privacy/` foi operacionalizado no Lote 8. READMEs funcionam como índices e registram limites. | Lotes 5, 9, 10 e 11 conforme domínio restante. |

## Divergências altas da auditoria e estado atual

| Divergência de `research/coverage-audit.md` | Estado após Lote 3 e Lote 1 | Encaminhamento |
|---|---|---|
| Checklists do Chunk 15 eram placeholders e fonte `chunk-15.md` não existia. | Reconciliado no Lote 3. Checklists principais são substantivos e `research/sources/chunk-15.md` existe. | Manter fechado; só alterar por erro objetivo. |
| `README.md` ainda tratava Chunk 19 e Chunk 20 como pendentes. | Reconciliado no Lote 1. README agora aponta para inventário, auditoria, plano e fila corretiva. | Manter atualizado nos próximos lotes. |
| `docs/repository-architecture.md` misturava árvore-alvo com implementação e dizia que scripts/workflows eram placeholders. | Reconciliado no Lote 1. Arquitetura agora separa ativo, exemplo, placeholder e pendência. | Atualizar quando lotes futuros mudarem estado real. |
| Workflows de exemplo permanecem majoritariamente placeholders. | Confirmado. O Lote 6 manteve exemplos fora do conjunto ativo e reconciliou apenas `security.yml` como automação mínima aplicável. | Promover exemplos somente em tarefa específica, após validação contextual. |
| Políticas raiz e proteção contra segredos permaneciam iniciais. | Reconciliado no Lote 4 com ressalvas; o Lote 6 adicionou verificação preventiva de arquivos sensíveis e marcadores sintéticos, mas secret scanning completo com Gitleaks/detect-secrets segue pendente. | Lote 10 para controles preventivos adicionais; repositório consumidor para owners, canal real e recursos GitHub nativos. |
| Documentos auxiliares, privacidade e risco auxiliar permanecem placeholders. | Parcialmente reconciliado no Lote 2 e atualizado no Lote 8. Documentos auxiliares em `docs/`, READMEs de domínio e `privacy/*.md` deixaram de ser placeholders vencidos; `risk/risk-matrix.md` e `risk/risk-register.csv` continuam pendentes no lote próprio. | Lote 10 para risco auxiliar; Lote 11 para revisao final. |
| Scripts existem, mas não foram exercitados funcionalmente. | Confirmado. Não foi corrigido no Lote 1 por estar fora do escopo. | Lote 5. |

## Próxima ordem corretiva

Após esta reconciliação, a fila corretiva recomendada permanece a ordem prática de `research/codex-execution-plan.md`:

| Ordem prática restante | Lote | Motivo |
|---:|---|---|
| 1 | Lote 9 - Acessibilidade | Fechar dominio de acessibilidade conforme dependencias. |
| 2 | Lote 5 - Scripts | Validar scripts com fixtures ficticias depois das dependencias documentais aplicaveis, incluindo a fixture Frappe/Python do Lote 7. |
| 3 | Lote 10 - Relatorios e evidencias | Reforcar controles preventivos, avaliar secret scanning completo e consolidar risco auxiliar. |
| 4 | Lote 11 - Revisao final | Verificar inventario, links, placeholders, fontes, scripts, workflows e arquivos sensiveis. |

## Limitações

- Não houve validação de links externos, versões de ferramentas, planos GitHub, imagens por digest, licenças, telemetria ou requisitos enterprise.
- `actions/checkout@v6` foi resolvido para SHA completo no Lote 6; outras actions e imagens de exemplos não foram promovidas nem fixadas.
- Não houve execução remota de workflows, scanners, scripts de auditoria, testes funcionais, servidor Frappe, banco, migração ou varredura completa de segredos.
- No Lote 8 houve alteracao apenas de `privacy/*.md` e registros de estado/fonte do lote; nao houve alteracao de scripts, workflows, exemplos de workflows, templates completos, checklists individuais, politicas raiz ou artefatos auxiliares de risco.
- Nenhum dado real, segredo, credencial, cookie, URL interna, tenant, relatório cru, payload, dump, backup, log ou evidência sensível foi criado.
