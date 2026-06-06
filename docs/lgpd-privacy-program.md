# Programa de LGPD e Privacidade para SaaS

## Objetivo e limites

Este documento estabelece um baseline prático para incorporar proteção de dados pessoais ao produto, à engenharia, à operação, à governança e à auditoria de um SaaS. Ele deve ser adaptado ao contexto, aos contratos, às categorias de titulares e ao papel efetivamente exercido em cada tratamento.

> **Limite:** este é um guia técnico e de governança, não um parecer jurídico. A qualificação de papéis, a escolha de base legal, o conteúdo de avisos e contratos, a resposta a direitos, a transferência internacional e a comunicação de incidentes exigem validação jurídica no caso concreto.

### Classificação das práticas

- **Obrigatório legal quando aplicável:** cumprir a LGPD e regulamentos vigentes da ANPD.
- **Obrigatório interno:** manter inventário, responsáveis, decisões, controles e evidências mínimas deste baseline.
- **Desejável:** automatizar descoberta, retenção, exportação e exclusão após validar riscos.
- **Melhoria futura:** métricas avançadas, privacy engineering e avaliação independente contínua.
- **Certificação formal:** normas voluntárias podem apoiar governança, mas não provam conformidade com a LGPD nem substituem a ANPD ou validação jurídica.

## Modelo operacional

O programa funciona como ciclo contínuo:

1. Descobrir tratamentos e fluxos de dados.
2. Definir finalidade, necessidade, papel dos agentes e hipótese legal.
3. Avaliar risco aos titulares antes da implementação.
4. Projetar controles de produto, segurança, retenção e transparência.
5. Validar fornecedores, contratos e transferências internacionais.
6. Testar direitos, exclusão, exportação, restauração e incidentes.
7. Liberar somente com riscos materiais tratados ou formalmente aceitos.
8. Monitorar mudanças, incidentes, reclamações e eficácia dos controles.
9. Atualizar inventários, documentos e evidências.

Privacidade não é um aceite único do jurídico. Produto, engenharia, segurança, operações, suporte, compras, encarregado e liderança mantêm responsabilidades verificáveis.

## Ciclo de vida do dado pessoal

| Etapa | Perguntas mínimas | Controles técnicos e operacionais | Evidência esperada |
|---|---|---|---|
| Coleta | Qual dado, titular, origem, finalidade e necessidade? É sensível ou de vulnerável? | Minimização; validação de campos; aviso contextual; consentimento granular quando for a hipótese; recusa de coleta livre em logs. | Fluxo no mapa de dados, requisito aprovado, tela ou API sanitizada. |
| Uso | O uso permanece compatível com finalidade e base registradas? | Autorização por função e tenant; propósito no serviço; testes contra uso secundário; revisão de analytics e IA. | ROPA, matriz de acesso, testes e decisão de privacy review. |
| Compartilhamento | Quem recebe, em qual papel, local e finalidade? | DPA/contrato; escopo mínimo; credenciais isoladas; registro de envio; mecanismo de transferência internacional quando aplicável. | Registro de fornecedor, contrato controlado fora do repositório-base, diagrama sanitizado. |
| Armazenamento | Onde estão dados, réplicas, índices, filas, arquivos, logs e cache? | Criptografia adequada; segregação por tenant; acesso mínimo; classificação; gestão de chaves; ambientes separados. | Inventário de sistemas, configuração sanitizada e teste de isolamento. |
| Retenção | Por quanto tempo e por qual fundamento? Há retenção legal, contratual ou defesa de direitos? | Tabela por finalidade; expiração; legal hold controlado; revisão periódica; retenção específica de logs e backups. | Política aprovada, regra configurada e execução amostrada. |
| Descarte | O dado terminou sua finalidade e não há hipótese de conservação aplicável? | Exclusão verificável; descarte criptográfico ou seguro; propagação para réplicas e fornecedores; registro sem conteúdo pessoal. | Ticket sanitizado, contagens agregadas, atestado do fornecedor. |
| Anonimização | O resultado deixa de se relacionar a pessoa identificada ou identificável pelos meios razoáveis disponíveis? | Avaliar reidentificação, combinação de bases e unicidade; remover chaves; limitar granularidade; testar ataques plausíveis. | Método, avaliação de risco e aprovação. |
| Pseudonimização | O identificador foi separado, mas a reidentificação ainda é possível com informação adicional? | Cofre ou tabela de correspondência separada; acesso restrito; chaves rotacionadas; proibição de tratar como anonimização. | Arquitetura, controle de acesso e teste. |

Dados anonimizados podem voltar ao escopo de proteção se a anonimização for revertida ou puder ser revertida com meios próprios ou esforços razoáveis. Pseudonimização reduz risco, mas o dado continua pessoal.

### Desenvolvimento e homologação

- Não copiar produção para desenvolvimento ou homologação como prática padrão.
- Preferir dados sintéticos claramente fictícios e casos de teste não identificáveis.
- Quando uma cópia excepcional for indispensável, exigir aprovação, minimização, mascaramento validado, ambiente isolado, prazo curto e descarte comprovado.
- Proibir dados pessoais reais em fixtures, snapshots, screenshots, issues, PRs e pipelines.
- Tratar suporte e debug como operações de acesso: autorização temporária, justificativa, logging e revisão.

## Papéis e responsabilidades

Papéis são definidos por atividade e poder decisório, não apenas pelo nome no contrato. A mesma organização pode ser controladora em um tratamento e operadora em outro.

| Papel | Aplicação prática em SaaS | Responsabilidades mínimas |
|---|---|---|
| Controlador | Decide finalidades e elementos essenciais do tratamento. Pode ser o fornecedor SaaS para cadastro, cobrança ou marketing próprio; em B2B, o cliente pode controlar dados inseridos por seus usuários. | Aprovar finalidade e hipótese legal; assegurar direitos; definir instruções; avaliar riscos; elaborar RIPD quando aplicável; decidir comunicações regulatórias. |
| Operador | Trata dados em nome do controlador e segundo instruções legítimas. O SaaS frequentemente atua assim para conteúdo do tenant empresarial. | Seguir instruções documentadas; manter segurança e registros aplicáveis; auxiliar direitos, incidentes, exclusão e auditoria; informar incidente sem demora injustificada. |
| Encarregado/DPO | Canal entre titulares, agente de tratamento e ANPD; orienta internamente conforme LGPD, Resolução CD/ANPD nº 18/2024 e ato de indicação. | Canal efetivo em português; independência e recursos compatíveis; ausência de conflito material; orientação, encaminhamento e acompanhamento. A dispensa aplicável a pequeno porte deve ser validada, mantendo canal de atendimento. |
| Suboperador | Fornecedor contratado pelo operador para parte do tratamento, como cloud, e-mail ou observabilidade. | Autorização e transparência conforme contrato; obrigações equivalentes; segurança; incidentes; retorno/exclusão; transferência internacional. |
| Terceiro | Recebe ou acessa dados fora da prestação estrita como operador, ou exerce papel próprio. | Finalidade e papel documentados; compartilhamento mínimo; base e transparência validadas; contrato e canal de incidente. |
| Cliente empresarial | Pode ser controlador dos dados de empregados, alunos, consumidores ou contatos inseridos no SaaS. | Configurar uso lícito, perfis, retenção e atendimento; emitir instruções; informar usuários; não usar a plataforma para finalidade incompatível. |
| Usuário final/titular | Pessoa natural a quem o dado se refere; um usuário administrativo também pode agir em nome do cliente. | Receber informação clara e canal de direitos; não deve ser responsabilizado por escolhas estruturais do controlador. |

O DPA deve separar os tratamentos em que o fornecedor SaaS atua como operador daqueles em que decide finalidade própria. Rótulo contratual inconsistente com a realidade não elimina responsabilidade.

## Bases legais

Base legal é definida por finalidade e categoria de dado antes da coleta; não é escolhida retroativamente para justificar um produto pronto. Dados pessoais sensíveis seguem hipóteses próprias do art. 11 da LGPD, e legítimo interesse não se aplica a eles.

| Hipótese | Uso possível em SaaS | Controles e validação |
|---|---|---|
| Consentimento | Comunicações ou funcionalidades opcionais quando a manifestação puder ser livre, informada e inequívoca. | Finalidades específicas, prova da manifestação, mesma facilidade para revogar e efeito da revogação. Não usar para condicionar serviço desnecessariamente. |
| Execução de contrato ou procedimentos preliminares a pedido do titular | Cadastro, autenticação, entrega de funcionalidade e suporte estritamente necessários ao contrato com a pessoa natural. | Demonstrar necessidade e vínculo com o pedido/contrato; separar marketing e usos próprios não necessários. Em B2B, nem todo dado de usuário decorre automaticamente de contrato direto com o SaaS. |
| Obrigação legal ou regulatória | Guarda ou comunicação exigida por norma aplicável, inclusive fiscal ou setorial. | Identificar norma, escopo, dado e período; validação jurídica; não ampliar coleta por conveniência. |
| Legítimo interesse | Segurança, prevenção de abuso ou melhoria compatível envolvendo dados não sensíveis, se requisitos forem atendidos. | Teste documentado de finalidade, necessidade, balanceamento e salvaguardas; expectativa do titular; transparência; canal de oposição quando cabível. Nunca tratar como base genérica. |
| Proteção do crédito | Operações estritamente relacionadas à proteção do crédito, quando aplicável ao modelo. | Validar escopo, necessidade, fontes, compartilhamentos e regras setoriais; não confundir com cobrança genérica ou analytics. |
| Exercício regular de direitos | Preservação e uso necessário em processo judicial, administrativo ou arbitral. | Legal hold restrito, acesso limitado, prazo e liberação documentados; validação jurídica. |
| Administração pública, estudos por órgão de pesquisa, proteção da vida, tutela da saúde e prevenção à fraude | Outras hipóteses dos arts. 7º e 11 podem ser aplicáveis em contextos específicos e dentro de seus requisitos próprios. | Não presumir aplicabilidade. Registrar artigo, contexto, limites e parecer/validação competente; para dado sensível, usar somente hipótese do art. 11. |

### Matriz de bases legais

Para cada finalidade, registrar: categoria de titular; dados comuns/sensíveis; operação; hipótese e justificativa; necessidade; consequência da recusa; compartilhamentos; retenção; direitos e canal; decisão jurídica; data e responsável pela revisão.

Mudança de finalidade, público, dado, fornecedor, país, IA ou decisão automatizada reabre a análise.

## Direitos dos titulares

O processo deve identificar o solicitante de forma proporcional, evitar coleta excessiva para autenticação e registrar decisões sem expor o conteúdo do pedido no Git.

| Direito ou demanda | Capacidade operacional necessária |
|---|---|
| Confirmação e acesso | Localizar tratamentos por identidade e tenant; entregar resposta clara e segura, sem dados de terceiros. |
| Correção | Atualizar fonte principal e propagar correções para sistemas e operadores aplicáveis. |
| Anonimização, bloqueio ou eliminação | Verificar tratamento desnecessário, excessivo ou desconforme; interromper uso; propagar ação e registrar exceções de conservação. |
| Portabilidade | Exportar em formato estruturado e seguro, observada a regulamentação e segredos comercial/industrial; validar interoperabilidade no caso concreto. |
| Informação sobre compartilhamento | Informar entidades ou categorias de destinatários de modo coerente com ROPA e registro de fornecedores. |
| Informação e recusa de consentimento | Explicar finalidade, consequências da negativa e alternativas aplicáveis. |
| Revogação e eliminação de dados tratados com consentimento | Manter mecanismo fácil; cessar tratamento futuro e avaliar conservação permitida pelo art. 16. |
| Oposição | Receber e avaliar oposição a tratamento sem consentimento em caso de alegado descumprimento da LGPD. |
| Revisão de decisão automatizada | Identificar decisões unicamente automatizadas que afetem interesses; fornecer informações claras sobre critérios e procedimentos, resguardados segredos; permitir contestação e revisão aplicável. |

### Fluxo de atendimento

1. Receber em canal acessível e gerar identificador não revelador.
2. Confirmar escopo, papel do SaaS e identidade com método proporcional.
3. Preservar contra alteração indevida enquanto o pedido é analisado.
4. Consultar sistemas, suboperadores e cliente controlador quando aplicável.
5. Aplicar exceções somente com fundamento documentado e revisão competente.
6. Responder em canal seguro e linguagem clara.
7. Registrar datas, decisão, aprovadores e comprovação sem copiar dados pessoais para o repositório.
8. Medir recorrência, atrasos, falhas de busca e causas técnicas.

Prazos e formato da resposta devem seguir a LGPD e regulamentação vigente. Não fixar SLA externo apenas por conveniência interna; o procedimento jurídico deve validar o prazo aplicável a cada tipo de resposta.

## Documentos do programa

Os caminhos abaixo são artefatos-alvo. Este chunk define conteúdo e governança, sem antecipar os templates completos do Chunk 17.

| Documento | Objetivo e campos mínimos | Quando preencher e revisão | Evidência e risco reduzido |
|---|---|---|---|
| `privacy/data-map.md` | Mapear origem, dado, titular, fluxo, sistema, país, destino, API, log, backup e descarte. | No discovery e antes de mudança; Produto, Engenharia, Segurança e Privacidade revisam. | Diagrama/inventário sanitizado; reduz tratamento desconhecido e fluxo não controlado. |
| `privacy/ropa.md` | Registrar operações, papel, finalidade, categorias, base provável, compartilhamento, retenção, segurança e responsável. | Antes de produção e em cada mudança material; controlador aprova com Privacidade/Jurídico. | Registro versionado sem dado pessoal; reduz falta de prestação de contas. |
| `privacy/legal-bases.md` | Relacionar finalidade, dado, titular, hipótese, justificativa, necessidade, direitos e validação. | Antes da coleta/novo uso; Jurídico/Privacidade revisam. | Decisão datada; reduz base inadequada ou incompatibilidade de finalidade. |
| Política/aviso de privacidade | Explicar controlador, dados, finalidades, bases, compartilhamentos, direitos, retenção, transferências, segurança, contato e atualização. | Antes da coleta e quando mudar; Jurídico, Privacidade, Produto e Comunicação revisam. | Versão publicada e histórico; reduz opacidade. |
| Política de cookies | Inventariar cookies/SDKs, finalidade, duração, terceiros, base, escolhas e revogação. | Antes de instalar tecnologia e após mudanças; Produto, Marketing, Engenharia e Jurídico revisam. | Scanner/inventário, banner e preferências testadas; reduz tracking não informado. |
| Termos de uso | Definir serviço, responsabilidades, uso aceitável, conta, propriedade, suporte e relação com documentos de privacidade. | Antes da oferta e mudanças contratuais; Jurídico e Produto revisam. | Versão e aceite quando aplicável; reduz ambiguidade contratual, sem substituir aviso de privacidade. |
| DPA/contrato com operador | Definir papéis por tratamento, objeto, duração, instruções, segurança, suboperadores, direitos, incidentes, auditoria, transferência, retorno e exclusão. | Antes de acesso do fornecedor/cliente e na renovação; Jurídico, Privacidade, Segurança e Compras revisam. | Contrato em repositório contratual restrito; reduz responsabilidade e resposta ambíguas. |
| `privacy/third-party-processors.md` | Registrar fornecedor, serviço, papel, dados, finalidade, países, suboperadores, contrato, retenção, exclusão, incidente, risco e dono. | Antes da contratação e ao menos na revisão periódica; Compras, Segurança, Privacidade e Jurídico. | Registro sanitizado e avaliação; reduz cadeia invisível e transferência inadequada. |
| `privacy/retention-policy.md` | Definir evento inicial, prazo, fundamento, sistema, backup, legal hold, descarte e responsável. | Antes da produção e por mudança legal/contratual; Dados, Operações, Privacidade e Jurídico. | Tabela aprovada e teste de expiração; reduz retenção indefinida. |
| Política de descarte | Definir métodos por mídia/sistema, propagação, exceções, aprovação e prova sem conteúdo. | Antes do primeiro descarte e por tecnologia; Segurança, Operações e Privacidade. | Registro agregado/atestado; reduz recuperação indevida. |
| `privacy/data-subject-rights.md` | Definir canais, autenticação, triagem, papéis, busca, resposta, exceções, comunicação e métricas. | Antes de receber titulares; Suporte, Encarregado, Engenharia e Jurídico testam. | Exercício simulado e registro de atendimento; reduz resposta incompleta ou exposição. |
| `privacy/dpia-template.md` | Estruturar projeto, sistemas, fluxo, dados, titulares, escala, finalidade, base, princípios, riscos, medidas, opiniões e aprovação. | Antes de tratamento de alto risco e após mudança material; controlador, Encarregado, Segurança e Jurídico. | RIPD interno controlado e versão pública sanitizada quando aplicável; reduz risco não analisado. |
| `privacy/incident-personal-data.md` | Definir triagem, papéis, preservação, risco ao titular, decisão, comunicações, complementação e lições. | Antes da produção; testar e acionar em suspeita; Segurança, controlador, Encarregado e Jurídico. | Registro restrito e postmortem sanitizado; reduz atraso e decisão sem fundamento. |
| Registro de incidentes | Registrar fatos, dados/categorias, titulares estimados, causa, risco, medidas, comunicações e encerramento. | Em todo incidente com dado pessoal, comunicável ou não; acesso restrito. | Linha do tempo e decisão. O regulamento vigente exige conservação mínima específica; confirmar texto consolidado. |
| Política de privacy by design | Definir gatilhos, perguntas, responsáveis, critérios, gates, exceções e reavaliação. | Em discovery, design, PRD, arquitetura e release; Produto, Engenharia, Segurança e Privacidade. | Privacy review e testes; reduz correção tardia. |
| `privacy/privacy-by-design-checklist.md` | Verificar minimização, defaults, acesso, tenant, logs, direitos, retenção, terceiros e incidentes. | Por feature/release relevante; Tech lead e Privacidade revisam. | Checklist sanitizado; reduz regressão. |
| `checklists/lgpd.md` | Consolidar auditoria de governança, produto, operação, fornecedores, direitos e evidências. | Em auditoria periódica e antes de venda/mudança material; revisor independente do controle quando possível. | Resultado sanitizado e backlog; reduz lacunas recorrentes. |

## Privacy by design e by default

### Controles transversais

- **Minimização:** cada campo, evento e atributo precisa de dono, finalidade e justificativa. Campo opcional não deve ser coletado por padrão.
- **Limitação de finalidade:** impedir reutilização silenciosa para marketing, treinamento de IA, scoring ou analytics incompatível.
- **Defaults protetivos:** perfil, compartilhamento, indexação, telemetria e publicidade começam no nível menos exposto compatível com o serviço.
- **Acesso:** menor privilégio, MFA para funções sensíveis, autorização no servidor, revisões e acesso de suporte temporário.
- **Segregação por tenant:** toda consulta, cache, fila, arquivo, exportação, busca e job deve preservar contexto de tenant; testar IDOR e vazamento cruzado.
- **Logs:** excluir corpo, token, senha, cookie, documento, mensagem e payload pessoal por padrão; mascarar identificadores; limitar acesso e retenção.
- **Exportação:** autorização forte, escopo de tenant, formato seguro, expiração curta, trilha e prevenção de dados de terceiros.
- **Exclusão:** considerar banco, busca, cache, filas, arquivos, analytics, fornecedores e backups; documentar atrasos técnicos e conservação permitida.
- **Backups:** criptografar, restringir, fixar retenção, testar restauração e impedir que dado excluído retorne ao uso ativo sem reconciliação pós-restore.
- **Analytics:** preferir métricas agregadas; reduzir identificadores; controlar SDKs, cookies, sessão replay e envio de texto livre.
- **Integrações:** allowlist de campos, autenticação robusta, escopos mínimos, retries idempotentes, logs reduzidos e desligamento/exclusão testados.

### Contextos comuns de SaaS

| Contexto | Riscos de privacidade | Controles mínimos |
|---|---|---|
| IA | Prompt ou arquivo enviado ao provedor; treinamento secundário; saída com dado; decisão automatizada; vazamento entre tenants. | Finalidade e papel do provedor; opt-out/contrato quando aplicável; minimização; não treinar sem base e transparência; isolamento; retenção; revisão humana e contestação para decisões aplicáveis; RIPD conforme risco. |
| Pagamentos | Dados financeiros, antifraude, chargeback e cadeia de gateways. | Não armazenar dado de cartão desnecessário; tokenização pelo provedor; papéis e bases separados; acesso e logs mínimos; retenção fiscal/jurídica validada. |
| WhatsApp/API | Conteúdo livre, metadados, contatos, anexos e múltiplos provedores. | Aviso no canal; minimizar mensagens; controlar template/webhook; assinatura e replay; mídia privada; retenção; consentimento/base conforme finalidade; registro do provedor e país. |
| Frappe/ERPNext | DocTypes customizados, permissões por função/campo, exportações, arquivos, logs e dados financeiros/RH. | Classificar DocTypes/campos; Role Permission e User Permission; revisar `get_all`, `ignore_permissions` e relatórios; arquivos privados; retenção por DocType; auditoria por site/tenant. |
| Frappe Learning | Perfis, progresso, avaliações, notas, uploads e eventualmente crianças/adolescentes. | Papéis e visibilidade; minimização de perfil; arquivos privados; retenção acadêmica validada; tratamento de vulneráveis e consentimento específico quando juridicamente aplicável. |

## Terceiros e fornecedores

Nenhum fornecedor que acesse dado pessoal entra em produção sem registro e dono. A revisão deve cobrir cloud, e-mail, WhatsApp, pagamentos, analytics, suporte, observabilidade, IA, autenticação, storage, gateways e qualquer suboperador.

### Due diligence mínima

- Serviço, criticidade, papel real, instruções e finalidade.
- Categorias de dados/titulares, dados sensíveis e escala.
- Regiões de processamento, suporte remoto e transferências internacionais.
- Lista e processo de mudança de suboperadores.
- Segurança, segregação, identidade, criptografia, logs, backup e continuidade.
- Retenção, exportação, retorno, exclusão e encerramento do contrato.
- Prazos internos de notificação e informações para resposta a incidentes.
- Apoio a direitos, auditoria e RIPD.
- Uso para analytics, melhoria, publicidade ou treinamento de IA pelo fornecedor.
- Evidências independentes, limitações, histórico material e plano de saída.

Transferência internacional exige, além de base legal para o tratamento, mecanismo válido nos termos da LGPD e da Resolução CD/ANPD nº 19/2024. Região de cloud, acesso de suporte no exterior e suboperadores podem ser relevantes; a análise jurídica deve confirmar a caracterização e o mecanismo.

## Incidentes com dados pessoais

### Fluxo

1. **Triagem:** distinguir vulnerabilidade, suspeita e evento confirmado; identificar se há dado pessoal, sistemas, tenants e agentes envolvidos.
2. **Contenção:** cessar exposição, preservar continuidade e impedir destruição de evidência; rotacionar credenciais quando aplicável.
3. **Preservação:** manter linha do tempo, logs e artefatos em armazenamento restrito, com acesso e integridade controlados.
4. **Avaliação:** estimar categorias, sensibilidade, volume, grupos vulneráveis, autenticação/finanças/sigilo, consequências, facilidade de identificação e medidas existentes.
5. **Papéis:** operador informa o controlador sem demora injustificada e fornece dados necessários; o controlador decide comunicações obrigatórias.
6. **Comunicação:** quando o incidente confirmado puder acarretar risco ou dano relevante, aplicar a Resolução CD/ANPD nº 15/2024 e o procedimento oficial vigente; comunicar ANPD e titulares no prazo aplicável, em linguagem clara.
7. **Recuperação:** validar acesso, integridade, isolamento e correções antes de retomar operação normal.
8. **Lições aprendidas:** corrigir causa, atualizar riscos, contratos, testes, treinamento e controles; publicar apenas resumo sanitizado.

Na data desta pesquisa, a página oficial da ANPD informa prazo de três dias úteis para comunicação pelo controlador à ANPD e aos titulares, ressalvada legislação específica, e complementação fundamentada em vinte dias úteis quando a comunicação inicial não estiver completa. Em incidente real, validar imediatamente o texto consolidado e o marco inicial aplicável; não esperar a investigação terminar para acionar o fluxo jurídico.

O registro real do incidente, evidência forense, lista de titulares e comunicação individual ficam fora do Git. O repositório pode receber somente postmortem sanitizado, sem vetor explorável, dados pessoais ou detalhes internos sensíveis.

## Matriz LGPD prática para SaaS

Os exemplos são fictícios. “Base provável” é hipótese para triagem, nunca conclusão jurídica.

| Tipo de dado | Finalidade | Base provável | Origem e sistema | Acesso e compartilhamento | Retenção | Risco e controles | Evidência esperada | Dono |
|---|---|---|---|---|---|---|---|---|
| Nome e identificador de conta | Criar e administrar conta | Contrato; outra relação no B2B pode exigir análise | Titular/admin; IAM e banco do app | Suporte mínimo; provedor de autenticação | Vida da conta + período validado | Apropriação, enumeração; MFA, rate limit, tenant e masking | ROPA, teste de auth, política | Produto/IAM |
| E-mail profissional | Login, aviso operacional e suporte | Contrato ou legítimo interesse conforme relação/finalidade | Titular/cliente; IAM, CRM e suporte | E-mail e suporte | Por finalidade | Phishing e uso secundário; separação de marketing, redaction | Matriz de bases, preferências | Produto/CS |
| Conteúdo inserido pelo tenant | Prestar a funcionalidade contratada | Determinada pelo cliente controlador; SaaS tipicamente operador | Usuário; banco, arquivos e busca | Suboperadores necessários | Configuração/contrato validado | Vazamento cruzado e excesso; autorização, criptografia, export/delete | DPA, mapa, testes tenant | Cliente + Engenharia |
| Logs de acesso com IP e user ID pseudônimo | Segurança e diagnóstico | Legítimo interesse pode ser provável para dado não sensível, mediante teste | Plataforma; observabilidade | Segurança e provedor de logs | Curta e definida | Rastreamento e exposição; minimização, masking, RBAC, expiração | LIA, configuração, amostra sanitizada | Segurança/SRE |
| Dados de cobrança e documento fiscal | Faturar e cumprir deveres aplicáveis | Contrato e obrigação legal/regulatória | Cliente/gateway/ERP | Financeiro, gateway, contabilidade | Conforme norma validada | Fraude e identidade; tokenização, acesso, segregação | Matriz, contrato, retenção | Financeiro/Jurídico |
| Preferência de cookies não essenciais | Analytics ou personalização opcional | Consentimento pode ser aplicável | Navegador; CMP e analytics | Provedor de analytics | Duração informada | Tracking sem escolha; bloqueio prévio, granularidade e revogação | Inventário, teste do banner | Marketing/Produto |
| Mensagem de suporte | Resolver solicitação | Contrato ou legítimo interesse conforme conteúdo/relação | Titular; help desk | Suporte e fornecedor | Prazo por categoria | Texto livre com dado sensível; aviso, redaction, acesso e descarte | Política, teste, contrato | Suporte |
| Prompt enviado a IA | Funcionalidade assistida | Depende da finalidade e papel; validar antes do uso | Usuário; app e provedor de IA | Provedor/suboperadores | Mínima e contratada | Treinamento secundário, memorization, vazamento; filtro, isolamento, contrato, opt-out | RIPD/LIA, testes, DPA | Produto/IA/Privacidade |
| Progresso e avaliação em LMS | Entregar curso e registrar desempenho | Contrato/relação educacional; validar vulneráveis e contexto | Aluno/instrutor; Frappe Learning | Cliente, instrutores autorizados | Política acadêmica validada | Perfilamento, constrangimento; acesso por papel, tenant, export e correção | ROPA, matriz de permissão | Cliente/Produto |
| Contato e conteúdo via WhatsApp | Atendimento ou notificação solicitada | Contrato, consentimento ou legítimo interesse conforme fluxo | Titular; BSP, webhook e CRM | Meta/BSP e suporte | Curta e definida | Exposição de conversa e país; minimização, templates, webhook seguro, exclusão | Registro do fornecedor, fluxo | Atendimento/Integrações |

## Checklist de auditoria LGPD para SaaS

### Governança e transparência

- [ ] Papéis de controlador, operador e suboperador estão definidos por tratamento, não apenas por contrato genérico.
- [ ] Há encarregado ou decisão documentada sobre dispensa aplicável, com canal efetivo.
- [ ] ROPA e mapa de dados cobrem produção, suporte, logs, backups, analytics, IA e integrações.
- [ ] Cada finalidade tem base provável, necessidade, validação jurídica e data de revisão.
- [ ] Avisos, termos, cookies e contratos refletem o comportamento real do produto.
- [ ] Mudanças materiais acionam privacy review e atualização documental.

### Produto e engenharia

- [ ] Campos e eventos são mínimos e defaults são protetivos.
- [ ] Autorização e segregação por tenant foram testadas em API, jobs, arquivos, cache, busca e exportação.
- [ ] Logs não registram tokens, cookies, payloads ou conteúdo pessoal desnecessário.
- [ ] Exportação, correção, bloqueio e exclusão funcionam ponta a ponta.
- [ ] Retenção e descarte são configurados e testados, inclusive em fornecedores.
- [ ] Backups têm retenção, acesso, restore testado e reconciliação pós-restauração.
- [ ] Desenvolvimento/homologação usam dados sintéticos ou exceção formal controlada.
- [ ] Decisões automatizadas e IA possuem inventário, explicabilidade aplicável, revisão e contestação.

### Terceiros e operação

- [ ] Todo fornecedor com dado pessoal tem dono, avaliação, contrato e suboperadores registrados.
- [ ] Transferências internacionais e mecanismos foram validados.
- [ ] Acesso de suporte é temporário, auditável e limitado ao tenant/caso.
- [ ] O processo de direitos foi testado sem revelar dados de terceiros.
- [ ] O playbook de incidente inclui operador, controlador, encarregado, jurídico e comunicação.
- [ ] Evidências reais ficam em repositório restrito; Git contém apenas material sanitizado.

## Critérios de bloqueio de release por privacidade

Bloquear o release quando houver, no escopo da mudança:

- coleta ou uso de dado pessoal sem finalidade, dono ou base provável registrada para validação;
- dado sensível, criança/adolescente, biometria, localização precisa ou alto risco sem avaliação e aprovação aplicáveis;
- ausência de segregação por tenant ou falha que exponha dado entre clientes;
- segredo, cookie, mensagem, documento ou payload pessoal em log/artifact acessível indevidamente;
- fornecedor recebendo dados sem avaliação mínima, contrato/papel ou transferência internacional tratada;
- consentimento usado sem escolha efetiva, prova ou revogação quando ele é a hipótese pretendida;
- impossibilidade conhecida de corrigir, exportar, bloquear ou excluir em fluxo material, sem fundamento e plano aprovados;
- retenção indefinida ou exclusão que não alcança sistemas ativos e fornecedores críticos;
- IA usando dados para finalidade secundária ou treinamento não aprovado;
- incidente ativo sem contenção, avaliação e autorização formal de retorno;
- aviso de privacidade ou contrato materialmente incompatível com o comportamento lançado.

Achado menor pode virar backlog com dono e prazo. Exceção a gate material exige risco documentado, validação de Privacidade/Jurídico, aprovação do responsável pelo negócio e data de expiração; não pode legitimar violação conhecida.

## Evidências e Git

### Pode ficar no Git

- políticas, checklists, matrizes e procedimentos genéricos;
- ROPA e mapas somente vazios, fictícios ou sanitizados;
- exemplos com identificadores como `tenant-demo`, `user-0001` e `example.invalid`;
- testes automatizados com dados sintéticos;
- decisões arquiteturais e resumos de auditoria sem dado pessoal ou detalhe explorável;
- relatórios revisados em `reports/sanitized/`.

### Deve ficar fora do Git

- pedidos e respostas reais de titulares;
- inventários preenchidos com pessoas, clientes, URLs internas ou detalhes confidenciais;
- contratos assinados, comunicações à ANPD/titulares e pareceres restritos;
- registros e evidências reais de incidentes, forense, logs, dumps e backups;
- exports, screenshots sem redaction, tickets de suporte e conversas;
- dados de produção, chaves, cookies, tokens, credenciais, `site_config.json` e estados de infraestrutura;
- relatórios crus de scanners, que devem permanecer em `reports/raw/` ignorado pelo Git.

### Como documentar sem expor dados reais

1. Registrar categoria e contagem aproximada, não valores ou lista de titulares.
2. Substituir identificadores por códigos aleatórios sem tabela de reversão no repositório.
3. Usar domínios reservados, nomes explicitamente fictícios e timestamps arredondados quando suficiente.
4. Remover query strings, headers, corpos, caminhos internos e IDs correlacionáveis.
5. Separar evidência restrita de índice sanitizado; o Git aponta o tipo, custodiante e data, não o segredo/local sensível.
6. Revisar redaction por segunda pessoa e verificar metadados de imagens/PDFs.
7. Registrar hash somente quando não permitir inferência perigosa e quando houver finalidade clara de integridade.

## Orientação técnica versus validação jurídica

| Orientação técnica e de governança | Validação jurídica necessária |
|---|---|
| Descobrir dados, reduzir campos, testar tenant, controlar acesso, logs, retenção e fornecedores. | Determinar papel jurídico por tratamento e obrigações contratuais. |
| Implementar canal, busca, exportação, correção e exclusão. | Definir escopo, exceções, prazo e conteúdo da resposta ao titular. |
| Produzir fatos, riscos e controles para LIA/RIPD. | Confirmar base legal, balanceamento, alto risco e necessidade formal do RIPD. |
| Preservar incidente e estimar impacto técnico. | Decidir comunicação obrigatória, conteúdo, destinatários e prazos no caso concreto. |
| Mapear regiões e acessos internacionais. | Confirmar transferência internacional e mecanismo válido. |
| Criar avisos coerentes com telemetria e interfaces. | Aprovar redação, consentimento, termos, DPA e obrigações setoriais. |

Quando houver incerteza, registrar a questão, responsável, data, tratamento provisório conservador e condição para decisão. Não converter interpretação técnica em afirmação de conformidade legal.

## Cadência e métricas

- Revisão por mudança: nova coleta, integração, país, finalidade, IA, decisão automatizada ou categoria sensível.
- Revisão trimestral: fornecedores críticos, acessos de suporte, falhas de retenção e métricas de direitos/incidentes.
- Revisão semestral: gap assessment enquanto o programa muda rapidamente.
- Revisão anual: ROPA, bases, avisos, contratos, RIPDs, exercícios e eficácia geral.

Métricas úteis: operações inventariadas; tratamentos sem dono/base revisada; fornecedores pendentes; tempo e falha de direitos; exclusões incompletas; acessos de suporte; incidentes por causa; releases bloqueados; RIPDs/LIA vencidos. Métrica não substitui análise qualitativa nem deve incentivar ocultação de incidentes.

## Referências

As fontes oficiais e as incertezas regulatórias usadas neste chunk estão registradas em `research/sources/chunk-09.md`.
