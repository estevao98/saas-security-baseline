# Inventário Reconciliado do Repositório

## Escopo

Este inventário atende ao Lote 1 - Estrutura inicial. Ele reconcilia a árvore versionada com o estado declarado após o fechamento real do Lote 3 - Checklists.

O inventário não corrige conteúdo dos próximos lotes, não executa scanners, não valida ferramentas, não declara conformidade e não prova ausência de vulnerabilidades.

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
| Documentos canônicos | Guias principais de normas, roadmap, auditorias, ferramentas, CI/CD, Frappe/Python, LGPD, acessibilidade, evidências, relatório, risco e Git. | Principais arquivos em `docs/` e `risk/severity-and-prioritization.md`. | Implementado com ressalvas. São guias e matrizes, não prova de operação. | Lotes 2, 4, 6, 7, 8, 9, 10 e 11 conforme domínio. |
| Documentos auxiliares | Planos, modelos ou checklists auxiliares em `docs/`. | `docs/incident-response-plan.md`, `docs/business-continuity-plan.md`, `docs/threat-model.md`, `docs/api-security-checklist.md`, `docs/cloud-security-checklist.md`, `docs/ai-governance-checklist.md`, `docs/accessibility-audit.md`, `docs/lgpd-gap-assessment.md`. | Placeholder. | Lote 2; acessibilidade também depende do Lote 9; LGPD depende do Lote 8. |
| Checklists | 15 checklists do Chunk 15, índice e README; checklist OWASP Top 10 adicional quando mantido. | `checklists/README.md`, `checklists/index.md` e 16 checklists de domínio. | Implementado. Lote 3 fechado e fonte `research/sources/chunk-15.md` presente. | Não alterar checklists individuais fora de erro objetivo de link, índice ou informação sensível. |
| Scripts | Oito pontos de entrada locais de auditoria. | `scripts/*.sh` e `scripts/README.md`. | Implementado com ressalvas. Sintaxe já foi validada, mas ferramentas, rede, flags, saídas e exit codes ainda não foram exercitados. | Lote 5 - Scripts. |
| Workflows ativos | Controles mínimos em `.github/workflows/`. | `.github/workflows/security.yml` e `.github/workflows/.gitkeep`. | Implementado com ressalvas. O workflow ativo cobre política parcial e não executa secret scanning completo. | Lote 6 - GitHub Actions; Lote 10 para ampliação de controles preventivos. |
| Workflows de exemplo | Exemplos documentais em `examples/github-workflows/`. | 13 exemplos. | Parcial. `dependency-review.yml`, `codeql.yml` e `zap-baseline.yml` são exemplos substantivos; os outros 10 permanecem placeholders. | Lote 6. Não copiar para `.github/workflows/` sem validação. |
| Templates | 14 templates do Chunk 17 e índice. | `templates/index.md`, `templates/README.md` e templates em `templates/`. | Implementado. | Validação ponta a ponta com SaaS fictício permanece melhoria futura. |
| Privacidade operacional | Artefatos auxiliares de LGPD em `privacy/`. | `privacy/*.md`. | Placeholder. O programa canônico está em `docs/lgpd-privacy-program.md`; arquivos operacionais ainda não foram reconciliados. | Lote 8 - LGPD. |
| Risco auxiliar | Registro e matriz auxiliares. | `risk/risk-matrix.md`, `risk/risk-register.csv`. | Placeholder. A fonte canônica atual é `risk/severity-and-prioritization.md`. | Lote 10 - Relatórios e evidências. |
| Relatórios | Separar cru local e resumo sanitizado. | `reports/README.md`, `reports/sanitized/.gitkeep`; `reports/raw/` é ignorado. | Implementado com ressalvas. Material cru não deve ser versionado. | Lote 10 para reforço preventivo; Lote 11 para verificação final. |
| Research | Prompts, progresso, fila, auditoria, plano e fontes. | `research/prompts.md`, `research/progress.md`, `research/task-queue.md`, `research/coverage-audit.md`, `research/codex-execution-plan.md`, `research/sources/`. | Implementado com ressalvas. `coverage-audit.md` é histórico e reflete o estado antes dos fechamentos corretivos. | Atualizar somente ao final de cada lote executado. |
| Diretórios de domínio | READMEs por área para navegação futura. | `accessibility/`, `ai-governance/`, `appsec/`, `business-continuity/`, `compliance/`, `devsecops/`, `incident-response/`, `policies/`, `security/`, `testing/`. | Inicial ou placeholder. | Lote 2 e lotes de domínio correspondentes. |

## Divergências altas da auditoria e estado atual

| Divergência de `research/coverage-audit.md` | Estado após Lote 3 e Lote 1 | Encaminhamento |
|---|---|---|
| Checklists do Chunk 15 eram placeholders e fonte `chunk-15.md` não existia. | Reconciliado no Lote 3. Checklists principais são substantivos e `research/sources/chunk-15.md` existe. | Manter fechado; só alterar por erro objetivo. |
| `README.md` ainda tratava Chunk 19 e Chunk 20 como pendentes. | Reconciliado no Lote 1. README agora aponta para inventário, auditoria, plano e fila corretiva. | Manter atualizado nos próximos lotes. |
| `docs/repository-architecture.md` misturava árvore-alvo com implementação e dizia que scripts/workflows eram placeholders. | Reconciliado no Lote 1. Arquitetura agora separa ativo, exemplo, placeholder e pendência. | Atualizar quando lotes futuros mudarem estado real. |
| Workflows de exemplo permanecem majoritariamente placeholders. | Confirmado. Não foi corrigido no Lote 1 por estar fora do escopo. | Lote 6. |
| Políticas raiz e proteção contra segredos permaneciam iniciais. | Reconciliado no Lote 4 com ressalvas: políticas e configuração inicial existem, mas canal privado, owners reais, fixture controlada, validação de ferramentas e workflow permanecem pendentes. | Lote 6 para automação; repositório consumidor para owners e canal real. |
| Documentos auxiliares, privacidade e risco auxiliar permanecem placeholders. | Confirmado. Não foi corrigido no Lote 1 por estar fora do escopo. | Lotes 2, 8, 9 e 10. |
| Scripts existem, mas não foram exercitados funcionalmente. | Confirmado. Não foi corrigido no Lote 1 por estar fora do escopo. | Lote 5. |

## Próxima ordem corretiva

Após esta reconciliação, a fila corretiva recomendada permanece a ordem prática de `research/codex-execution-plan.md`:

| Ordem prática restante | Lote | Motivo |
|---:|---|---|
| 1 | Lote 6 - GitHub Actions | Implementar somente automações aplicáveis e validadas, incluindo secret scanning controlado. |
| 2 | Lote 2 - Documentos base | Reconciliar documentos auxiliares e fontes canônicas sem duplicação. |
| 3 | Lotes 7, 8 e 9 | Fechar domínios Frappe/Python, LGPD e acessibilidade conforme dependências. |
| 4 | Lote 5 - Scripts | Validar scripts com fixtures fictícias depois das dependências documentais aplicáveis. |
| 5 | Lote 10 - Relatórios e evidências | Reforçar controles preventivos e consolidar risco auxiliar. |
| 6 | Lote 11 - Revisão final | Verificar inventário, links, placeholders, fontes, scripts, workflows e arquivos sensíveis. |

## Limitações

- Não houve validação de links externos, versões de ferramentas, planos GitHub, actions por SHA, imagens por digest, licenças, telemetria ou requisitos enterprise.
- Não houve execução de scanners, workflows, scripts de auditoria, testes funcionais ou varredura completa de segredos.
- Não houve alteração de scripts, workflows, checklists individuais, templates completos, documentos auxiliares, privacidade ou risco auxiliar.
- Nenhum dado real, segredo, credencial, cookie, URL interna, tenant, relatório cru, payload, dump, backup, log ou evidência sensível foi criado.
