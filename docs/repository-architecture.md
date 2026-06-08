# Arquitetura do Repositório

## Nome recomendado

**Nome principal:** `saas-security-baseline`

O nome comunica que o repositório define uma base mínima, repetível e evolutiva para segurança e governança de SaaS. Ele não promete certificação, conformidade automática nem substitui avaliação jurídica ou auditoria independente.

**Nomes alternativos:**

- `saas-assurance-baseline`: enfatiza confiança, evidências e controles.
- `secure-saas-governance-template`: enfatiza governança e reutilização.
- `saas-devsecops-compliance-kit`: enfatiza automação e conformidade, mas pode sugerir cobertura mais ampla do que a efetivamente implementada.

## Princípios de organização

- Separar orientação (`docs/`), execução (`scripts/` e workflows), evidências (`reports/`) e modelos reutilizáveis (`templates/`).
- Manter relatórios crus em `reports/raw/`, fora do Git.
- Versionar somente conteúdo sanitizado, revisável e sem dados sensíveis.
- Evoluir cada área no lote ou chunk próprio; arquivos ainda não implementados devem permanecer claramente marcados como iniciais, exemplos, placeholders ou planejados.
- Tratar checklists e políticas como baseline interno, não como prova automática de conformidade ou certificação.

## Árvore de referência e estado atual

Os comentários indicam a função principal e o estado observado após os fechamentos corretivos dos Lotes 1, 2, 3, 4 e 6. A presença de um caminho não significa prontidão operacional, gate obrigatório, certificação ou validação funcional.

```text
saas-security-baseline/
├── .github/
│   └── workflows/
│       ├── .gitkeep
│       └── security.yml                         # workflow ativo mínimo; política e higiene documental
├── accessibility/
│   └── README.md                            # índice de domínio reconciliado
├── ai-governance/
│   └── README.md                            # índice de domínio reconciliado
├── appsec/
│   └── README.md                            # índice de domínio reconciliado
├── business-continuity/
│   └── README.md                            # índice de domínio reconciliado
├── checklists/
│   ├── README.md
│   ├── index.md
│   ├── pre-beta.md                             # checklist substantivo
│   ├── pre-deploy.md                           # checklist substantivo
│   ├── pre-enterprise-sale.md                  # checklist substantivo
│   ├── owasp-top-10.md                         # checklist substantivo adicional
│   ├── owasp-asvs.md                         # checklist substantivo
│   ├── owasp-api-top-10.md                   # checklist substantivo
│   ├── lgpd.md                               # checklist substantivo
│   ├── accessibility-wcag-22-aa.md           # checklist substantivo
│   ├── frappe-security.md                    # checklist substantivo
│   ├── cloud-security.md                      # checklist substantivo
│   ├── ci-cd-security.md                      # checklist substantivo
│   ├── payment-security.md                    # checklist substantivo
│   ├── incident-response.md                   # checklist substantivo
│   ├── backup-restore.md                      # checklist substantivo
│   ├── third-party-risk.md                    # checklist substantivo
│   └── ai-governance.md                       # checklist substantivo
├── compliance/
│   └── README.md                            # índice de domínio reconciliado
├── devsecops/
│   └── README.md                            # índice de domínio reconciliado
├── docs/
│   ├── README.md                            # índice de documentação reconciliado
│   ├── repository-architecture.md
│   ├── standards-and-frameworks-matrix.md
│   ├── security-audit-baseline.md             # template de relatório
│   ├── security-roadmap.md
│   ├── lgpd-gap-assessment.md                 # guia auxiliar; Lote 8 operacionaliza privacy/
│   ├── threat-model.md                        # guia auxiliar para threat modeling sanitizado
│   ├── incident-response-plan.md              # guia auxiliar de resposta a incidentes
│   ├── business-continuity-plan.md            # guia auxiliar de continuidade
│   ├── accessibility-audit.md                 # guia auxiliar; Lote 9 operacionaliza processo
│   ├── api-security-checklist.md              # guia auxiliar; checklist canônico em checklists/
│   ├── cloud-security-checklist.md            # guia auxiliar; checklist canônico em checklists/
│   └── ai-governance-checklist.md             # guia auxiliar; checklist canônico em checklists/
├── examples/                                  # exemplos exclusivamente fictícios
│   └── github-workflows/
│       ├── codeql.yml                         # exemplo substantivo; validar plano e SHA antes de gate
│       ├── dependency-review.yml              # exemplo substantivo; validar plano e SHA antes de gate
│       ├── zap-baseline.yml                   # exemplo loopback alert-only; validar imagem/digest antes de uso
│       ├── basic-pr.yml                       # placeholder de exemplo
│       ├── security-weekly.yml                # placeholder de exemplo
│       ├── secret-scan.yml                    # placeholder de exemplo
│       ├── semgrep.yml                        # placeholder de exemplo
│       ├── python-audit.yml                   # placeholder de exemplo
│       ├── node-audit.yml                     # placeholder de exemplo
│       ├── container-audit.yml                # placeholder de exemplo
│       ├── sbom.yml                           # placeholder de exemplo
│       ├── accessibility-audit.yml            # placeholder de exemplo
│       └── release-checklist.yml              # placeholder de exemplo
├── incident-response/
│   └── README.md                            # índice de domínio reconciliado
├── policies/
│   └── README.md                              # índice de políticas
├── privacy/
│   ├── README.md                            # índice de domínio; privacy/*.md ficam para Lote 8
│   ├── data-map.md                            # placeholder de template
│   ├── ropa.md                                # placeholder de template
│   ├── dpia-template.md                       # placeholder de template
│   ├── legal-bases.md                         # placeholder de template
│   ├── retention-policy.md                    # placeholder de política
│   ├── third-party-processors.md              # placeholder de template
│   ├── data-subject-rights.md                 # placeholder de política/processo
│   ├── incident-personal-data.md              # placeholder de política/processo
│   └── privacy-by-design-checklist.md          # placeholder de checklist
├── reports/
│   ├── README.md                            # índice de evidências reconciliado
│   ├── raw/                                   # relatórios crus; ignorado pelo Git
│   └── sanitized/                             # relatórios revisados e sanitizados
├── research/
│   ├── repository-inventory.md                # inventário reconciliado do Lote 1
│   ├── prompts.md
│   ├── task-queue.md
│   ├── progress.md
│   ├── coverage-audit.md
│   ├── codex-execution-plan.md
│   └── sources/
│       ├── README.md
│       ├── chunk-01.md ... chunk-20.md
│       ├── lote-01.md                         # fontes internas da reconciliação do Lote 1
│       ├── lote-02.md                         # fontes internas da reconciliação do Lote 2
│       ├── lote-04.md                         # fontes da reconciliação do Lote 4
│       └── lote-06.md                         # fontes da reconciliação do Lote 6
├── risk/
│   ├── README.md                              # índice de risco reconciliado
│   ├── risk-register.csv                      # placeholder de template
│   ├── risk-matrix.md                         # placeholder
│   └── severity-and-prioritization.md
├── scripts/
│   ├── README.md
│   ├── run-security-audit.sh
│   ├── run-python-audit.sh
│   ├── run-node-audit.sh
│   ├── run-container-audit.sh
│   ├── run-accessibility-audit.sh
│   ├── run-api-audit.sh
│   ├── run-frappe-audit.sh
│   └── generate-sbom.sh
├── security/
│   └── README.md                              # índice de domínio reconciliado
├── templates/
│   ├── README.md                              # guia de uso reconciliado
│   ├── index.md
│   ├── security-finding-template.md
│   ├── remediation-plan-template.md
│   ├── risk-register-template.csv
│   ├── threat-model-template.md
│   ├── incident-report-template.md
│   ├── postmortem-template.md
│   ├── backup-restore-test-template.md
│   ├── executive-summary-template.md
│   ├── data-map-template.md
│   ├── ropa-template.md
│   ├── dpia-template.md
│   ├── vendor-risk-assessment-template.md
│   ├── accessibility-finding-template.md
│   └── ai-risk-assessment-template.md
├── testing/
│   └── README.md                              # índice de domínio reconciliado
├── .gitleaks.toml                          # configuração inicial de secret scanning; exige validação local
├── .secrets.baseline                       # baseline vazia revisável; sem findings reais
├── .gitignore                              # controle preventivo ampliado para segredos/evidências
├── AGENTS.md
├── CODEOWNERS                              # template comentado; owners reais dependem do consumidor
├── CONTRIBUTING.md                         # política de contribuição reconciliada
├── opencode.json
├── README.md
└── SECURITY.md                             # política de reporte e resposta reconciliada
```

## Função das pastas

| Pasta | Função | Conteúdo permitido no Git | Cuidados |
|---|---|---|---|
| `.github/workflows/` | Orquestrar verificações automatizadas e gates de CI. | YAML revisado, sem credenciais embutidas. | Atualmente há apenas `security.yml` ativo, com controles mínimos de política e higiene documental; novos scanners/gates dependem de validação de plano, ferramenta, SHA/digest, logs e artifacts. |
| `docs/` | Documentação transversal, planos, guias e modelos de auditoria. | Baselines, sínteses e documentos sanitizados. | Documentos auxiliares do Lote 2 são guias/índices e apontam para fontes canônicas; não registrar achados reais sem sanitização. |
| `checklists/` | Verificações repetíveis por domínio e etapa do produto. | Itens genéricos e evidências esperadas. | Checklist preenchido de cliente/produto pode se tornar sensível. |
| `policies/` | Políticas internas aprovadas e seus índices. | Políticas genéricas ou aprovadas para distribuição interna. | Não confundir template com política formalmente aprovada. |
| `risk/` | Método de avaliação, matriz, severidade e modelo de registro. | Estruturas e exemplos fictícios. | `severity-and-prioritization.md` é canônico; `risk-matrix.md` e `risk-register.csv` ficam para o Lote 10. |
| `compliance/` | Mapeamentos de obrigações e controles. | Matrizes e interpretações práticas. | Requer validação jurídica quando tratar obrigações legais. |
| `privacy/` | Governança LGPD, inventários e processos de titulares. | Modelos vazios ou exemplos fictícios. | O README foi reconciliado no Lote 2; `privacy/*.md` fica para Lote 8. Nunca incluir dados pessoais reais. |
| `security/` | Controles gerais de segurança e orientações operacionais. | Padrões e procedimentos genéricos. | Evitar detalhes exploráveis de ambientes reais. |
| `appsec/` | Práticas de segurança no ciclo de desenvolvimento. | Padrões de revisão, modelagem e testes. | Resultados crus devem ir para `reports/raw/`. |
| `devsecops/` | Integração de segurança em build, CI/CD e dependências. | Estratégias, configurações e regras revisadas. | Não embutir tokens, endpoints internos ou variáveis reais. |
| `incident-response/` | Preparação, papéis, playbooks e exercícios. | Modelos e playbooks genéricos. | Casos reais e indicadores devem permanecer em sistema restrito. |
| `business-continuity/` | Continuidade, recuperação e testes de restauração. | Planos e templates sanitizados. | Não expor topologia, fornecedores ou tempos reais confidenciais. |
| `accessibility/` | Programa, critérios e orientação de acessibilidade. | Guias, processos e resultados sanitizados. | Evidências podem conter dados de usuários ou telas internas. |
| `testing/` | Estratégia de testes e critérios de qualidade. | Planos, matrizes e exemplos fictícios. | Não versionar massas de dados reais. |
| `ai-governance/` | Riscos, uso responsável e controles para IA. | Políticas, inventários e avaliações-modelo. | Não incluir prompts, dados ou respostas confidenciais reais. |
| `templates/` | Modelos copiáveis para cada SaaS. | Campos vazios e exemplos explicitamente fictícios. | Não preencher o template central com dados de um produto. |
| `scripts/` | Pontos de entrada locais para auditorias defensivas. | Código revisado e sem segredos. | Os oito scripts existem e passaram por validação sintática, mas scanners, ferramentas externas, rede, flags e exit codes ainda não foram testados funcionalmente. |
| `reports/raw/` | Saídas originais de scanners e coleta. | Nada: a pasta é ignorada, exceto estrutura local não versionada. | Pode conter segredos, caminhos, dependências e vulnerabilidades. |
| `reports/sanitized/` | Resumos revisados para versionamento controlado. | Apenas material redigido e aprovado. | Sanitização e revisão humana são obrigatórias; controles preventivos adicionais ficam para Lote 10. |
| `examples/` | Demonstrações de preenchimento e integração. | Dados claramente fictícios. | Exemplos de workflows exigem adaptação, fixação de referências e validação antes de uso; dez exemplos permanecem placeholders. |
| `research/` | Prompts, fila, progresso e fontes por chunk. | Registro metodológico e referências públicas. | Não armazenar cópias integrais de normas protegidas. |

## Arquivos principais

| Arquivo ou grupo | Tipo | Finalidade | Dados reais? |
|---|---|---|---|
| `README.md` | Documento de entrada | Apresentar objetivo, escopo, maturidade e navegação. | Não. |
| `SECURITY.md` | Política/processo | Definir reporte privado, triagem, resposta a segredos, divulgação e evidências. | Não registrar relatos no arquivo ou em issue pública. Canal real depende do repositório consumidor. |
| `CONTRIBUTING.md` | Política/processo | Definir contribuição, revisão, PRs, fontes, evidências e limites de escopo. | Não. |
| `CODEOWNERS` | Governança | Documentar template de ownership sem inventar usuários ou equipes. | Owners reais devem ser configurados no repositório consumidor. |
| `.gitignore` | Controle preventivo | Excluir relatórios crus, segredos locais, logs, dumps e estados de infraestrutura. | Não contém dados reais. |
| `.gitleaks.toml` | Configuração | Customizar detecção de segredos sem permitir segredos reais. | Allowlists não devem conter credenciais. |
| `.secrets.baseline` | Baseline técnico | Registrar fingerprints gerados por ferramenta de detecção, após revisão. | Não adicionar o valor dos segredos; o placeholder é vazio. |
| `docs/security-audit-baseline.md` | Template de relatório | Estruturar escopo, achados, riscos e remediação. | Somente cópias sanitizadas; relatório real deve ter controle próprio. |
| `docs/*-checklist.md` e `checklists/*.md` | Checklist/guia | Em `docs/`, guiar navegação e apontar para checklists canônicos; em `checklists/`, padronizar verificações executáveis. | O modelo não; respostas de um SaaS podem ser confidenciais. |
| `docs/*-plan.md` | Guia auxiliar | Orientar resposta a incidentes e continuidade sem registrar casos reais. | Não incluir contatos, ativos ou arquitetura reais no template. |
| `risk/risk-register.csv` | Template | Definir campos mínimos do registro de riscos. | Não no template central. |
| `risk/risk-matrix.md` | Método | Definir probabilidade, impacto e tratamento. | Não. |
| `scripts/*.sh` | Automação | Executar ferramentas e direcionar resultados às pastas corretas. | Nunca embutir dados reais; scripts existem, mas precisam de testes com fixtures antes de virar gate confiável. |
| `.github/workflows/security.yml` | Automação | Executar controles mínimos de política do repositório, arquivos sensíveis rastreados, padrões perigosos em workflows ativos e higiene básica de Markdown. | Não executa secret scanning completo, SAST, SCA, DAST, SBOM, deploy nem substitui os workflows planejados. |
| `examples/github-workflows/*.yml` | Exemplo | Mostrar padrões possíveis de CI/CD. | Não copiar sem validar plano GitHub, permissões, logs, artifacts, referências imutáveis e stack. |
| `reports/raw/` | Relatório/evidência | Armazenar temporariamente saída integral. | Pode conter dados reais, mas nunca deve ser versionado. |
| `reports/sanitized/` | Relatório/evidência | Guardar síntese revisada com exposição reduzida. | Apenas o mínimo necessário, após redaction e aprovação. |

## Classificação dos artefatos

- **Templates:** arquivos em `templates/`, modelos de privacidade, `risk/risk-register.csv`, modelos de planos e documentos de auditoria ainda não preenchidos.
- **Checklists:** arquivos em `checklists/`, arquivos `docs/*-checklist.md` e `privacy/privacy-by-design-checklist.md`.
- **Políticas:** arquivos aprovados em `policies/`, `SECURITY.md`, política de retenção e processos formais de privacidade, incidentes e continuidade.
- **Relatórios:** saídas em `reports/raw/` e `reports/sanitized/`, além de cópias preenchidas de templates de auditoria.
- **Configuração e automação:** `.gitleaks.toml`, `.secrets.baseline`, `.github/workflows/` e `scripts/`.

## Arquivos que não devem receber dados reais

O repositório-base não deve receber segredos, tokens, credenciais, cookies, dados pessoais, URLs internas, payloads exploráveis, dumps, backups, logs, configurações reais de sites, estados de infraestrutura nem relatórios crus. Em especial, não preencher com dados reais:

- `examples/` e `templates/`;
- checklists e modelos mantidos como fonte reutilizável;
- `.gitleaks.toml`, `.secrets.baseline`, scripts e workflows;
- documentos em `research/`;
- issues, pull requests, commits ou histórico Git.

Quando um SaaS exigir evidências reais, elas devem permanecer em armazenamento restrito definido pelo projeto. O Git pode conter somente resumo sanitizado e aprovado em `reports/sanitized/`.

## Reutilização em vários SaaS

1. Criar um novo repositório privado a partir deste template, sem copiar o histórico de evidências de outro produto.
2. Definir responsáveis no `CODEOWNERS` e adaptar `README.md`, escopo técnico e fases de maturidade.
3. Selecionar checklists aplicáveis à stack e marcar itens não aplicáveis com justificativa.
4. Copiar templates para uma área controlada do projeto antes de preenchê-los; não alterar os modelos centrais com dados reais.
5. Habilitar scripts e workflows gradualmente nos chunks próprios, validando versões, comandos, permissões e política de artifacts.
6. Manter evidências cruas fora do Git e publicar apenas resumos sanitizados.
7. Sincronizar melhorias estruturais de volta ao template sem importar informações específicas do SaaS.

## Estado reconciliado após os lotes corretivos

O inventário verificável do estado atual está em `research/repository-inventory.md`. Esta arquitetura deve ser lida junto com esse inventário quando houver dúvida entre documento canônico, índice, template, exemplo, placeholder e backlog.

Estado confirmado nesta reconciliação:

- O Lote 3 foi fechado antes desta atualização; os 15 checklists do prompt do Chunk 15 e o checklist adicional `checklists/owasp-top-10.md` existem e foram tratados como substantivos.
- `research/sources/chunk-15.md` existe e registra fontes, decisões, incertezas e limites do fechamento corretivo dos checklists.
- `README.md`, `docs/repository-architecture.md`, `research/progress.md` e `research/task-queue.md` foram reconciliados para não manter o Chunk 19, o Chunk 20 ou o Lote 1 como pendentes.
- O Lote 2 foi reconciliado: documentos auxiliares em `docs/` e READMEs de domínio deixaram de ser placeholders vencidos e passaram a funcionar como guias ou índices para fontes canônicas, checklists, templates e pendências.
- O Lote 4 foi reconciliado: `SECURITY.md`, `CONTRIBUTING.md`, `CODEOWNERS`, `.gitleaks.toml`, `.secrets.baseline` e `.gitignore` deixaram de ser placeholders iniciais, com pendências contextuais registradas.
- O Lote 6 foi reconciliado: `.github/workflows/security.yml` ficou como workflow ativo mínimo, com `permissions` somente leitura, sem artifacts, sem secrets, sem `pull_request_target` e com `actions/checkout` fixado por SHA completo.
- `research/coverage-audit.md` permanece como auditoria histórica do estado anterior e não foi reescrito nesta reconciliação.
- Scripts, exemplos de workflows, privacidade operacional, risco auxiliar e evidências mantêm as pendências dos próximos lotes corretivos quando indicado no inventário.

Limites que permanecem:

- Não há declaração de conformidade, certificação, ausência de vulnerabilidades, prontidão enterprise ou eficácia completa de automações.
- Workflows de exemplo ainda não devem ser tratados como controles ativos.
- Scripts locais ainda precisam de testes funcionais com fixtures fictícias e versões validadas.
- Owners reais, canal privado, validação de ferramentas de secret scanning, CodeQL, Dependency Review, branch protection, rulesets e scanners especializados continuam pendentes.
- Arquivos iniciais ou placeholders fora dos lotes já reconciliados foram apenas inventariados; a correção de conteúdo pertence aos lotes seguintes.
