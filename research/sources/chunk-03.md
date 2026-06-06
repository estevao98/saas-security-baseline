# Fontes do Chunk 3

Data de acesso: **6 de junho de 2026**.

## Critério

O roadmap foi derivado da matriz validada no Chunk 1, do contexto-mestre e da arquitetura definida no Chunk 2. Foram usados links oficiais para sustentar o papel de cada referência. Não foi reproduzido texto normativo integral e não foram definidos comandos ou releases de ferramentas, pois esses itens pertencem a chunks posteriores.

## Fontes internas

| Fonte | Uso |
|---|---|
| `research/prompts.md` | Escopo e critérios obrigatórios do Chunk 3. |
| `docs/standards-and-frameworks-matrix.md` | Edições validadas, fase, aplicação, incertezas e posição sobre certificação. |
| `docs/repository-architecture.md` | Caminhos de documentos, automações e política de evidências. |
| `research/sources/chunk-01.md` | Registro de validação oficial reutilizado para evitar contradição entre chunks. |

## ISO e ABNT

| Fonte | Organização | URL oficial | Uso no roadmap |
|---|---|---|---|
| ISO/IEC 27001 | ISO | https://www.iso.org/standard/27001.html | Estrutura proporcional de gestão na Fase 1. |
| ISO/IEC 27002 | ISO | https://www.iso.org/standard/75652.html | Seleção de controles na Fase 1. |
| ISO/IEC 27005 | ISO | https://www.iso.org/standard/80585.html | Processo de gestão de riscos na Fase 1. |
| Família ISO/IEC 27000 | ISO | https://www.iso.org/search.html?q=ISO%2FIEC%2027 | Referências 27017, 27018, 27034 e 27035; famílias multipartes requerem validação da parte usada. |
| ISO/IEC 27701 | ISO | https://www.iso.org/standard/85819.html | Sistema de gestão de privacidade na Fase 2. |
| ISO/IEC 29100 | ISO | https://www.iso.org/search.html?q=ISO%2FIEC%2029100 | Framework de privacidade na Fase 1. |
| ISO/IEC 20000-1 | ISO | https://www.iso.org/standard/70636.html | Gestão de serviços, suporte e SLA na Fase 2. |
| ISO 22301 | ISO | https://www.iso.org/standard/75106.html | Continuidade na Fase 2. |
| ISO/IEC/IEEE 12207 | ISO | https://www.iso.org/standard/90219.html | Ciclo de vida na Fase 3. |
| ISO/IEC 25010 | ISO | https://www.iso.org/standard/78176.html | Modelo de qualidade na Fase 3. |
| ISO/IEC/IEEE 29119 | ISO | https://www.iso.org/search.html?q=ISO%2FIEC%2FIEEE%2029119 | Processos e técnicas de teste na Fase 3. |
| ISO/IEC 30111 e 29147 | ISO | https://www.iso.org/search.html?q=ISO%2FIEC%2030111%2029147 | Tratamento e divulgação coordenada de vulnerabilidades. |
| ISO/IEC 42001 | ISO | https://www.iso.org/standard/81230.html | Sistema de gestão de IA, apenas quando IA for material. |
| ISO/IEC 23894 | ISO | https://www.iso.org/standard/77304.html | Gestão de riscos de IA, apenas quando aplicável. |
| Catálogo ABNT | ABNT | https://www.abntcatalogo.com.br/ | Confirmação de designação, vigência, adoção brasileira e emendas antes de uso formal. |
| ABNT NBR 17225 | NIC.br | https://bibliotecadigital.acervo.nic.br/entities/publication/46065bd0-b2cf-4afb-93f8-089bbf7701ef/full | Referência institucional para acessibilidade web brasileira e relação com WCAG 2.2. |

## Lei, acessibilidade e OWASP

| Fonte | Organização | URL oficial | Uso no roadmap |
|---|---|---|---|
| Lei nº 13.709/2018 | Presidência da República | https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm | LGPD como obrigação legal quando aplicável. |
| Portal da ANPD | ANPD | https://www.gov.br/anpd/pt-br | Regulamentos e orientações de proteção de dados. |
| WCAG 2.2 | W3C/WAI | https://www.w3.org/TR/WCAG22/ | Baseline de acessibilidade A e AA aplicável. |
| OWASP Top 10 | OWASP | https://owasp.org/www-project-top-ten/ | Taxonomia inicial de riscos web. |
| OWASP API Security Top 10 | OWASP | https://owasp.org/www-project-api-security/ | Riscos prioritários de APIs. |
| OWASP ASVS | OWASP | https://owasp.org/www-project-application-security-verification-standard/ | Requisitos verificáveis e seleção proporcional de nível. |
| OWASP SAMM | OWASP | https://owaspsamm.org/guidance/quick-start-guide/ | Medição opcional de maturidade na Fase 2 e no planejamento anual. |

## Incertezas e limites

- Uma edição ISO não comprova automaticamente adoção brasileira idêntica. Confirmar a norma correspondente no Catálogo ABNT antes de citação formal, aquisição, contrato ou certificação.
- ISO/IEC 27034, 27035 e ISO/IEC/IEEE 29119 são famílias ou séries com partes e ciclos distintos; selecionar e validar somente as partes aplicáveis.
- A aplicabilidade e a vigência formal da ABNT NBR 17060 devem ser reconfirmadas no Catálogo ABNT.
- A seleção de ASVS nível 1 ou 2 depende do risco e do contexto do produto; o roadmap recomenda nível 2 para SaaS autenticado, B2B ou com dados e funções de maior impacto, sem transformar essa recomendação em requisito universal da OWASP.
- LGPD e regulamentos da ANPD exigem avaliação jurídica contextual. Normas de privacidade não substituem a lei.
- Certificação formal foi tratada como decisão de negócio e garantia independente de escopo definido, não como obrigação universal.
