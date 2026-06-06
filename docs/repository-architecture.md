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
- Evoluir cada área no chunk próprio; arquivos ainda não implementados devem permanecer claramente marcados como placeholders.
- Tratar checklists e políticas como baseline interno, não como prova automática de conformidade ou certificação.

## Árvore-alvo

Os comentários `# template`, `# checklist`, `# política` e `# relatório` indicam a função principal. A árvore é o estado-alvo do template; a presença de um caminho não significa que seu conteúdo já esteja implementado.

```text
saas-security-baseline/
├── .github/
│   └── workflows/
│       ├── basic-pr.yml
│       ├── security.yml
│       ├── security-weekly.yml
│       ├── dependency-review.yml
│       ├── secret-scan.yml
│       ├── codeql.yml
│       ├── semgrep.yml
│       ├── python-audit.yml
│       ├── node-audit.yml
│       ├── container-audit.yml
│       ├── zap-baseline.yml
│       ├── sbom.yml
│       ├── accessibility-audit.yml
│       └── release-checklist.yml
├── accessibility/
│   └── README.md
├── ai-governance/
│   └── README.md
├── appsec/
│   └── README.md
├── business-continuity/
│   └── README.md
├── checklists/
│   ├── index.md
│   ├── owasp-asvs.md                         # checklist
│   ├── owasp-api-top-10.md                   # checklist
│   ├── lgpd.md                               # checklist
│   ├── accessibility-wcag-22-aa.md           # checklist
│   ├── frappe-security.md                    # checklist
│   ├── pre-deploy.md                         # checklist
│   └── pre-enterprise-sale.md                # checklist
├── compliance/
│   └── README.md
├── devsecops/
│   └── README.md
├── docs/
│   ├── README.md
│   ├── repository-architecture.md
│   ├── standards-and-frameworks-matrix.md
│   ├── security-audit-baseline.md             # template de relatório
│   ├── security-roadmap.md
│   ├── lgpd-gap-assessment.md                 # template de relatório
│   ├── threat-model.md                        # template
│   ├── incident-response-plan.md
│   ├── business-continuity-plan.md
│   ├── accessibility-audit.md                 # template de relatório
│   ├── api-security-checklist.md              # checklist
│   ├── cloud-security-checklist.md            # checklist
│   └── ai-governance-checklist.md             # checklist
├── examples/                                  # exemplos exclusivamente fictícios
├── incident-response/
│   └── README.md
├── policies/
│   └── README.md                              # índice de políticas
├── privacy/
│   ├── README.md
│   ├── data-map.md                            # template
│   ├── ropa.md                                # template
│   ├── dpia-template.md                       # template
│   ├── legal-bases.md                         # template
│   ├── retention-policy.md                    # política
│   ├── third-party-processors.md              # template
│   ├── data-subject-rights.md                 # política/processo
│   ├── incident-personal-data.md              # política/processo
│   └── privacy-by-design-checklist.md          # checklist
├── reports/
│   ├── README.md
│   ├── raw/                                   # relatórios crus; ignorado pelo Git
│   └── sanitized/                             # relatórios revisados e sanitizados
├── research/
│   ├── prompts.md
│   ├── task-queue.md
│   ├── progress.md
│   ├── chunks/
│   └── sources/
│       ├── README.md
│       └── chunk-NN.md
├── risk/
│   ├── README.md
│   ├── risk-register.csv                      # template
│   ├── risk-matrix.md
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
│   └── README.md
├── templates/
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
│   └── README.md
├── .gitleaks.toml
├── .secrets.baseline
├── .gitignore
├── AGENTS.md
├── CODEOWNERS
├── CONTRIBUTING.md
├── README.md
└── SECURITY.md
```

## Função das pastas

| Pasta | Função | Conteúdo permitido no Git | Cuidados |
|---|---|---|---|
| `.github/workflows/` | Orquestrar verificações automatizadas e gates de CI. | YAML revisado, sem credenciais embutidas. | Logs e artifacts podem expor dados; usar permissões mínimas e política de retenção. |
| `docs/` | Documentação transversal, planos, guias e modelos de auditoria. | Baselines, sínteses e documentos sanitizados. | Não registrar achados reais sem sanitização. |
| `checklists/` | Verificações repetíveis por domínio e etapa do produto. | Itens genéricos e evidências esperadas. | Checklist preenchido de cliente/produto pode se tornar sensível. |
| `policies/` | Políticas internas aprovadas e seus índices. | Políticas genéricas ou aprovadas para distribuição interna. | Não confundir template com política formalmente aprovada. |
| `risk/` | Método de avaliação, matriz, severidade e modelo de registro. | Estruturas e exemplos fictícios. | O registro real pode revelar vulnerabilidades e decisões confidenciais. |
| `compliance/` | Mapeamentos de obrigações e controles. | Matrizes e interpretações práticas. | Requer validação jurídica quando tratar obrigações legais. |
| `privacy/` | Governança LGPD, inventários e processos de titulares. | Modelos vazios ou exemplos fictícios. | Nunca incluir dados pessoais reais no template. |
| `security/` | Controles gerais de segurança e orientações operacionais. | Padrões e procedimentos genéricos. | Evitar detalhes exploráveis de ambientes reais. |
| `appsec/` | Práticas de segurança no ciclo de desenvolvimento. | Padrões de revisão, modelagem e testes. | Resultados crus devem ir para `reports/raw/`. |
| `devsecops/` | Integração de segurança em build, CI/CD e dependências. | Estratégias, configurações e regras revisadas. | Não embutir tokens, endpoints internos ou variáveis reais. |
| `incident-response/` | Preparação, papéis, playbooks e exercícios. | Modelos e playbooks genéricos. | Casos reais e indicadores devem permanecer em sistema restrito. |
| `business-continuity/` | Continuidade, recuperação e testes de restauração. | Planos e templates sanitizados. | Não expor topologia, fornecedores ou tempos reais confidenciais. |
| `accessibility/` | Programa, critérios e orientação de acessibilidade. | Guias, processos e resultados sanitizados. | Evidências podem conter dados de usuários ou telas internas. |
| `testing/` | Estratégia de testes e critérios de qualidade. | Planos, matrizes e exemplos fictícios. | Não versionar massas de dados reais. |
| `ai-governance/` | Riscos, uso responsável e controles para IA. | Políticas, inventários e avaliações-modelo. | Não incluir prompts, dados ou respostas confidenciais reais. |
| `templates/` | Modelos copiáveis para cada SaaS. | Campos vazios e exemplos explicitamente fictícios. | Não preencher o template central com dados de um produto. |
| `scripts/` | Pontos de entrada locais para auditorias. | Código revisado e sem segredos. | Saídas cruas somente em `reports/raw/`; placeholders atuais são inertes. |
| `reports/raw/` | Saídas originais de scanners e coleta. | Nada: a pasta é ignorada, exceto estrutura local não versionada. | Pode conter segredos, caminhos, dependências e vulnerabilidades. |
| `reports/sanitized/` | Resumos revisados para versionamento controlado. | Apenas material redigido e aprovado. | Sanitização e revisão humana são obrigatórias. |
| `examples/` | Demonstrações de preenchimento e integração. | Dados claramente fictícios. | Não usar domínios, pessoas ou credenciais que pareçam reais. |
| `research/` | Prompts, fila, progresso e fontes por chunk. | Registro metodológico e referências públicas. | Não armazenar cópias integrais de normas protegidas. |

## Arquivos principais

| Arquivo ou grupo | Tipo | Finalidade | Dados reais? |
|---|---|---|---|
| `README.md` | Documento de entrada | Apresentar objetivo, escopo, maturidade e navegação. | Não. |
| `SECURITY.md` | Política/processo | Definir canal e regras para relatos de segurança. | Não registrar relatos no arquivo ou em issue pública. |
| `CONTRIBUTING.md` | Política/processo | Definir contribuição, revisão e cuidados com evidências. | Não. |
| `CODEOWNERS` | Governança | Atribuir revisão por área usando equipes ou usuários configurados no repositório. | Evitar dados pessoais desnecessários. |
| `.gitignore` | Controle preventivo | Excluir relatórios crus, segredos locais, logs, dumps e estados de infraestrutura. | Não contém dados reais. |
| `.gitleaks.toml` | Configuração | Customizar detecção de segredos sem permitir segredos reais. | Allowlists não devem conter credenciais. |
| `.secrets.baseline` | Baseline técnico | Registrar fingerprints gerados por ferramenta de detecção, após revisão. | Não adicionar o valor dos segredos; o placeholder é vazio. |
| `docs/security-audit-baseline.md` | Template de relatório | Estruturar escopo, achados, riscos e remediação. | Somente cópias sanitizadas; relatório real deve ter controle próprio. |
| `docs/*-checklist.md` e `checklists/*.md` | Checklist | Padronizar verificações manuais e automatizadas. | O modelo não; respostas de um SaaS podem ser confidenciais. |
| `docs/*-plan.md` | Plano/template | Orientar resposta a incidentes e continuidade. | Não incluir contatos, ativos ou arquitetura reais no template. |
| `risk/risk-register.csv` | Template | Definir campos mínimos do registro de riscos. | Não no template central. |
| `risk/risk-matrix.md` | Método | Definir probabilidade, impacto e tratamento. | Não. |
| `scripts/*.sh` | Automação | Executar ferramentas e direcionar resultados às pastas corretas. | Nunca embutir dados reais; scripts atuais são placeholders. |
| `.github/workflows/*.yml` | Automação | Executar checks no GitHub Actions. | Nunca embutir segredos; placeholders atuais só aceitam disparo manual. |
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

## Estado da árvore no Chunk 2

A verificação realizada neste chunk confirmou todas as pastas mínimas solicitadas e os documentos obrigatórios já presentes. Foram adicionados apenas os placeholders ausentes de configuração, scripts e workflows. O conteúdo funcional desses arquivos permanece reservado aos chunks 7 e 16.
