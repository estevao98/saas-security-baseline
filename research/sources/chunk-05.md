# Fontes do Chunk 5

Data de acesso: **6 de junho de 2026**.

## Critério de pesquisa

O documento principal deriva os gatilhos, frequências e gates do catálogo interno do Chunk 4 e do roadmap do Chunk 3. Fontes oficiais foram reconfirmadas para sustentar desenvolvimento seguro contínuo, threat modeling por ciclo de vida, incidentes, RIPD e comunicação de incidente. As frequências da matriz permanecem recomendações internas baseadas em risco, não requisitos universais atribuídos às fontes.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Regras de segurança, fontes, evidências e atualização da pesquisa. |
| `research/prompts.md` | Cenários e campos obrigatórios do Chunk 5. |
| `research/task-queue.md` | Critérios de aceite e limite de execução. |
| `research/progress.md` | Continuidade e estado dos chunks. |
| `docs/audit-types.md` | Nomes dos 23 tipos, frequências, ferramentas, evidências e gates que não podem ser contraditos. |
| `docs/security-roadmap.md` | Fases MVP seguro, SaaS vendável para empresas e SaaS maduro. |
| `docs/standards-and-frameworks-matrix.md` | Referências vigentes/recomendadas e incertezas já registradas. |
| `docs/repository-architecture.md` | Política de relatórios crus, sanitização e caminhos de evidência. |

## Fontes oficiais consultadas

| ID | Fonte oficial | Organização | URL | Uso no Chunk 5 |
|---|---|---|---|---|
| S1 | Secure Software Development Framework, NIST SP 800-218 v1.1 | NIST | https://csrc.nist.gov/pubs/sp/800/218/final | Sustentar integração de práticas de desenvolvimento seguro ao SDLC e prevenção de recorrência. Não define as periodicidades internas desta matriz. |
| S2 | Threat Modeling Project | OWASP | https://owasp.org/www-project-threat-modeling/ | Sustentar threat modeling desde design e refinamento contínuo ao longo do ciclo de vida. |
| S3 | Incident Response Recommendations and Considerations, NIST SP 800-61 Rev. 3 | NIST | https://csrc.nist.gov/pubs/sp/800/61/r3/final | Sustentar preparação, resposta, recuperação e melhoria integradas à gestão de risco. Publicação final de abril de 2025, substituindo a Rev. 2. |
| S4 | Relatório de Impacto à Proteção de Dados Pessoais | ANPD | https://www.gov.br/anpd/pt-br/canais_atendimento/agente-de-tratamento/relatorio-de-impacto-a-protecao-de-dados-pessoais-ripd | Sustentar avaliação contextual de RIPD e registrar a incerteza regulatória sobre critérios específicos. |
| S5 | Comunicação de Incidente de Segurança | ANPD | https://www.gov.br/anpd/pt-br/assuntos/comunicacao-de-incidentes-de-seguranca-cis | Sustentar triagem de incidente com dados pessoais, papéis, critérios e necessidade de validar prazos/comunicação no caso concreto. Página modificada em 19 de maio de 2026. |
| S6 | Regulamentações da ANPD | ANPD | https://www.gov.br/anpd/pt-br/acesso-a-informacao/institucional/atos-normativos/regulamentacoes_anpd/regulamentacoes-anpd | Confirmar que a Resolução CD/ANPD nº 15/2024 consta como vigente e que o catálogo registra alterações posteriores. |
| S7 | Web Security Testing Guide | OWASP | https://owasp.org/www-project-web-security-testing-guide/ | Referência de escopo para testes web, autenticação e autorização; usada por remissão ao Chunk 4. |
| S8 | Application Security Verification Standard | OWASP | https://owasp.org/www-project-application-security-verification-standard/ | Referência para requisitos verificáveis de aplicação; usada por remissão ao Chunk 4. |
| S9 | API Security Project | OWASP | https://owasp.org/www-project-api-security/ | Referência para riscos e testes específicos de APIs; usada por remissão ao Chunk 4. |
| S10 | Web Content Accessibility Guidelines 2.2 | W3C/WAI | https://www.w3.org/TR/WCAG22/ | Referência de critérios de acessibilidade; usada por remissão ao Chunk 4. |
| S11 | PCI Data Security Standard | PCI Security Standards Council | https://www.pcisecuritystandards.org/standards/pci-dss/ | Referência oficial para confirmar edição e escopo PCI aplicável antes de avaliação formal. |

## Sínteses aplicadas

- O NIST SSDF fornece práticas de alto nível integráveis a diferentes ciclos de desenvolvimento; a matriz traduz isso em gates internos por evento, sem atribuir ao NIST uma frequência mensal, trimestral ou anual universal.
- A OWASP recomenda threat modeling cedo e de forma contínua; por isso ele aparece antes de arquitetura/recurso de alto risco e em revisões periódicas.
- A resposta a incidente não termina na contenção: auditorias pós-incidente devem validar recuperação, causa, controle corrigido e prevenção de recorrência.
- A ANPD distingue vulnerabilidade de incidente confirmado e exige avaliação contextual de incidentes que envolvam dados pessoais e possam acarretar risco ou dano relevante. A matriz não presume que toda suspeita exija comunicação, mas exige ativação imediata do processo de triagem.
- Para RIPD, a orientação oficial consultada registra parâmetros transitórios e análise contextual. O documento evita declarar que todo uso de dado sensível, isoladamente, gera automaticamente RIPD ou tratamento de alto risco.

## Incertezas e limites

- O catálogo de regulamentações da ANPD informa que a Resolução CD/ANPD nº 15/2024 está vigente e registra alterações posteriores. Em incidente real, consultar o texto consolidado e assessoria competente antes de decidir conteúdo, destinatários e prazo de comunicação.
- A página de RIPD informa ausência de regulamento específico em parte da orientação consultada. Reconfirmar o estado regulatório antes de avaliação jurídica ou auditoria formal.
- A edição, o escopo e o método de validação PCI DSS devem ser confirmados no PCI SSC para a arquitetura real; nenhuma versão ou questionário foi presumido neste chunk.
- Ferramentas citadas são exemplos coerentes com `docs/audit-types.md`. O Chunk 5 não valida comandos, versões, licenças ou configuração, reservados ao Chunk 6.
- O documento não reproduz normas ISO/ABNT e não faz declaração de conformidade, certificação ou parecer jurídico.
