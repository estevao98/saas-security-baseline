# Research Progress

## Status geral

- [x] Repositório local criado
- [x] `.gitignore` inicial criado
- [x] `AGENTS.md` criado
- [x] Fila de tarefas dos chunks 0 a 20 criada
- [x] Prompts importados
- [x] Estrutura inicial gerada pelo Codex
- [ ] Chunks executados parcialmente

Progresso: 14 de 21 chunks de execução concluídos; o Chunk 0 registra o contexto-mestre.
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
- [x] Chunk 7 — GitHub Actions e CI/CD
- [x] Chunk 8 — Frappe, ERPNext, Frappe LMS e Python
- [x] Chunk 9 — LGPD e privacidade para SaaS
- [x] Chunk 10 — Acessibilidade para SaaS web
- [x] Chunk 11 — Relatórios, evidências e política de artifacts
- [x] Chunk 12 — Modelo final de relatório de auditoria
- [x] Chunk 13 — Priorização de vulnerabilidades e matriz de severidade
- [x] Chunk 14 — Política de branches, commits, issues e PRs
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

### 2026-06-06 — Chunk 7

- Criado `docs/github-actions-strategy.md` com os 13 workflows solicitados, gatilhos, ferramentas, saídas, permissões, gates, riscos de logs/artifacts e maturidade recomendada.
- Definidas políticas de falha, artifacts, logs, permissões, secrets, branch protection, matriz por fase e matriz de gates por severidade.
- Substituídos os placeholders de `security.yml`, `dependency-review.yml`, `codeql.yml` e `zap-baseline.yml` por exemplos mínimos sem secrets ou URLs privadas.
- O exemplo ZAP usa somente alvo fictício em loopback, não aceita URL arbitrária e não publica relatório; Dependency Review e CodeQL registram dependência de plano/licença em repositório privado.
- Registradas fontes oficiais e incertezas em `research/sources/chunk-07.md`, incluindo o incidente da cadeia do Trivy em março de 2026.
- Os demais workflows permanecem documentais e os scripts completos continuam reservados ao Chunk 16.
- Nenhum outro chunk foi executado.

### 2026-06-06 — Chunk 8

- Criado `docs/frappe-python-security-audit.md` com guia prático para Frappe Framework, ERPNext, Frappe Learning e Python.
- Cobertos estrutura de app, permissões, roles/profiles, customizações, APIs, ORM/SQL, jobs, scheduler, hooks, scripts, arquivos, autenticação, integrações, pagamentos, multi-tenant, logs, segredos e dependências.
- Incluídos checklist manual, comandos `rg`, padrões perigosos, falsos positivos, regras Semgrep simples, evidências, riscos críticos e bloqueios de release.
- Registradas fontes oficiais e incertezas de versão em `research/sources/chunk-08.md`, incluindo mudanças documentadas no Frappe v16 e limites de validação de CSRF/rate limiting por versão.
- Nenhum script do Chunk 16 nem workflow adicional do Chunk 7 foi criado ou alterado.
- Nenhum outro chunk foi executado.

### 2026-06-06 — Chunk 9

- Criado `docs/lgpd-privacy-program.md` como programa prático de LGPD e privacidade para produto, engenharia, operação, governança, fornecedores, evidências e auditoria de SaaS.
- Cobertos ciclo de vida, papéis, bases legais, direitos, documentos, privacy by design/default, terceiros, transferências internacionais, incidentes, matriz operacional, checklist e gates de release.
- Diferenciadas orientação técnica e validação jurídica, com incertezas regulatórias explícitas para RIPD, direitos, pequeno porte, transferências e comunicação de incidentes.
- Registradas fontes oficiais da LGPD e ANPD em `research/sources/chunk-09.md`.
- Nenhum template completo do Chunk 17, script do Chunk 16 ou checklist final do Chunk 15 foi criado.
- Nenhum outro chunk foi executado.

### 2026-06-06 — Chunk 10

- Criado `docs/accessibility-program.md` como programa prático para produto, design, frontend, conteúdo, QA, suporte, auditoria e CI/CD de SaaS web.
- Cobertos WCAG 2.2 AA, princípios e níveis, critérios prioritários, limites da automação, política, responsabilidades, fluxos críticos, checklists e roteiro manual.
- Documentadas a ABNT NBR 17225:2025 e a aplicabilidade condicional da ABNT NBR 17060:2022, com incertezas e necessidade de reconfirmação no Catálogo ABNT para uso formal.
- Reutilizados somente os comandos de axe, Lighthouse e Pa11y já validados em `docs/security-tools-catalog.md`.
- Definidos proteção de evidências, redaction, gates de release, backlog/SLA, diferenças entre tipos de avaliação e relações com LGPD, design system, Frappe/LMS e multi-tenant.
- Registradas fontes oficiais e institucionais em `research/sources/chunk-10.md`.
- Mantido `docs/accessibility-audit.md` como placeholder; foi incluída apenas sua estrutura sugerida, sem antecipar o template completo do Chunk 17.
- Nenhum script do Chunk 16, checklist final do Chunk 15 ou workflow novo foi criado.
- Nenhum outro chunk foi executado.

### 2026-06-06 — Chunk 11

- Criado `docs/evidence-and-reporting-policy.md` com classificação, ciclo de vida, acesso, redaction, retenção e descarte de evidências de auditoria de SaaS.
- Classificados todos os tipos solicitados e os 13 relatórios do prompt original quanto a Git, `reports/raw/`, `reports/sanitized/`, exposição, criptografia, CI artifact e evidência mínima.
- Definidas políticas específicas para vulnerabilidades, segredos, dados pessoais, SBOM/supply chain, acessibilidade, testes com usuários, incidentes, Frappe/Frappe LMS e clientes enterprise.
- Incluídos checklists antes de commit, upload em CI/CD e abertura de issue/PR, além de revisão por formato e exemplos de nomes seguros/proibidos.
- Confirmado que `reports/raw/` já está protegido por `.gitignore`; o arquivo não foi alterado e nenhum relatório cru foi criado ou movido.
- Registradas fontes oficiais e incertezas em `research/sources/chunk-11.md`, incluindo retenção do GitHub Actions e o mínimo de cinco anos para registros de incidentes com dados pessoais segundo a Resolução CD/ANPD nº 15/2024.
- Nenhum workflow, script ou template completo foi criado; nenhum outro chunk foi executado.

### 2026-06-06 — Chunk 12

- Substituido o placeholder de `docs/security-audit-baseline.md` por um modelo preenchivel de relatorio final de auditoria de seguranca para SaaS.
- Incluidas capa, sumario executivo, controle de versao, classificacao, escopo, metodologia, ferramentas, execucao, achados, riscos, remediacao, gates, dominios, mapeamentos, evidencias, limitacoes, proximas auditorias e declaracao final.
- Incluidos comentarios Markdown e avisos para impedir segredos, credenciais, dados pessoais, URLs privadas, payloads, requests/responses, logs crus e evidencias sensiveis.
- Mantida a separacao entre `reports/raw/` fora do Git e `reports/sanitized/` revisado, com referencia opaca, redaction e cadeia de custodia quando aplicavel.
- Registradas fontes internas e oficiais de apoio em `research/sources/chunk-12.md`, sem introduzir novas versoes, comandos ou requisitos.
- Nenhum relatorio cru, script, workflow ou template do Chunk 17 foi criado; nenhum outro chunk foi executado.

### 2026-06-07 — Chunk 13

- Substituído o placeholder de `risk/severity-and-prioritization.md` por uma matriz prática de severidade, prioridade, risco, SLA, gates de release, tratamento, aceite, issues, backlog e reteste para SaaS.
- Definidos os níveis crítico, alto, médio, baixo e informativo, com impacto técnico/de negócio, explorabilidade, exposição, dados, LGPD, acessibilidade, disponibilidade, financeiro, reputação e alcance multi-tenant.
- Documentado o uso complementar e não automático de CVSS v4.0, CISA KEV, SSVC, EPSS, OWASP e contexto de negócio.
- Incluídos SLAs internos ajustáveis, regras de exceção/reabertura/expiração, matriz por tipo de finding, exemplos fictícios e checklists de triagem, reclassificação e fechamento.
- Registradas fontes oficiais, decisões e incertezas em `research/sources/chunk-13.md`.
- Nenhum workflow do Chunk 7, script do Chunk 16 ou template completo do Chunk 17 foi criado ou alterado; nenhum outro chunk foi executado.

### 2026-06-07 — Chunk 14

- Criado `docs/git-security-workflow.md` com estratégia trunk-based, uso condicional de `develop` e padrões seguros para feature, finding, tooling, documentação, hotfix e release.
- Documentados os fluxos de findings, issues, riscos aceitos, falsos positivos, segredos vazados, hotfixes, releases, commits e pull requests.
- Definidas relações por IDs opacos entre PRs, issues, findings, riscos e evidências sanitizadas, preservando relatórios crus e detalhes sensíveis fora do Git.
- Incluídos fluxos para MVP seguro, SaaS vendável para empresas e SaaS maduro, além de branch protection e checklists antes de merge e release.
- Registradas fontes oficiais e incertezas de plano, licença, contrato e política interna em `research/sources/chunk-14.md`.
- Nenhum workflow, script, checklist do Chunk 15 ou template completo do Chunk 17 foi criado ou alterado; nenhum outro chunk foi executado.
