# Fontes do Chunk 9

Data de acesso: **6 de junho de 2026**.

## Critério de pesquisa

Foram usadas fontes oficiais da Presidência da República e da ANPD. O documento principal sintetiza requisitos e orientações sem reproduzir trechos longos. Guias da ANPD são orientação e devem ser lidos junto à LGPD, aos regulamentos vigentes e ao contexto concreto.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Limites de escopo, fontes, evidências e dados sensíveis. |
| `research/prompts.md` | Entregáveis exclusivos do Chunk 9. |
| `research/task-queue.md` | Critérios de aceite e status. |
| `research/progress.md` | Estado anterior e registro da execução. |
| `docs/standards-and-frameworks-matrix.md` | LGPD e referências de privacidade já validadas. |
| `docs/security-roadmap.md` | Fases, evidências e gates de maturidade. |
| `docs/audit-types.md` | Limites de automação e auditoria. |
| `docs/audit-trigger-matrix.md` | Gatilhos de PIA/RIPD, incidentes e fornecedores. |
| `docs/security-tools-catalog.md` | Limites de ferramentas para determinar conformidade. |
| `docs/github-actions-strategy.md` | Proteção de logs, artifacts e relatórios crus. |
| `docs/frappe-python-security-audit.md` | Controles Frappe, multi-tenant, logs e integrações. |
| `docs/repository-architecture.md` | Separação entre templates, evidências restritas, `reports/raw/` e `reports/sanitized/`. |

## Fontes oficiais

| ID | Fonte | URL | Uso |
|---|---|---|---|
| S1 | Lei nº 13.709/2018, LGPD | https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm | Princípios, conceitos, bases legais, término/conservação, direitos, agentes, registros, RIPD, segurança, incidentes, encarregado e transferências internacionais. |
| S2 | Direito dos Titulares | https://www.gov.br/anpd/pt-br/assuntos/titular-de-dados-1/direito-dos-titulares | Capacidades para confirmação, acesso, correção, eliminação, portabilidade, informação, revogação e decisões automatizadas. |
| S3 | Guia Orientativo para Definições dos Agentes de Tratamento e do Encarregado, versão 2.0 | https://www.gov.br/anpd/pt-br/centrais-de-conteudo/materiais-educativos-e-publicacoes/guia-orientativo-para-definicoes-dos-agentes-de-tratamento-de-dados-pessoais-e-do-encarregado | Distinção contextual entre controlador, operador, encarregado e suboperador. |
| S4 | Atuação do Encarregado pelo Tratamento de Dados Pessoais | https://www.gov.br/anpd/pt-br/assuntos/noticias/anpd-lanca-guia-sobre-atuacao-do-encarregado | Relação com a Resolução CD/ANPD nº 18/2024, canal e boas práticas do encarregado. |
| S5 | Guia de Hipóteses Legais - Legítimo Interesse | https://www.gov.br/anpd/pt-br/centrais-de-conteudo/materiais-educativos-e-publicacoes/guia_orientativo_hipoteses_legais_tratamento_de_dados_pessoais_legitimo_interesse | Teste de finalidade, necessidade, balanceamento/salvaguardas e inaplicabilidade a dados sensíveis. |
| S6 | Relatório de Impacto à Proteção de Dados Pessoais | https://www.gov.br/anpd/pt-br/canais_atendimento/agente-de-tratamento/relatorio-de-impacto-a-protecao-de-dados-pessoais-ripd | Responsabilidade do controlador, alto risco, momento, conteúdo e revisão do RIPD. |
| S7 | Comunicação de Incidente de Segurança | https://www.gov.br/anpd/pt-br/canais_atendimento/agente-de-tratamento/comunicado-de-incidente-de-seguranca-cis | Triagem, risco/dano relevante, papéis, prazo informado pela ANPD e comunicação aos titulares. |
| S8 | Resolução CD/ANPD nº 15/2024 - notícia oficial | https://www.gov.br/anpd/pt-br/assuntos/noticias/anpd-aprova-o-regulamento-de-comunicacao-de-incidente-de-seguranca | Regulamento de comunicação e registro de incidentes; a aplicação deve usar o texto consolidado vigente. |
| S9 | Transferência Internacional de Dados | https://www.gov.br/anpd/pt-br/assuntos/assuntos-internacionais/transferencia-internacional-de-dados | Resolução CD/ANPD nº 19/2024, mecanismos e análise de transferências internacionais. |
| S10 | Resolução CD/ANPD nº 19/2024 | https://www.gov.br/anpd/pt-br/acesso-a-informacao/institucional/atos-normativos/regulamentacoes_anpd/resolucao-cd-anpd-no-19-de-23-de-agosto-de-2024 | Requisitos e mecanismos para transferência internacional; página registra retificação de 2025. |
| S11 | Guia Cookies e Proteção de Dados Pessoais | https://www.gov.br/anpd/pt-br/assuntos/noticias-periodo-eleitoral/anpd-lanca-guia-orientativo-201ccookies-e-protecao-de-dados-pessoais201d | Transparência, minimização, escolhas e controle do titular em cookies. |
| S12 | Guia de Segurança da Informação para Agentes de Tratamento de Pequeno Porte | https://www.gov.br/anpd/pt-br/assuntos/noticias/anpd-publica-guia-de-seguranca-para-agentes-de-tratamento-de-pequeno-porte | Medidas administrativas e técnicas de segurança como referência prática, sem presumir enquadramento como pequeno porte. |
| S13 | Resolução CD/ANPD nº 2/2022 | https://www.gov.br/anpd/pt-br/acesso-a-informacao/institucional/atos-normativos/regulamentacoes_anpd/resolucao-cd-anpd-no-2-de-27-de-janeiro-de-2022 | Tratamento diferenciado para agentes de pequeno porte e limites de simplificação. |

## Decisões e incertezas

- A LGPD é a fonte legal principal; guias orientativos não substituem lei, regulamento, decisão da ANPD ou avaliação jurídica.
- A página do Planalto apresentou resposta técnica inconsistente durante a consulta automatizada, mas a URL oficial e o texto consolidado já estavam validados nos chunks anteriores. Não foram inferidas alterações legais além das fontes oficiais consultadas.
- “Base legal provável” na matriz é somente triagem. Cada finalidade e papel deve ser validado, especialmente em B2B, marketing, crédito, dados sensíveis, crianças/adolescentes, IA e WhatsApp.
- Legítimo interesse foi limitado a dados pessoais não sensíveis e exige teste contextual; não foi usado como autorização genérica.
- A ANPD informa que o cenário de RIPD é dinâmico. O documento recomenda RIPD para alto risco e não afirma que toda feature exige o relatório.
- A página oficial de incidentes consultada informa três dias úteis para comunicação pelo controlador à ANPD e aos titulares quando houver risco ou dano relevante, ressalvada legislação específica, e vinte dias úteis para complementação fundamentada. O caso real deve usar o texto consolidado vigente e validar o marco inicial.
- A notícia oficial da Resolução nº 15/2024 informa conservação do registro de incidentes por ao menos cinco anos. O programa evita replicar o prazo como regra isolada sem consulta ao regulamento consolidado no caso concreto.
- A Resolução CD/ANPD nº 19/2024 possui retificação indicada em 18 de agosto de 2025. Contratos e mecanismos de transferência devem usar a versão oficial consolidada.
- Dispensa ou simplificação para agente de pequeno porte não elimina princípios, direitos, segurança nem a necessidade de canal aplicável. O enquadramento deve ser confirmado.
- Portabilidade e alguns aspectos de direitos podem depender de regulamentação e contexto setorial; o programa exige capacidade técnica e validação do formato/prazo aplicável, sem inventá-los.
- Nenhum template completo do Chunk 17, script do Chunk 16 ou checklist final do Chunk 15 foi criado neste chunk.
