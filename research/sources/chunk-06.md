# Fontes do Chunk 6

Data de acesso: **6 de junho de 2026**.

## Critério de pesquisa

Foram priorizadas documentações oficiais, repositórios mantidos pelo projeto e páginas oficiais das organizações. Comandos só foram incluídos quando a sintaxe central foi encontrada nessas fontes. Redirecionamento shell para `reports/raw/` foi acrescentado apenas para aplicar a política local de evidências. Placeholders como `<image-ref>` e `<database>` devem ser substituídos por referências não sensíveis do ambiente autorizado.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Regras de fontes, segredos, relatórios e atualização da pesquisa. |
| `research/prompts.md` | Escopo, categorias, ferramentas e campos do Chunk 6. |
| `research/task-queue.md` | Critérios de aceite e limite de execução. |
| `research/progress.md` | Continuidade e estado dos chunks. |
| `docs/audit-types.md` | Tipos, falsos positivos, evidências e classificação de bloqueio. |
| `docs/audit-trigger-matrix.md` | Gatilhos e Go/No-Go que o catálogo não pode contradizer. |
| `docs/security-roadmap.md` | Fases MVP, vendável e maduro. |
| `docs/repository-architecture.md` | Caminhos para relatórios crus e sanitizados. |

## Documentação oficial ou primária

| ID | Projeto/tema | URL | Uso |
|---|---|---|---|
| S1 | Gitleaks | https://github.com/gitleaks/gitleaks | Comandos `git`/`dir`, redaction e formatos de relatório. |
| S2 | detect-secrets | https://github.com/Yelp/detect-secrets | `detect-secrets scan`, baseline, audit e pre-commit. |
| S3 | TruffleHog | https://github.com/trufflesecurity/trufflehog | Scan Git/filesystem, JSON e verificadores; complementado por https://trufflesecurity.com/blog/trufflehog-commands-git-vs-filesystem. |
| S4 | Bandit | https://bandit.readthedocs.io/en/latest/man/bandit.html | CLI, recursão e formatos. |
| S5 | pip-audit | https://github.com/pypa/pip-audit | CLI, formatos, exit codes, action e security model. |
| S6 | Safety CLI | https://docs.safetycli.com/safety-docs/safety-cli/scanning-for-vulnerable-and-malicious-packages/available-commands-and-inputs | `safety scan`, autenticação e saídas; telemetria em https://docs.safetycli.com/safety-docs/safety-cli/safety-telemetry. |
| S7 | Ruff | https://docs.astral.sh/ruff/linter/ | `ruff check`, seleção de regras e exit codes; regras S em https://docs.astral.sh/ruff/rules/. |
| S8 | npm audit | https://docs.npmjs.com/cli/commands/npm-audit | Audit, JSON e níveis. A busca retornou também página legada; confirmar a página da versão npm fixada. |
| S9 | pnpm audit | https://pnpm.io/cli/audit | Sintaxe e saída do audit. Confirmar comportamento na versão pnpm adotada. |
| S10 | OSV-Scanner | https://google.github.io/osv-scanner/usage/scan-source | Scan recursivo, lockfiles, SBOM e call analysis. |
| S11 | Semgrep | https://semgrep.dev/docs/getting-started/cli | `scan`, `ci`, JSON/SARIF e saídas; referência em https://semgrep.dev/docs/cli-reference. |
| S12 | CodeQL | https://docs.github.com/en/code-security/codeql-cli/getting-started-with-the-codeql-cli/analyzing-your-code-with-codeql-queries | `database analyze`, SARIF e limites; action em https://github.com/github/codeql-action. |
| S13 | OWASP ZAP Baseline | https://www.zaproxy.org/docs/docker/baseline-scan/ | Imagem, alvo, reports e natureza passiva do baseline. |
| S14 | OWASP Dependency-Check | https://dependency-check.github.io/DependencyCheck/dependency-check-cli/arguments.html | `--scan`, `--project`, `--format` e `--out`. |
| S15 | Trivy | https://trivy.dev/latest/docs/references/configuration/cli/trivy_image/ | Scan de imagem e JSON; reporting em https://trivy.dev/docs/latest/configuration/reporting/. |
| S16 | Grype | https://oss.anchore.com/docs/guides/vulnerability/getting-started/ | Alvos e JSON; referência CLI em https://oss.anchore.com/docs/reference/grype/cli/. |
| S17 | Checkov | https://www.checkov.io/2.Basics/CLI%20Command%20Reference.html | Diretório, frameworks, outputs e baseline. |
| S18 | tfsec | https://github.com/aquasecurity/tfsec | CLI, formatos e orientação explícita de transição para Trivy. |
| S19 | Terrascan | https://runterrascan.io/docs/usage/command_line_mode/ | `terrascan scan`, outputs e exit codes. |
| S20 | Syft | https://oss.anchore.com/docs/guides/sbom/formats/ | Formatos e escrita em arquivo; CLI em https://oss.anchore.com/docs/reference/syft/cli/. |
| S21 | CycloneDX | https://cyclonedx.org/tool-center/ | Padrão e geradores por ecossistema; guia em https://cyclonedx.org/guides/sbom/. |
| S22 | FOSSA CLI | https://docs.fossa.com/docs/cli-cheat-sheet | `analyze`, `test` e reports. Plano e tratamento de dados devem ser confirmados. |
| S23 | ScanCode Toolkit | https://scancode-toolkit.readthedocs.io/en/stable/cli-reference/synopsis.html | Detecção e comando JSON; referência em https://scancode-toolkit.readthedocs.io/en/stable/reference/scancode-cli/. |
| S24 | OSS Review Toolkit | https://oss-review-toolkit.org/ort/ | Toolchain e comandos; tutorial e alerta de desatualização em https://oss-review-toolkit.org/ort/docs/getting-started/tutorial. |
| S25 | axe-core | https://github.com/dequelabs/axe-core | Engine e instalação; CLI separado em https://github.com/dequelabs/axe-core-npm/blob/develop/packages/cli/README.md. |
| S26 | Lighthouse | https://developer.chrome.com/docs/lighthouse/overview/ | CLI e JSON. |
| S27 | Pa11y | https://github.com/pa11y/pa11y | CLI, runners, reporter e threshold; CI em https://github.com/pa11y/pa11y-ci. |
| S28 | Schemathesis | https://schemathesis.readthedocs.io/en/stable/reference/cli/ | `st run`, reports e diretório; CI em https://schemathesis.github.io/schemathesis/guides/cicd/. |
| S29 | Dredd | https://dredd.org/en/latest/usage/ | CLI e reporters; formatos/limites em https://dredd.org/en/latest/. |
| S30 | Postman/Newman | https://learning.postman.com/docs/collections/using-newman-cli/newman-options | `newman run`, reporters e exit status; compatibilidade em https://learning.postman.com/docs/collections/using-newman-cli/command-line-integration-with-newman. |
| S31 | OWASP ZAP API Scan | https://www.zaproxy.org/docs/docker/api-scan/ | Scan de API e formatos. Revalidar antes de execução ativa. |
| S32 | GitHub Actions | https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax | YAML, jobs, steps e permissões; hardening em https://docs.github.com/en/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions. |
| S33 | OWASP Threat Dragon | https://owasp.org/www-project-threat-dragon/docs-2/ | Função, armazenamento e métodos; CLI PDF em https://github.com/OWASP/threat-dragon/wiki/FAQs. |
| S34 | LGPD, Lei nº 13.709/2018 | https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm | Princípios, bases, registros, término e direitos. |
| S35 | ANPD - RIPD | https://www.gov.br/anpd/pt-br/canais_atendimento/agente-de-tratamento/relatorio-de-impacto-a-protecao-de-dados-pessoais-ripd | Finalidade e avaliação contextual do RIPD. |

## Incertezas e decisões

- Não foram fixadas versões de ferramentas: isso pertence à implementação e deve considerar release, suporte, checksum e compatibilidade na data da adoção.
- Actions foram citadas por nome/tag apenas para orientação mínima. Workflows finais devem validar versão e fixar SHA no Chunk 7.
- FOSSA e Safety envolvem serviço/plano e autenticação. Não foi presumido recurso gratuito, retenção, residência de dados ou condição contratual.
- O comando ORT de produção não foi inferido porque depende da toolchain/configuração e o tutorial oficial está parcialmente desatualizado. Foi mantido apenas um comando oficial de descoberta (`analyze --help`) e uma exigência explícita de PoC.
- Para CycloneDX, foi usado Syft como gerador multi-ecossistema validado. Os CLIs CycloneDX específicos devem ser escolhidos conforme stack.
- Comandos DAST/API apontam para loopback e pressupõem ambiente autorizado. Não usar em produção sem autorização, escopo, proteção e rollback.
- Redirecionamentos `>` são comportamento do shell Linux, não flags das ferramentas. Eles aplicam a política local de guardar saída crua fora do Git.
- Resultados de scanners são indícios. A política de bloqueio deriva de `docs/audit-types.md` e `docs/audit-trigger-matrix.md`, não de uma promessa universal das ferramentas.
