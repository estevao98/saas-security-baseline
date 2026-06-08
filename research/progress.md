# Research Progress

## Status geral

- [x] Repositório local criado
- [x] `.gitignore` inicial criado
- [x] `AGENTS.md` criado
- [x] Fila de tarefas dos chunks 0 a 20 criada
- [x] Prompts importados
- [x] Estrutura inicial gerada pelo Codex
- [ ] Chunks executados parcialmente

Progresso: 20 de 21 chunks de execução concluídos; o Chunk 0 registra o contexto-mestre.
- [x] README consolidado
- [x] Auditoria de cobertura
- [x] Repositório enviado para GitHub privado
- [x] Fechamento corretivo do Lote 3 — Checklists concluído
- [x] Reconciliação corretiva do Lote 1 — Estrutura inicial concluída
- [x] Reconciliação corretiva do Lote 4 — Políticas concluída com pendências contextuais
- [x] Reconciliação corretiva do Lote 6 — GitHub Actions concluída com pendências contextuais
- [x] Reconciliação corretiva do Lote 2 — Documentos base concluída com pendências por domínio

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
- [x] Chunk 15 — Checklists principais
- [x] Chunk 16 — Scripts locais de auditoria
- [x] Chunk 17 — Templates de documentos
- [x] Chunk 18 — Consolidação README
- [x] Chunk 19 — Auditoria de cobertura
- [x] Chunk 20 — Plano para Codex/agente de código

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

### 2026-06-07 — Chunk 15

- Substituidos os placeholders dos 15 checklists definidos no prompt por conteudo pratico para fases de release, AppSec, API, LGPD, acessibilidade, Frappe/Python, cloud, pagamentos, incidentes, backup, CI/CD, terceiros e IA.
- Mantido `checklists/owasp-top-10.md` como checklist principal adicional, substantivo e referenciado pelo README principal.
- Cada checklist inclui objetivo, momento de uso, revisor, evidencias, itens obrigatorios, desejaveis e de melhoria futura, criterios de aprovacao/reprovacao e cuidados com dados sensiveis.
- Alinhados os gates a `docs/audit-trigger-matrix.md`, `docs/evidence-and-reporting-policy.md`, `docs/security-audit-baseline.md` e `risk/severity-and-prioritization.md`.
- Registradas fontes oficiais, versoes, decisoes e limites em `research/sources/chunk-15.md`.
- Nenhum script do Chunk 16, template completo do Chunk 17 ou workflow novo do Chunk 7 foi criado ou alterado.
- Nenhum relatorio cru, segredo, credencial, dado pessoal real ou evidencia sensivel foi criado; nenhum outro chunk foi executado.

### 2026-06-07 — Chunk 16

- Substituidos os oito placeholders de `scripts/` por scripts Bash executaveis para orquestracao, Python, Node, containers/IaC, acessibilidade, API, Frappe e SBOM.
- Todos usam `set -euo pipefail`, preflight de dependencias, validacao de listas/caminhos/URLs, diretorios com timestamp e separacao entre crus em `reports/raw/` e resumos em `reports/sanitized/`.
- Rede exige consentimento explicito quando a ferramenta consulta registry, indice, advisory, regra ou base; imagens ZAP/produto precisam existir localmente e nenhum pull/instalacao ocorre automaticamente.
- URLs foram limitadas a HTTP em `127.0.0.1` ou `localhost`, sem query, fragmento, credenciais, headers ou cookies; ZAP ficou restrito ao Baseline passivo.
- O README documenta dependencias, execucao, saídas, falsos positivos/negativos, Frappe/Python, CI/CD, evidencias, interpretacao de status e relacao com risco.
- Registradas fontes oficiais, decisoes e incertezas em `research/sources/chunk-16.md`, incluindo rede, telemetria, caches, Grype DB v5, schemas SBOM e exit codes.
- Validada a sintaxe dos oito scripts com `bash -n`; scanners nao foram executados e nenhum relatorio cru foi criado.
- Nenhum workflow do Chunk 7 ou template do Chunk 17 foi criado ou alterado; nenhum outro chunk foi executado.

### 2026-06-07 — Chunk 17

- Substituídos os placeholders de `templates/index.md` e dos 14 templates definidos no prompt por modelos reutilizáveis de risco, findings, remediação, resumo executivo, privacidade, incidentes, continuidade, fornecedores, acessibilidade, threat modeling e IA.
- Cada template define objetivo, momento de uso, campos obrigatórios e opcionais, exemplo claramente fictício, cuidados contra exposição, critérios mínimos de revisão e relação com documentos existentes.
- O registro de riscos foi mantido em CSV com cabeçalho claro e uma única linha fictícia segura; os demais modelos usam Markdown pequeno, preenchível e revisável.
- Reforçada a separação entre templates/versionáveis e registros reais confidenciais ou restritos, com evidências apenas por IDs opacos e conteúdo cru fora do Git.
- Registradas fontes oficiais, decisões e incertezas jurídicas, contratuais, normativas, enterprise e de ferramenta em `research/sources/chunk-17.md`.
- Nenhum script do Chunk 16, workflow do Chunk 7, checklist do Chunk 15, README do Chunk 18, auditoria do Chunk 19 ou plano do Chunk 20 foi alterado; nenhum outro chunk foi executado.

### 2026-06-07 — Chunk 18

- Substituido o placeholder de `README.md` por uma porta de entrada com 25 secoes para proposito, publico, escopo, maturidade, uso, auditorias, ferramentas, CI/CD, Frappe/Python, LGPD, acessibilidade, evidencias, riscos, Git, checklists e templates.
- Mantidos os detalhes nos documentos existentes por meio de links relativos, sem duplicar normas, guias, scripts, checklists, templates ou workflows.
- Registrado que somente `.github/workflows/security.yml` esta ativo por padrao e que os demais workflows sao exemplos que exigem adaptacao e validacao contextual.
- Registradas fontes internas, referencias herdadas e incertezas preexistentes em `research/sources/chunk-18.md`.
- Nenhum script do Chunk 16, template do Chunk 17, checklist do Chunk 15 ou workflow do Chunk 7 foi alterado.
- Nenhuma auditoria de cobertura do Chunk 19 ou plano Codex do Chunk 20 foi criado; nenhum outro chunk foi executado.

### 2026-06-07 — Chunk 19

- Criado `research/coverage-audit.md` com avaliacao honesta dos 25 pontos, classificacao Sim/Parcial/Nao, evidencias, lacunas, gravidade, correcoes, prioridades e impacto no uso.
- Atribuidas notas aos seis criterios do prompt e criada lista de pendencias em formato de issues, separada por criticidade.
- Confirmadas divergencias relevantes no estado auditado daquele momento: checklists do Chunk 15 ainda eram placeholders, faltava `research/sources/chunk-15.md`, dez workflows de exemplo continuavam inertes e varios artefatos auxiliares/arquivos raiz nao estavam prontos para uso operacional.
- Nao foram encontrados links Markdown locais quebrados, relatorios crus rastreados ou padroes evidentes de credenciais reais na busca limitada; os oito scripts passaram em `bash -n`, sem execucao dos scanners.
- Registradas somente fontes internas e limites em `research/sources/chunk-19.md`.
- Nenhuma lacuna foi corrigida, nenhum documento fora de `research/` foi alterado e o Chunk 20 nao foi executado.

### 2026-06-07 — Chunk 20

- Criado `research/codex-execution-plan.md` com os 11 lotes do prompt original, reorganizados em ordem prática a partir das lacunas de `research/coverage-audit.md`.
- Priorizada, naquele momento, a recuperação real do Chunk 15, a regularização de `research/sources/chunk-15.md`, a reconciliação de status e a operacionalização da proteção contra segredos.
- Cada lote registra objetivo, branch, issue, arquivos existentes ou **a criar**, tarefas, conteúdo, aceite, validações, riscos, cuidados com evidências, revisão humana, ordem e proibições para o agente.
- Divididos os trabalhos futuros em PRs pequenos para políticas, workflows aplicáveis, documentos auxiliares, Frappe/Python, LGPD, acessibilidade, scripts, evidências e verificação final.
- Registradas somente fontes internas e incertezas em `research/sources/chunk-20.md`; nenhuma lacuna foi corrigida e nenhum arquivo fora de `research/` foi alterado.
- Nenhum outro chunk foi executado.

### 2026-06-07 — Fechamento corretivo do Lote 3 — Checklists

- Verificados os 15 checklists do prompt do Chunk 15 e o checklist adicional `checklists/owasp-top-10.md`.
- Confirmado que os checklists principais existem e nao sao placeholders: todos possuem itens marcaveis, objetivo, momento de uso, revisores, evidencias, criterios de aprovacao/reprovacao ou bloqueio e cuidados contra vazamento.
- Substituidos os placeholders remanescentes de navegacao em `checklists/index.md` e `checklists/README.md` por visao geral, uso, limites, agrupamento dos checklists e politica de evidencias.
- Atualizado `research/sources/chunk-15.md` com verificacao realizada, decisoes do fechamento, incertezas pendentes e limites de seguranca.
- Marcado o Lote 3 como concluido apos verificacao real; o proximo lote corretivo indicado em `research/task-queue.md` e o Lote 1 — Estrutura inicial.
- Nenhum arquivo individual de checklist, script, workflow, template ou documento fora do escopo foi alterado.

### 2026-06-07 — Reconciliação corretiva do Lote 1 — Estrutura inicial

- Identificado o escopo permitido a partir de `research/task-queue.md`, `research/codex-execution-plan.md` e `research/coverage-audit.md`: `docs/repository-architecture.md`, `README.md`, `research/progress.md`, `research/task-queue.md` e artefatos auxiliares de inventário/fontes em `research/`.
- Criado `research/repository-inventory.md` com inventário `esperado x existente x estado x próximo lote`, distinguindo implementado, implementado com ressalvas, exemplo, placeholder, planejado e não versionado.
- Atualizado `docs/repository-architecture.md` para refletir a árvore real após o Lote 3, separar workflow ativo, exemplos de workflows, checklists substantivos, placeholders e pendências.
- Atualizado `README.md` para apontar para `research/coverage-audit.md`, `research/codex-execution-plan.md`, `research/repository-inventory.md` e `research/sources/lote-01.md`, sem manter Chunk 19 ou Chunk 20 como pendentes.
- Criado `research/sources/lote-01.md` com fontes internas, decisões, incertezas e limites da reconciliação; `research/sources/chunk-01.md` não foi alterado porque pertence ao Chunk 1.
- Atualizado `research/task-queue.md` para marcar o Lote 1 como concluído e indicar o Lote 4 — Políticas como próximo lote corretivo.
- `research/coverage-audit.md` permaneceu sem alteração por ser registro histórico do estado auditado antes dos fechamentos corretivos.
- Não foram alterados checklists individuais, scripts, workflows, templates completos, políticas raiz, documentos auxiliares, arquivos de privacidade ou artefatos de risco fora do escopo.
- Não foram criados dados reais, segredos, credenciais, cookies, URLs internas, tenants, logs crus, dumps, backups, payloads, relatórios crus ou evidências sensíveis.

### 2026-06-08 — Reconciliação corretiva do Lote 4 — Políticas

- Identificado o escopo permitido a partir de `research/codex-execution-plan.md`, `research/task-queue.md` e `research/repository-inventory.md`: `SECURITY.md`, `CONTRIBUTING.md`, `CODEOWNERS`, `.gitleaks.toml`, `.secrets.baseline`, `.gitignore`, navegacao/estado em `README.md`, `docs/repository-architecture.md`, `research/repository-inventory.md`, `research/sources/lote-04.md`, `research/progress.md` e `research/task-queue.md`.
- Substituidos os placeholders de `SECURITY.md` e `CONTRIBUTING.md` por politicas operacionais para reporte privado, triagem, segredos expostos, evidencias, contribuicao, PRs, revisao e limites de escopo.
- Reescrito `CODEOWNERS` como template seguro com exemplos comentados, sem inventar usuarios, emails ou equipes GitHub.
- Atualizados `.gitleaks.toml` e `.secrets.baseline` para configuracao inicial de secret scanning sem segredos reais, sem findings e sem allowlist ampla.
- Ampliado `.gitignore` para padroes adicionais de chaves, configuracoes locais, credenciais e relatorios de scanners.
- Atualizados `README.md`, `docs/repository-architecture.md` e `research/repository-inventory.md` somente para refletir o estado real do Lote 4 e apontar pendencias restantes.
- Criado `research/sources/lote-04.md` com fontes oficiais, fontes internas, decisoes, incertezas e limites.
- Nao foram alterados scripts, workflows, templates completos, checklists individuais, documentos auxiliares, privacidade ou risco auxiliar.
- Permanecem pendentes para lote apropriado: owners reais, canal privado real, validacao com ferramentas instaladas, fixture controlada de secret scanning e integracao em workflow.
- Nao foram criados dados reais, segredos, credenciais, cookies, URLs internas, tenants, logs crus, dumps, backups, payloads, relatorios crus ou evidencias sensiveis.

### 2026-06-08 — Reconciliação corretiva do Lote 6 — GitHub Actions

- Identificado o escopo permitido a partir de `research/codex-execution-plan.md`, `research/task-queue.md` e `research/repository-inventory.md`: `.github/workflows/*.yml`, `.github/workflows/*.yaml`, navegacao/estado em `README.md` e `docs/repository-architecture.md`, `research/repository-inventory.md`, `research/sources/lote-06.md`, `research/progress.md` e `research/task-queue.md`.
- Confirmado que `.github/workflows/security.yml` e o unico workflow ativo por padrao; `.github/workflows/.gitkeep` e estrutural; exemplos em `examples/github-workflows/` nao foram promovidos nem alterados.
- Reconciliado `security.yml` como automacao minima aplicavel, com `permissions: contents: read`, `concurrency`, timeouts, `actions/checkout` fixado por SHA completo, `persist-credentials: false`, sem `pull_request_target`, sem secrets, sem permissao de escrita e sem upload de artifacts.
- Ampliados os controles do workflow ativo para bloquear arquivos sensiveis rastreados, marcadores sinteticos de conteudo sensivel, referencias mutaveis em workflows ativos, permissões perigosas, uso de secrets em workflows ativos e upload de artifacts.
- Adicionada higiene documental minima para Markdown, verificando arquivos vazios, CRLF e marcadores de conflito sem publicar relatorios ou linhas sensiveis.
- Atualizados `README.md`, `docs/repository-architecture.md` e `research/repository-inventory.md` somente para refletir o estado real do workflow ativo e das pendencias restantes.
- Criado `research/sources/lote-06.md` com fontes oficiais, fontes internas, decisoes, incertezas e limites.
- Validados localmente: parsing YAML com Ruby, `git diff --check` e execucao local dos scripts de politica/higiene usados no workflow. `actionlint` nao estava instalado e nao foi executado.
- Permanecem pendentes: Gitleaks/detect-secrets operacional, Dependency Review, CodeQL, SAST/SCA/DAST/SBOM, branch protection, rulesets, owners reais, canal privado real, plano/licenca GitHub, fixtures e validacao de logs/artifacts.
- Nao foram alterados scripts, exemplos de workflows, templates completos, checklists individuais, politicas fora de estado real, documentos auxiliares, privacidade ou risco auxiliar.
- Nao foram criados dados reais, segredos, credenciais, cookies, URLs internas, tenants, logs crus, dumps, backups, payloads, relatorios crus, artifacts ou evidencias sensiveis.

### 2026-06-08 — Reconciliação corretiva do Lote 2 — Documentos base

- Identificado o escopo permitido a partir de `research/codex-execution-plan.md`, `research/task-queue.md` e `research/repository-inventory.md`: documentos auxiliares em `docs/`, READMEs de dominio, navegacao/estado em `README.md` e `docs/repository-architecture.md`, `research/repository-inventory.md`, `research/sources/lote-02.md`, `research/progress.md` e `research/task-queue.md`.
- Substituidos placeholders de `docs/README.md`, `docs/incident-response-plan.md`, `docs/business-continuity-plan.md`, `docs/threat-model.md`, `docs/api-security-checklist.md`, `docs/cloud-security-checklist.md`, `docs/ai-governance-checklist.md`, `docs/accessibility-audit.md` e `docs/lgpd-gap-assessment.md` por guias pequenos, navegaveis e alinhados a fontes canonicas.
- Reconciliados READMEs de dominio como indices e limites de uso: `accessibility/`, `ai-governance/`, `appsec/`, `business-continuity/`, `compliance/`, `devsecops/`, `incident-response/`, `policies/`, `security/`, `testing/`, `privacy/`, `risk/`, `reports/` e `templates/`.
- Atualizados `README.md`, `docs/repository-architecture.md` e `research/repository-inventory.md` somente para refletir o estado real do Lote 2 e apontar pendencias restantes.
- Criado `research/sources/lote-02.md` com fontes internas, decisoes, incertezas e limites. Nao foram consultadas novas fontes externas.
- Permanecem pendentes para lotes proprios: Frappe/Python operacional no Lote 7, `privacy/*.md` no Lote 8, acessibilidade operacional no Lote 9, scripts no Lote 5, risco/evidencias no Lote 10 e revisao final no Lote 11.
- Nao foram alterados scripts, workflows, exemplos de workflows, templates completos, checklists individuais, politicas raiz, `privacy/*.md`, `risk/risk-matrix.md` ou `risk/risk-register.csv`.
- Nao foram criados dados reais, segredos, credenciais, cookies, URLs internas, tenants, logs crus, dumps, backups, payloads, relatorios crus, artifacts ou evidencias sensiveis.
