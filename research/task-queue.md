# Fila de tarefas da pesquisa

Esta fila organiza os chunks definidos em `research/prompts.md`. Nenhum chunk foi executado durante a criação deste arquivo.

## Regras de execução

- Processar um chunk por vez e manter o status como `pendente` até cumprir todos os critérios de aceite.
- Antes de cada chunk, reler `AGENTS.md`, este arquivo e `research/progress.md`.
- Registrar as fontes oficiais do chunk em um arquivo próprio dentro de `research/sources/`.
- Atualizar `research/progress.md` ao concluir cada chunk.
- Manter relatórios crus em `reports/raw/`, fora do Git, e publicar somente resumos revisados em `reports/sanitized/`.
- Não incluir segredos, credenciais, dados pessoais reais ou evidências sensíveis.

## Fila corretiva pós-auditoria

Esta fila deriva de `research/coverage-audit.md` e `research/codex-execution-plan.md`. Ela nao substitui a fila historica dos chunks; registra o estado dos lotes corretivos.

| Ordem | Lote corretivo | Status | Observacao |
|---:|---|---|---|
| 1 | Lote 3 — Checklists | Concluido em 2026-06-07 | Checklists principais verificados como substantivos; `checklists/README.md`, `checklists/index.md`, `research/sources/chunk-15.md`, `research/progress.md` e esta fila foram reconciliados. |
| 2 | Lote 1 — Estrutura inicial | Concluido em 2026-06-07 | Inventario, arquitetura, README, fontes e estado declarado reconciliados sem alterar scripts, workflows, templates completos ou checklists individuais. |
| 3 | Lote 4 — Políticas | Concluido em 2026-06-08 com pendencias contextuais | `SECURITY.md`, `CONTRIBUTING.md`, `CODEOWNERS`, `.gitleaks.toml`, `.secrets.baseline`, `.gitignore`, navegacao, fontes e estado foram reconciliados sem alterar scripts, workflows, templates completos ou checklists individuais. |
| 4 | Lote 6 — GitHub Actions | Concluido em 2026-06-08 com pendencias contextuais | `.github/workflows/security.yml`, navegacao, inventario, fontes e estado foram reconciliados com automacao minima aplicavel, sem promover exemplos, scanners especializados, artifacts, deploy ou gates dependentes de plano GitHub. |
| 5 | Lote 2 — Documentos base | Concluido em 2026-06-08 com pendencias por dominio | Documentos auxiliares em `docs/`, READMEs de dominio, navegacao, inventario, fontes e estado foram reconciliados como guias/indices sem alterar scripts, workflows, templates completos, checklists individuais, politicas raiz, `privacy/*.md` ou risco auxiliar. |
| 6 | Lote 7 — Frappe/Python | Concluido em 2026-06-08 com pendencias contextuais | Criadas matriz de compatibilidade, fixture ficticia positiva/negativa e validacoes locais seguras documentadas com `rg`; a conferencia local usou busca interna equivalente porque `rg` nao estava instalado. |
| 7 | Lote 8 — LGPD | Concluido em 2026-06-09 com pendencias juridicas/contextuais | `privacy/*.md`, navegacao, inventario, fontes e estado foram reconciliados como artefatos operacionais reutilizaveis, sem dados pessoais reais, sem escolher base legal e sem alterar scripts, workflows, templates completos, politicas raiz ou checklists individuais. |
| 8 | Lote 9 — Acessibilidade | Proximo lote corretivo | Operacionalizar acessibilidade sem declarar conformidade automatica e preservando avaliacao manual obrigatoria. |

Pendencias do Lote 3 encerradas neste fechamento:

- [x] Confirmar existencia dos checklists principais.
- [x] Confirmar que os checklists principais nao permanecem placeholders.
- [x] Atualizar `checklists/index.md` para refletir os checklists existentes.
- [x] Atualizar `checklists/README.md` com visao geral, uso e limites.
- [x] Atualizar `research/sources/chunk-15.md` com fechamento, decisoes e incertezas.
- [x] Reconciliar `research/progress.md` e `research/task-queue.md` sem executar outro lote.

Pendencias do Lote 1 encerradas nesta reconciliacao:

- [x] Confirmar que o Lote 3 foi fechado antes de reconciliar estado do Chunk 15.
- [x] Criar inventario `esperado x existente x substantivo x placeholder x planejado` em `research/repository-inventory.md`.
- [x] Atualizar `docs/repository-architecture.md` para separar estado atual, exemplos, placeholders e pendencias.
- [x] Atualizar `README.md` para apontar para auditoria, plano, inventario e fila corretiva existentes.
- [x] Registrar fontes, decisoes e incertezas em `research/sources/lote-01.md`.
- [x] Reconciliar `research/progress.md` e `research/task-queue.md` sem executar outro lote.

O Lote 3 e o Lote 1 permanecem fechados; nao altera-los salvo erro objetivo de link, indice ou informacao sensivel.

Pendencias do Lote 4 encerradas nesta reconciliacao:

- [x] Substituir placeholder de `SECURITY.md` por politica de reporte, triagem, segredos, divulgacao e evidencias.
- [x] Substituir placeholder de `CONTRIBUTING.md` por fluxo de contribuicao, PR, evidencias, fontes e revisao.
- [x] Reconciliar `CODEOWNERS` sem inventar owners reais, mantendo exemplos comentados para o repositorio consumidor.
- [x] Configurar `.gitleaks.toml` com extensao das regras padrao e regras minimas especificas sem allowlist ampla.
- [x] Converter `.secrets.baseline` em baseline vazia revisavel, sem findings, hashes de segredos reais ou valores sensiveis.
- [x] Ampliar `.gitignore` para padroes adicionais de credenciais, chaves, configuracoes locais e relatorios de scanners.
- [x] Atualizar `README.md`, `docs/repository-architecture.md` e `research/repository-inventory.md` apenas para refletir o estado real das politicas e pendencias restantes.
- [x] Registrar fontes, decisoes, incertezas e limites em `research/sources/lote-04.md`.
- [x] Reconciliar `research/progress.md` e `research/task-queue.md` sem executar outro lote.

Pendencias que permanecem fora do Lote 4:

- [ ] Definir canal privado real de reporte no repositorio consumidor.
- [ ] Substituir exemplos comentados de `CODEOWNERS` por usuarios ou equipes GitHub reais com permissao de escrita.
- [ ] Validar Gitleaks e detect-secrets com versoes instaladas e stdout/stderr revisados.
- [ ] Criar ou gerar fixture positiva/negativa de secret scanning em estrategia controlada que nao quebre scans normais do repositorio.
- [ ] Avaliar integracao de secret scanning em workflow somente apos validar ferramenta, logs, artifacts, plano GitHub, fixture e politica de gate; no Lote 6 permaneceu como pendencia contextual.
- [ ] Reconciliar `docs/README.md`, `policies/README.md` e outros READMEs de dominio no Lote 2 ou revisao final.

O proximo trabalho nao deve alterar o Lote 4 salvo erro objetivo, link quebrado ou informacao sensivel.

Pendencias do Lote 6 encerradas nesta reconciliacao:

- [x] Inventariar `.github/workflows/` e confirmar que somente `security.yml` esta ativo por padrao.
- [x] Separar workflow ativo minimo, exemplos de workflows e controles que nao devem virar gate ainda.
- [x] Reconciliar `security.yml` com `permissions: contents: read`, sem `pull_request_target`, sem secrets, sem artifacts e sem permissao de escrita.
- [x] Fixar `actions/checkout` por SHA completo no workflow ativo.
- [x] Ampliar controles aplicaveis contra arquivos sensiveis rastreados, marcadores sinteticos e padroes perigosos em workflows ativos.
- [x] Adicionar higiene documental minima para Markdown sem depender de ferramenta externa, artifact ou secret.
- [x] Atualizar `README.md`, `docs/repository-architecture.md` e `research/repository-inventory.md` apenas para refletir o estado real dos workflows.
- [x] Registrar fontes, decisoes, incertezas e limites em `research/sources/lote-06.md`.
- [x] Reconciliar `research/progress.md` e `research/task-queue.md` sem executar outro lote.

Pendencias que permanecem fora do Lote 6:

- [ ] Confirmar plano/licenca GitHub antes de habilitar Dependency Review, CodeQL/code scanning, secret scanning nativo, rulesets, branch protection avancada, environments ou merge queue.
- [ ] Validar Gitleaks e detect-secrets com versoes instaladas, fixture controlada, stdout/stderr revisados e estrategia que nao publique valores ou relatorios crus.
- [ ] Fixar por SHA completo as actions e por digest as imagens de qualquer workflow especializado antes de usa-lo como gate material.
- [ ] Promover exemplos de `examples/github-workflows/` somente em tarefa propria, por stack/fase, com owner, plano, logs, artifacts e politica de falha revisados.
- [ ] Executar `actionlint` ou validador equivalente quando uma versao aprovada estiver disponivel.
- [ ] Configurar branch protection, rulesets, owners reais e checks obrigatorios apenas no repositorio consumidor ou apos decisao humana especifica.

Pendencias do Lote 2 encerradas nesta reconciliacao:

- [x] Confirmar escopo do Lote 2 em `research/codex-execution-plan.md`, `research/task-queue.md` e `research/repository-inventory.md`.
- [x] Substituir placeholders de `docs/README.md` e dos documentos auxiliares de incidentes, continuidade, threat model, API, cloud, IA, acessibilidade e LGPD por guias pequenos e navegaveis.
- [x] Redirecionar documentos auxiliares para fontes canonicas, checklists e templates existentes, evitando duplicacao contraditoria.
- [x] Reconciliar READMEs de dominio como indices de navegacao e limites de uso.
- [x] Atualizar `README.md`, `docs/repository-architecture.md` e `research/repository-inventory.md` apenas para refletir o estado real dos documentos base.
- [x] Registrar fontes, decisoes, incertezas e limites em `research/sources/lote-02.md`.
- [x] Reconciliar `research/progress.md` e `research/task-queue.md` sem executar outro lote.

Pendencias que permanecem fora do Lote 2:

- [x] Validar Frappe/Python com fixture ficticia, matriz de versoes e testes documentais no Lote 7; validacao funcional de scripts permanece no Lote 5.
- [x] Reconciliar `privacy/*.md`, bases legais, ROPA, RIPD/DPIA, direitos, retencao, terceiros e incidentes com dados pessoais no Lote 8.
- [ ] Operacionalizar acessibilidade com fixture, automacao/manual combinados e eventual CI no Lote 9.
- [ ] Validar scripts, ferramentas, rede, outputs e exit codes com fixtures ficticias no Lote 5.
- [ ] Consolidar `risk/risk-matrix.md`, `risk/risk-register.csv`, evidencias, controles preventivos e secret scanning completo no Lote 10.
- [ ] Executar revisao final de links, placeholders, fontes, scripts, workflows e arquivos sensiveis no Lote 11.

Pendencias do Lote 7 encerradas nesta reconciliacao:

- [x] Confirmar escopo do Lote 7 em `research/codex-execution-plan.md`, `research/task-queue.md` e `research/repository-inventory.md`.
- [x] Criar matriz de compatibilidade em `docs/frappe-python-version-compatibility.md`, sem fixar versoes reais do consumidor.
- [x] Criar fixture Frappe/Python ficticia positiva/negativa em `testing/frappe-python/`, sem `sites/`, banco, usuario, tenant, credencial, token, URL interna, request/response, payload ofensivo ou dado pessoal real.
- [x] Documentar validacoes locais seguras com `rg`, sem rede externa e sem scanner agressivo; conferencia local feita por busca interna equivalente porque `rg` nao estava instalado.
- [x] Alinhar guia, checklist Frappe e indices de dominio aplicaveis aos novos artefatos.
- [x] Registrar fontes, decisoes, incertezas e limites em `research/sources/lote-07.md`.
- [x] Reconciliar `research/progress.md`, `research/task-queue.md` e `research/repository-inventory.md` sem executar outro lote.

Pendencias que permanecem fora do Lote 7:

- [ ] Validar funcionalmente `scripts/run-frappe-audit.sh`, `scripts/run-python-audit.sh` e wrappers com ferramentas ausentes, stdout/stderr, exit codes, paths, criacao de `reports/raw/` e resumos em `reports/sanitized/` no Lote 5.
- [ ] Confirmar versoes reais de Frappe, ERPNext, Frappe Learning, Python, Node, apps instalados e ferramentas no SaaS consumidor.
- [ ] Validar permissões efetivas, Custom DocPerm, User Permissions, Role Profiles, Server Scripts, Client Scripts, Property Setters e customizacoes por site em ambiente autorizado.
- [ ] Integrar Semgrep, Bandit, Ruff, pip-audit, secret scanning ou CI somente apos versoes, logs, artifacts, rede, falsos positivos e politica de falha serem aprovados.
- [x] Reconciliar LGPD operacional no Lote 8.
- [ ] Reconciliar acessibilidade operacional no Lote 9, scripts no Lote 5, evidencias/risco no Lote 10 e revisao final no Lote 11.

Pendencias do Lote 8 encerradas nesta reconciliacao:

- [x] Confirmar escopo permitido em `research/codex-execution-plan.md`, `research/task-queue.md` e `research/repository-inventory.md`.
- [x] Reconciliar `privacy/README.md` como indice operacional de privacidade/LGPD.
- [x] Substituir placeholders de `privacy/data-map.md`, `privacy/ropa.md`, `privacy/legal-bases.md`, `privacy/dpia-template.md`, `privacy/data-subject-rights.md`, `privacy/retention-policy.md`, `privacy/third-party-processors.md`, `privacy/incident-personal-data.md` e `privacy/privacy-by-design-checklist.md` por guias operacionais pequenos.
- [x] Apontar para `docs/lgpd-privacy-program.md`, `docs/evidence-and-reporting-policy.md`, `docs/lgpd-gap-assessment.md`, checklists e templates existentes sem duplicar modelos completos.
- [x] Preservar bases legais como triagem e registrar validacao juridica/Privacidade como dependencia humana.
- [x] Registrar limites para dados pessoais, evidencias, terceiros, transferencia internacional, incidentes, ROPA e RIPD/DPIA.
- [x] Criar `research/sources/lote-08.md` com fontes internas, decisoes, incertezas e limites.
- [x] Reconciliar `research/progress.md`, `research/task-queue.md` e `research/repository-inventory.md` sem executar outro lote.

Pendencias que permanecem fora do Lote 8:

- [ ] Validar juridicamente papeis controlador/operador, bases legais, RIPD, retencao, transferencias internacionais, contratos, direitos e comunicacao de incidentes no SaaS consumidor.
- [ ] Preencher registros reais de mapa, ROPA, RIPD/DPIA, fornecedores, direitos e incidentes somente em sistema restrito do produto, nunca neste baseline.
- [ ] Revalidar texto consolidado e regulamentos vigentes da ANPD antes de caso real, comunicacao externa ou auditoria formal.
- [ ] Operacionalizar acessibilidade no Lote 9, scripts no Lote 5, evidencias/risco no Lote 10 e revisao final no Lote 11.

O proximo lote corretivo e o **Lote 9 — Acessibilidade**.

## Chunk 0 - Contexto-mestre do projeto

- **Arquivo principal esperado:** sem arquivo final; contexto registrado em `research/prompts.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Confirmar o entendimento do objetivo, do escopo técnico e das três fases de maturidade.
  - [ ] Registrar limites de segurança, evidências e uso de fontes para os chunks seguintes.
  - [ ] Não gerar documentos finais nem antecipar conteúdo dos demais chunks.
  - [ ] Registrar fontes em `research/sources/chunk-00.md`, caso alguma fonte seja consultada.
  - [ ] Atualizar `research/progress.md`.
- **Comando de commit sugerido:** `git commit -m "docs(research): register master context"`

## Chunk 1 - Matriz de normas, frameworks e referências

- **Arquivo principal esperado:** `docs/standards-and-frameworks-matrix.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Cobrir todas as normas, leis, frameworks e referências listadas no prompt.
  - [x] Informar versão ou edição somente quando validada, indicando incertezas.
  - [x] Mapear objetivo, aplicação em SaaS, fase, documentos, ferramentas e certificação.
  - [x] Incluir a seção "Como usar esta matriz no repositório".
  - [x] Registrar fontes oficiais em `research/sources/chunk-01.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(standards): add frameworks matrix"`

## Chunk 2 - Estrutura completa do repositório

- **Arquivo principal esperado:** `docs/repository-architecture.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Propor nome principal, alternativas e justificativa.
  - [x] Incluir a árvore completa com todas as pastas e arquivos obrigatórios do prompt.
  - [x] Explicar pastas e arquivos principais em tabelas.
  - [x] Identificar templates, checklists, políticas, relatórios e arquivos que não recebem dados reais.
  - [x] Explicar a reutilização em diferentes SaaS.
  - [x] Registrar fontes em `research/sources/chunk-02.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(architecture): define repository structure"`

## Chunk 3 - Roadmap de implantação por fases

- **Arquivo principal esperado:** `docs/security-roadmap.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Cobrir MVP seguro, SaaS vendável para empresas e SaaS maduro.
  - [x] Mapear normas e referências indicadas para cada fase.
  - [x] Incluir objetivos, documentos, automações, riscos, evidências e critérios de avanço e bloqueio.
  - [x] Incluir planos de 30, 60, 90 e 180 dias.
  - [x] Diferenciar obrigatório, desejável, melhoria futura e práticas para empresas maiores.
  - [x] Registrar fontes em `research/sources/chunk-03.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(roadmap): add security maturity phases"`

## Chunk 4 - Tipos de auditoria para SaaS

- **Arquivo principal esperado:** `docs/audit-types.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Cobrir todos os tipos de auditoria listados no prompt.
  - [x] Para cada tipo, documentar uso, frequência, ferramentas, riscos, limitações e evidências.
  - [x] Incluir falsos positivos e exemplo prático de SaaS.
  - [x] Classificar auditorias na seção "Quais auditorias bloqueiam release?".
  - [x] Registrar fontes em `research/sources/chunk-04.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(audit): document SaaS audit types"`

## Chunk 5 - Matriz de auditorias por cenário

- **Arquivo principal esperado:** `docs/audit-trigger-matrix.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Cobrir todos os cenários de evento e periodicidade definidos no prompt.
  - [x] Classificar auditorias obrigatórias, desejáveis e futuras por cenário.
  - [x] Informar riscos, evidências, revisor e critério de Go/No-Go.
  - [x] Incluir tabela-resumo por auditoria com frequência, bloqueio, ferramentas e relatório.
  - [x] Registrar fontes em `research/sources/chunk-05.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(audit): add audit trigger matrix"`

## Chunk 6 - Ferramentas recomendadas e comandos

- **Arquivo principal esperado:** `docs/security-tools-catalog.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Cobrir todas as categorias e ferramentas listadas no prompt.
  - [x] Documentar finalidade, ecossistema, limites, falsos positivos, saída e política de bloqueio.
  - [x] Incluir apenas comandos Linux confirmados em documentação oficial.
  - [x] Explicar integração com GitHub Actions e riscos de exposição em relatórios.
  - [x] Sinalizar explicitamente comandos ou versões que exijam validação posterior.
  - [x] Registrar fontes em `research/sources/chunk-06.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(tooling): add security tools catalog"`

## Chunk 7 - GitHub Actions e CI/CD

- **Arquivo principal esperado:** `docs/github-actions-strategy.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Definir todos os workflows solicitados, seus gatilhos, ferramentas e saídas.
  - [x] Incluir exemplos mínimos de YAML sem segredos reais.
  - [x] Definir bloqueio ou alerta, política de artifacts e cuidados com logs.
  - [x] Recomendar checks de branch protection para as três fases de maturidade.
  - [x] Incluir a seção "Estratégia de falha: quando o CI deve quebrar?".
  - [x] Registrar fontes em `research/sources/chunk-07.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(ci): define GitHub Actions strategy"`

## Chunk 8 - Frappe, ERPNext, Frappe LMS e Python

- **Arquivo principal esperado:** `docs/frappe-python-security-audit.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Cobrir todos os padrões, permissões, integrações e fluxos Frappe listados.
  - [x] Incluir checklist manual, comandos `rg`, padrões suspeitos e falsos positivos.
  - [x] Incluir regras Semgrep simples somente quando tecnicamente válidas.
  - [x] Definir riscos críticos, evidências, bloqueios de release e adaptação multi-tenant.
  - [x] Sinalizar dependências de versão e não inventar APIs do Frappe.
  - [x] Registrar fontes em `research/sources/chunk-08.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(frappe): add Python security audit guide"`

## Chunk 9 - LGPD e privacidade para SaaS

- **Arquivo principal esperado:** `docs/lgpd-privacy-program.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Cobrir o ciclo de tratamento, direitos, papéis, terceiros, incidentes e privacy by design.
  - [x] Explicar cada documento de privacidade solicitado, seus campos, revisão e evidências.
  - [x] Incluir matriz LGPD prática para SaaS.
  - [x] Diferenciar orientação técnica de validação jurídica.
  - [x] Citar LGPD e fontes oficiais da ANPD.
  - [x] Registrar fontes em `research/sources/chunk-09.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(lgpd): add SaaS privacy program"`

## Chunk 10 - Acessibilidade para SaaS web

- **Arquivo principal esperado:** `docs/accessibility-program.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Cobrir WCAG 2.2 AA e as normas ABNT aplicáveis sem reproduzir texto integral.
  - [x] Incluir política, checklists, roteiro manual e fluxos críticos.
  - [x] Explicar uso de axe-core, Lighthouse e Pa11y com comandos validados.
  - [x] Definir evidências, falhas que bloqueiam release e melhorias não bloqueantes.
  - [x] Incluir exemplo de estrutura para `docs/accessibility-audit.md`.
  - [x] Registrar fontes em `research/sources/chunk-10.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(accessibility): add SaaS accessibility program"`

## Chunk 11 - Relatórios, evidências e política de segurança dos artifacts

- **Arquivo principal esperado:** `docs/evidence-and-reporting-policy.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Classificar todos os relatórios listados quanto a exposição, Git, criptografia, redaction e retenção.
  - [x] Definir políticas para logs, screenshots, SBOM, vulnerabilidades, segredos e dados pessoais.
  - [x] Preservar `reports/raw/` fora do Git e limitar o Git a material sanitizado.
  - [x] Incluir as seções de redaction e checklist antes de commitar evidências.
  - [x] Registrar fontes em `research/sources/chunk-11.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(evidence): define reporting and artifact policy"`

## Chunk 12 - Modelo final de relatório de auditoria

- **Arquivo principal esperado:** `docs/security-audit-baseline.md`
- **Status:** concluído em 2026-06-06
- **Critérios de aceite:**
  - [x] Incluir todas as seções obrigatórias de escopo, execução, achados, riscos e remediação.
  - [x] Usar tabelas para achados, riscos, plano e mapeamentos.
  - [x] Incluir comentários Markdown internos e avisos contra conteúdo sensível.
  - [x] Incluir critérios explícitos de aprovação e reprovação.
  - [x] Produzir um modelo reutilizável, sem dados reais ou payloads exploráveis.
  - [x] Registrar fontes em `research/sources/chunk-12.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(audit): add security audit report template"`

## Chunk 13 - Priorização de vulnerabilidades e matriz de severidade

- **Arquivo principal esperado:** `risk/severity-and-prioritization.md`
- **Status:** concluído em 2026-06-07
- **Critérios de aceite:**
  - [x] Definir níveis crítico, alto, médio e baixo com os exemplos solicitados.
  - [x] Incluir matrizes de severidade e SLA.
  - [x] Incorporar impacto, probabilidade, exploração, exposição, dados e controles compensatórios.
  - [x] Explicar uso apropriado de CISA KEV, CVSS e SSVC.
  - [x] Definir bloqueio de release, aceite formal de risco, issues e backlog.
  - [x] Registrar fontes em `research/sources/chunk-13.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(risk): add severity and prioritization matrix"`

## Chunk 14 - Política de branches, commits, issues e PRs

- **Arquivo principal esperado:** `docs/git-security-workflow.md`
- **Status:** concluído em 2026-06-07
- **Critérios de aceite:**
  - [x] Definir estratégia de branches e quando usar cada padrão solicitado.
  - [x] Documentar fluxo de findings, issues, riscos aceitos, falsos positivos, hotfixes e releases.
  - [x] Incluir mensagens de commit e práticas que evitem vazamento de relatórios.
  - [x] Definir fluxos para as três fases de maturidade e branch protection.
  - [x] Incluir checklists antes de merge e release.
  - [x] Registrar fontes em `research/sources/chunk-14.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(git): define secure collaboration workflow"`

## Chunk 15 - Checklists principais

- **Arquivo principal esperado:** `checklists/index.md`
- **Status:** concluído em 2026-06-07; reconciliado no fechamento corretivo do Lote 3 em 2026-06-07
- **Critérios de aceite:**
  - [x] Criar o índice e os 15 checklists listados no prompt.
  - [x] Manter `checklists/owasp-top-10.md` como checklist principal adicional substantivo e referenciado.
  - [x] Usar caixas de seleção Markdown com itens aplicáveis a SaaS real.
  - [x] Definir objetivo, momento de uso, revisor e evidências em cada checklist.
  - [x] Diferenciar itens obrigatórios, desejáveis e futuros.
  - [x] Definir critérios de aprovação e reprovação em cada arquivo.
  - [x] Atualizar `checklists/README.md` com visão geral, uso e limites.
  - [x] Registrar fontes em `research/sources/chunk-15.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(checklists): add core SaaS security checklists"`

## Chunk 16 - Scripts locais de auditoria

- **Arquivo principal esperado:** `scripts/README.md`
- **Status:** concluído em 2026-06-07
- **Critérios de aceite:**
  - [x] Criar os oito scripts Bash listados no prompt.
  - [x] Usar `set -euo pipefail`, verificar dependências e falhar de forma segura.
  - [x] Direcionar saídas cruas a `reports/raw/` e resumos revisáveis a `reports/sanitized/`.
  - [x] Não imprimir segredos nem enviar dados externamente sem aviso.
  - [x] Usar somente comandos validados e exemplos locais fictícios.
  - [x] Registrar fontes em `research/sources/chunk-16.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "chore(audit): add local security audit scripts"`

## Chunk 17 - Templates de documentos

- **Arquivo principal esperado:** `templates/index.md`
- **Status:** concluído em 2026-06-07
- **Critérios de aceite:**
  - [x] Criar o índice e os 14 templates listados no prompt.
  - [x] Usar Markdown ou CSV conforme o tipo de documento.
  - [x] Definir objetivo, momento de uso, campos obrigatórios e opcionais.
  - [x] Incluir exemplos claramente fictícios e sem dados pessoais ou credenciais.
  - [x] Incluir cuidados de segurança específicos em cada template.
  - [x] Registrar fontes em `research/sources/chunk-17.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(templates): add governance document templates"`

## Chunk 18 - Consolidação do README

- **Arquivo principal esperado:** `README.md` (derivado do prompt, que não usa o campo "Arquivo sugerido")
- **Status:** concluído em 2026-06-07
- **Critérios de aceite:**
  - [x] Executar somente depois da geração e revisão dos chunks anteriores aplicáveis.
  - [x] Cobrir as 23 seções obrigatórias definidas no prompt.
  - [x] Manter o README objetivo e apontar para documentos existentes sem duplicá-los.
  - [x] Não inventar arquivos nem incluir dados sensíveis ou trechos longos de normas.
  - [x] Registrar fontes em `research/sources/chunk-18.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(readme): consolidate repository guidance"`

## Chunk 19 - Auditoria de cobertura

- **Arquivo principal esperado:** `research/coverage-audit.md` (nome operacional derivado do objetivo do prompt)
- **Status:** concluido em 2026-06-07
- **Critérios de aceite:**
  - [x] Avaliar os 25 pontos de cobertura definidos no prompt.
  - [x] Classificar cada item como Sim, Parcial ou Não, com lacuna, gravidade e correção.
  - [x] Atribuir notas de 0 a 10 para os seis critérios solicitados.
  - [x] Gerar lista final de pendências no formato de issues GitHub.
  - [x] Não ocultar lacunas nem marcar como completo conteúdo sem evidência.
  - [x] Registrar fontes em `research/sources/chunk-19.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(research): audit baseline coverage"`

## Chunk 20 - Plano de execução para Codex

- **Arquivo principal esperado:** `research/codex-execution-plan.md` (nome operacional derivado do objetivo do prompt)
- **Status:** concluído em 2026-06-07
- **Critérios de aceite:**
  - [x] Transformar os documentos aprovados em tarefas ordenadas para implementação.
  - [x] Organizar o trabalho nos 11 lotes definidos no prompt.
  - [x] Informar branches, arquivos, conteúdo esperado, validações, riscos e revisão de PR.
  - [x] Dividir a execução em PRs pequenos com issues no formato solicitado.
  - [x] Não gerar código inseguro, segredos ou exemplos semelhantes a credenciais reais.
  - [x] Registrar fontes em `research/sources/chunk-20.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(research): add Codex execution plan"`
