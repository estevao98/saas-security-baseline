# Fontes do Chunk 10

Data de acesso: **6 de junho de 2026**.

## Critério de pesquisa

Foram priorizadas fontes oficiais do W3C/WAI, documentação oficial das ferramentas e fonte institucional brasileira para a ABNT NBR 17225. O documento principal sintetiza requisitos e práticas, sem reproduzir trechos longos de WCAG ou normas ABNT. Os comandos foram reutilizados sem alteração a partir de `docs/security-tools-catalog.md`, onde a sintaxe já havia sido validada.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Escopo, fontes prioritárias, proteção de evidências e limites de criação. |
| `research/prompts.md` | Entregáveis exclusivos do Chunk 10. |
| `research/task-queue.md` | Critérios de aceite e status anterior. |
| `research/progress.md` | Continuidade e registro de execução. |
| `docs/standards-and-frameworks-matrix.md` | Edições e incertezas já registradas para WCAG e ABNT. |
| `docs/security-roadmap.md` | Fases de maturidade, critérios de avanço e baseline WCAG 2.2 AA. |
| `docs/audit-types.md` | Escopo, frequência, limitações e evidências de auditoria de acessibilidade. |
| `docs/audit-trigger-matrix.md` | Gatilhos de avaliação e decisão Go/No-Go. |
| `docs/security-tools-catalog.md` | Única origem dos comandos de axe, Lighthouse e Pa11y usados neste chunk. |
| `docs/github-actions-strategy.md` | CI/CD, gates, relatórios e proteção de artifacts. |
| `docs/lgpd-privacy-program.md` | Minimização, dados pessoais, redaction, logs e evidências. |
| `docs/repository-architecture.md` | Separação entre `reports/raw/` e `reports/sanitized/`. |

## Fontes oficiais e institucionais

| ID | Fonte | URL | Uso |
|---|---|---|---|
| S1 | W3C - Web Content Accessibility Guidelines (WCAG) 2.2 | https://www.w3.org/TR/WCAG22/ | Recomendação de 12-12-2024, princípios, níveis, critérios A/AA/AAA, processos completos, conformidade e novos critérios 2.2. |
| S2 | W3C WAI - WCAG 2 Overview | https://www.w3.org/WAI/standards-guidelines/wcag/ | Visão geral e relação entre padrão, materiais de apoio e versões. |
| S3 | W3C WAI - Evaluating Web Accessibility Overview | https://www.w3.org/WAI/test-evaluate/ | Avaliação durante o desenvolvimento, necessidade de julgamento humano, WCAG-EM e relatórios. |
| S4 | W3C WAI - Selecting Web Accessibility Evaluation Tools | https://www.w3.org/WAI/test-evaluate/tools/selecting/ | Capacidades, limites, falsos resultados e integração de ferramentas. |
| S5 | W3C WAI - Easy Checks | https://www.w3.org/WAI/test-evaluate/easy-checks/ | Verificações iniciais de teclado, foco, contraste, zoom, headings, mídia e formulários; não é avaliação completa. |
| S6 | W3C WAI - ARIA Authoring Practices Guide | https://www.w3.org/WAI/ARIA/apg/ | Padrões de componentes, teclado, landmarks, nomes e descrições acessíveis. |
| S7 | W3C WAI - Forms Tutorial | https://www.w3.org/WAI/tutorials/forms/ | Labels, agrupamento, instruções, validação, notificações, formulários multipágina e controles customizados. |
| S8 | W3C WAI - Developing an Accessibility Statement | https://www.w3.org/WAI/planning/statements/ | Finalidade, conteúdo e limites de declaração pública. |
| S9 | W3C WAI - Accessibility Statement Generator | https://www.w3.org/WAI/planning/statements/generator/ | Status de conformidade, limitações, compatibilidade, avaliação, evidências e canal de feedback. |
| S10 | NIC.br/Ceweb.br - Lançamento Norma ABNT 17225 | https://bibliotecadigital.acervo.nic.br/entities/publication/46065bd0-b2cf-4afb-93f8-089bbf7701ef/full | Validação institucional de que a NBR 17225 foi lançada em 2025 para conteúdos e aplicações web com base na WCAG 2.2. |
| S11 | Catálogo ABNT | https://www.abntcatalogo.com.br/ | Fonte a consultar para texto autorizado, vigência, emendas, substituições e aplicação formal das normas brasileiras. |
| S12 | Deque - axe-core | https://github.com/dequelabs/axe-core | Engine de testes automatizados e limites; comando CLI validado anteriormente com a documentação do pacote separado. |
| S13 | Deque - `@axe-core/cli` | https://github.com/dequelabs/axe-core-npm/tree/develop/packages/cli | Instalação e uso do CLI `axe`. |
| S14 | Chrome Developers - Lighthouse Overview | https://developer.chrome.com/docs/lighthouse/overview/ | Auditoria de acessibilidade, execução e natureza do relatório Lighthouse. |
| S15 | Pa11y | https://github.com/pa11y/pa11y | CLI, runners, reporters e limites de contexto/estado. |

## Decisões e incertezas

- WCAG 2.2 é o alvo interno atual. A página normativa consultada identifica a Recomendação W3C de 12 de dezembro de 2024.
- O nível AA exige os critérios aplicáveis A e AA; não é uma média de scores. A tabela de prioridades do programa não substitui a avaliação do conjunto completo aplicável.
- Ferramentas automatizadas apenas auxiliam. O W3C registra que nenhuma ferramenta isolada determina conformidade e que avaliação humana qualificada é necessária.
- A ABNT NBR 17225:2025 foi validada por material institucional do NIC.br/Ceweb.br que descreve requisitos para conteúdo e aplicações web baseados na WCAG 2.2. O texto normativo integral não foi consultado nem reproduzido.
- A ABNT NBR 17060:2022 permanece referência condicional para experiência móvel. Seu status, emendas, substituição e fronteira de aplicação com a NBR 17225 devem ser reconfirmados no Catálogo ABNT antes de uso formal.
- Não foi afirmada equivalência integral entre WCAG 2.2, ISO/IEC 40500:2025, ABNT NBR 17225 e ABNT NBR 17060.
- Não foi identificada obrigação jurídica universal de certificação ou declaração pública para todo SaaS. Aplicabilidade legal, contratual, setorial e territorial requer validação própria.
- Exemplos de leitores de tela são uma matriz possível, não uma alegação de compatibilidade nem uma obrigação de cobrir todas as combinações em cada execução.
- Os comandos de axe, Lighthouse e Pa11y não foram pesquisados novamente nem ampliados: foram copiados dos comandos já validados no Chunk 6, conforme exigido pelo prompt.
- Nenhum template completo do Chunk 17, script do Chunk 16, checklist final do Chunk 15 ou workflow novo foi criado neste chunk.
