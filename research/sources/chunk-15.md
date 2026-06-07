# Fontes do Chunk 15 - PRs corretivos do Lote 3

Data de acesso: **7 de junho de 2026**.

## Escopo deste registro

Este arquivo registra incrementalmente as fontes internas, fontes oficiais, decisões e incertezas dos PRs corretivos do Lote 3.

O primeiro PR foi limitado aos checklists de release:

- `checklists/pre-beta.md`;
- `checklists/pre-deploy.md`;
- `checklists/pre-enterprise-sale.md`.

O segundo PR foi limitado aos checklists OWASP e API:

- `checklists/owasp-top-10.md`;
- `checklists/owasp-asvs.md`;
- `checklists/owasp-api-top-10.md`.

O terceiro PR e limitado aos checklists de privacidade e acessibilidade:

- `checklists/lgpd.md`;
- `checklists/accessibility-wcag-22-aa.md`.

O pacote completo do Chunk 15 ainda nao foi reconciliado. `research/progress.md`, `research/task-queue.md`, indices, scripts, workflows, templates e demais checklists nao foram alterados nestes tres PRs.

## Fontes internas consultadas

| Fonte | Uso nos checklists |
|---|---|
| `AGENTS.md` | Regras de escopo, evidências, fontes, arquivos sensíveis e estilo dos checklists. |
| `README.md` | Propósito da baseline, fases de maturidade, interpretação de relatórios e limites de conformidade. |
| `research/codex-execution-plan.md` | Escopo do Lote 3, ordem por PR, critérios de aceite e proibição de reconciliar status antes do pacote completo. |
| `research/coverage-audit.md` | Confirmação de que os checklists eram placeholders e de que `research/sources/chunk-15.md` estava ausente. |
| `research/prompts.md` | Requisitos originais do Chunk 15 e categorias esperadas. |
| `research/task-queue.md` | Estado declarado e critérios históricos, consultados sem alteração. |
| `research/progress.md` | Divergência histórica do Chunk 15, consultada sem reconciliação neste PR. |
| `docs/security-roadmap.md` | Fases MVP seguro e SaaS vendável para empresas, evidências, gates e critérios de não avançar. |
| `docs/standards-and-frameworks-matrix.md` | Versões internas adotadas: OWASP Top 10:2025, API Security Top 10:2023 e ASVS 5.0.0; limites de uso e certificação. |
| `docs/audit-types.md` | Combinação de revisão manual, testes de autenticação/autorização e ferramentas como evidência parcial. |
| `docs/audit-trigger-matrix.md` | Auditorias, revisores, evidências e Go/No-Go para primeiro deploy, beta e venda empresarial. |
| `docs/security-tools-catalog.md` | Limites e riscos de SAST, DAST, SCA, testes de API, logs e relatórios automatizados. |
| `docs/evidence-and-reporting-policy.md` | Classificação, redaction, `reports/raw/`, `reports/sanitized/`, compartilhamento e retenção contextual. |
| `docs/security-audit-baseline.md` | Estrutura de evidência, findings, risco, reteste e critérios de decisão. |
| `docs/git-security-workflow.md` | Gates de release, revisão independente, IDs opacos e proibição de evidência crua em Git, issues e PRs. |
| `risk/severity-and-prioritization.md` | Severidade, aceite, reteste e condições de bloqueio de release. |
| `checklists/index.md` | Contexto do conjunto de checklists; permaneceu inalterado por pertencer à reconciliação posterior. |
| `docs/lgpd-privacy-program.md` | Ciclo de vida, papeis, bases legais, direitos, fornecedores, RIPD, incidentes, privacy by design e limites de orientacao juridica. |
| `docs/accessibility-program.md` | WCAG 2.2 AA, processos completos, avaliacao manual, tecnologias assistivas, limites da automacao, evidencias e gates. |

## Fontes oficiais

| Fonte oficial | Versão/estado confirmado em 7 de junho de 2026 | Uso neste PR |
|---|---|---|
| [OWASP Top Ten Web Application Security Risks](https://owasp.org/www-project-top-ten/) | A página oficial informa o OWASP Top 10:2025 como versão publicada mais atual. | Nomes e ordem das dez categorias; uso como documento de conscientização e taxonomia inicial, não como padrão completo de verificação. |
| [OWASP Top 10:2025 - Introduction](https://owasp.org/Top10/2025/0x00_2025-Introduction/) | Lista oficial A01:2025 a A10:2025. | Estrutura do checklist web, incluindo supply chain e tratamento de condições excepcionais. |
| [OWASP API Security Top 10:2023](https://owasp.org/API-Security/editions/2023/en/0x00-header/) | Edição estável publicada de 2023. | Nomes e ordem de API1:2023 a API10:2023. |
| [OWASP API Security Project](https://owasp.org/www-project-api-security/) | Projeto oficial mantém 2023 como versão estável publicada. | Limite de escopo e aplicação a APIs públicas, internas e de parceiros. |
| [OWASP Application Security Verification Standard](https://owasp.org/www-project-application-security-verification-standard/) | Versão estável mais recente indicada: ASVS 5.0.0, publicada em 30 de maio de 2025. | Finalidade do ASVS, uso de requisitos verificáveis e formato recomendado de IDs versionados `v5.0.0-x.y.z`. |
| [Repositório oficial OWASP ASVS - tag v5.0.0](https://github.com/OWASP/ASVS/tree/v5.0.0/5.0/en) | Estrutura publicada da versão 5.0.0. | Confirmação dos capítulos V1 a V17 usados para organizar o checklist de adoção. |
| [Lei nº 13.709/2018 - LGPD](https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm) | Texto legal oficial; a aplicacao ao caso concreto deve ser validada. | Principios, direitos, agentes, seguranca, RIPD, incidentes e prestacao de contas, sem reproduzir trechos longos ou escolher hipotese legal. |
| [ANPD - Titular de Dados](https://www.gov.br/anpd/pt-br/assuntos/titular-de-dados-1/titular-de-dados) | Pagina institucional consultada em 7 de junho de 2026. | Distincao geral entre controlador e operador e responsabilidade pelo atendimento de direitos. |
| [ANPD - Direito dos Titulares](https://www.gov.br/anpd/pt-br/assuntos/titular-de-dados-1/direito-dos-titulares) | Orientacao institucional consultada em 7 de junho de 2026. | Capacidades operacionais de informacao, confirmacao, acesso, correcao e demais direitos, sujeitas ao contexto e ao texto vigente. |
| [ANPD - Relatorio de Impacto a Protecao de Dados Pessoais](https://www.gov.br/anpd/pt-br/canais_atendimento/agente-de-tratamento/relatorio-de-impacto-a-protecao-de-dados-pessoais-ripd) | Perguntas e respostas oficiais; a propria pagina alerta que o cenario normativo e dinamico. | Decisao contextual sobre RIPD, elaboracao preferencial antes do tratamento de alto risco, conteudo minimo e revisao continua. |
| [ANPD - Comunicacao de Incidente de Seguranca](https://www.gov.br/anpd/pt-br/assuntos/comunicacao-de-incidentes-de-seguranca-cis) | Procedimento oficial vigente consultado em 7 de junho de 2026, relacionado a Resolucao CD/ANPD nº 15/2024. | Capacidade de avaliar risco ou dano relevante, comunicar quando aplicavel e manter registros restritos. |
| [ANPD - Transferencia Internacional de Dados](https://www.gov.br/anpd/pt-br/assuntos/assuntos-internacionais/transferencia-internacional-de-dados) | Pagina institucional sobre a Resolucao CD/ANPD nº 19/2024. | Inventario de regioes, acessos e suboperadores e validacao do mecanismo aplicavel, sem presumir adequacao automatica. |
| [WCAG 2.2 - W3C Recommendation](https://www.w3.org/TR/WCAG22/) | Recomendacao W3C; historico oficial registra a versao de 12 de dezembro de 2024. | Criterios A e AA, requisitos de conformidade, paginas completas e processos completos. |
| [W3C WAI - Evaluating Web Accessibility](https://www.w3.org/WAI/test-evaluate/) | Orientacao oficial consultada em 7 de junho de 2026. | Ferramenta isolada nao determina atendimento ao padrao; avaliacao humana competente e necessaria. |
| [W3C - Understanding ACT Rules](https://www.w3.org/WAI/WCAG22/Understanding/understanding-act-rules) | Documento informativo oficial. | Testes automaticos sao verificacoes parciais; passar uma regra nao demonstra satisfacao integral do criterio relacionado. |
| [W3C - How to refer to WCAG 2.2](https://www.w3.org/WAI/WCAG22/Understanding/refer-to-wcag) | Orientacao oficial consultada em 7 de junho de 2026. | Nivel AA implica todos os criterios A e AA aplicaveis; subconjunto prioritario nao deve ser chamado de conformidade AA. |

As fontes oficiais herdadas dos demais domínios permanecem nos registros anteriores de `research/sources/`. Nenhuma referência foi convertida em obrigação universal, prova automática de segurança ou certificação.

## Decisões deste PR

- Os três arquivos foram tratados como gates diferentes, não como duplicações: beta considera usuários reais e isolamento; deploy considera promoção técnica, migração e rollback; venda empresarial considera compromissos, due diligence e capacidade operacional.
- Todos os itens permanecem desmarcados para evitar aparência de avaliação de produto real.
- Itens não aplicáveis exigem justificativa e revisão; check obrigatório não executado não equivale a aprovação.
- Evidências são descritas por conteúdo mínimo e IDs opacos. Material real deve permanecer em sistema restrito.
- Os critérios de bloqueio foram alinhados à matriz interna: segredo exposto, autenticação/autorização quebrada, acesso entre tenants, finding crítico/alto bloqueante, gate obrigatório ausente, incidente ativo e recuperação insuficiente conforme o cenário.
- Certificação formal aparece apenas como melhoria futura condicionada a objetivo, escopo e validação próprios.
- RTO, RPO, SLA, SBOM, DAST, controles cloud e avaliações independentes são aplicados conforme risco, arquitetura ou compromisso; sua simples presença não prova segurança ou conformidade.
- Este PR cria o registro incremental de fontes do Chunk 15, mas não declara o chunk concluído.

### Decisões do segundo PR - OWASP e API

- O OWASP Top 10:2025 foi tratado como taxonomia de triagem. Cada categoria recebeu verificações práticas para SaaS, mas o checklist direciona requisitos verificáveis e maior profundidade ao ASVS.
- O checklist ASVS fixa a versão 5.0.0 e exige IDs no formato `v5.0.0-x.y.z` na matriz formal. O arquivo não reproduz a lista integral do padrão e não permite alegar conformidade por simples marcação.
- A seleção de nível ASVS permanece proporcional ao risco. Nível 2 é referência interna a avaliar para SaaS autenticado, B2B, com dados pessoais, pagamentos ou funções administrativas; isso não foi apresentado como obrigação universal da OWASP.
- O checklist ASVS foi organizado pelos capítulos da versão 5.0.0 e exige avaliação requisito a requisito no conjunto oficial selecionado, incluindo justificativa para não aplicabilidade.
- O OWASP API Security Top 10:2023 foi aplicado a APIs públicas, de parceiros, mobile, internas e administrativas. Ocultação, rede interna ou gateway não substituem autenticação e autorização.
- Autorização por objeto, propriedade e função foi separada, com testes explícitos de isolamento multi-tenant e negação segura.
- Abuso de fluxos de negócio, consumo de recursos, inventário, SSRF e consumo de APIs de terceiros foram tratados como controles de desenho e operação, não apenas como achados de scanner.
- Testes de API ativos só são admitidos em escopo autorizado, preferencialmente efêmero e com dados fictícios; nenhum request, response, payload ou PoC foi incluído.
- Critérios de bloqueio foram alinhados a `risk/severity-and-prioritization.md`: quebra de autenticação/autorização/tenant, segredo exposto, integridade de build comprometida, finding crítico ou alto bloqueante, gate ausente e incidente ativo.
- Os três checklists exigem evidência mínima, revisão humana, IDs opacos, tratamento de findings e reteste. Resultado automatizado isolado não aprova categoria nem requisito.

### Decisoes do terceiro PR - LGPD e acessibilidade

- O checklist LGPD foi estruturado como verificacao tecnica, operacional e de governanca. Ele nao produz parecer juridico, nao escolhe base legal e exige validacao competente para papeis, hipoteses legais, direitos, contratos, transferencias, RIPD e incidentes.
- Hipoteses legais candidatas devem ser registradas por finalidade e avaliadas a partir dos fatos. Consentimento e legitimo interesse receberam controles condicionais, sem serem recomendados automaticamente.
- O RIPD nao foi tratado como obrigatorio para todo tratamento. O checklist exige decisao documentada do controlador e elaboracao ou revisao quando o contexto e a orientacao aplicavel indicarem alto risco ou outra hipotese pertinente.
- Direitos dos titulares foram convertidos em capacidades de produto e operacao, incluindo identificacao proporcional, busca por tenant, resposta segura e prevencao de exposicao de terceiros.
- Fornecedores, suboperadores, suporte remoto e regioes cloud foram incluidos no inventario, mas transferencia internacional e mecanismo valido dependem de caracterizacao e revisao juridica.
- Incidentes exigem capacidade de avaliar risco ou dano relevante e acionar o procedimento vigente. Prazos e decisoes concretas devem ser reconfirmados no evento; o checklist nao automatiza comunicacao.
- O checklist WCAG usa como alvo todos os criterios A e AA aplicaveis da WCAG 2.2. A lista de temas e controles praticos nao substitui uma matriz criterio a criterio.
- Conformidade nao pode ser inferida de score, scanner, pagina isolada ou componente isolado. Foram exigidos avaliacao humana, teclado, tecnologia assistiva, paginas completas e processos completos.
- Automacao foi tratada como verificacao parcial para detectar algumas falhas. Resultado sem achados nao aprova criterio nem o escopo.
- Barreiras em fluxos criticos sem alternativa equivalente bloqueiam release. Excecao exige alternativa acessivel efetiva, risco, owner, aprovacao e expiracao; score alto nao compensa bloqueio funcional.
- Evidencias de acessibilidade receberam protecao especifica porque prints, voz, relatos e tecnologia assistiva podem identificar pessoas ou revelar informacao sensivel.
- Todos os itens permanecem desmarcados. A conclusao permitida e apenas `aprovado para o escopo avaliado`, nunca conformidade automatica com LGPD ou WCAG.

## Incertezas e validações contextuais

- Requisitos jurídicos, LGPD, comunicação de incidentes, papéis de tratamento, transferências e cláusulas contratuais dependem dos fatos e exigem revisão competente.
- Requisitos enterprise variam por cliente, setor, região, contrato, criticidade e dados tratados.
- Acessibilidade exige avaliação humana; automação isolada não comprova conformidade.
- Ferramentas, versões, comandos, ambientes, retenção, frequência e thresholds devem ser definidos e validados no produto consumidor.
- Recursos de GitHub, cloud, CI/CD, assinatura, proveniência e segregação dependem do plano, arquitetura e configuração adotados.
- Um checklist preenchido pode revelar lacunas, arquitetura e decisões comerciais; sua classificação deve ser definida antes de armazenar ou compartilhar.
- O OWASP Top 10 e o API Security Top 10 podem receber novas edições; o produto consumidor deve confirmar a versão antes de iniciar uma nova avaliação e controlar migração de mapeamentos.
- IDs e conteúdo de requisitos ASVS podem mudar entre versões. Uma atualização de versão exige análise de delta; não se deve renomear IDs históricos como se fossem equivalentes.
- O checklist ASVS resume áreas de controle, mas a avaliação formal depende da lista oficial completa, do nível selecionado, do escopo e de evidência requisito a requisito.
- GraphQL, WebRTC, OAuth/OIDC, webhooks, gateways, filas e integrações são aplicáveis somente quando presentes; não aplicabilidade precisa ser documentada sem produzir falsa cobertura.
- A aplicacao da LGPD, a definicao de papeis, a escolha de base legal, a necessidade de RIPD, os prazos de direitos, a transferencia internacional e a comunicacao de incidentes dependem dos fatos e do texto vigente; exigem revisao competente no momento da decisao.
- O checklist nao reproduz todos os artigos, regulamentos ou orientacoes da ANPD. Uma auditoria juridica formal deve consultar os textos oficiais consolidados e as obrigacoes setoriais e contratuais aplicaveis.
- WCAG 2.2 permanece a referencia tecnica adotada pelo programa. A aplicabilidade legal ou contratual, as normas ABNT vigentes e qualquer alegacao publica precisam de validacao propria.
- Tecnologias assistivas, navegadores, componentes e conteudos variam. A matriz de teste deve ser escolhida pelo uso real e risco; nenhuma combinacao unica representa todas as pessoas.
- Criterios WCAG podem exigir interpretacao especializada. Tecnicas, ACT Rules e ferramentas sao informativas ou parciais e nao substituem os criterios normativos nem julgamento humano.
- Conteudo e customizacao de terceiros ou de tenants nao devem ser excluidos silenciosamente do processo; responsabilidade, alternativa e limites dependem do controle e do contrato aplicaveis.

## Limites de segurança observados

- Não foram criados dados pessoais, dados de cliente, segredos, credenciais, cookies, URLs internas, logs crus, payloads, PoCs ou requests/responses.
- Não foram executados testes contra ambientes, chamadas de API, scans ou coleta de evidências reais.
- Não foram criados relatórios preenchidos nem declarações de conformidade, certificação ou ausência de vulnerabilidades.
- Não foram copiados trechos longos das publicações OWASP nem listas integrais de requisitos ASVS.
- Não foram executados DAST, fuzzing ou procedimentos ofensivos.
- Nao foram selecionadas bases legais, emitidos pareceres juridicos ou feitas declaracoes de conformidade LGPD/WCAG.
- Nao foram executados testes de acessibilidade, coletados relatos de usuarios ou gerados prints, videos e relatorios de ferramentas.
