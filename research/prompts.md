Prompt 0 — Contexto-mestre do projeto

Use este antes dos outros.

Você deve atuar como um pesquisador técnico sênior em segurança de aplicações web, SaaS, DevSecOps, compliance, LGPD, OWASP e normas ISO/ABNT.

Estou criando um repositório privado no GitHub que funcionará como template reutilizável para todos os SaaS que eu desenvolver no futuro.

O repositório deve servir como base de:

- auditoria de segurança;
- governança;
- qualidade;
- privacidade;
- LGPD;
- acessibilidade;
- operação;
- DevSecOps;
- gestão de riscos;
- resposta a incidentes;
- continuidade de negócio;
- maturidade técnica;
- auditorias recorrentes.

Contexto técnico:

- Desenvolvo SaaS, aplicações web, APIs e sistemas.
- Posso usar Python, Frappe, ERPNext, Frappe LMS, JavaScript, TypeScript, SQL, Docker, CI/CD, integrações WhatsApp/API, autenticação, pagamentos e cloud.
- O repositório será privado.
- O repositório não deve conter segredos, tokens, credenciais, dados pessoais reais ou relatórios sensíveis sem revisão.
- Quero separar a maturidade em três fases:
  1. MVP seguro;
  2. SaaS vendável para empresas;
  3. SaaS maduro.

Regras obrigatórias da pesquisa:

- Não faça resposta genérica.
- Seja prático, técnico e aplicável.
- Use Markdown bem organizado.
- Use tabelas quando ajudarem.
- Não escreva parágrafos gigantes.
- Cite fontes oficiais.
- Priorize OWASP, ABNT Catálogo, ISO, ANPD, W3C/WAI, NIST, CIS, CISA e documentação oficial das ferramentas.
- Não copie trechos longos de normas ISO/ABNT.
- Faça apenas sínteses, interpretações práticas e mapeamentos.
- Verifique versões atualmente vigentes ou recomendadas quando possível.
- Quando houver incerteza sobre uma norma, diga claramente que precisa ser confirmado em fonte oficial.
- Diferencie:
  - obrigatório para meu baseline interno;
  - desejável;
  - melhoria futura;
  - certificação formal.
- Não trate certificação ISO como obrigatória para todo SaaS.
- Entregue conteúdo que possa virar diretamente arquivos de um repositório GitHub privado.

Não gere ainda o relatório completo. Apenas confirme que entendeu o contexto e aguarde o próximo chunk.
Chunk 1 — Matriz de normas, frameworks e referências

Arquivo sugerido:

docs/standards-and-frameworks-matrix.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/standards-and-frameworks-matrix.md`.

Objetivo: criar uma matriz prática de normas, frameworks e referências para um repositório privado de auditoria e governança de SaaS.

Pesquise, valide e organize:

## Segurança da informação, risco e controles

- ABNT NBR ISO/IEC 27001
- ABNT NBR ISO/IEC 27002
- ABNT NBR ISO/IEC 27005
- ABNT NBR ISO/IEC 27017
- ABNT NBR ISO/IEC 27018
- ABNT NBR ISO/IEC 27035
- ABNT NBR ISO/IEC 27036
- ABNT NBR ISO/IEC 27034

## Privacidade e proteção de dados

- LGPD
- ABNT NBR ISO/IEC 27701
- ABNT NBR ISO/IEC 29100
- ABNT NBR ISO/IEC 29134

## Qualidade, ciclo de vida, testes e operação

- ABNT NBR ISO/IEC/IEEE 12207
- ABNT NBR ISO/IEC 25010
- ABNT NBR ISO/IEC/IEEE 29119
- ABNT NBR ISO/IEC 20000-1
- ABNT NBR ISO 22301
- ABNT NBR ISO 31000
- ABNT NBR ISO 9001

## Vulnerabilidades e divulgação coordenada

- ABNT NBR ISO/IEC 30111
- ABNT NBR ISO/IEC 29147

## Inteligência artificial

- ABNT NBR ISO/IEC 42001
- ABNT NBR ISO/IEC 23894

## Acessibilidade

- ABNT NBR 17225
- ABNT NBR 17060
- WCAG 2.2 nível AA

## OWASP

- OWASP Top 10
- OWASP API Security Top 10
- OWASP ASVS
- OWASP SAMM
- OWASP Cheat Sheet Series
- OWASP Dependency-Check
- OWASP ZAP

Para cada item, entregue uma tabela com:

- Nome da norma/framework.
- Versão/edição vigente ou recomendada, quando verificável.
- Fonte oficial.
- Objetivo.
- Aplicação prática em SaaS.
- Fase recomendada: MVP seguro, SaaS vendável para empresas ou SaaS maduro.
- Documentos do repositório relacionados.
- Ferramentas relacionadas.
- O que usar como referência interna.
- Quando buscar certificação formal.
- Observações e incertezas.

Não copie texto integral de normas. Faça síntese prática.

No final, entregue uma seção chamada “Como usar esta matriz no repositório”.
Chunk 2 — Estrutura completa do repositório

Arquivo sugerido:

docs/repository-architecture.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/repository-architecture.md`.

Objetivo: propor a estrutura completa de um repositório privado GitHub que funcione como template reutilizável de segurança, auditoria, governança, DevSecOps, LGPD, acessibilidade e maturidade técnica para SaaS.

Quero que você proponha:

1. Nome principal do repositório.
2. Nomes alternativos.
3. Justificativa do nome escolhido.
4. Árvore completa de arquivos e pastas.
5. Explicação da função de cada pasta.
6. Explicação dos arquivos principais.
7. Quais arquivos são templates.
8. Quais arquivos são checklists.
9. Quais arquivos são políticas.
10. Quais arquivos são relatórios.
11. Quais arquivos não devem receber dados reais.
12. Como reutilizar esse repositório em vários SaaS.

A estrutura deve incluir, no mínimo:

- docs/
- checklists/
- policies/
- risk/
- compliance/
- privacy/
- security/
- appsec/
- devsecops/
- incident-response/
- business-continuity/
- accessibility/
- testing/
- ai-governance/
- templates/
- scripts/
- reports/
- reports/raw/
- reports/sanitized/
- examples/
- .github/workflows/

Inclua estes arquivos na árvore:

- README.md
- SECURITY.md
- CONTRIBUTING.md
- CODEOWNERS
- .gitignore
- .gitleaks.toml
- .secrets.baseline
- docs/security-audit-baseline.md
- docs/security-roadmap.md
- docs/lgpd-gap-assessment.md
- docs/threat-model.md
- docs/incident-response-plan.md
- docs/business-continuity-plan.md
- docs/accessibility-audit.md
- docs/api-security-checklist.md
- docs/cloud-security-checklist.md
- docs/ai-governance-checklist.md
- risk/risk-register.csv
- risk/risk-matrix.md
- checklists/owasp-asvs.md
- checklists/owasp-api-top-10.md
- checklists/lgpd.md
- checklists/accessibility-wcag-22-aa.md
- checklists/frappe-security.md
- checklists/pre-deploy.md
- checklists/pre-enterprise-sale.md
- scripts/run-security-audit.sh
- scripts/run-python-audit.sh
- scripts/run-node-audit.sh
- scripts/run-container-audit.sh
- scripts/run-accessibility-audit.sh
- .github/workflows/security.yml
- .github/workflows/dependency-review.yml
- .github/workflows/codeql.yml
- .github/workflows/zap-baseline.yml

Entregue em Markdown.

Inclua uma árvore de arquivos em bloco de código.
Depois explique cada pasta em uma tabela.
Depois explique os arquivos principais em outra tabela.
Chunk 3 — Roadmap de implantação por fases

Arquivo sugerido:

docs/security-roadmap.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/security-roadmap.md`.

Objetivo: criar um roadmap prático de implantação do repositório de auditoria e governança para SaaS.

Divida em três fases:

# Fase 1 — MVP seguro

Inclua:

- ISO/IEC 27001 como estrutura de gestão.
- ISO/IEC 27002 como checklist de controles.
- ISO/IEC 27005 para matriz de risco.
- OWASP Top 10.
- OWASP API Top 10.
- OWASP ASVS nível 1 ou 2.
- LGPD + ISO/IEC 29100.
- Acessibilidade com WCAG 2.2 AA e normas ABNT aplicáveis.

# Fase 2 — SaaS vendável para empresas

Inclua:

- ISO/IEC 27017 para cloud.
- ISO/IEC 27018 para dados pessoais em cloud.
- ISO/IEC 27701 para privacidade.
- ISO/IEC 27035 para incidentes.
- ISO/IEC 20000-1 para suporte, SLA e operação.
- ISO 22301 para continuidade.

# Fase 3 — SaaS maduro

Inclua:

- ISO/IEC/IEEE 12207 para ciclo de vida de software.
- ISO/IEC 25010 para qualidade.
- ISO/IEC/IEEE 29119 para testes.
- ISO/IEC 27034 para segurança de aplicação.
- ISO/IEC 30111 e ISO/IEC 29147 para tratamento e divulgação de vulnerabilidades.
- ISO/IEC 42001 e ISO/IEC 23894 se o SaaS usar IA de forma relevante.

Para cada fase, explique em tabelas:

- Objetivo da fase.
- O que implementar primeiro.
- Quais documentos criar.
- Quais ferramentas automatizar.
- Quais riscos reduzir.
- Quais evidências guardar.
- O que não vale a pena fazer ainda.
- Critérios para avançar para a próxima fase.
- Critérios de “não avançar”.
- Exemplo de aplicação em um SaaS real.

Inclua também:

- Plano de 30 dias.
- Plano de 60 dias.
- Plano de 90 dias.
- Plano de 180 dias.
- O que é obrigatório.
- O que é desejável.
- O que é melhoria futura.
- O que só faz sentido em empresa maior.

Use Markdown.
Cite fontes oficiais.
Chunk 4 — Tipos de auditoria para SaaS

Arquivo sugerido:

docs/audit-types.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/audit-types.md`.

Objetivo: explicar, de forma prática, os principais tipos de auditoria para SaaS.

Inclua os seguintes tipos:

- Revisão manual de código.
- SAST.
- DAST.
- SCA.
- Secret scanning.
- IaC scanning.
- Container scanning.
- Dependency scanning.
- API security testing.
- Threat modeling.
- Privacy impact assessment.
- LGPD gap assessment.
- Acessibilidade.
- Testes de autenticação e autorização.
- Testes de permissões e controle de acesso.
- Auditoria de logs.
- Auditoria de backups.
- Auditoria de incident response.
- Auditoria de CI/CD.
- Auditoria de cloud.
- Auditoria de pagamentos.
- Auditoria de integrações externas.
- Auditoria de IA, quando aplicável.

Para cada tipo de auditoria, entregue uma tabela com:

- O que é.
- Quando fazer.
- Frequência recomendada.
- Ferramentas que podem ser usadas.
- Arquivos/relatórios gerados.
- Riscos que detecta.
- Limitações.
- Falsos positivos comuns.
- Evidências recomendadas.
- Exemplo de aplicação em um SaaS.

Inclua também uma seção chamada:

“Quais auditorias bloqueiam release?”

Classifique em:

- Bloqueia sempre.
- Bloqueia dependendo da severidade.
- Apenas alerta.
- Apenas revisão periódica.

Use linguagem prática, técnica e aplicável.
Cite fontes oficiais quando mencionar frameworks ou ferramentas.
Chunk 5 — Matriz de auditorias por cenário

Arquivo sugerido:

docs/audit-trigger-matrix.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/audit-trigger-matrix.md`.

Objetivo: criar uma matriz prática que responda quando fazer cada tipo de auditoria em um SaaS.

Crie uma tabela com os seguintes cenários:

- Antes do primeiro deploy.
- Antes de abrir beta para usuários.
- Antes de vender para clientes empresariais.
- Antes de integrar pagamentos.
- Antes de processar dados pessoais sensíveis.
- Antes de lançar API pública.
- Antes de criar app mobile.
- Antes de integrar IA.
- Antes de contratar cloud/terceiros críticos.
- Antes de migração grande.
- Antes de refatoração crítica.
- Antes de auditoria externa.
- Após incidente.
- Após vazamento ou suspeita de vazamento.
- Após alteração em autenticação/autorização.
- Após mudança em permissões de usuário.
- Após atualização grande de dependências.
- Mensalmente.
- Trimestralmente.
- Semestralmente.
- Anualmente.

Para cada cenário, informe:

- Auditorias obrigatórias.
- Auditorias desejáveis.
- Auditorias futuras.
- Por que executar.
- Riscos principais.
- Evidências mínimas.
- Quem deveria revisar.
- Critério de Go/No-Go.

Depois crie uma segunda tabela resumida com:

- Auditoria.
- Frequência mínima.
- Frequência ideal.
- Quando bloquear release.
- Ferramentas sugeridas.
- Relatório gerado.

Use Markdown.
Chunk 6 — Ferramentas recomendadas e comandos

Arquivo sugerido:

docs/security-tools-catalog.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/security-tools-catalog.md`.

Objetivo: criar um catálogo prático de ferramentas para auditoria de SaaS, preferindo opções open source ou boas para CI/CD.

Organize por categoria:

## Secret scanning

- Gitleaks
- detect-secrets
- TruffleHog

## Python security

- Bandit
- pip-audit
- Safety
- Ruff rules

## JavaScript/TypeScript

- npm audit
- pnpm audit
- osv-scanner

## SAST

- Semgrep
- CodeQL

## DAST

- OWASP ZAP

## Dependências

- OWASP Dependency-Check
- OSV Scanner

## Containers

- Trivy
- Grype

## IaC

- Checkov
- tfsec
- Terrascan

## SBOM

- Syft
- CycloneDX

## Licenças

- FOSSA
- ScanCode
- ORT
- alternativas open source

## Acessibilidade

- axe-core
- Lighthouse
- Pa11y

## API testing

- Schemathesis
- Dredd
- Postman/Newman
- OWASP ZAP

## CI/CD

- GitHub Actions

## Threat modeling

- OWASP Threat Dragon
- modelos manuais

## LGPD/privacy

- modelos de ROPA
- DPIA/RIPD
- consentimento
- bases legais
- retenção

Para cada ferramenta, informe em tabela:

- Finalidade.
- Linguagens/ecossistemas atendidos.
- Pontos fortes.
- Limitações.
- Quando usar.
- Exemplo de comando.
- Como integrar no GitHub Actions.
- Se pode gerar falso positivo.
- Se há risco de expor segredo no relatório.
- Saída recomendada.
- Se deve bloquear merge ou apenas alertar.

Inclua comandos prontos para Linux.

Não invente comandos. Quando não tiver certeza do comando atual, diga para validar na documentação oficial.
Cite a documentação oficial de cada ferramenta ou projeto.
Chunk 7 — GitHub Actions e CI/CD

Arquivo sugerido:

docs/github-actions-strategy.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/github-actions-strategy.md`.

Objetivo: propor uma estratégia de GitHub Actions para um repositório template de auditoria, DevSecOps, segurança, privacidade e qualidade para SaaS.

Separe os workflows:

- Pull request básico.
- Security scan semanal.
- Dependency scan.
- Secret scan.
- CodeQL.
- Semgrep.
- Python audit.
- Node audit.
- Container audit.
- OWASP ZAP baseline.
- SBOM.
- Accessibility audit.
- Release checklist.

Para cada workflow, informe:

- Nome do arquivo `.yml`.
- Objetivo.
- Quando roda: pull_request, push, schedule, workflow_dispatch.
- Ferramentas usadas.
- Saídas geradas.
- Se bloqueia merge ou apenas alerta.
- Riscos cobertos.
- Limitações.
- Cuidados para não vazar segredos em logs.
- Política de artifacts.
- Exemplo mínimo de YAML.

Depois entregue uma recomendação de quais checks devem ser obrigatórios em branch protection para:

1. MVP seguro.
2. SaaS vendável para empresas.
3. SaaS maduro.

Inclua uma seção final chamada:

“Estratégia de falha: quando o CI deve quebrar?”

Use Markdown.
Não use segredos reais nos exemplos.
Chunk 8 — Frappe, ERPNext, Frappe LMS e Python

Arquivo sugerido:

docs/frappe-python-security-audit.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/frappe-python-security-audit.md`.

Objetivo: criar uma seção específica para auditoria de segurança em aplicações feitas com Frappe, ERPNext, Frappe LMS e Python.

Pesquise e proponha checks para:

- `@frappe.whitelist`
- `allow_guest=True`
- `ignore_permissions=True`
- `frappe.db.sql`
- permissões de DocTypes
- roles e role profiles
- endpoints públicos
- upload de arquivos
- `hooks.py`
- scheduled jobs
- server scripts
- client scripts
- logs com dados pessoais
- webhooks
- integrações externas
- exposição de `meeting_url`, `external_url`, tokens ou dados internos
- autenticação e sessão
- rate limiting
- CSRF
- permissões por tenant, se aplicável
- permissões em LMS: cursos, aulas, matrículas, alunos, instrutores e relatórios
- integrações com WhatsApp/API
- integrações com pagamento

Entregue:

1. Checklist manual.
2. Comandos `grep`/`ripgrep` para detectar riscos.
3. Exemplos de padrões suspeitos.
4. Exemplos de falso positivo.
5. Regras Semgrep simples, quando possível.
6. Recomendações para revisão manual.
7. Riscos críticos específicos de Frappe.
8. Evidências a guardar.
9. O que bloquearia release.
10. Como adaptar para multi-tenant.

Inclua comandos prontos, por exemplo usando `rg`.

Não invente APIs do Frappe. Quando algo depender da versão do Frappe, diga para validar na documentação oficial.
Cite documentação oficial do Frappe e fontes OWASP relevantes.
Chunk 9 — LGPD e privacidade para SaaS

Arquivo sugerido:

docs/lgpd-privacy-program.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/lgpd-privacy-program.md`.

Objetivo: criar uma seção prática sobre LGPD e privacidade para SaaS.

Inclua:

- Mapeamento de dados pessoais.
- Dados pessoais sensíveis.
- Bases legais.
- Consentimento.
- Legítimo interesse.
- Retenção de dados.
- Exclusão de dados.
- Portabilidade.
- Direitos do titular.
- Registro das operações de tratamento.
- Encarregado/DPO, quando aplicável.
- Operadores e controladores.
- Contratos com terceiros.
- Incidentes com dados pessoais.
- RIPD/DPIA.
- Privacy by design.
- Privacy by default.
- Minimização de dados.
- Segurança no tratamento.
- Compartilhamento com terceiros.
- Suboperadores.
- Transferência internacional, se aplicável.
- Logs com dados pessoais.
- Backups contendo dados pessoais.
- Ambientes de desenvolvimento e homologação.

Explique quais documentos o repositório deve ter:

- privacy/data-map.md
- privacy/ropa.md
- privacy/legal-bases.md
- privacy/retention-policy.md
- privacy/data-subject-rights.md
- privacy/dpia-template.md
- privacy/incident-personal-data.md
- privacy/third-party-processors.md
- privacy/privacy-by-design-checklist.md
- checklists/lgpd.md

Para cada documento, entregue:

- Objetivo.
- Campos mínimos.
- Quando preencher.
- Quem revisa.
- Evidência gerada.
- Risco reduzido.

Inclua uma matriz LGPD para SaaS com:

- Dado coletado.
- Finalidade.
- Base legal.
- Local de armazenamento.
- Terceiros envolvidos.
- Prazo de retenção.
- Direitos aplicáveis.
- Risco.
- Controle.

Cite ANPD e LGPD.
Não dê aconselhamento jurídico definitivo; diferencie orientação técnica de validação jurídica.
Chunk 10 — Acessibilidade para SaaS web

Arquivo sugerido:

docs/accessibility-program.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/accessibility-program.md`.

Objetivo: criar uma seção prática de acessibilidade para SaaS web.

Inclua:

- WCAG 2.2 nível AA.
- ABNT NBR 17225, se aplicável.
- ABNT NBR 17060, se aplicável.
- Testes automatizados.
- Testes manuais.
- Navegação por teclado.
- Contraste.
- Leitores de tela.
- Formulários acessíveis.
- Componentes UI.
- Erros e mensagens.
- Fluxos críticos.
- Dashboard.
- Login.
- Checkout/pagamento.
- Páginas de curso/aula, quando aplicável.
- Documentação de evidências.

Entregue:

1. Política de acessibilidade para o repositório.
2. Checklist WCAG 2.2 AA prático.
3. Checklist de componentes UI.
4. Roteiro de teste manual.
5. Ferramentas recomendadas.
6. Como usar axe-core.
7. Como usar Lighthouse.
8. Como usar Pa11y.
9. Como registrar evidência.
10. Quais falhas bloqueiam release.
11. Quais falhas entram como melhoria.
12. Exemplo de relatório `docs/accessibility-audit.md`.

Cite W3C/WAI, WCAG 2.2 e fontes oficiais sobre as normas ABNT quando possível.
Não copie texto integral das normas.
Chunk 11 — Relatórios, evidências e política de segurança dos artifacts

Arquivo sugerido:

docs/evidence-and-reporting-policy.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/evidence-and-reporting-policy.md`.

Objetivo: definir quais relatórios e evidências devem ser gerados em cada auditoria, quais podem ser commitados e quais devem ficar fora do Git.

Inclua os relatórios:

- environment.txt
- bandit.json
- pip-audit.json
- semgrep.json
- gitleaks.json
- detect-secrets.json
- zap-report.html
- trivy-report.json
- sbom.json
- risk-register.csv
- audit-summary.md
- executive-summary.md
- remediation-plan.md

Para cada relatório, entregue uma tabela com:

- Ferramenta/origem.
- Conteúdo típico.
- Riscos de exposição.
- Pode ir para o Git?
- Deve ficar local?
- Deve ser criptografado?
- Deve ser redigido?
- Deve ir como artifact de CI?
- Retenção recomendada.
- Exemplo de caminho.
- Política recomendada.

Crie uma política clara para:

- O que pode ir para o repositório.
- O que deve ficar local.
- O que deve ser criptografado.
- O que deve ser redigido.
- O que nunca deve ser commitado.
- Como lidar com screenshots.
- Como lidar com logs.
- Como lidar com SBOM.
- Como lidar com relatórios de segredo.
- Como lidar com relatórios de vulnerabilidade.
- Como lidar com dados pessoais em evidências.
- Como lidar com relatórios para clientes empresariais.

Inclua uma seção chamada:

“Política de redaction antes de commit”

Inclua outra seção chamada:

“Checklist antes de commitar evidências”

Use Markdown.
Cite OWASP Logging Cheat Sheet, OWASP Secrets Management Cheat Sheet e documentação oficial das ferramentas quando relevante.
Chunk 12 — Modelo final de relatório de auditoria

Arquivo sugerido:

docs/security-audit-baseline.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/security-audit-baseline.md`.

Objetivo: criar um modelo completo de relatório final de auditoria de segurança em Markdown.

O relatório deve conter obrigatoriamente:

- Data da auditoria.
- Escopo.
- Fora de escopo.
- Commit analisado.
- Branch analisada.
- Ambiente.
- Ferramentas executadas.
- Resumo executivo.
- Decisão Go/No-Go.
- Achados críticos.
- Achados altos.
- Achados médios.
- Achados baixos.
- Falsos positivos.
- Riscos aceitos.
- Riscos pendentes.
- Evidências.
- Recomendações.
- Plano de correção.
- Responsáveis.
- Prazo.
- Relação com OWASP ASVS.
- Relação com OWASP Top 10.
- Relação com OWASP API Top 10.
- Relação com LGPD.
- Relação com normas ISO/ABNT.
- Próximas auditorias.

O modelo deve ser pronto para copiar e usar.

Use tabelas para achados, riscos, plano de correção e mapeamentos.

Inclua instruções internas em comentários Markdown, mas sem expor dados sensíveis.

Inclua avisos do tipo:

- Não inserir segredos.
- Não inserir dados pessoais reais.
- Não inserir URLs internas sensíveis sem redaction.
- Não colar payloads exploráveis.
- Não colar tokens.
- Não colar logs crus.

No final, inclua uma seção chamada:

“Critérios de aprovação da auditoria”

E outra chamada:

“Critérios de reprovação da auditoria”.
Chunk 13 — Priorização de vulnerabilidades e matriz de severidade

Arquivo sugerido:

risk/severity-and-prioritization.md

Prompt:

Com base no contexto-mestre, gere o arquivo `risk/severity-and-prioritization.md`.

Objetivo: criar uma matriz prática de severidade e priorização de vulnerabilidades para SaaS.

Use as categorias:

# Crítico

Inclua exemplos:

- Segredo real em código.
- API key vazada.
- Webhook sem assinatura.
- `allow_guest=True` em método que altera dados.
- `ignore_permissions=True` sem validação.
- SQL injection.
- Retorno de dados privados sem checagem de acesso.
- Dependência com CVE crítica explorável.
- Falha em autenticação ou autorização.

# Alto

Inclua exemplos:

- Falta de rate limit em endpoint sensível.
- Logs contendo dados pessoais.
- Permissões muito abertas.
- Token com validade excessiva.
- Upload inseguro.
- Falta de validação em entrada crítica.
- Falha em reset de senha ou sessão.

# Médio

Inclua exemplos:

- Erros retornando detalhes internos.
- Ausência de headers de segurança.
- Dependências desatualizadas sem CVE crítica.
- Falhas de acessibilidade importantes.
- Documentação de segurança incompleta.

# Baixo

Inclua exemplos:

- Warnings sem impacto claro.
- Documentação desatualizada.
- Configurações não ideais, mas sem risco imediato.
- Melhorias de hardening.

Explique como priorizar correções considerando:

- Impacto.
- Probabilidade.
- Exploração realista.
- Exposição à internet.
- Sensibilidade dos dados.
- Contexto do SaaS.
- Esforço de correção.
- Controles compensatórios.
- Existência de exploit público.
- Presença em CISA KEV, quando aplicável.
- CVSS, quando aplicável.
- SSVC, quando aplicável.

Entregue:

1. Matriz de severidade.
2. Matriz de SLA.
3. Critérios de bloqueio de release.
4. Critérios de aceite formal de risco.
5. Modelo de registro de risco aceito.
6. Exemplos práticos em SaaS.
7. Como abrir issues de correção.
8. Como transformar findings em backlog.

Cite OWASP, CISA KEV, CVSS e SSVC quando relevante.
Chunk 14 — Política de branches, commits, issues e PRs

Arquivo sugerido:

docs/git-security-workflow.md

Prompt:

Com base no contexto-mestre, gere o arquivo `docs/git-security-workflow.md`.

Objetivo: propor um fluxo de trabalho Git para um repositório privado de auditoria e governança de SaaS.

Inclua:

- `main`
- `develop`, se fizer sentido
- `feat/security-audit-baseline`
- `fix/security-finding-*`
- `chore/security-tooling`
- `docs/security-*`

Explique:

- Quando criar branch.
- Quando usar `main`.
- Quando usar `develop`.
- Quando criar branch de feature.
- Quando criar branch de correção de vulnerabilidade.
- Como revisar findings.
- Como criar issue.
- Como registrar risco aceito.
- Como fazer commit sem vazar relatório sensível.
- Como abrir pull request.
- Como escrever mensagens de commit para segurança.
- Como nomear issues de segurança.
- Como usar labels.
- Como usar milestones.
- Como lidar com findings críticos.
- Como lidar com falso positivo.
- Como lidar com segredos vazados.
- Como lidar com hotfix.
- Como lidar com release.

Inclua exemplos de mensagens de commit:

- `security: add gitleaks baseline`
- `fix(auth): enforce permission check on enrollment endpoint`
- `docs(lgpd): add data retention policy`
- `chore(ci): add semgrep workflow`

Inclua:

1. Fluxo MVP.
2. Fluxo para SaaS vendável para empresas.
3. Fluxo para SaaS maduro.
4. Branch protection recomendada.
5. Checklist antes de merge.
6. Checklist antes de release.
Chunk 15 — Checklists principais

Arquivo sugerido:

checklists/index.md

Prompt:

Com base no contexto-mestre, gere o arquivo `checklists/index.md` e os conteúdos principais dos checklists.

Objetivo: criar checklists práticos para o repositório privado de auditoria e governança de SaaS.

Gere os seguintes checklists em Markdown:

1. `checklists/pre-deploy.md`
2. `checklists/pre-beta.md`
3. `checklists/pre-enterprise-sale.md`
4. `checklists/owasp-asvs.md`
5. `checklists/owasp-api-top-10.md`
6. `checklists/lgpd.md`
7. `checklists/accessibility-wcag-22-aa.md`
8. `checklists/frappe-security.md`
9. `checklists/cloud-security.md`
10. `checklists/payment-security.md`
11. `checklists/incident-response.md`
12. `checklists/backup-restore.md`
13. `checklists/ci-cd-security.md`
14. `checklists/third-party-risk.md`
15. `checklists/ai-governance.md`

Para cada checklist, entregue:

- Objetivo.
- Quando usar.
- Quem revisa.
- Evidências esperadas.
- Itens obrigatórios.
- Itens desejáveis.
- Itens futuros.
- Critério de aprovação.
- Critério de reprovação.

Use caixas de seleção Markdown:

```md
- [ ] Item

Não gere conteúdo genérico. Os itens devem ser aplicáveis a SaaS real.
Cite OWASP, LGPD, WCAG, ISO/ABNT e documentação oficial quando relevante.


---

# Chunk 16 — Scripts locais de auditoria

Arquivo sugerido:

```txt
scripts/README.md

Prompt:

Com base no contexto-mestre, gere o arquivo `scripts/README.md` e os scripts principais de auditoria local.

Objetivo: criar comandos locais para rodar auditorias de segurança em projetos SaaS Python, Node, Docker, API e acessibilidade.

Gere o conteúdo dos seguintes scripts:

- `scripts/run-security-audit.sh`
- `scripts/run-python-audit.sh`
- `scripts/run-node-audit.sh`
- `scripts/run-container-audit.sh`
- `scripts/run-accessibility-audit.sh`
- `scripts/run-api-audit.sh`
- `scripts/run-frappe-audit.sh`
- `scripts/generate-sbom.sh`

Cada script deve:

- Usar Bash.
- Ter `set -euo pipefail`.
- Criar pastas de relatório.
- Gravar outputs em `reports/raw/`.
- Gerar resumo sanitizado em `reports/sanitized/`, quando possível.
- Não imprimir segredos no terminal.
- Não exigir credenciais reais.
- Ter comentários claros.
- Falhar de forma segura.
- Avisar quando uma ferramenta não estiver instalada.
- Não enviar nada para serviços externos sem aviso.

Inclua comandos para:

- Bandit.
- pip-audit.
- Semgrep.
- Gitleaks.
- detect-secrets.
- npm audit.
- pnpm audit.
- osv-scanner.
- Trivy.
- Grype.
- Syft.
- CycloneDX, quando aplicável.
- Pa11y.
- Lighthouse, quando aplicável.
- OWASP ZAP baseline, quando aplicável.
- Schemathesis, quando aplicável.
- Checks específicos para Frappe com `rg`.

Quando um comando depender da instalação da ferramenta, inclua comentário informando para validar na documentação oficial.

Não use tokens reais.
Não use URLs reais.
Use exemplos como `http://localhost:8000`.
Chunk 17 — Templates de documentos

Arquivo sugerido:

templates/index.md

Prompt:

Com base no contexto-mestre, gere o arquivo `templates/index.md` e modelos prontos para documentos do repositório.

Objetivo: criar templates reutilizáveis de documentação para auditoria, governança, segurança, privacidade, incidentes e operação SaaS.

Gere modelos para:

- `templates/risk-register-template.csv`
- `templates/security-finding-template.md`
- `templates/remediation-plan-template.md`
- `templates/executive-summary-template.md`
- `templates/data-map-template.md`
- `templates/ropa-template.md`
- `templates/dpia-template.md`
- `templates/incident-report-template.md`
- `templates/postmortem-template.md`
- `templates/backup-restore-test-template.md`
- `templates/vendor-risk-assessment-template.md`
- `templates/accessibility-finding-template.md`
- `templates/threat-model-template.md`
- `templates/ai-risk-assessment-template.md`

Para cada template, entregue:

- Objetivo.
- Quando usar.
- Campos obrigatórios.
- Campos opcionais.
- Exemplo fictício sem dados reais.
- Cuidados para não vazar segredos ou dados pessoais.

Use Markdown e CSV quando fizer sentido.
Chunk 18 — Prompt final de consolidação

Use depois de gerar todos os chunks.

Você agora deve atuar como editor técnico sênior.

Eu gerei vários chunks de uma pesquisa para criar um repositório privado GitHub de auditoria, governança, segurança, DevSecOps, LGPD, OWASP, acessibilidade, operação e maturidade técnica para SaaS.

Sua tarefa é consolidar os chunks em um documento principal chamado:

`README.md`

O README deve ser objetivo, navegável e útil.

Não repita tudo que está nos documentos internos. Faça uma visão geral e aponte para os arquivos.

Estrutura obrigatória do README:

1. Nome do projeto.
2. Objetivo.
3. Para quem é este template.
4. O que este repositório resolve.
5. O que este repositório não resolve.
6. Fases de maturidade:
   - MVP seguro.
   - SaaS vendável para empresas.
   - SaaS maduro.
7. Estrutura de pastas.
8. Como usar em um novo SaaS.
9. Como rodar auditoria local.
10. Como interpretar relatórios.
11. Política de evidências.
12. Política de segredos.
13. Workflows de CI/CD.
14. Checklists principais.
15. Documentos de LGPD.
16. Documentos de acessibilidade.
17. Estratégia para Frappe/Python.
18. Roadmap 30/60/90/180 dias.
19. Como abrir findings.
20. Como aceitar riscos.
21. Como contribuir.
22. Avisos importantes.
23. Fontes principais.

Use Markdown.
Não invente arquivos que não existem.
Não inclua dados sensíveis.
Não copie trechos longos de normas.
Chunk 19 — Prompt de auditoria de cobertura

Use este para verificar se a pesquisa ficou completa.

Você deve atuar como auditor técnico sênior.

Vou te entregar os documentos gerados para um repositório privado GitHub de auditoria, governança, segurança, DevSecOps, LGPD, OWASP, acessibilidade, operação e maturidade técnica para SaaS.

Sua tarefa é verificar se a entrega cobre integralmente o escopo original.

Avalie os seguintes pontos:

1. Resumo executivo.
2. Roadmap por fases.
3. Matriz de normas e frameworks.
4. Matriz de auditorias por cenário.
5. Estrutura do repositório.
6. Lista de arquivos a criar.
7. Modelos de documentos.
8. Checklists principais.
9. Ferramentas recomendadas.
10. Workflows GitHub Actions sugeridos.
11. Comandos de auditoria local.
12. Estratégia para Frappe/Python.
13. Política de relatórios e evidências.
14. Priorização de riscos.
15. Plano de implantação em 30, 60, 90 e 180 dias.
16. Próximos passos para transformar a pesquisa em tarefas para Codex/agente de código.
17. LGPD e privacidade.
18. Acessibilidade.
19. CI/CD.
20. Branches, commits, PRs e issues.
21. Normas ISO/ABNT.
22. OWASP.
23. Frappe/ERPNext/Frappe LMS.
24. Ferramentas open source.
25. Políticas contra vazamento de segredo.

Para cada ponto, entregue uma tabela com:

- Item avaliado.
- Está completo? Sim/Parcial/Não.
- O que falta.
- Gravidade da lacuna.
- Como corrigir.
- Arquivo onde deveria estar.

Depois dê uma nota de 0 a 10 para:

- Cobertura.
- Profundidade.
- Aplicabilidade.
- Clareza.
- Segurança.
- Utilidade para criar o repositório.

No final, gere uma lista de tarefas pendentes em formato de issues GitHub.
Chunk 20 — Prompt para transformar tudo em tarefas para Codex
Você deve atuar como arquiteto técnico e gerente de implementação para um agente de código/Codex.

Com base nos documentos gerados sobre o repositório privado de auditoria, governança, segurança, DevSecOps, LGPD, OWASP, acessibilidade e maturidade SaaS, transforme tudo em um plano de execução para o Codex.

Objetivo:

Criar o repositório privado no GitHub com toda a estrutura, arquivos, templates, checklists, scripts e workflows.

Entregue:

1. Lista de tarefas em ordem de execução.
2. Branch sugerida para cada tarefa.
3. Arquivos que devem ser criados.
4. Arquivos que devem ser editados.
5. Conteúdo esperado de cada arquivo.
6. Critérios de aceite.
7. Testes ou validações.
8. Riscos de vazamento.
9. Como revisar o PR.
10. Como dividir em PRs pequenos.

Organize em lotes:

- Lote 1: estrutura inicial.
- Lote 2: documentos base.
- Lote 3: checklists.
- Lote 4: políticas.
- Lote 5: scripts.
- Lote 6: GitHub Actions.
- Lote 7: Frappe/Python.
- Lote 8: LGPD.
- Lote 9: acessibilidade.
- Lote 10: relatórios e evidências.
- Lote 11: revisão final.

Para cada lote, entregue issues no formato:

```md
## Issue: título

### Objetivo

### Arquivos

### Tarefas

- [ ] tarefa

### Critérios de aceite

- [ ] critério

### Observações de segurança

Não gere código inseguro.
Não use segredos reais.
Não crie arquivos que pareçam conter credenciais reais.


---

# Ordem recomendada para rodar

Eu rodaria nesta ordem:

```txt
0  - Contexto-mestre
1  - Normas e frameworks
2  - Estrutura do repositório
3  - Roadmap
4  - Tipos de auditoria
5  - Auditorias por cenário
6  - Ferramentas
7  - GitHub Actions
8  - Frappe/Python
9  - LGPD
10 - Acessibilidade
11 - Relatórios e evidências
12 - Modelo de relatório final
13 - Severidade e priorização
14 - Branches e commits
15 - Checklists
16 - Scripts locais
17 - Templates
18 - Consolidação README
19 - Auditoria de cobertura
20 - Tarefas para Codex
