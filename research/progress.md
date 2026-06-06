# Research Progress

## Status geral

- [x] Repositório local criado
- [x] `.gitignore` inicial criado
- [x] `AGENTS.md` criado
- [x] Fila de tarefas dos chunks 0 a 20 criada
- [x] Prompts importados
- [x] Estrutura inicial gerada pelo Codex
- [ ] Chunks executados parcialmente

Progresso: 6 de 21 chunks de execução concluídos; o Chunk 0 registra o contexto-mestre.
- [ ] README consolidado
- [ ] Auditoria de cobertura
- [x] Repositório enviado para GitHub privado

## Chunks

- [x] Chunk 0 — Contexto-mestre
- [x] Chunk 1 — Matriz de normas, frameworks e referências
- [x] Chunk 2 — Estrutura completa do repositório
- [x] Chunk 3 — Roadmap de implantação por fases
- [x] Chunk 4 — Tipos de auditoria para SaaS
- [x] Chunk 5 — Matriz de auditorias por cenário
- [x] Chunk 6 — Ferramentas recomendadas e comandos
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

### 2026-06-06 — Chunk 3

- Criado `docs/security-roadmap.md` com as fases MVP seguro, SaaS vendável para empresas e SaaS maduro.
- Mapeados objetivos, prioridades, documentos, automações, riscos, evidências, gates de avanço e critérios de bloqueio para cada fase.
- Incluídos planos cumulativos de 30, 60, 90 e 180 dias e a separação entre obrigatório, desejável, melhoria futura e práticas para empresas maiores.
- Mantidas as edições e incertezas da matriz do Chunk 1, sem antecipar comandos ou configurações dos chunks de ferramentas e CI/CD.
- Registradas fontes oficiais e limites em `research/sources/chunk-03.md`.
- Nenhum outro chunk foi executado.

### 2026-06-06 — Chunk 4

- Criado `docs/audit-types.md` cobrindo os 23 tipos de auditoria solicitados.
- Para cada tipo foram documentados objetivo, gatilhos, frequência recomendada, ferramentas, relatórios, riscos, limitações, falsos positivos, evidências e exemplo de SaaS.
- Incluída a seção "Quais auditorias bloqueiam release?", com classificação baseada em aplicabilidade, validação e severidade.
- Diferenciados SCA e dependency scanning e registrados os limites de scanners, automação e evidência de ausência de achados.
- Registradas fontes oficiais e incertezas em `research/sources/chunk-04.md`, sem antecipar comandos ou versões do Chunk 6.
- Nenhum outro chunk foi executado.

### 2026-06-06 — Chunk 5

- Criado `docs/audit-trigger-matrix.md` com os 21 cenários de evento e periodicidade definidos no prompt.
- Classificadas auditorias obrigatórias, desejáveis e melhorias futuras por cenário, com riscos, evidências, revisores e critérios de Go/No-Go.
- Consolidada tabela operacional dos 23 tipos do Chunk 4 com frequência mínima e ideal, bloqueio, ferramentas e relatório esperado.
- Alinhadas as decisões às fases MVP seguro, SaaS vendável para empresas e SaaS maduro, sem alterar os gates do Chunk 4.
- Reconfirmadas fontes oficiais sobre SSDF, threat modeling, resposta a incidentes, RIPD e comunicação de incidente; incertezas foram registradas em `research/sources/chunk-05.md`.
- Nenhum outro chunk foi executado.

### 2026-06-06 — Chunk 6

- Substituído o placeholder de `docs/security-tools-catalog.md` por um catálogo operacional cobrindo secret scanning, Python, JavaScript/TypeScript, SAST, DAST, SCA, containers, IaC, SBOM, licenças, acessibilidade, API testing, CI/CD, gestão de risco, threat modeling e LGPD/privacy.
- Para cada ferramenta ou modelo foram registrados finalidade, ecossistema, forças, limitações, falsos positivos, comando validado quando aplicável, integração mínima com GitHub Actions, risco de exposição, gate e caminhos de relatório.
- Mantidos os workflows completos para o Chunk 7 e os scripts para o Chunk 16; os snippets são somente orientação documental.
- Registradas fontes oficiais, decisões e incertezas em `research/sources/chunk-06.md`, incluindo limites atuais de Safety, CodeQL privado, Dredd/OpenAPI 3, Newman v3, tfsec, ORT e CycloneDX.
- Reforçada a separação entre `reports/raw/` fora do Git e resumos revisados em `reports/sanitized/`.
- Nenhum outro chunk foi executado.
