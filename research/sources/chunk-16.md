# Fontes do Chunk 16

Data de acesso: **7 de junho de 2026**.

## Criterio de pesquisa

Foram priorizadas documentacoes oficiais dos projetos e os comandos ja validados em `docs/security-tools-catalog.md`. Os scripts adotam uma politica mais restritiva que os exemplos publicos: alvo somente local, sem instalacao automatica, sem upload, sem correcao automatica, sem scan ativo e com consentimento explicito para rede.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Regras de evidencias, fontes, segredos, dados pessoais e atualizacao do chunk. |
| `research/prompts.md` | Oito scripts, ferramentas e criterios originais do Chunk 16. |
| `research/task-queue.md` | Limite do chunk e criterios de aceite. |
| `research/progress.md` | Estado anterior e registro de conclusao. |
| `docs/repository-architecture.md` | Responsabilidade de `scripts/` e separacao `reports/raw/`/`reports/sanitized/`. |
| `docs/security-tools-catalog.md` | Comandos validados, riscos de exposicao, limitacoes e falsos positivos. |
| `docs/github-actions-strategy.md` | Adaptacao para CI/CD, permissoes, artifacts e gates. |
| `docs/evidence-and-reporting-policy.md` | Classificacao, redaction, retencao, descarte e revisao de relatorios. |
| `docs/security-audit-baseline.md` | Registro de ferramentas, evidencias, limitacoes e declaracao final. |
| `risk/severity-and-prioritization.md` | Interpretacao de severidade, prioridade, SLA, excecoes e bloqueios. |
| `docs/frappe-python-security-audit.md` | Padroes `rg`, riscos Frappe/Python e limites da analise automatizada. |
| `docs/accessibility-program.md` | Uso seguro de Pa11y/Lighthouse e necessidade de avaliacao humana. |
| `docs/git-security-workflow.md` | Proibicao de evidencias cruas em commits, PRs e issues. |

## Ferramentas e formatos oficiais

| ID | Fonte oficial | URL | Uso |
|---|---|---|---|
| S1 | Gitleaks | https://github.com/gitleaks/gitleaks | `git`, redaction, JSON, report path e limites de secret scanning. |
| S2 | detect-secrets | https://github.com/Yelp/detect-secrets | `scan`, baseline, filtros e `--no-verify` para evitar verificacao externa. |
| S3 | Bandit | https://bandit.readthedocs.io/en/latest/ | SAST Python, formato JSON e exit codes dependentes de findings/configuracao. |
| S4 | pip-audit | https://github.com/pypa/pip-audit | Auditoria de requirements, JSON e consulta a indices/advisories. |
| S5 | Semgrep CLI reference | https://semgrep.dev/docs/cli-reference | `semgrep scan`, config, JSON, metrics e exit codes. |
| S6 | npm audit | https://docs.npmjs.com/cli/commands/npm-audit | Requisito de lockfile, JSON, envio de metadados ao registry e exit code. |
| S7 | pnpm audit | https://pnpm.io/cli/audit | Auditoria da arvore pnpm, JSON e dependencia de registry. |
| S8 | OSV-Scanner V2 | https://google.github.io/osv-scanner/usage/ | `scan source`, recursao, JSON, arquivo de saida e modo offline. |
| S9 | Trivy filesystem | https://trivy.dev/docs/latest/target/filesystem/ | Scanners de vulnerabilidade, segredo e misconfiguration em filesystem. |
| S10 | Trivy misconfiguration | https://trivy.dev/docs/latest/scanner/misconfiguration/ | `trivy config`, checks IaC e necessidade de bundle/cache. |
| S11 | Trivy reporting | https://trivy.dev/docs/latest/configuration/reporting/ | JSON e arquivo de saida. |
| S12 | Grype | https://oss.anchore.com/docs/guides/vulnerability/interpreting-results/ | JSON, matching, falsos positivos e interpretacao de resultados. |
| S13 | Grype DB v5 EOL | https://oss.anchore.com/docs/announcements/grype-db-v5-eol/ | Necessidade de versao compativel com DB v6 apos 6 de marco de 2026. |
| S14 | Checkov CLI | https://www.checkov.io/2.Basics/CLI%20Command%20Reference.html | Diretorio, JSON, `--skip-download`, frameworks e exit behavior. |
| S15 | Syft output formats | https://oss.anchore.com/docs/guides/sbom/formats/ | CycloneDX JSON, SPDX JSON e multiplas saidas em uma execucao. |
| S16 | CycloneDX specification | https://cyclonedx.org/specification/overview/ | Natureza e versoes do padrao SBOM; geracao concreta feita via Syft. |
| S17 | Pa11y | https://github.com/pa11y/pa11y | CLI, JSON, WCAG2AA, requisitos e exit codes. |
| S18 | Lighthouse overview | https://developer.chrome.com/docs/lighthouse/overview/ | CLI, JSON, output path e limites da auditoria automatizada. |
| S19 | Schemathesis CLI | https://schemathesis.readthedocs.io/en/stable/reference/cli/ | `st run`, schema local, `--url`, fases, determinismo, timeouts e exit codes. |
| S20 | Schemathesis checks | https://schemathesis.readthedocs.io/en/stable/reference/checks/ | Checks de conformidade de resposta e limites da geracao automatizada. |
| S21 | OWASP ZAP Baseline | https://www.zaproxy.org/docs/docker/baseline-scan/ | Spider, passive scan, JSON/HTML, tempos e diferenca para scan ativo. |
| S22 | ripgrep | https://github.com/BurntSushi/ripgrep | Busca recursiva, globs, paths e uso como triagem textual local. |

## Decisoes e incertezas

- Ferramentas que consultam registries, indices, advisories, regras ou bases exigem `ALLOW_NETWORK=1`. Consentimento de rede nao torna o envio isento de risco; proxy, telemetria, autenticacao local e politica do servico ainda precisam ser revisados.
- Semgrep usa arquivo de regras local por padrao operacional. `SEMGREP_CONFIG=auto` e permitido somente com consentimento explicito e `--metrics off`; a documentacao alerta que `auto` busca regras no Registry e pode associar metadados do projeto.
- detect-secrets usa `--no-verify` para evitar chamadas de verificacao. Isso pode aumentar falsos positivos e nao substitui revogacao/rotacao quando um segredo for confirmado.
- Trivy e Grype sem rede dependem de bases e checks previamente armazenados. Cache ausente ou desatualizado deve ser tratado como verificacao nao executada/confiabilidade reduzida, nao como aprovacao.
- O projeto Grype encerrou a publicacao da base schema v5 em 6 de marco de 2026; a versao instalada deve ser validada antes do uso. O script nao instala nem atualiza a ferramenta.
- Checkov usa `--skip-download` para evitar configuracoes externas. Isso pode omitir links, severidades ou politicas remotas documentadas pelo projeto.
- Syft gera CycloneDX e SPDX sem fixar versao de schema. Um consumidor que exija versao especifica deve fixa-la e validar compatibilidade antes de promover o comando a gate.
- Pa11y e Lighthouse automatizam apenas parte da acessibilidade. Resultado ou score nao determina conformidade WCAG 2.2 AA.
- Schemathesis executa requests gerados pelo contrato. Mesmo limitado a fases finitas e ambiente loopback, pode alterar estado; o operador deve usar dados ficticios e ambiente descartavel.
- ZAP Baseline nao executa ataques ativos, mas faz spider e analise passiva. Este baseline interno e deliberadamente mais restritivo que a documentacao do ZAP e proibe alvo externo/producao por padrao.
- O container ZAP deve existir localmente. O script nao faz pull automatico; tag mutavel deve ser substituida por digest validado no projeto adotante.
- Exit code nao distingue de forma uniforme finding, threshold, configuracao invalida, cache ausente e erro tecnico entre todas as ferramentas. Os resumos usam `ALERTA_OU_FALHA` e exigem triagem humana.
- Comandos e flags devem ser revalidados com a versao fixada por meio de `--help` e execucao em projeto ficticio antes de uso como gate de CI/CD.
