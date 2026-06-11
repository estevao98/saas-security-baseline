# Fontes do Chunk 11

Data de acesso: **6 de junho de 2026**.

## Critério de pesquisa

Foram priorizadas fontes oficiais de OWASP, GitHub, ANPD, W3C/WAI, CycloneDX e SPDX. A política sintetiza práticas e metadados necessários sem reproduzir relatórios crus, payloads, segredos, dados pessoais ou trechos longos das fontes.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Política obrigatória de Git, `reports/raw/`, `reports/sanitized/`, dados sensíveis e limites do chunk. |
| `research/prompts.md` | Escopo original e 13 relatórios obrigatórios do Chunk 11. |
| `research/task-queue.md` | Critérios de aceite e status anterior. |
| `research/progress.md` | Continuidade e registro de execução. |
| `docs/repository-architecture.md` | Separação entre orientação, execução, evidência crua e resumo sanitizado. |
| `docs/security-roadmap.md` | Fases, owners, evidências e gestão de risco. |
| `docs/audit-types.md` | Tipos de auditoria, relatórios, falsos positivos e gates. |
| `docs/audit-trigger-matrix.md` | Gatilhos, reviewers e decisões Go/No-Go. |
| `docs/security-tools-catalog.md` | Ferramentas, formatos, riscos de exposição e caminhos de saída. |
| `docs/github-actions-strategy.md` | Permissões, logs, artifacts, SARIF e retenção em CI/CD. |
| `docs/security-tools-catalog.md` | Riscos de aplicações web/backend, configurações, logs, tenants e dados restritos. |
| `docs/lgpd-privacy-program.md` | Minimização, retenção, titulares, fornecedores, incidentes e evidências. |
| `docs/accessibility-program.md` | Prints, vídeos, relatos, tecnologia assistiva e testes com usuários. |

## Fontes oficiais

| ID | Fonte | URL | Uso |
|---|---|---|---|
| S1 | OWASP Logging Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html | Exclusão/mascaramento de tokens, sessões, senhas, chaves, dados pessoais e strings de conexão; proteção e descarte de logs. |
| S2 | OWASP Secrets Management Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html | Menor privilégio, ciclo de vida, rotação, revogação, resposta rápida e remoção de segredos de código/logs. |
| S3 | GitHub Docs - Store and share data with workflow artifacts | https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts | Upload/download de artifacts e limite de `retention-days` pela configuração superior. |
| S4 | GitHub Docs - Managing GitHub Actions settings for a repository | https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository | Retenção padrão de 90 dias; faixa de 1–400 dias para repositório privado; aplicação apenas a novos logs/artifacts. |
| S5 | GitHub Docs - REST API endpoints for Actions artifacts | https://docs.github.com/en/rest/actions/artifacts?apiVersion=2022-11-28 | Leitura/download e efeito das permissões de repositório privado sobre artifacts. |
| S6 | GitHub Docs - Uploading a SARIF file to GitHub | https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/uploading-a-sarif-file-to-github | Upload de SARIF, permissões e dependência de GitHub Code Security em repositórios privados/internos. |
| S7 | GitHub Docs - SARIF support for code scanning | https://docs.github.com/en/code-security/reference/code-scanning/sarif-support-for-code-scanning | Paths, propriedades e limites de ingestão de SARIF. |
| S8 | GitHub Docs - About secret scanning | https://docs.github.com/code-security/secret-scanning/introduction/about-secret-scanning | Superfícies verificadas, alertas, histórico e remediação de segredos. |
| S9 | GitHub Docs - Resolving alerts from secret scanning | https://docs.github.com/en/code-security/how-tos/manage-security-alerts/manage-secret-scanning-alerts/resolving-alerts | Tratar segredo commitado como comprometido, rotacionar e justificar fechamento de alertas. |
| S10 | GitHub Docs - Removing sensitive data from a repository | https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository | Revogar/rotacionar antes de remover conteúdo e riscos operacionais de reescrever histórico. |
| S11 | GitHub Docs - About repository security advisories | https://docs.github.com/en/code-security/security-advisories/working-with-repository-security-advisories/about-repository-security-advisories | Discussão/correção privada e divulgação coordenada; disponibilidade documentada para repositórios públicos. |
| S12 | ANPD - Regulamento de Comunicação de Incidente de Segurança | https://www.gov.br/anpd/pt-br/assuntos/noticias/anpd-aprova-o-regulamento-de-comunicacao-de-incidente-de-seguranca | Resolução CD/ANPD nº 15/2024 e retenção mínima de cinco anos para registros de incidentes com dados pessoais. |
| S13 | ANPD - Comunicação de Incidente de Segurança | https://www.gov.br/anpd/pt-br/assuntos/comunicacao-de-incidentes-de-seguranca-cis | Procedimento vigente, comunicação, risco/dano relevante, sigilo comercial e responsabilidades de controlador/operador. |
| S14 | CycloneDX - Software Bill of Materials | https://cyclonedx.org/capabilities/sbom/ | Inventário de componentes, serviços, versões, dependências e relações para supply chain. |
| S15 | SPDX - Overview | https://spdx.dev/about/overview/ | Padrão aberto para comunicar SBOM, proveniência, licenças, segurança e dados relacionados. |
| S16 | W3C WAI - Involving Users in Evaluating Web Accessibility | https://www.w3.org/WAI/test-evaluate/involving-users/ | Testes com pessoas, escopo, parâmetros, limites de generalização e combinação com avaliação de conformidade. |

## Decisões e incertezas

- As retenções de 7, 30, 90, 365 dias e dois anos são baselines operacionais recomendados, não prazos legais universais.
- A retenção mínima de cinco anos foi afirmada somente para registro de incidentes de segurança com dados pessoais, conforme Resolução CD/ANPD nº 15/2024. Obrigações adicionais podem exigir prazo maior.
- O padrão atual do GitHub Actions é 90 dias; repositórios privados permitem configuração entre 1 e 400 dias, limitada por organização ou enterprise. A configuração deve ser reconfirmada no repositório antes de auditoria formal.
- Artifacts de repositório privado não foram tratados como canal nominal: acesso de leitura ao repositório pode permitir acesso aos artifacts conforme permissões e token.
- Code scanning/SARIF e secret scanning dependem de plano, licenciamento, visibilidade e configuração. A política não presume que estejam habilitados.
- A documentação do GitHub consultada apresenta repository security advisories e private vulnerability reporting para repositórios públicos. Vulnerabilidades deste repositório privado devem usar canal restrito próprio, salvo validação futura de capacidade diferente no plano adotado.
- CycloneDX e SPDX descrevem transparência e intercâmbio de supply chain, mas isso não torna todo SBOM automaticamente público. A sensibilidade depende dos componentes, serviços, versões e relações incluídos.
- Pseudonimização, anonimização, base legal, retenção definitiva e comunicação externa dependem do contexto e requerem validação de Privacidade/Jurídico quando aplicável.
- Não foram criados workflows, scripts, templates completos, relatórios crus ou exemplos de credenciais. Nenhum outro chunk foi executado.
