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

O quarto PR e limitado aos checklists de plataforma e DevSecOps:

- `checklists/cloud-security.md`;
- `checklists/ci-cd-security.md`.

O quinto PR e limitado aos checklists de operacao, terceiros, IA e pagamentos:

- `checklists/payment-security.md`;
- `checklists/incident-response.md`;
- `checklists/backup-restore.md`;
- `checklists/third-party-risk.md`;
- `checklists/ai-governance.md`.

O pacote completo do Chunk 15 foi reconciliado no fechamento corretivo do Lote 3. O fechamento alterou somente `checklists/README.md`, `checklists/index.md`, `research/sources/chunk-15.md`, `research/progress.md` e `research/task-queue.md`.

## Fechamento corretivo do Lote 3

### Verificacao realizada

- Foram verificados os 15 checklists listados no prompt do Chunk 15 e o checklist adicional `checklists/owasp-top-10.md`, ja referenciado pelo README principal.
- Todos os checklists principais existem, possuem secoes de objetivo, momento de uso, revisor, evidencias, itens marcaveis, criterios de aprovacao/reprovacao ou bloqueio e cuidados contra vazamento.
- A busca por placeholders encontrou apenas `checklists/README.md` e `checklists/index.md` como remanescentes de navegacao; ambos foram substituidos por conteudo operacional neste fechamento.
- O uso da palavra "placeholder" em `checklists/accessibility-wcag-22-aa.md` permanece intencional no item que alerta que placeholder de formulario nao substitui label acessivel.

### Decisoes do fechamento

- `checklists/index.md` passou a listar os checklists por fase, AppSec, aplicacao, plataforma, operacao, governanca, privacidade e acessibilidade.
- `checklists/README.md` passou a explicar visao geral, forma de uso, limites e politica de evidencias dos checklists.
- `checklists/owasp-top-10.md` foi mantido como checklist principal adicional, por estar substantivo e coerente com OWASP Top 10:2025 e com o README principal.
- Nenhum checklist individual foi alterado, pois nao foi identificado erro de link ou indice que exigisse edicao fora do escopo permitido.
- `research/progress.md` e `research/task-queue.md` foram reconciliados para registrar o Lote 3 como concluido apos verificacao real, sem reabrir ou executar outro lote.

### Incertezas e pendencias fora do Lote 3

- A conclusao do Lote 3 nao corrige divergencias de inventario, arquitetura, documentos auxiliares, politicas, workflows, scripts, templates ou automacoes fora do escopo deste fechamento.
- O proximo lote corretivo indicado permanece o **Lote 1 - Estrutura inicial**, conforme a ordem de `research/codex-execution-plan.md`, para reconciliar inventario e estado declarado do repositorio.
- Avaliacoes juridicas, contratuais, enterprise, de acessibilidade, backend, cloud, ferramentas, versoes e certificacoes continuam contextuais e pendentes quando aplicaveis.
- Nenhum checklist preenchido de produto real foi criado; material real deve permanecer em local autorizado e classificado.

## Fontes internas consultadas

| Fonte | Uso nos checklists |
|---|---|
| `AGENTS.md` | Regras de escopo, evidências, fontes, arquivos sensíveis e estilo dos checklists. |
| `README.md` | Propósito da baseline, fases de maturidade, interpretação de relatórios e limites de conformidade. |
| `research/codex-execution-plan.md` | Escopo do Lote 3, ordem por PR, critérios de aceite e proibição de reconciliar status antes do pacote completo. |
| `research/coverage-audit.md` | Confirmação de que os checklists eram placeholders e de que `research/sources/chunk-15.md` estava ausente. |
| `research/prompts.md` | Requisitos originais do Chunk 15 e categorias esperadas. |
| `research/task-queue.md` | Estado declarado e critérios históricos; reconciliado somente no fechamento corretivo do Lote 3. |
| `research/progress.md` | Divergência histórica do Chunk 15; reconciliada somente no fechamento corretivo do Lote 3. |
| `docs/security-roadmap.md` | Fases MVP seguro e SaaS vendável para empresas, evidências, gates e critérios de não avançar. |
| `docs/standards-and-frameworks-matrix.md` | Versões internas adotadas: OWASP Top 10:2025, API Security Top 10:2023 e ASVS 5.0.0; limites de uso e certificação. |
| `docs/audit-types.md` | Combinação de revisão manual, testes de autenticação/autorização e ferramentas como evidência parcial. |
| `docs/audit-trigger-matrix.md` | Auditorias, revisores, evidências e Go/No-Go para primeiro deploy, beta e venda empresarial. |
| `docs/security-tools-catalog.md` | Limites e riscos de SAST, DAST, SCA, testes de API, logs e relatórios automatizados. |
| `docs/evidence-and-reporting-policy.md` | Classificação, redaction, `reports/raw/`, `reports/sanitized/`, compartilhamento e retenção contextual. |
| `docs/security-audit-baseline.md` | Estrutura de evidência, findings, risco, reteste e critérios de decisão. |
| `docs/git-security-workflow.md` | Gates de release, revisão independente, IDs opacos e proibição de evidência crua em Git, issues e PRs. |
| `risk/severity-and-prioritization.md` | Severidade, aceite, reteste e condições de bloqueio de release. |
| `checklists/index.md` | Contexto do conjunto de checklists; atualizado somente no fechamento corretivo do Lote 3. |
| `docs/lgpd-privacy-program.md` | Ciclo de vida, papeis, bases legais, direitos, fornecedores, RIPD, incidentes, privacy by design e limites de orientacao juridica. |
| `docs/accessibility-program.md` | WCAG 2.2 AA, processos completos, avaliacao manual, tecnologias assistivas, limites da automacao, evidencias e gates. |
| `docs/security-tools-catalog.md` | Superficies backend/Python; dependencia de versao; APIs, roles, permissions, jobs, hooks, arquivos, integracoes, logs e multi-tenant. |
| `docs/github-actions-strategy.md` | Eventos, `permissions`, `pull_request_target`, secrets, artifacts, caches, runners, branch protection, SHA/digest e politica de falha para CI/CD. |
| `templates/incident-report-template.md` | Campos minimos, linha do tempo, evidencias, comunicacao e cuidados de resposta a incidentes. |
| `templates/postmortem-template.md` | Estrutura de aprendizado, acoes corretivas, owners, prazos e revisao apos incidente ou falha. |
| `templates/backup-restore-test-template.md` | Campos minimos para teste de restore, RPO/RTO, integridade, descarte e evidencias agregadas. |
| `templates/vendor-risk-assessment-template.md` | Avaliacao de fornecedor, contrato, dados, suboperadores, continuidade, offboarding e decisao de risco. |
| `templates/ai-risk-assessment-template.md` | Avaliacao de finalidade, modelo, fornecedor, dados, revisao humana, riscos, controles e gatilhos de IA. |

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
| [Python documentation](https://docs.python.org/3/) | Documentacao oficial do runtime e biblioteca padrao. | Validar comportamento por versao instalada. |
| [OWASP Application Security Verification Standard](https://owasp.org/www-project-application-security-verification-standard/) | Referencia oficial de requisitos verificaveis. | Revisao de autenticacao, autorizacao, APIs, validacao, arquivos, logs e configuracao. |
| [OWASP API Security Top 10](https://owasp.org/www-project-api-security/) | Referencia oficial de riscos de APIs. | Revisao de objetos, propriedades, recursos, inventario, consumo e integracoes. |
| [GitHub Docs - Security hardening for GitHub Actions](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions) | Documentacao oficial do GitHub; recursos variam por plano, repositorio e configuracao. | Cuidados com `pull_request_target`, codigo nao confiavel, secrets, permissões, logs e actions de terceiros. |
| [GitHub Docs - Automatic token authentication](https://docs.github.com/en/actions/security-guides/automatic-token-authentication) | Documentacao oficial do GitHub. | Uso de `GITHUB_TOKEN` e principio de menor privilegio via `permissions`. |
| [GitHub Docs - Using secrets in GitHub Actions](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions) | Documentacao oficial do GitHub. | Tratamento de secrets, escopo, ausencia em contextos nao confiaveis e risco de logs. |
| [GitHub Docs - Storing workflow data as artifacts](https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts) | Documentacao oficial do GitHub. | Politica de artifacts, retencao, conteudo sensivel e allowlist de arquivos. |
| [NIST Cybersecurity Framework 2.0](https://www.nist.gov/cyberframework) | Framework oficial de referencia geral; nao e checklist especifico de provedor cloud. | Organizacao de governanca, identificacao, protecao, deteccao, resposta e recuperacao para cloud. |
| [CIS Critical Security Controls](https://www.cisecurity.org/controls) | Referencia oficial CIS; aplicabilidade depende do ambiente e do provedor. | Orientacao geral para inventario, IAM, logs, configuracao, vulnerabilidades, recuperacao e seguranca operacional. |
| [CISA - Cloud Security](https://www.cisa.gov/topics/cloud-security) | Portal oficial CISA sobre seguranca cloud. | Apoio geral para riscos de configuracao, identidade, visibilidade, resposta e responsabilidades em cloud. |
| [PCI Security Standards Council - PCI DSS](https://www.pcisecuritystandards.org/standards/pci-dss/) | Pagina oficial do padrao PCI DSS; escopo e validacao dependem do fluxo real de dados de cartao. | Limite do checklist de pagamentos: nao declarar conformidade PCI sem validacao formal; reduzir escopo de dados de cartao, webhooks, logs e responsabilidades. |
| [NIST SP 800-61 Rev. 3 - Incident Response](https://csrc.nist.gov/pubs/sp/800/61/r3/final) | Publicacao final localizada nos documentos internos como referencia vigente de resposta a incidentes. | Estrutura de preparacao, deteccao, analise, contencao, erradicacao, recuperacao e melhoria. |
| [NIST SP 800-34 Rev. 1 - Contingency Planning](https://csrc.nist.gov/pubs/sp/800/34/r1/upd1/final) | Publicacao final usada como referencia de planejamento de contingencia nos documentos internos. | Base para backup/restore, RPO/RTO, testes, manutencao e evidencia de recuperacao. |
| [NIST SP 800-161 Rev. 1 - Cybersecurity Supply Chain Risk Management Practices](https://csrc.nist.gov/pubs/sp/800/161/r1/final) | Publicacao final sobre gestao de risco de cadeia de suprimentos cibernetica. | Apoio ao checklist de terceiros: risco de fornecedor, dependencia, controles, monitoramento e resposta. |
| [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework) | Framework oficial voluntario; a propria documentacao informa revisoes e complementos ao longo do tempo. | Base para governanca de IA, gestao de risco, monitoramento, revisao humana e limites de alegacoes. |
| [NIST AI 600-1 - Generative AI Profile](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence) | Perfil oficial de IA generativa relacionado ao AI RMF. | Apoio a riscos de IA generativa como vazamento, alucinacao, abuso, dependencia, dados e monitoramento. |
| [OWASP Top 10 for Large Language Model Applications](https://owasp.org/www-project-top-10-for-large-language-model-applications/) | Projeto oficial OWASP para riscos de aplicacoes com LLM; versao aplicavel deve ser confirmada antes de avaliacao formal. | Referencia de apoio para prompt injection, dados sensiveis, supply chain, abuso, agentes e saidas inseguras, sem reproduzir payloads ou bypasses. |

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

### Decisoes do quarto PR - Backend, Cloud e CI/CD

- Backend Python foi tratado como revisao manual obrigatoria e dependente de versao. Ele nao presume APIs, hooks, roles, permissoes ou comportamento alem do que precisa ser validado na stack instalada.
- Aplicações web, plataformas educacionais SaaS e módulos financeiros foram separados por superficie, sem criar dados reais, configuracoes sensiveis, backups, dumps, logs ou fixtures operacionais neste PR.
- Roles, permissions, endpoints, jobs, hooks, arquivos, integracoes e isolamento multi-tenant foram definidos como revisoes obrigatorias porque scanners nao validam regra de negocio ou autorizacao server-side sozinhos.
- O checklist cloud permaneceu agnostico de provedor. Ele cobre IAM, rede, secrets, storage, logs, backups, exposicao publica, custo, regiao, criptografia e acesso administrativo sem inventar conta, bucket, dominio, tenant, ambiente ou comando destrutivo.
- O checklist cloud evita assumir que um benchmark, CSPM ou scanner prova seguranca; resultado tecnico exige escopo, triagem, owner, excecao e reteste.
- O checklist CI/CD foi escrito como revisao documental e operacional. Ele nao altera workflows, nao habilita scanner, nao cria gate e nao declara pipeline seguro sem validacao.
- `pull_request_target` foi citado com alerta explicito de risco, especialmente quando combinado com checkout ou execucao de codigo nao confiavel em contexto privilegiado.
- Actions por SHA completo e imagens por digest foram tratadas como requisito para gates e controles materiais, mas a fixacao concreta depende de validacao posterior da versao e integridade.
- Falha tecnica, cancelamento, scanner ausente ou saida obrigatoria ausente foram tratados como falha segura quando o controle e obrigatorio.
- Logs, artifacts, caches, secrets, runners, permissions e branch protection foram tratados como superficies de vazamento e supply chain, nao apenas como configuracao de automacao.
- Todos os itens permanecem desmarcados; os checklists devem ser preenchidos apenas em avaliacao autorizada e protegida.

### Decisoes do quinto PR - Pagamentos, incidentes, backup/restore, terceiros e IA

- O checklist de pagamentos foi tratado como controle financeiro e de AppSec, sem declarar conformidade PCI, bancaria, fiscal, contabil ou regulatoria. Escopo PCI e obrigacoes formais exigem validacao competente.
- Pagamentos incluem gateway, webhooks, idempotencia, conciliacao, reembolso, chargeback, antifraude, logs, autorizacao e segregacao financeira como controles obrigatorios quando aplicaveis.
- Nenhum dado real ou plausivel de cartao, Pix, banco, transacao, invoice, gateway de cliente, segredo de webhook ou credencial foi criado.
- O checklist de incidentes separa preparacao, triagem, severidade, contencao, preservacao de evidencia, comunicacao, decisao de notificacao, recuperacao, postmortem e acoes corretivas.
- Decisoes juridicas, regulatorias, contratuais e comunicacao externa foram marcadas como dependentes de revisao humana competente; o checklist nao automatiza notificacao.
- O checklist de backup/restore exige escopo, RPO/RTO, criptografia, acesso, retencao, segregacao, restore testado, evidencia sanitizada e descarte da copia restaurada.
- Backup executado nao foi tratado como prova de continuidade; continuidade so pode ser afirmada para escopo com restore testado e aprovado.
- O checklist de terceiros usa marcadores como `[FORNECEDOR-A]`, `[CONTRATO-A]` e `[SISTEMA-A]`, cobre dados tratados, acesso, contrato, seguranca, privacidade, continuidade, suporte, localizacao, subcontratados e offboarding, sem parecer juridico definitivo.
- O checklist de IA cobre governanca de modelo, dados de entrada, logs, retencao, avaliacao humana, alucinacao, privacidade, seguranca, fornecedores, prompt injection e uso aceitavel, sem declarar IA segura, imparcial, conforme ou livre de vazamento.
- Prompt injection foi tratado como risco e controle, sem payloads, bypasses, prompts reais, outputs sensiveis, conversas privadas ou exemplos perigosos.
- Todos os itens permanecem desmarcados; os checklists devem ser preenchidos apenas em avaliacao autorizada e com classificacao adequada.

## Incertezas e validações contextuais

- Requisitos jurídicos, LGPD, comunicação de incidentes, papéis de tratamento, transferências e cláusulas contratuais dependem dos fatos e exigem revisão competente.
- Requisitos enterprise variam por cliente, setor, região, contrato, criticidade e dados tratados.
- Acessibilidade exige avaliação humana; automação isolada não comprova conformidade.
- Ferramentas, versões, comandos, ambientes, retenção, frequência e thresholds devem ser definidos e validados no produto consumidor.
- Recursos de GitHub, cloud, CI/CD, assinatura, proveniência e segregação dependem do plano, arquitetura e configuração adotados.
- Backend Python varia por versao, bibliotecas, apps instalados, customizacoes e arquitetura multi-tenant. Uma nova release exige validar documentacao oficial e comportamento local.
- Cloud depende de provedor, servicos, regioes, contrato, modelo de responsabilidade compartilhada, plano de suporte, regulacao, arquitetura e dados processados. Este PR nao define benchmark unico nem comando universal.
- Recursos de IAM, logs, secrets, chaves, backups, retencao, CSPM, OIDC, runners, environments, rulesets, code scanning e secret scanning variam por provedor, plano, licenca e configuracao.
- Fixar actions por SHA e imagens por digest exige processo de validacao e atualizacao. Este PR define criterio de revisao, nao seleciona versoes ou digests.
- `pull_request_target`, runners self-hosted, caches e artifacts podem ser seguros ou inseguros conforme desenho. A aplicabilidade exige teste com cenarios de fork, Dependabot, merge queue e branches protegidas.
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
- Escopo PCI, fluxo de dados de cartao, responsabilidades do gateway, exigencias de arranjo, antifraude, chargeback, reembolso, fiscal, contabil e regulatorio dependem da arquitetura real e de validacao especializada.
- Gateways, webhooks, eventos, retries, sandboxes, conciliacao e relatorios financeiros variam por provedor; os checklists definem criterios de revisao, nao comandos nem contratos.
- Resposta a incidentes depende de fatos, severidade, dados envolvidos, papel controlador/operador, contrato, jurisdicao, canal, retencao e autoridade de comunicacao.
- RPO/RTO, escopo de restore, retencao, legal hold, descarte, criptografia e imutabilidade dependem da criticidade, arquitetura, fornecedor, contrato e testes executados.
- Risco de terceiros depende de criticidade, dados, acesso, suboperadores, regioes, plano contratado, evidencias fornecidas, contrato, suporte, continuidade e capacidade de offboarding.
- Governanca de IA depende de finalidade, modelo, fornecedor, dados, autonomia, populacao afetada, retencao, avaliacao humana, contrato e mudancas normativas. Frameworks de IA usados como referencia nao sao certificacao.
- Avaliacoes de IA sao probabilisticas e podem mudar com versao, prompt, contexto, dados e fornecedor; resultados agregados nao provam ausencia de alucinacao, vies, vazamento ou abuso.

## Limites de segurança observados

- Não foram criados dados pessoais, dados de cliente, segredos, credenciais, cookies, URLs internas, logs crus, payloads, PoCs ou requests/responses.
- Não foram executados testes contra ambientes, chamadas de API, scans ou coleta de evidências reais.
- Não foram criados relatórios preenchidos nem declarações de conformidade, certificação ou ausência de vulnerabilidades.
- Não foram copiados trechos longos das publicações OWASP nem listas integrais de requisitos ASVS.
- Não foram executados DAST, fuzzing ou procedimentos ofensivos.
- Nao foram selecionadas bases legais, emitidos pareceres juridicos ou feitas declaracoes de conformidade LGPD/WCAG.
- Nao foram executados testes de acessibilidade, coletados relatos de usuarios ou gerados prints, videos e relatorios de ferramentas.
- Nao foram criados arquivos de configuracao reais, bancos, usuarios, cursos, clientes, tenants, logs, backups, dumps ou fixtures reais.
- Nao foram criados IPs internos, IDs de conta, buckets, dominios, tenants, nomes de ambientes, configuracoes cloud reais, credenciais cloud ou exemplos semelhantes a credenciais.
- Nao foram alterados workflows, habilitados scanners, ativados gates, criados artifacts, modificados scripts ou executados comandos destrutivos.
- Nao foram incluidos requests/responses, payloads, PoCs, logs crus, prints, relatorios sensiveis, URLs internas ou informacoes reais de cliente.
- Nao foram criados dados de cartao, chave Pix, dado bancario, chargeback, invoice, ID real de transacao, gateway real de cliente, webhook secret, token, client secret ou credencial.
- Nao foram criadas narrativas com vitimas, clientes, atacantes, IPs, dominios, URLs, tenants, contas ou evidencias sensiveis reais.
- Nao foram criados dumps, backups, paths reais sensiveis, nomes reais de banco, buckets, servidores, tenants, comandos destrutivos ou declaracao de continuidade garantida.
- Nao foram usados nomes reais de fornecedores, clientes, contratos, suboperadores ou processadores; os checklists usam marcadores ficticios.
- Nao foram criados prompts reais de clientes, outputs sensiveis, conversas privadas, conteudo de usuario real, instrucoes ofensivas, bypasses, prompt injection exploravel ou exemplos perigosos.
