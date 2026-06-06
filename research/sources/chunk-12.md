# Fontes do Chunk 12

Data de acesso: **6 de junho de 2026**.

## Criterio de pesquisa

O Chunk 12 consolida em um template preenchivel as decisoes ja aprovadas nos chunks anteriores. Nao foram introduzidas novas versoes, normas, ferramentas ou sintaxes de comandos. As fontes oficiais abaixo sao herdadas dos registros internos correspondentes e foram usadas apenas como base conceitual, sem copiar trechos longos.

## Fontes internas

| Fonte | Uso no template |
|---|---|
| `AGENTS.md` | Regras de seguranca, evidencias, Git, fontes e limites de execucao. |
| `research/prompts.md` | Campos e secoes obrigatorias do Chunk 12. |
| `research/task-queue.md` | Criterios de aceite e limite de executar somente o Chunk 12. |
| `research/progress.md` | Estado anterior e registro de conclusao. |
| `docs/repository-architecture.md` | Papel do template e separacao entre `reports/raw/` e `reports/sanitized/`. |
| `docs/standards-and-frameworks-matrix.md` | Referencias OWASP, LGPD, ISO/ABNT e incertezas de edicao. |
| `docs/security-roadmap.md` | Fases, owners, risco, evidencias e gates de maturidade. |
| `docs/audit-types.md` | Metodos, limitacoes, falsos positivos, evidencias e bloqueios. |
| `docs/audit-trigger-matrix.md` | Gatilhos, reviewers, frequencia e decisao Go/No-Go. |
| `docs/security-tools-catalog.md` | Campos de ferramenta, versao, execucao, saida e limitacoes. |
| `docs/github-actions-strategy.md` | CI/CD, permissions, logs, artifacts e gates. |
| `docs/frappe-python-security-audit.md` | Secao Frappe/Python, multi-tenant e protecao de evidencias. |
| `docs/lgpd-privacy-program.md` | Privacidade, validacao juridica, incidentes e dados pessoais. |
| `docs/accessibility-program.md` | Metodologia, gates, limitacoes e evidencias de acessibilidade. |
| `docs/evidence-and-reporting-policy.md` | Classificacao, redaction, anexos, retencao e cadeia de custodia. |

## Fontes oficiais de apoio

| ID | Fonte oficial | URL | Apoio |
|---|---|---|---|
| S1 | OWASP Application Security Verification Standard | https://owasp.org/www-project-application-security-verification-standard/ | Campo de mapeamento de requisitos e verificacao de seguranca de aplicacao. |
| S2 | OWASP Top 10 | https://owasp.org/www-project-top-ten/ | Campo de mapeamento de categorias de risco de aplicacao. |
| S3 | OWASP API Security Top 10 | https://owasp.org/www-project-api-security/ | Campo de mapeamento de riscos de APIs. |
| S4 | OWASP Web Security Testing Guide | https://owasp.org/www-project-web-security-testing-guide/ | Estrutura de escopo, testes, evidencias e limitacoes. |
| S5 | NIST Secure Software Development Framework | https://csrc.nist.gov/Projects/ssdf | Governanca de desenvolvimento seguro, verificacao e resposta a vulnerabilidades. |
| S6 | LGPD, Lei nº 13.709/2018 | https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm | Mapeamento de privacidade e necessidade de validacao contextual. |
| S7 | ANPD - Comunicacao de Incidente de Seguranca | https://www.gov.br/anpd/pt-br/assuntos/comunicacao-de-incidentes-de-seguranca-cis | Tratamento e registro de incidentes com dados pessoais. |
| S8 | W3C - Web Content Accessibility Guidelines 2.2 | https://www.w3.org/TR/WCAG22/ | Referencia de acessibilidade e declaracao de escopo/limitacoes. |
| S9 | GitHub Docs - Store and share data with workflow artifacts | https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts | Cuidados com artifacts, acesso e retencao. |
| S10 | CycloneDX - Software Bill of Materials | https://cyclonedx.org/capabilities/sbom/ | Campo de SBOM e distincao entre inventario e atestado. |
| S11 | SPDX - Overview | https://spdx.dev/about/overview/ | Formato de intercambio de informacoes de componentes e supply chain. |
| S12 | ISO - Standards catalogue | https://www.iso.org/standards.html | Consulta de normas ISO aplicaveis; edicao deve ser confirmada antes de uso formal. |
| S13 | ABNT Catalogo | https://www.abntcatalogo.com.br/ | Confirmacao da edicao brasileira antes de declaracao formal ou contratual. |

## Decisoes e incertezas

- O template nao define uma nova matriz de severidade; deve usar o metodo vigente do SaaS e, futuramente, o documento proprio do Chunk 13.
- Mapeamentos para OWASP, LGPD e ISO/ABNT indicam relacao de controle ou risco, nao conformidade integral, certificacao ou parecer juridico.
- Edicoes ABNT, versoes de ferramentas, comandos, retencao, apetite de risco, autoridade de aprovacao e gates finais dependem do contexto e devem ser confirmados na auditoria.
- Cadeia de custodia, hash, assinatura e armazenamento imutavel sao condicionais ao valor probatorio, investigativo, contratual ou regulatorio.
- O documento nao inclui dados reais, segredos, credenciais, payloads, requests/responses, logs crus ou relatorios de scanner.
- Nenhum relatorio cru, script, workflow ou template do Chunk 17 foi criado. Nenhum outro chunk foi executado.
