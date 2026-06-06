# Research Progress

## Status geral

- [x] Repositório local criado
- [x] `.gitignore` inicial criado
- [x] `AGENTS.md` criado
- [x] Fila de tarefas dos chunks 0 a 20 criada
- [x] Prompts importados
- [x] Estrutura inicial gerada pelo Codex
- [ ] Chunks executados parcialmente

Progresso: 2 de 21 chunks de execução concluídos; o Chunk 0 registra o contexto-mestre.
- [ ] README consolidado
- [ ] Auditoria de cobertura
- [ ] Repositório enviado para GitHub privado

## Chunks

- [x] Chunk 0 — Contexto-mestre
- [x] Chunk 1 — Matriz de normas, frameworks e referências
- [x] Chunk 2 — Estrutura completa do repositório
- [ ] Chunk 3 — Roadmap de implantação por fases
- [ ] Chunk 4 — Tipos de auditoria para SaaS
- [ ] Chunk 5 — Matriz de auditorias por cenário
- [ ] Chunk 6 — Ferramentas recomendadas e comandos
- [ ] Chunk 7 — GitHub Actions e CI/CD
- [ ] Chunk 8 — Frappe, ERPNext, Frappe LMS e Python
- [ ] Chunk 9 — LGPD e privacidade para SaaS
- [ ] Chunk 10 — Acessibilidade para SaaS web
- [ ] Chunk 11 — Relatórios, evidências e política de artifacts
- [ ] Chunk 12 — Modelo final de relatório de auditoria
- [ ] Chunk 13 — Priorização de vulnerabilidades e matriz de severidade
- [ ] Chunk 14 — Política de branches, commits, issues e PRs
- [ ] Chunk 15 — Checklists principais
- [ ] Chunk 16 — Scripts locais de auditoria
- [ ] Chunk 17 — Templates de documentos
- [ ] Chunk 18 — Consolidação README
- [ ] Chunk 19 — Auditoria de cobertura
- [ ] Chunk 20 — Plano para Codex/agente de código

## Registro de execução

### 2026-06-06 — Chunk 0

- Contexto-mestre registrado em `research/prompts.md`.
- Não houve geração de documento final.
- Nenhuma fonte externa foi necessária.


### 2026-06-06 — Chunk 1

- Criada a matriz prática em `docs/standards-and-frameworks-matrix.md`.
- Registradas fontes oficiais e incertezas em `research/sources/chunk-01.md`.
- Validada a atualização para OWASP Top 10 2025 e ISO/IEC/IEEE 12207:2026.
- Mantida pendente a confirmação, no Catálogo ABNT, da equivalência exata de edições brasileiras quando os metadados públicos foram insuficientes.
- Nenhum outro chunk foi executado.

### 2026-06-06 — Chunk 2

- Criado `docs/repository-architecture.md` com nome, árvore-alvo, responsabilidades, classificação dos artefatos e estratégia de reutilização.
- Verificada a árvore local contra os caminhos obrigatórios do prompt.
- Criados placeholders seguros para `.gitleaks.toml`, `.secrets.baseline`, oito scripts de auditoria e workflows do Chunk 7.
- Os scripts permanecem inertes até o Chunk 16; os workflows aceitam somente disparo manual e não executam scanners.
- Registrado em `research/sources/chunk-02.md` que nenhuma fonte externa foi necessária.
- Nenhum outro chunk foi executado.
