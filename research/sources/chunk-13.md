# Fontes do Chunk 13

Data de acesso: **7 de junho de 2026**.

## Critério de pesquisa

Foram priorizadas fontes primárias de CISA, FIRST, CERT/CC, OWASP e NIST. O documento diferencia severidade técnica, probabilidade de exploração, risco contextual e decisão operacional. Nenhuma métrica foi tratada como SLA, obrigação regulatória ou decisor automático.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Regras de fontes, evidências, dados sensíveis, arquivos e atualização do chunk. |
| `research/prompts.md` | Escopo original do Chunk 13. |
| `research/task-queue.md` | Critérios de aceite e status anterior. |
| `research/progress.md` | Continuidade e registro da execução. |
| `docs/repository-architecture.md` | Função de `risk/`, issues, relatórios e separação de evidências. |
| `docs/standards-and-frameworks-matrix.md` | Referências e limites de normas/frameworks já pesquisados. |
| `docs/security-roadmap.md` | Fases, apetite, gates, owners e maturidade. |
| `docs/audit-types.md` | Tipos de findings, falsos positivos e bloqueios. |
| `docs/audit-trigger-matrix.md` | Gatilhos, revisores e decisões Go/No-Go. |
| `docs/security-tools-catalog.md` | Scanners, limites, formatos e triagem. |
| `docs/github-actions-strategy.md` | Gates de CI/CD por severidade, exceções e artifacts. |
| `docs/security-tools-catalog.md` | Autorização, SQL/ORM, APIs, tenants, secrets e bloqueios de backend. |
| `docs/lgpd-privacy-program.md` | Risco aos titulares, incidentes, validação jurídica e gates de privacidade. |
| `docs/accessibility-program.md` | Barreiras críticas, alternativas, backlog, SLA orientativo e reteste. |
| `docs/evidence-and-reporting-policy.md` | Sanitização, issues, evidências, risco aceito, reteste e reabertura. |
| `docs/security-audit-baseline.md` | Campos de findings, riscos, remediação, decisão e relatório final. |

## Fontes oficiais e primárias

| ID | Fonte | URL | Uso |
|---|---|---|---|
| S1 | FIRST - CVSS v4.0 Specification Document | https://www.first.org/cvss/v4.0/specification-document | Grupos Base, Threat, Environmental e Supplemental; severidade técnica, vetor, contexto ambiental e limites para risco/priorização. |
| S2 | FIRST - CVSS v4.0 User Guide | https://www.first.org/cvss/v4.0/user-guide | Nomenclatura, avaliação e comunicação consistente do score/vetor. |
| S3 | CISA - Known Exploited Vulnerabilities Catalog | https://www.cisa.gov/known-exploited-vulnerabilities-catalog | Catálogo de CVEs com evidência de exploração; sinal de urgência para vulnerabilidades aplicáveis. |
| S4 | CISA - Known Exploited Vulnerabilities | https://www.cisa.gov/known-exploited-vulnerabilities | Finalidade do KEV e priorização de vulnerabilidades exploradas. |
| S5 | CISA - Stakeholder-Specific Vulnerability Categorization | https://www.cisa.gov/stakeholder-specific-vulnerability-categorization-ssvc | Modelo de decisão contextual e resultados de resposta/prioridade. |
| S6 | CERT/CC - SSVC documentation | https://certcc.github.io/SSVC/ | Árvores, pontos de decisão, versões e orientação primária do projeto SSVC. |
| S7 | CERT/CC - SSVC repository | https://github.com/CERTCC/SSVC | Artefatos e histórico oficial; necessidade de registrar versão/perfil. |
| S8 | FIRST - EPSS Model | https://www.first.org/epss/model | Probabilidade estimada de exploração de CVEs nos 30 dias seguintes e limites do modelo. |
| S9 | FIRST - EPSS User Guide | https://www.first.org/epss/user-guide | Uso de score, percentil, data e combinação com contexto/impacto. |
| S10 | OWASP - Risk Rating Methodology | https://owasp.org/www-community/OWASP_Risk_Rating_Methodology | Separação entre probabilidade e impacto, fatores técnicos/de negócio e adaptação ao contexto. |
| S11 | OWASP - Vulnerability Management Guide | https://owasp.org/www-project-vulnerability-management-guide/ | Descoberta, priorização, remediação e ciclo de gestão de vulnerabilidades. |
| S12 | OWASP ASVS | https://owasp.org/www-project-application-security-verification-standard/ | Requisitos verificáveis de segurança de aplicações e contexto de controles. |
| S13 | NIST SP 800-40 Rev. 4 | https://csrc.nist.gov/pubs/sp/800/40/r4/final | Planejamento de patch management como manutenção preventiva e redução de risco organizacional. |
| S14 | NIST SP 800-53 Rev. 5 - RA-5 | https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final | Monitoramento, análise e remediação de vulnerabilidades; consultar o catálogo oficial para uso formal. |

## Síntese das validações

- O CVSS v4.0 comunica características e severidade. A especificação orienta enriquecer Base com Threat/Environmental e considerar separadamente clientes, perdas, regulação e reputação.
- O KEV representa evidência de exploração conhecida, mas só é decisivo quando produto, versão e implantação são aplicáveis. Ausência no catálogo não significa segurança.
- SSVC é árvore de decisão, não score equivalente ao CVSS. O resultado depende do stakeholder, perfil, versão e valores dos pontos de decisão.
- EPSS estima a probabilidade de um CVE ser explorado nos 30 dias seguintes. Não mede impacto, não cobre todo achado sem CVE e não garante exploração.
- OWASP oferece metodologia adaptável de probabilidade x impacto. Seus fatores precisam ser personalizados ao SaaS e não criam fórmula ou SLA universal.
- NIST SP 800-40 Rev. 4 trata patching como redução de risco e manutenção preventiva; não estabelece os SLAs internos deste chunk.

## Decisões e incertezas

- Os SLAs de 4 horas, 24 horas, 72 horas, 15, 60 e 120 dias são objetivos internos recomendados. Devem ser ajustados por contrato, risco, incidente, capacidade, regulação e apetite aprovado.
- `P0` a `P3` são filas internas, não padrão de CVSS, CISA, OWASP ou NIST.
- A matriz qualitativa impacto x probabilidade é síntese operacional deste repositório, não fórmula oficial de uma das fontes.
- CVSS v4.0 foi usado como referência atual. Ferramentas ainda podem fornecer v3.1; versão e vetor devem ser preservados, sem comparar scores entre versões como equivalentes.
- KEV e EPSS mudam continuamente. Toda decisão deve registrar data da consulta e ser revista quando houver nova inteligência.
- As páginas CISA/CERT do SSVC podem evoluir. Perfis e árvores adotados precisam de versionamento interno antes de automação.
- Classificação de LGPD, comunicação, base legal, obrigação contratual, penalidade e aceite jurídico dependem do caso e requerem Privacidade/Jurídico.
- Severidade de acessibilidade depende da tarefa, usuários, critério aplicável e alternativa. Score agregado de ferramenta não define conformidade nem impacto.
- Não foram criados scripts, workflows, templates completos, relatórios crus, payloads, PoCs, dados pessoais ou credenciais. Nenhum outro chunk foi executado.
