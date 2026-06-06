# Fila de tarefas da pesquisa

Esta fila organiza os chunks definidos em `research/prompts.md`. Nenhum chunk foi executado durante a criação deste arquivo.

## Regras de execução

- Processar um chunk por vez e manter o status como `pendente` até cumprir todos os critérios de aceite.
- Antes de cada chunk, reler `AGENTS.md`, este arquivo e `research/progress.md`.
- Registrar as fontes oficiais do chunk em um arquivo próprio dentro de `research/sources/`.
- Atualizar `research/progress.md` ao concluir cada chunk.
- Manter relatórios crus em `reports/raw/`, fora do Git, e publicar somente resumos revisados em `reports/sanitized/`.
- Não incluir segredos, credenciais, dados pessoais reais ou evidências sensíveis.

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
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Cobrir todos os cenários de evento e periodicidade definidos no prompt.
  - [ ] Classificar auditorias obrigatórias, desejáveis e futuras por cenário.
  - [ ] Informar riscos, evidências, revisor e critério de Go/No-Go.
  - [ ] Incluir tabela-resumo por auditoria com frequência, bloqueio, ferramentas e relatório.
  - [ ] Registrar fontes em `research/sources/chunk-05.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(audit): add audit trigger matrix"`

## Chunk 6 - Ferramentas recomendadas e comandos

- **Arquivo principal esperado:** `docs/security-tools-catalog.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Cobrir todas as categorias e ferramentas listadas no prompt.
  - [ ] Documentar finalidade, ecossistema, limites, falsos positivos, saída e política de bloqueio.
  - [ ] Incluir apenas comandos Linux confirmados em documentação oficial.
  - [ ] Explicar integração com GitHub Actions e riscos de exposição em relatórios.
  - [ ] Sinalizar explicitamente comandos ou versões que exijam validação posterior.
  - [ ] Registrar fontes em `research/sources/chunk-06.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(tooling): add security tools catalog"`

## Chunk 7 - GitHub Actions e CI/CD

- **Arquivo principal esperado:** `docs/github-actions-strategy.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Definir todos os workflows solicitados, seus gatilhos, ferramentas e saídas.
  - [ ] Incluir exemplos mínimos de YAML sem segredos reais.
  - [ ] Definir bloqueio ou alerta, política de artifacts e cuidados com logs.
  - [ ] Recomendar checks de branch protection para as três fases de maturidade.
  - [ ] Incluir a seção "Estratégia de falha: quando o CI deve quebrar?".
  - [ ] Registrar fontes em `research/sources/chunk-07.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(ci): define GitHub Actions strategy"`

## Chunk 8 - Frappe, ERPNext, Frappe LMS e Python

- **Arquivo principal esperado:** `docs/frappe-python-security-audit.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Cobrir todos os padrões, permissões, integrações e fluxos Frappe listados.
  - [ ] Incluir checklist manual, comandos `rg`, padrões suspeitos e falsos positivos.
  - [ ] Incluir regras Semgrep simples somente quando tecnicamente válidas.
  - [ ] Definir riscos críticos, evidências, bloqueios de release e adaptação multi-tenant.
  - [ ] Sinalizar dependências de versão e não inventar APIs do Frappe.
  - [ ] Registrar fontes em `research/sources/chunk-08.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(frappe): add Python security audit guide"`

## Chunk 9 - LGPD e privacidade para SaaS

- **Arquivo principal esperado:** `docs/lgpd-privacy-program.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Cobrir o ciclo de tratamento, direitos, papéis, terceiros, incidentes e privacy by design.
  - [ ] Explicar cada documento de privacidade solicitado, seus campos, revisão e evidências.
  - [ ] Incluir matriz LGPD prática para SaaS.
  - [ ] Diferenciar orientação técnica de validação jurídica.
  - [ ] Citar LGPD e fontes oficiais da ANPD.
  - [ ] Registrar fontes em `research/sources/chunk-09.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(lgpd): add SaaS privacy program"`

## Chunk 10 - Acessibilidade para SaaS web

- **Arquivo principal esperado:** `docs/accessibility-program.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Cobrir WCAG 2.2 AA e as normas ABNT aplicáveis sem reproduzir texto integral.
  - [ ] Incluir política, checklists, roteiro manual e fluxos críticos.
  - [ ] Explicar uso de axe-core, Lighthouse e Pa11y com comandos validados.
  - [ ] Definir evidências, falhas que bloqueiam release e melhorias não bloqueantes.
  - [ ] Incluir exemplo de estrutura para `docs/accessibility-audit.md`.
  - [ ] Registrar fontes em `research/sources/chunk-10.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(accessibility): add SaaS accessibility program"`

## Chunk 11 - Relatórios, evidências e política de segurança dos artifacts

- **Arquivo principal esperado:** `docs/evidence-and-reporting-policy.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Classificar todos os relatórios listados quanto a exposição, Git, criptografia, redaction e retenção.
  - [ ] Definir políticas para logs, screenshots, SBOM, vulnerabilidades, segredos e dados pessoais.
  - [ ] Preservar `reports/raw/` fora do Git e limitar o Git a material sanitizado.
  - [ ] Incluir as seções de redaction e checklist antes de commitar evidências.
  - [ ] Registrar fontes em `research/sources/chunk-11.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(evidence): define reporting and artifact policy"`

## Chunk 12 - Modelo final de relatório de auditoria

- **Arquivo principal esperado:** `docs/security-audit-baseline.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Incluir todas as seções obrigatórias de escopo, execução, achados, riscos e remediação.
  - [ ] Usar tabelas para achados, riscos, plano e mapeamentos.
  - [ ] Incluir comentários Markdown internos e avisos contra conteúdo sensível.
  - [ ] Incluir critérios explícitos de aprovação e reprovação.
  - [ ] Produzir um modelo reutilizável, sem dados reais ou payloads exploráveis.
  - [ ] Registrar fontes em `research/sources/chunk-12.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(audit): add security audit report template"`

## Chunk 13 - Priorização de vulnerabilidades e matriz de severidade

- **Arquivo principal esperado:** `risk/severity-and-prioritization.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Definir níveis crítico, alto, médio e baixo com os exemplos solicitados.
  - [ ] Incluir matrizes de severidade e SLA.
  - [ ] Incorporar impacto, probabilidade, exploração, exposição, dados e controles compensatórios.
  - [ ] Explicar uso apropriado de CISA KEV, CVSS e SSVC.
  - [ ] Definir bloqueio de release, aceite formal de risco, issues e backlog.
  - [ ] Registrar fontes em `research/sources/chunk-13.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(risk): add severity and prioritization matrix"`

## Chunk 14 - Política de branches, commits, issues e PRs

- **Arquivo principal esperado:** `docs/git-security-workflow.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Definir estratégia de branches e quando usar cada padrão solicitado.
  - [ ] Documentar fluxo de findings, issues, riscos aceitos, falsos positivos, hotfixes e releases.
  - [ ] Incluir mensagens de commit e práticas que evitem vazamento de relatórios.
  - [ ] Definir fluxos para as três fases de maturidade e branch protection.
  - [ ] Incluir checklists antes de merge e release.
  - [ ] Registrar fontes em `research/sources/chunk-14.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(git): define secure collaboration workflow"`

## Chunk 15 - Checklists principais

- **Arquivo principal esperado:** `checklists/index.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Criar o índice e os 15 checklists listados no prompt.
  - [ ] Usar caixas de seleção Markdown com itens aplicáveis a SaaS real.
  - [ ] Definir objetivo, momento de uso, revisor e evidências em cada checklist.
  - [ ] Diferenciar itens obrigatórios, desejáveis e futuros.
  - [ ] Definir critérios de aprovação e reprovação em cada arquivo.
  - [ ] Registrar fontes em `research/sources/chunk-15.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(checklists): add core SaaS security checklists"`

## Chunk 16 - Scripts locais de auditoria

- **Arquivo principal esperado:** `scripts/README.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Criar os oito scripts Bash listados no prompt.
  - [ ] Usar `set -euo pipefail`, verificar dependências e falhar de forma segura.
  - [ ] Direcionar saídas cruas a `reports/raw/` e resumos revisáveis a `reports/sanitized/`.
  - [ ] Não imprimir segredos nem enviar dados externamente sem aviso.
  - [ ] Usar somente comandos validados e exemplos locais fictícios.
  - [ ] Registrar fontes em `research/sources/chunk-16.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "chore(audit): add local security audit scripts"`

## Chunk 17 - Templates de documentos

- **Arquivo principal esperado:** `templates/index.md`
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Criar o índice e os 14 templates listados no prompt.
  - [ ] Usar Markdown ou CSV conforme o tipo de documento.
  - [ ] Definir objetivo, momento de uso, campos obrigatórios e opcionais.
  - [ ] Incluir exemplos claramente fictícios e sem dados pessoais ou credenciais.
  - [ ] Incluir cuidados de segurança específicos em cada template.
  - [ ] Registrar fontes em `research/sources/chunk-17.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(templates): add governance document templates"`

## Chunk 18 - Consolidação do README

- **Arquivo principal esperado:** `README.md` (derivado do prompt, que não usa o campo "Arquivo sugerido")
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Executar somente depois da geração e revisão dos chunks anteriores aplicáveis.
  - [ ] Cobrir as 23 seções obrigatórias definidas no prompt.
  - [ ] Manter o README objetivo e apontar para documentos existentes sem duplicá-los.
  - [ ] Não inventar arquivos nem incluir dados sensíveis ou trechos longos de normas.
  - [ ] Registrar fontes em `research/sources/chunk-18.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(readme): consolidate repository guidance"`

## Chunk 19 - Auditoria de cobertura

- **Arquivo principal esperado:** `research/coverage-audit.md` (nome operacional derivado do objetivo do prompt)
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Avaliar os 25 pontos de cobertura definidos no prompt.
  - [ ] Classificar cada item como Sim, Parcial ou Não, com lacuna, gravidade e correção.
  - [ ] Atribuir notas de 0 a 10 para os seis critérios solicitados.
  - [ ] Gerar lista final de pendências no formato de issues GitHub.
  - [ ] Não ocultar lacunas nem marcar como completo conteúdo sem evidência.
  - [ ] Registrar fontes em `research/sources/chunk-19.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(research): audit baseline coverage"`

## Chunk 20 - Plano de execução para Codex

- **Arquivo principal esperado:** `research/codex-execution-plan.md` (nome operacional derivado do objetivo do prompt)
- **Status:** pendente
- **Critérios de aceite:**
  - [ ] Transformar os documentos aprovados em tarefas ordenadas para implementação.
  - [ ] Organizar o trabalho nos 11 lotes definidos no prompt.
  - [ ] Informar branches, arquivos, conteúdo esperado, validações, riscos e revisão de PR.
  - [ ] Dividir a execução em PRs pequenos com issues no formato solicitado.
  - [ ] Não gerar código inseguro, segredos ou exemplos semelhantes a credenciais reais.
  - [ ] Registrar fontes em `research/sources/chunk-20.md` e atualizar o progresso.
- **Comando de commit sugerido:** `git commit -m "docs(research): add Codex execution plan"`
