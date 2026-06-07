# Checklist de LGPD e Privacidade para SaaS

## Objetivo

Verificar se um SaaS possui governanca, controles tecnicos e capacidade operacional proporcionais aos tratamentos de dados pessoais no escopo avaliado. Este checklist apoia auditoria e decisao de release, mas nao declara conformidade com a LGPD, nao escolhe base legal e nao substitui parecer juridico.

## Quando usar

- antes do primeiro uso de dados pessoais em producao;
- antes de beta, release material, venda empresarial ou nova integracao;
- ao introduzir nova finalidade, categoria de dado, titular, fornecedor, pais, analytics, IA ou decisao automatizada;
- antes de tratamento que possa gerar alto risco e na avaliacao sobre elaborar ou revisar RIPD;
- apos incidente, reclamacao relevante, falha de direitos, mudanca regulatoria ou alteracao material de arquitetura;
- em revisao periodica definida pelo programa de privacidade.

Itens nao aplicaveis devem ter justificativa, escopo e aprovador. Item obrigatorio nao testado nao equivale a aprovado.

## Revisor responsavel

- **Responsavel primario:** Privacidade ou encarregado, com independencia proporcional ao risco.
- **Revisores obrigatorios conforme o tema:** owner do produto, Engenharia, Seguranca, Operacoes, Suporte e Compras.
- **Validacao competente:** Juridico para papeis, bases legais, direitos, contratos, transferencias, RIPD e comunicacao de incidentes; controlador para decisoes que lhe competem.
- **Aprovacao de release:** responsavel pelo release e autoridade de risco definida pela organizacao.

Quem implementou o controle nao deve ser seu unico aprovador em tratamento material ou de alto risco.

## Evidencias esperadas

- mapa de dados e ROPA atualizados, sem registros pessoais no Git;
- matriz de finalidades, papeis, hipoteses legais candidatas e validacoes competentes;
- requisitos e testes de minimizacao, acesso, isolamento entre tenants, exportacao, correcao, exclusao, retencao e restore;
- avisos, termos, preferencias e contratos coerentes com o comportamento observado;
- inventario e avaliacao de fornecedores, suboperadores, regioes e transferencias;
- procedimento testado de direitos e de incidentes com dados pessoais;
- decisao sobre RIPD e, quando aplicavel, RIPD controlado e revisado;
- findings, riscos, excecoes e retestes referenciados por IDs opacos.

Evidencia integral permanece em armazenamento restrito ou em `reports/raw/`, fora do Git. Somente sinteses minimizadas, redigidas e aprovadas podem ir para `reports/sanitized/`.

## Itens obrigatorios

### Escopo, governanca e prestacao de contas

- [ ] O escopo identifica produto, release, ambientes, processos, sistemas, tenants abstratos, categorias de titulares e tipos de dados, sem incluir valores pessoais reais?
- [ ] Controlador, operador, suboperadores e terceiros foram avaliados por operacao de tratamento, sem presumir que o rotulo contratual resolve o papel real?
- [ ] Existe owner para cada tratamento e um canal efetivo para titulares, com encarregado ou decisao documentada sobre regra aplicavel?
- [ ] Mapa de dados e ROPA cobrem coleta, uso, compartilhamento, armazenamento, logs, cache, filas, busca, arquivos, backups, suporte, analytics, IA, descarte e fornecedores?
- [ ] Mudancas materiais acionam revisao de privacidade antes da implementacao ou liberacao?
- [ ] Decisoes, limitacoes, riscos residuais, aprovadores e datas de revisao estao registrados sem dados pessoais ou informacoes sensiveis no Git?

### Finalidade, necessidade e hipotese legal

- [ ] Cada finalidade esta descrita de forma especifica e vinculada aos dados estritamente necessarios?
- [ ] A organizacao registrou uma hipotese legal candidata por finalidade e obteve validacao juridica competente, sem selecao automatica por ferramenta ou checklist?
- [ ] Dados pessoais sensiveis, dados de criancas e adolescentes e outros contextos vulneraveis recebem analise propria e controles proporcionais?
- [ ] Mudanca de finalidade, enriquecimento, perfilamento, marketing, analytics ou treinamento de IA reabre a analise antes do novo uso?
- [ ] Quando consentimento for a hipotese validada, a manifestacao, granularidade, prova, recusa e revogacao foram projetadas e testadas sem condicionamento indevido?
- [ ] Quando legitimo interesse for cogitado para dado nao sensivel, finalidade, necessidade, balanceamento, expectativa, salvaguardas e transparencia foram documentados e revisados?

### Transparencia e direitos dos titulares

- [ ] Avisos e informacoes contextuais refletem dados, finalidades, papeis, compartilhamentos, retencao, direitos, transferencias e canais efetivamente usados?
- [ ] O processo de direitos identifica o solicitante de forma proporcional e evita coletar dado adicional desnecessario?
- [ ] Confirmacao, acesso, correcao, bloqueio, eliminacao, portabilidade, informacao, oposicao, revogacao e revisao de decisao automatizada sao encaminhados conforme aplicabilidade e validacao competente?
- [ ] A busca por dados cobre sistemas ativos, arquivos, fornecedores e tenants sem revelar dados de terceiros?
- [ ] Exportacao e resposta usam canal seguro, autorizacao adequada, escopo correto e formato revisado?
- [ ] Excecoes, conservacao e negativas possuem fundamento documentado, aprovador e comunicacao apropriada, sem decisao automatica do sistema?
- [ ] Um exercicio com IDs opacos e dados sinteticos validou recebimento, triagem, busca, decisao, resposta e registro do pedido?

### Produto, engenharia e seguranca

- [ ] Campos, eventos, telemetria e conteudo livre foram revisados para minimizacao e defaults protetivos?
- [ ] Autenticacao, autorizacao e menor privilegio protegem funcoes de administracao, suporte, exportacao, exclusao e configuracao de privacidade?
- [ ] Isolamento entre tenants foi testado em API, banco, jobs, filas, cache, busca, arquivos, relatorios, exportacoes e integracoes aplicaveis?
- [ ] Logs, traces, metricas e artifacts excluem por padrao segredos, cookies, corpos, documentos, mensagens e dados pessoais desnecessarios?
- [ ] Desenvolvimento, teste e homologacao usam dados sinteticos; qualquer excecao real possui aprovacao, mascaramento validado, isolamento, prazo e descarte?
- [ ] Criptografia, gestao de chaves, acesso administrativo, revisoes de acesso e trilhas de auditoria foram avaliados conforme o risco?
- [ ] Retencao possui evento inicial, prazo, fundamento validado, owner, excecoes e descarte verificavel por sistema?
- [ ] Exclusao e bloqueio propagam-se a replicas, cache, busca, filas e fornecedores; atrasos de backup e conservacoes permitidas estao documentados?
- [ ] Backups possuem acesso restrito, retencao, restore testado e reconciliacao para impedir retorno indevido de dados excluidos ao uso ativo?

### Fornecedores e transferencias

- [ ] Todo fornecedor que recebe ou acessa dados pessoais possui owner, finalidade, papel, categorias de dados, criticidade e avaliacao registrados?
- [ ] Contratos aplicaveis cobrem instrucoes, confidencialidade, seguranca, suboperadores, direitos, incidentes, auditoria, retorno e exclusao?
- [ ] Regioes de processamento, suporte remoto e suboperadores foram inventariados antes do envio de dados?
- [ ] Transferencia internacional foi caracterizada e o mecanismo aplicavel foi validado por Privacidade/Juridico, sem presumir adequacao apenas pela regiao cloud?
- [ ] O plano de saida testa exportacao, continuidade, revogacao de acessos e eliminacao pelo fornecedor?

### RIPD, incidentes e operacao

- [ ] O controlador registrou a decisao sobre necessidade de RIPD considerando finalidade, escala, dados, titulares, tecnologia, decisoes automatizadas e riscos aos direitos?
- [ ] Quando aplicavel, o RIPD foi elaborado antes do tratamento ou atualizado apos mudanca material, com riscos, medidas, salvaguardas, aprovadores e divergencias relevantes?
- [ ] O plano de incidente distingue operador e controlador, preserva evidencia restrita e define escalonamento para Privacidade, Encarregado, Juridico e Seguranca?
- [ ] O processo permite avaliar risco ou dano relevante, decidir comunicacoes e cumprir o procedimento vigente sem esperar investigacao completa?
- [ ] Incidentes com dados pessoais possuem registro restrito e retencao conforme a regra aplicavel; o Git recebe no maximo postmortem sanitizado?
- [ ] Um exercicio validou deteccao, contencao, avaliacao, comunicacao interna, recuperacao e retorno seguro?

### Findings, risco e release

- [ ] Achados possuem ID opaco, impacto aos titulares, severidade, owner, prazo, criterio de aceite e reteste?
- [ ] Findings materiais foram revisados por Privacidade e, quando necessario, Juridico, Seguranca e autoridade de risco?
- [ ] Excecoes e aceites sao temporarios, aprovados, monitorados e incapazes de legitimar tratamento sabidamente ilicito?
- [ ] O checklist preenchido e suas evidencias receberam classificacao, acesso, retencao e audiencia definidos?

## Itens desejaveis

- [ ] Descoberta de dados e revisao de schema apoiam o inventario, com triagem humana e sem enviar conteudo sensivel a servico nao aprovado?
- [ ] Testes automatizados previnem novos campos, eventos ou logs fora de allowlists revisadas?
- [ ] Retencao, expiracao, exportacao e exclusao possuem monitoramento, alertas e amostras periodicas?
- [ ] Fornecedores criticos fornecem evidencias independentes proporcionais ao risco e passam por revisao recorrente?
- [ ] Metricas acompanham tratamentos sem owner, falhas de direitos, exclusoes incompletas, acessos de suporte, fornecedores pendentes e excecoes vencidas?
- [ ] Privacy review esta integrado ao discovery, PRD, arquitetura, threat modeling, CI/CD e decisao de release?
- [ ] Testes de abuso cobrem exportacao em massa, acesso de suporte, mudanca de tenant, revogacao e uso secundario sem registrar payloads reais?
- [ ] Treinamento por funcao cobre Engenharia, Produto, Suporte, Marketing, Compras e resposta a incidentes?

## Melhorias futuras

- [ ] Adotar privacy engineering e modelagem sistematica de ameacas a privacidade nos fluxos de maior risco?
- [ ] Ampliar verificacao continua de minimizacao, lineage, retencao e propagacao de direitos?
- [ ] Realizar avaliacao independente do programa e da eficacia dos controles, com escopo e limitacoes documentados?
- [ ] Publicar transparencia adicional ou versao publica sanitizada de documentos somente apos aprovacao competente?
- [ ] Avaliar certificacao formal de privacidade ou seguranca apenas quando houver objetivo, escopo, norma e organismo definidos, sem trata-la como prova de conformidade com a LGPD?

## Criterios de aprovacao

- [ ] Todos os itens obrigatorios aplicaveis foram executados e possuem evidencia minima revisada?
- [ ] Itens nao aplicaveis possuem justificativa, escopo, revisor e data?
- [ ] Bases legais, papeis, direitos, contratos, transferencias, RIPD e incidentes receberam validacao competente quando aplicavel?
- [ ] Nao existe finding critico, alto bloqueante, incidente ativo ou risco material sem tratamento e reteste?
- [ ] Excecoes validas possuem alternativa ou controle, owner, monitoramento, aprovador e expiracao?
- [ ] A decisao registra apenas **aprovado para o escopo avaliado**, sem declarar conformidade automatica ou integral com a LGPD?

## Criterios de reprovacao ou bloqueio

- [ ] Ha coleta ou uso material sem finalidade, necessidade, owner ou hipotese legal submetida a validacao competente?
- [ ] Uma base legal foi escolhida automaticamente, sem analise dos fatos e aprovacao adequada?
- [ ] Dado sensivel ou tratamento potencialmente de alto risco iniciou sem avaliacao e decisao aplicaveis?
- [ ] Existe falha confirmada de autorizacao ou isolamento que exponha dados entre tenants ou pessoas?
- [ ] Logs, artifacts, issues, PRs ou repositorios contem dado pessoal, segredo, cookie, evidencia crua ou informacao sensivel indevida?
- [ ] Direitos nao podem ser atendidos em fluxo material, ou a resposta pode revelar dados de terceiros?
- [ ] Retencao e descarte sao indefinidos ou exclusao conhecida nao alcanca sistemas ativos e fornecedores criticos?
- [ ] Fornecedor recebe dados sem avaliacao, papel, contrato ou transferencia aplicavel tratados?
- [ ] Aviso, preferencia ou contrato e materialmente incompativel com o comportamento que sera liberado?
- [ ] Incidente relacionado esta ativo, sem contencao, avaliacao ou autorizacao formal de retorno?
- [ ] Gate obrigatorio nao executou, falhou tecnicamente ou nao produziu evidencia suficiente?
- [ ] Excecao ou aceite expirou, nao possui autoridade ou tenta legitimar descumprimento conhecido?

Qualquer condicao marcada nesta secao exige decisao **No-Go** ate correcao e reteste ou decisao formal permitida pelos documentos canonicos. Nem toda condicao admite aceite de risco.

## Cuidados contra vazamento

- [ ] O checklist nao contem nome de titular, cliente, fornecedor ou pessoa real?
- [ ] Nao foram incluidos CPF, e-mail, telefone, endereco, documento, mensagem, pagamento ou outro dado pessoal real?
- [ ] Exemplos usam somente IDs opacos, como `TRAT-0001`, sem tabela de reversao no repositorio?
- [ ] Nao foram incluidos segredos, tokens, credenciais, cookies, headers, chaves ou valores parecidos com credenciais?
- [ ] Nao foram incluidos logs crus, dumps, backups, requests, responses, payloads, PoCs ou relatorios integrais?
- [ ] URLs internas, nomes de tenant, paths, topologia, identificadores correlacionaveis e informacoes de cliente foram removidos?
- [ ] Prints, videos e PDFs indispensaveis foram recortados, redigidos irreversivelmente, limpos de metadados e revisados por segunda pessoa?
- [ ] Evidencias cruas permanecem em `reports/raw/` ou armazenamento restrito e nunca foram staged?
- [ ] O resumo em `reports/sanitized/` foi reconstruido por minimizacao, aprovado pelo owner e referencia apenas IDs opacos?

## Referencias internas

- `docs/lgpd-privacy-program.md`
- `docs/evidence-and-reporting-policy.md`
- `docs/audit-trigger-matrix.md`
- `docs/security-audit-baseline.md`
- `docs/git-security-workflow.md`
- `risk/severity-and-prioritization.md`
- `research/sources/chunk-15.md`
