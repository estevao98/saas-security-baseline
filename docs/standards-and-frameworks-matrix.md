# Matriz de normas, frameworks e referências

## Objetivo e critérios

Esta matriz orienta o baseline interno de auditoria e governança para SaaS. Não substitui a leitura licenciada das normas, avaliação jurídica nem auditoria de certificação.

Edições internacionais foram verificadas em fontes oficiais até **6 de junho de 2026**. Para normas `ABNT NBR`, a equivalência e a vigência da edição brasileira devem ser confirmadas no [Catálogo ABNT](https://www.abntcatalogo.com.br/) antes de contratos, declarações de conformidade ou certificação. A ausência de metadados públicos completos impede afirmar que toda adoção brasileira tenha a mesma edição da ISO.

**Fases:** `MVP` = MVP seguro; `Empresa` = SaaS vendável para empresas; `Maduro` = SaaS maduro. “Obrigatório interno” é uma decisão deste baseline, não uma obrigação legal universal. Caminhos em `Documentos` podem ser existentes ou planejados.

## Segurança da informação, risco e controles

| Norma/framework | Edição vigente ou recomendada | Fonte oficial | Objetivo e aplicação prática em SaaS | Fase | Documentos | Ferramentas | Referência interna | Certificação formal | Observações e incertezas |
|---|---|---|---|---|---|---|---|---|---|
| ABNT NBR ISO/IEC 27001 | ISO/IEC 27001:2022 + Amd 1:2024 | [ISO](https://www.iso.org/standard/27001.html) / [ABNT](https://www.abntcatalogo.com.br/) | Requisitos de SGSI; definir escopo, papéis, riscos, controles, auditorias e melhoria. | MVP | `docs/security-roadmap.md`; `risk/`; `policies/` | GRC, inventário, SIEM | **Obrigatório interno** como estrutura proporcional. | Quando clientes, contratos ou mercado exigirem evidência independente. | Confirmar designação e emendas da edição ABNT adquirida. |
| ABNT NBR ISO/IEC 27002 | ISO/IEC 27002:2022 | [ISO](https://www.iso.org/standard/75652.html) / [ABNT](https://www.abntcatalogo.com.br/) | Orientação de controles; manter catálogo, responsáveis, evidências e aplicabilidade. | MVP | `checklists/`; `docs/security-audit-baseline.md` | IAM, EDR, SIEM, scanners | **Obrigatório interno** como catálogo selecionado por risco. | Não é normalmente certificada isoladamente; apoia 27001. | Não converter todos os controles em obrigações indiscriminadas. |
| ABNT NBR ISO/IEC 27005 | ISO/IEC 27005:2022 | [ISO](https://www.iso.org/standard/80585.html) / [ABNT](https://www.abntcatalogo.com.br/) | Gestão de riscos; padronizar identificação, análise, tratamento, aceite e monitoramento. | MVP | `risk/risk-register.csv`; `risk/risk-matrix.md` | GRC, issue tracker | **Obrigatório interno** para método de risco. | Não possui certificação independente usual. | Escalas e apetite são definidos pela organização. |
| ABNT NBR ISO/IEC 27017 | ISO/IEC 27017:2015, confirmada em 2024 | [ISO](https://www.iso.org/standard/43757.html) / [ABNT](https://www.abntcatalogo.com.br/) | Controles cloud; responsabilidade compartilhada, administração, isolamento e configuração. | Empresa | `docs/cloud-security-checklist.md`; `risk/` | CSPM, IaC scanners, logs cloud | **Desejável** desde o MVP; formalizar em Empresa. | Em geral avaliada como extensão do SGSI. | Confirmar edição ABNT e esquema do certificador. |
| ABNT NBR ISO/IEC 27018 | ISO/IEC 27018:2025 | [ISO](https://www.iso.org/standard/27018) / [ABNT](https://www.abntcatalogo.com.br/) | Proteção de PII em nuvem pública; reger tratamento, exclusão, transparência e suboperadores. | Empresa | `privacy/`; `docs/lgpd-privacy-program.md` | DLP, KMS, inventário de dados | **Desejável** para dados pessoais em cloud pública. | Usualmente evidenciada com 27001 e escopo cloud. | Substituiu 2019; confirmar adoção ABNT. |
| ABNT NBR ISO/IEC 27035 | Família; partes 1 e 2:2023, outras com ciclos próprios | [ISO](https://www.iso.org/search.html?q=ISO%2FIEC%2027035) / [ABNT](https://www.abntcatalogo.com.br/) | Gestão de incidentes; triagem, resposta, comunicação, evidências e lições aprendidas. | Empresa | `docs/incident-response-plan.md`; `incident-response/` | SIEM, SOAR, ticketing | **Obrigatório interno** como processo proporcional. | Não é certificação autônoma usual. | Validar parte e edição antes de citar requisito específico. |
| ABNT NBR ISO/IEC 27036 | Partes vigentes incluem 1:2021, 2:2022 e 3:2023 | [ISO](https://www.iso.org/search.html?q=ISO%2FIEC%2027036) / [ABNT](https://www.abntcatalogo.com.br/) | Segurança de fornecedores e cadeia; due diligence, cláusulas, monitoramento e encerramento. | Empresa | `risk/`; templates de fornecedor; `policies/` | SCA, SBOM, TPRM | **Desejável**; obrigatório para terceiros críticos. | Não certificável isoladamente. | Família multiparte; validar a parte 4 antes do uso. |
| ABNT NBR ISO/IEC 27034 | Família; parte 1 publicada em 2011 | [ISO](https://www.iso.org/search.html?q=ISO%2FIEC%2027034) / [ABNT](https://www.abntcatalogo.com.br/) | Integrar segurança ao ciclo de vida de aplicações, controles e validação. | Maduro | `appsec/`; `docs/threat-model.md`; `checklists/owasp-asvs.md` | SAST, DAST, SCA | **Melhoria futura**; ASVS atende o início. | Não certificável isoladamente. | Partes têm situações distintas; confirmar vigência individual. |

## Privacidade e proteção de dados

| Norma/framework | Edição vigente ou recomendada | Fonte oficial | Objetivo e aplicação prática em SaaS | Fase | Documentos | Ferramentas | Referência interna | Certificação formal | Observações e incertezas |
|---|---|---|---|---|---|---|---|---|---|
| LGPD | Lei nº 13.709/2018, com alterações | [Planalto](https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm) / [ANPD](https://www.gov.br/anpd/pt-br) | Regular tratamento; mapear bases legais, direitos, contratos, segurança, retenção e incidentes. | MVP | `docs/lgpd-privacy-program.md`; `privacy/` | RoPA, workflow de direitos, DLP | **Obrigatório legal quando aplicável**. | Não há certificação oficial equivalente à conformidade LGPD. | Exige análise jurídica e regulamentos atuais da ANPD. |
| ABNT NBR ISO/IEC 27701 | ISO/IEC 27701:2025 | [ISO](https://www.iso.org/standard/85819.html) / [ABNT](https://www.abntcatalogo.com.br/) | Sistema de gestão de privacidade; organizar governança, riscos, controles e evidências. | Empresa | `privacy/`; `compliance/` | GRC, RoPA, DPIA | **Desejável** como PIMS; não substitui LGPD. | Quando houver demanda empresarial ou valor de garantia independente. | Confirmar adoção ABNT e transição da edição 2025. |
| ABNT NBR ISO/IEC 29100 | ISO/IEC 29100:2024 | [ISO](https://www.iso.org/search.html?q=ISO%2FIEC%2029100) / [ABNT](https://www.abntcatalogo.com.br/) | Framework, terminologia e princípios de privacidade para privacy by design. | MVP | `privacy/`; `docs/lgpd-privacy-program.md` | Descoberta e modelagem de dados | **Obrigatório interno** como referência conceitual. | Não certificável. | Não presumir equivalência entre princípios e obrigações legais. |
| ABNT NBR ISO/IEC 29134 | ISO/IEC 29134:2023 | [ISO](https://www.iso.org/search.html?q=ISO%2FIEC%2029134) / [ABNT](https://www.abntcatalogo.com.br/) | Avaliação de impacto; padronizar gatilhos, riscos, medidas e aprovação de RIPD/DPIA. | Empresa | `privacy/`; template de RIPD | RoPA, GRC, diagramas | **Desejável**; interno para alto risco. | Não certificável. | Observar também orientações vigentes da ANPD. |

## Qualidade, ciclo de vida, testes e operação

| Norma/framework | Edição vigente ou recomendada | Fonte oficial | Objetivo e aplicação prática em SaaS | Fase | Documentos | Ferramentas | Referência interna | Certificação formal | Observações e incertezas |
|---|---|---|---|---|---|---|---|---|---|
| ABNT NBR ISO/IEC/IEEE 12207 | ISO/IEC/IEEE 12207:2026 | [ISO](https://www.iso.org/standard/90219.html) / [ABNT](https://www.abntcatalogo.com.br/) | Processos do ciclo de vida: aquisição, desenvolvimento, operação, manutenção e descarte. | Maduro | `testing/`; `devsecops/` | ALM, CI/CD, issue tracker | **Melhoria futura**, com adaptação proporcional. | Não é certificação usual de sistema de gestão. | Publicada em 29-04-2026 e substitui 2017; confirmar adoção ABNT. |
| ABNT NBR ISO/IEC 25010 | ISO/IEC 25010:2023 | [ISO](https://www.iso.org/standard/78176.html) / [ABNT](https://www.abntcatalogo.com.br/) | Modelo de qualidade; traduzir atributos em requisitos, aceite e métricas. | Maduro | `testing/`; requisitos | Testes, APM, quality gates | **Desejável**. | Não certificável isoladamente. | Consultar outras partes SQuaRE para medição. |
| ABNT NBR ISO/IEC/IEEE 29119 | Série; parte 1:2022 e partes 2, 3 e 4:2021 | [ISO](https://www.iso.org/search.html?q=ISO%2FIEC%2FIEEE%2029119) / [ABNT](https://www.abntcatalogo.com.br/) | Conceitos, processos, documentação e técnicas de teste. | Maduro | `testing/`; `checklists/pre-deploy.md` | Frameworks de teste, coverage, CI | **Desejável**, adaptada ao ágil. | Não certificável isoladamente. | Selecionar partes aplicáveis e confirmar equivalentes ABNT. |
| ABNT NBR ISO/IEC 20000-1 | ISO/IEC 20000-1:2018 + Amd 1:2024 | [ISO](https://www.iso.org/standard/70636.html) / [ABNT](https://www.abntcatalogo.com.br/) | Gestão de serviços; catálogo, SLA, incidentes, mudanças, capacidade e fornecedores. | Empresa | operação; SLA | ITSM, observabilidade | **Desejável** para operação B2B. | Com escala ou exigência contratual. | Confirmar emenda e edição ABNT. |
| ABNT NBR ISO 22301 | ISO 22301:2019 + Amd 1:2024 | [ISO](https://www.iso.org/standard/75106.html) / [ABNT](https://www.abntcatalogo.com.br/) | Continuidade; BIA, estratégias, planos, testes e recuperação. | Empresa | `docs/business-continuity-plan.md` | Backup, DR, monitoramento | **Desejável**; mínimo de continuidade é interno. | Para serviços críticos, contratos ou mercado regulado. | RTO/RPO derivam da análise de negócio. |
| ABNT NBR ISO 31000 | ISO 31000:2018 | [ISO](https://www.iso.org/standard/65694.html) / [ABNT](https://www.abntcatalogo.com.br/) | Gestão geral de riscos estratégicos, operacionais, legais e tecnológicos. | Empresa | `risk/` | GRC, dashboards | **Desejável**, complementa 27005. | Não certificável. | Não prescreve matriz única. |
| ABNT NBR ISO 9001 | ISO 9001:2015 + Amd 1:2024 | [ISO](https://www.iso.org/standard/62085.html) / [ABNT](https://www.abntcatalogo.com.br/) | Gestão da qualidade; processos, cliente, não conformidades e melhoria. | Maduro | governança; `testing/` | QMS, analytics | **Melhoria futura**. | Quando houver valor comercial ou contratual. | Revisão futura está em desenvolvimento; não antecipar edição. |

## Vulnerabilidades e divulgação coordenada

| Norma/framework | Edição vigente ou recomendada | Fonte oficial | Objetivo e aplicação prática em SaaS | Fase | Documentos | Ferramentas | Referência interna | Certificação formal | Observações e incertezas |
|---|---|---|---|---|---|---|---|---|---|
| ABNT NBR ISO/IEC 30111 | ISO/IEC 30111:2019 | [ISO](https://www.iso.org/standard/69725.html) / [ABNT](https://www.abntcatalogo.com.br/) | Investigar, corrigir e divulgar vulnerabilidades; triagem, correção, release e retrospectiva. | Empresa | `SECURITY.md`; `appsec/` | Ticketing restrito, CVE tooling | **Desejável**; processo básico obrigatório interno. | Não certificável isoladamente. | Não versionar payloads exploráveis. |
| ABNT NBR ISO/IEC 29147 | ISO/IEC 29147:2018 | [ISO](https://www.iso.org/standard/72311.html) / [ABNT](https://www.abntcatalogo.com.br/) | Recebimento e divulgação coordenada; canal, política e comunicação segura. | Empresa | `SECURITY.md` | Caixa monitorada, advisories | **Desejável**; canal é obrigatório interno. | Não certificável. | Coordenar com 30111 e jurídico quando necessário. |

## Inteligência artificial

| Norma/framework | Edição vigente ou recomendada | Fonte oficial | Objetivo e aplicação prática em SaaS | Fase | Documentos | Ferramentas | Referência interna | Certificação formal | Observações e incertezas |
|---|---|---|---|---|---|---|---|---|---|
| ABNT NBR ISO/IEC 42001 | ISO/IEC 42001:2023 | [ISO](https://www.iso.org/standard/81230.html) / [ABNT](https://www.abntcatalogo.com.br/) | Sistema de gestão de IA; inventário, riscos, dados, impactos, monitoramento e papéis. | Maduro | `docs/ai-governance-checklist.md`; `ai-governance/` | Model registry, avaliações | **Desejável** quando IA for material. | Para portfólio relevante ou exigência externa. | Certificação não comprova correção de cada modelo. |
| ABNT NBR ISO/IEC 23894 | ISO/IEC 23894:2023 | [ISO](https://www.iso.org/standard/77304.html) / [ABNT](https://www.abntcatalogo.com.br/) | Riscos de IA: dano, viés, robustez, explicabilidade, uso indevido e drift. | Maduro | `ai-governance/`; `risk/` | Red teaming, observabilidade | **Desejável** para IA material. | Não certificável; apoia 42001. | Complementar com legislação e regras setoriais. |

## Acessibilidade

| Norma/framework | Edição vigente ou recomendada | Fonte oficial | Objetivo e aplicação prática em SaaS | Fase | Documentos | Ferramentas | Referência interna | Certificação formal | Observações e incertezas |
|---|---|---|---|---|---|---|---|---|---|
| ABNT NBR 17225 | ABNT NBR 17225:2025 | [ABNT](https://www.abntcatalogo.com.br/) / [NIC.br](https://bibliotecadigital.acervo.nic.br/entities/publication/46065bd0-b2cf-4afb-93f8-089bbf7701ef/full) | Requisitos brasileiros para conteúdo e aplicações web; incorporar ao design, código e conteúdo. | MVP | `docs/accessibility-program.md`; `docs/accessibility-audit.md` | axe-core, Lighthouse, leitores de tela | **Obrigatório interno** para web. | Não presumir certificação universal. | Texto oficial deve ser consultado por acesso autorizado. |
| ABNT NBR 17060 | ABNT NBR 17060:2022 | [ABNT](https://www.abntcatalogo.com.br/) | Acessibilidade em apps móveis nativos, híbridos, web apps e sites móveis. | MVP | programa e checklist mobile | Accessibility Scanner/Inspector | **Obrigatório interno** quando aplicável. | Verificar mecanismo formal disponível. | Edição identificada em fontes institucionais; reconfirmar status no catálogo. |
| WCAG 2.2 nível AA | Recomendação W3C de 12-12-2024; ISO/IEC 40500:2025 | [W3C](https://www.w3.org/TR/WCAG22/) | Critérios testáveis; definir aceite AA e testes automatizados e manuais. | MVP | `checklists/accessibility-wcag-22-aa.md` | axe-core, Lighthouse, Pa11y, leitores de tela | **Obrigatório interno**: A e AA aplicáveis. | W3C não certifica sites. | Automação cobre apenas parte dos critérios. |

## OWASP

| Norma/framework | Edição vigente ou recomendada | Fonte oficial | Objetivo e aplicação prática em SaaS | Fase | Documentos | Ferramentas | Referência interna | Certificação formal | Observações e incertezas |
|---|---|---|---|---|---|---|---|---|---|
| OWASP Top 10 | 2025 | [OWASP](https://owasp.org/www-project-top-ten/) | Conscientização sobre riscos web; treinamento, threat modeling e verificações iniciais. | MVP | `checklists/owasp-top-10.md`; `appsec/` | SAST, DAST, SCA | **Obrigatório interno** como taxonomia. | Não certificável pela OWASP. | Não usar como único padrão de verificação. |
| OWASP API Security Top 10 | 2023 | [OWASP](https://owasp.org/www-project-api-security/) | Riscos de APIs; autorização, recursos, inventário e integrações. | MVP | `docs/api-security-checklist.md` | DAST de API, fuzzing | **Obrigatório interno** para APIs. | Não certificável. | Complementa Top 10 e ASVS. |
| OWASP ASVS | 5.0.0 | [OWASP](https://owasp.org/www-project-application-security-verification-standard/) | Requisitos verificáveis; orientar requisitos, testes, aceite e escopo por nível. | MVP | `checklists/owasp-asvs.md` | Testes, SAST, DAST, SCA | **Obrigatório interno**; selecionar nível proporcional. | OWASP não certifica aplicações nem concede selo. | Fixar versão nos IDs, como `v5.0.0-x.y.z`. |
| OWASP SAMM | 2.0 | [OWASP SAMM](https://owaspsamm.org/guidance/quick-start-guide/) | Maturidade de software assurance; medir governança, design, implementação, verificação e operação. | Empresa | `docs/security-roadmap.md`; `devsecops/` | SAMM Toolbox | **Desejável** para roadmap anual. | Não é certificação OWASP. | Confirmar versão em cada avaliação. |
| OWASP Cheat Sheet Series | Conteúdo contínuo; registrar data | [OWASP](https://cheatsheetseries.owasp.org/) | Guias práticos de AppSec para padrões de implementação e revisão. | MVP | `appsec/`; checklists | Linters, testes, code review | **Obrigatório interno** como complemento. | Não certificável. | Conteúdo evolui continuamente. |
| OWASP Dependency-Check | Release estável corrente; fixar no CI | [OWASP](https://owasp.org/www-project-dependency-check/) | SCA; correlacionar dependências com vulnerabilidades públicas e revisar falsos positivos. | MVP | catálogo de ferramentas; CI | Dependency-Check, NVD | **Desejável**; SCA equivalente é obrigatório interno. | Não certificável. | Validar release oficial no workflow. |
| OWASP ZAP (nome histórico; projeto ZAP atual) | Release estável corrente; fixar no CI | [ZAP](https://www.zaproxy.org/) | DAST e proxy; scans passivos e testes autorizados de web/APIs. | MVP | catálogo de ferramentas; workflow ZAP | ZAP, Automation Framework | **Desejável**; DAST conforme risco. | Não certificável. | Atualmente é projeto independente; não executar ataques ativos em produção sem autorização. |

## Como usar esta matriz no repositório

1. Definir tecnologias, dados, jurisdições, clientes, fornecedores, criticidade, cloud e IA do SaaS.
2. Selecionar primeiro as referências da fase atual; obrigações legais aplicáveis não podem ser adiadas pela fase.
3. Relacionar requisito interno a política, risco, controle, evidência, responsável e revisão.
4. Aplicar proporcionalidade e justificar exclusões e controles compensatórios.
5. Fixar edição em checklists e relatórios; para conteúdo contínuo e ferramentas, registrar data e versão.
6. Manter saídas cruas em `reports/raw/`, fora do Git, e somente resumos revisados em `reports/sanitized/`.
7. Rever ISO, ABNT, ANPD, W3C e OWASP ao menos anualmente e antes de auditorias ou contratos relevantes.
8. Tratar certificação como decisão de negócio com escopo, patrocínio, benefício e manutenção definidos.

## Limitações

- Esta é uma síntese operacional e não reproduz conteúdo normativo integral.
- Legislação, regulamentos, edições ABNT e esquemas de certificação podem mudar.
- Declarações de conformidade exigem avaliação documentada e, quando necessário, parecer jurídico ou auditoria independente.
