# Fontes do Chunk 4

Data de acesso: **6 de junho de 2026**.

## Critério

Foram consultadas fontes oficiais para definir o propósito e os limites das auditorias e para citar exemplos de ferramentas. As frequências e os gates são recomendações internas baseadas em risco, não requisitos universais atribuídos às fontes. Não foram definidos comandos ou versões de ferramentas, pois isso pertence ao Chunk 6.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Regras de segurança, evidências, fontes e atualização da pesquisa. |
| `research/prompts.md` | Escopo integral e critérios do Chunk 4. |
| `research/task-queue.md` | Critérios de aceite e estado do chunk. |
| `research/progress.md` | Continuidade e limite de execução. |
| `docs/standards-and-frameworks-matrix.md` | Referências já validadas, fases e incertezas. |
| `docs/repository-architecture.md` | Caminhos de evidências e política para `reports/raw/` e `reports/sanitized/`. |
| `docs/security-roadmap.md` | Critérios de risco e maturidade que orientam frequência e bloqueio. |

## AppSec, SDLC e ferramentas

| ID | Fonte oficial | Organização | URL | Uso |
|---|---|---|---|---|
| S1 | Web Security Testing Guide | OWASP | https://owasp.org/www-project-web-security-testing-guide/ | DAST, testes web, autenticação, autorização e abordagem equilibrada de testes. A página oficial informa versão estável 4.2 e desenvolvimento da 5.0; o documento evita depender de identificadores que possam mudar. |
| S2 | Code Review Guide | OWASP | https://owasp.org/www-project-code-review-guide/ | Papel da revisão manual de código e sua complementaridade com scanners. |
| S3 | Threat Modeling | OWASP | https://owasp.org/www-community/Threat_Modeling | Objetivos, artefatos, aplicação contínua e gatilhos de atualização do threat model. |
| S4 | API Security Project | OWASP | https://owasp.org/www-project-api-security/ | Riscos próprios de APIs e referência para testes de objetos, funções, recursos e inventário. |
| S5 | Application Security Verification Standard | OWASP | https://owasp.org/www-project-application-security-verification-standard/ | Requisitos verificáveis para autenticação, sessão, autorização e outros controles de aplicação. |
| S6 | SP 800-218, Secure Software Development Framework | NIST | https://csrc.nist.gov/pubs/sp/800/218/final | Práticas de desenvolvimento seguro, proteção do ambiente, produção e resposta a vulnerabilidades. |
| S7 | About secret scanning | GitHub Docs | https://docs.github.com/code-security/secret-scanning/introduction/about-secret-scanning | Funcionamento, escopo, alertas, padrões customizados, validação e necessidade de rotação. Disponibilidade depende do tipo de repositório e plano. |
| S8 | About dependency review | GitHub Docs | https://docs.github.com/code-security/concepts/supply-chain-security/about-dependency-review | Comparação de dependências em PR, vulnerabilidades e possibilidade de enforcement. Disponibilidade depende do tipo de repositório e plano. |
| S9 | Trivy documentation | Aqua Security | https://trivy.dev/docs/latest/ | Exemplo de scanner para vulnerabilidades, misconfiguração de IaC, imagens, repositórios e segredos. |
| S10 | ZAP Automation Framework | OWASP ZAP | https://www.zaproxy.org/docs/automate/automation-framework/ | Exemplo de automação DAST, scans passivos/ativos e suporte a OpenAPI, SOAP e GraphQL. |
| S11 | SP 800-190, Application Container Security Guide | NIST | https://csrc.nist.gov/pubs/sp/800/190/final | Riscos e recomendações para imagens, registries, orquestradores, containers e hosts. |

## Privacidade e acessibilidade

| ID | Fonte oficial | Organização | URL | Uso |
|---|---|---|---|---|
| S12 | Lei nº 13.709/2018 | Presidência da República | https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm | Base legal oficial para LGPD, RIPD, segurança, prevenção e responsabilização. |
| S13 | Relatório de Impacto à Proteção de Dados Pessoais | ANPD | https://www.gov.br/anpd/pt-br/canais_atendimento/agente-de-tratamento/relatorio-de-impacto-a-protecao-de-dados-pessoais-ripd | Momento recomendado, alto risco, documentação da análise e possibilidade de requisição pela ANPD. |
| S14 | Web Content Accessibility Guidelines 2.2 | W3C/WAI | https://www.w3.org/TR/WCAG22/ | Critérios de acessibilidade e níveis de conformidade. |
| S15 | Evaluating Web Accessibility Overview | W3C/WAI | https://www.w3.org/WAI/test-evaluate/ | Combinação de avaliação inicial, ferramentas e avaliação humana; limites da automação. |

## Operação, cloud, pagamentos e IA

| ID | Fonte oficial | Organização | URL | Uso |
|---|---|---|---|---|
| S16 | SP 800-92, Guide to Computer Security Log Management | NIST | https://csrc.nist.gov/pubs/sp/800/92/final | Planejamento e operação de gestão de logs. |
| S17 | SP 800-34 Rev. 1, Contingency Planning Guide | NIST | https://csrc.nist.gov/pubs/sp/800/34/r1/upd1/final | Planejamento, recuperação, testes, exercícios e manutenção de contingência. |
| S18 | SP 800-61 Rev. 3, Incident Response Recommendations and Considerations | NIST | https://csrc.nist.gov/pubs/sp/800/61/r3/final | Preparação, detecção, resposta, recuperação e melhoria integradas ao CSF 2.0. Publicação final de abril de 2025, que substituiu a Rev. 2. |
| S19 | SP 800-144, Guidelines on Security and Privacy in Public Cloud Computing | NIST | https://csrc.nist.gov/pubs/sp/800/144/final | Riscos de segurança, privacidade, terceirização e responsabilidade em cloud pública. |
| S20 | PCI Data Security Standard (PCI DSS) | PCI Security Standards Council | https://www.pcisecuritystandards.org/standards/pci-dss/ | Público-alvo e aplicabilidade geral a entidades que armazenam, processam, transmitem dados de cartão ou podem impactar a segurança do ambiente desses dados. A edição atual deve ser consultada na biblioteca oficial antes de avaliação formal. |
| S21 | AI Risk Management Framework | NIST | https://www.nist.gov/itl/ai-risk-management-framework | Gestão voluntária de riscos de IA durante desenho, desenvolvimento, uso e avaliação. |
| S22 | NIST AI 600-1, Generative AI Profile | NIST | https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence | Riscos e ações complementares para IA generativa, vinculados ao AI RMF 1.0. |

## Incertezas e limites registrados

- O NIST AI Resource Center informa que o AI RMF 1.0 está sendo revisado. A versão deve ser reconfirmada antes de avaliação formal; o framework é voluntário e não representa certificação.
- O NIST SP 800-92 Rev. 1 localizado em https://csrc.nist.gov/pubs/sp/800/92/r1/ipd continua marcado como **Initial Public Draft**. Foi citado como referência normativa apenas o SP 800-92 final, registrando que é uma publicação antiga.
- O escopo e a forma de validação PCI variam conforme arquitetura, fluxo de dados de cartão, terceiros e programa aplicável. O Chunk 4 não declara nível, questionário ou requisito específico sem esse contexto.
- A orientação da ANPD sobre RIPD recomenda elaboração antes do tratamento de alto risco e admite requisição pela Autoridade, mas não transforma toda funcionalidade em obrigação automática de RIPD. A análise deve ser contextual.
- Ferramentas comerciais ou recursos do GitHub podem depender de licença, plano e configuração. A menção indica capacidade documentada, não disponibilidade garantida neste repositório.
- Frequências, severidades e gates são decisões internas proporcionais ao risco. Nenhuma fonte foi usada para atribuir periodicidade universal a todos os SaaS.
