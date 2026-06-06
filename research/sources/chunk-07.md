# Fontes do Chunk 7

Data de acesso: **6 de junho de 2026**.

## Critério de pesquisa

Foram priorizadas fontes oficiais do GitHub e dos projetos das ferramentas. Os comandos de scanners foram herdados de `docs/security-tools-catalog.md`, onde a sintaxe foi validada no Chunk 6. Este chunk pesquisou principalmente eventos, permissões, artifacts, disponibilidade por plano e versões suportadas das actions.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Regras de evidência, fontes, segredos e atualização da pesquisa. |
| `research/prompts.md` | Escopo e entregáveis do Chunk 7. |
| `research/task-queue.md` | Critérios de aceite e limite de execução. |
| `research/progress.md` | Estado anterior dos chunks. |
| `docs/security-tools-catalog.md` | Comandos, riscos de relatório, saídas e política de gate. |
| `docs/audit-trigger-matrix.md` | Eventos, frequência e critérios de Go/No-Go. |
| `docs/audit-types.md` | Limitações, falsos positivos e auditorias que bloqueiam release. |
| `docs/security-roadmap.md` | Fases MVP seguro, SaaS vendável e SaaS maduro. |
| `docs/repository-architecture.md` | Nomes dos workflows e separação de relatórios crus/sanitizados. |

## GitHub Actions e segurança

| ID | Fonte oficial | URL | Uso |
|---|---|---|---|
| G1 | Workflow syntax | https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax | Eventos, jobs, `permissions`, expressions e estrutura YAML. |
| G2 | Security hardening for GitHub Actions | https://docs.github.com/en/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions | Código não confiável, pin por SHA, secrets, tokens e riscos de actions de terceiros. |
| G3 | Automatic token authentication | https://docs.github.com/en/actions/security-for-github-actions/security-guides/automatic-token-authentication | Escopo do `GITHUB_TOKEN` e declaração explícita de permissões. |
| G4 | Events that trigger workflows | https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows | Diferenças entre `pull_request`, `pull_request_target`, `schedule` e `workflow_dispatch`. |
| G5 | Managing Actions settings | https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/managing-github-actions-settings-for-a-repository | Política de actions permitidas, token padrão e retenção de logs/artifacts. |
| G6 | Workflow artifacts | https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts | Upload, download, digest e retenção de artifacts. |
| G7 | `actions/upload-artifact` | https://github.com/actions/upload-artifact | Versão atual, imutabilidade, arquivos ocultos e restrição de caminhos. |
| G8 | Using secrets in GitHub Actions | https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions | Masking, secrets em forks, environment secrets e OIDC. |
| G9 | Protected branches | https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches | Reviews, required checks, merge queue e limitações. |
| G10 | Rulesets | https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets | Regras por branch/tag e disponibilidade conforme plano. |

## Actions e ferramentas

| ID | Fonte oficial | URL | Uso |
|---|---|---|---|
| T1 | `actions/checkout` | https://github.com/actions/checkout | `checkout@v6`, `contents: read` e `persist-credentials`. |
| T2 | Dependency Review | https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/about-dependency-review | Funcionamento, falha do check e disponibilidade em privados. |
| T3 | Dependency Review Action | https://github.com/actions/dependency-review-action | `@v5`, `fail-on-severity` e runtime atual. |
| T4 | Code scanning | https://docs.github.com/en/code-security/concepts/code-scanning/about-code-scanning | Disponibilidade em privados e função do code scanning. |
| T5 | CodeQL Action | https://github.com/github/codeql-action | `@v4`, permissões, linguagens e recomendação de versão suportada. |
| T6 | Code scanning em PR | https://docs.github.com/en/code-security/code-scanning/managing-code-scanning-alerts/triaging-code-scanning-alerts-in-pull-requests | Severidades que falham o check e triagem de alertas novos. |
| T7 | Code scanning merge protection | https://docs.github.com/en/code-security/concepts/code-scanning/merge-protection | Rulesets, severidade e limitações da proteção. |
| T8 | Semgrep CI samples | https://semgrep.dev/docs/semgrep-ci/sample-ci-configs | Container oficial, eventos e `semgrep scan --config auto`. |
| T9 | Semgrep CLI | https://semgrep.dev/docs/getting-started/cli | Diferença entre `semgrep scan` e `semgrep ci`. |
| T10 | Gitleaks | https://github.com/gitleaks/gitleaks | Imagem oficial, comando Git, redaction e formatos. |
| T11 | ZAP Baseline | https://www.zaproxy.org/docs/docker/baseline-scan/ | Natureza passiva, exit codes e formatos de saída. |
| T12 | ZAP Baseline Action | https://github.com/zaproxy/action-baseline | Criação de issue/artifact por padrão e opções para falha. |
| T13 | Trivy advisory GHSA-69fq-xp46-6x23 | https://github.com/aquasecurity/trivy/security/advisories/GHSA-69fq-xp46-6x23 | Comprometimento de actions/tags/imagens em março de 2026 e versões corrigidas. |
| T14 | Syft | https://github.com/anchore/syft | Geração de SBOM CycloneDX/SPDX. |
| T15 | Pa11y | https://github.com/pa11y/pa11y | CLI e limites de teste automatizado de acessibilidade. |

## Decisões e incertezas

- Os exemplos usam tags maiores oficiais (`checkout@v6`, Dependency Review `@v5` e CodeQL `@v4`) para permanecer legíveis e acompanhar a recomendação dos próprios projetos. Na adoção por um SaaS, actions de terceiros devem ser fixadas por SHA completo e atualizadas por processo automatizado com revisão.
- O workflow ZAP usa `ghcr.io/zaproxy/zaproxy:stable` porque essa é a referência documentada no catálogo e no projeto. Antes de uso real, deve ser substituída por digest validado. O exemplo só escaneia conteúdo fictício em loopback, não aceita URL como input e não publica artifact.
- Dependency Review em repositório privado depende de proprietário, plano/licença e configuração aplicáveis. O GitHub documenta disponibilidade para privados de organização com GitHub Code Security ou GitHub Advanced Security nas condições indicadas pela documentação atual.
- Code scanning/CodeQL em privado exige licença/configuração aplicável e suporte da linguagem. Não foi presumida disponibilidade neste repositório.
- Rulesets, merge protection, environments, attestations, merge queue e retenção variam por plano e tipo de repositório. As recomendações devem ser confirmadas nas configurações reais.
- `schedule` não garante execução no minuto exato e usa UTC. Workflows agendados rodam a partir do branch padrão.
- Resultados crus podem conter código, dependências, URLs, headers, respostas, paths e dados pessoais. O padrão é não fazer upload; quando indispensável, o documento limita o artifact a arquivos enumerados e retenção curta.
- O incidente Trivy de março de 2026 demonstra que pin por tag não é suficiente contra force-push ou comprometimento de publicação. Não foi criado workflow Trivy operacional neste chunk; a adoção exige versão corrigida, SHA/digest e checksum verificados.
- Os demais placeholders de `.github/workflows/` continuam documentais. Os comandos completos e instalação de ferramentas serão tratados no Chunk 16, sem antecipação neste chunk.
