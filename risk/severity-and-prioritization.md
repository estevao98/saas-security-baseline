# Severidade, Priorizacao e Tratamento de Vulnerabilidades

## Objetivo e aplicacao

Este documento define um metodo interno, pratico e revisavel para classificar, priorizar, tratar e retestar achados em SaaS. Aplica-se a aplicacao, API, Frappe/Python, dependencias, containers, infraestrutura como codigo, CI/CD, privacidade, acessibilidade, incidentes e fornecedores.

As categorias e prazos abaixo sao **baseline interno**, nao formula universal, obrigacao regulatoria ou substituto de contrato. Contexto do produto, legislacao, compromisso com clientes, ferramenta, apetite de risco e capacidade operacional podem exigir decisao mais restritiva.

## Principios obrigatorios

- Classificar o **cenario validado**, nao copiar cegamente a severidade da ferramenta.
- Separar severidade tecnica, risco de negocio e prioridade operacional.
- Considerar isolamento multi-tenant, dados pessoais, fluxo critico e exposicao publica desde a triagem.
- Tratar exploracao ativa, incidente ativo, segredo confirmado e quebra de autorizacao como fatos que exigem resposta imediata.
- Usar CVSS, KEV, SSVC, EPSS e OWASP como entradas complementares, nunca como decisor isolado.
- Documentar incertezas, premissas, controles compensatorios e motivo de qualquer reclassificacao.
- Manter evidencia crua fora do Git. Issues, PRs e resumos versionados devem ser sanitizados conforme `docs/evidence-and-reporting-policy.md`.
- Reavaliar severidade e prioridade quando o ativo, exposicao, explorabilidade, alcance ou controle mudar.

## Termos que nao devem ser confundidos

| Termo | Significado operacional |
|---|---|
| Severidade | Magnitude intrinseca do dano plausivel no cenario validado, considerando impacto e condicoes de exploracao. |
| Risco | Efeito da incerteza sobre objetivos: combina cenario, probabilidade, impacto, ativos, ameacas e controles no contexto do SaaS. |
| Prioridade | Ordem de tratamento definida pelo risco, urgencia, exploracao, compromissos, dependencias, esforco e capacidade. |
| Urgencia | Quanto tempo existe para agir antes de dano, exploracao, release, prazo contratual ou perda de controle. |
| Explorabilidade | Quao viavel e atingir a condicao vulneravel, incluindo acesso, pre-requisitos, interacao, complexidade e disponibilidade de meios. |
| Impacto | Consequencia tecnica e de negocio sobre confidencialidade, integridade, disponibilidade, privacidade, acessibilidade, financeiro e reputacao. |
| Criticidade do ativo | Importancia do servico, dado ou processo para clientes, operacao, receita, obrigacoes e continuidade. Nao e a severidade do finding. |

Uma vulnerabilidade tecnicamente alta pode receber prioridade menor quando nao e alcancavel e ha controle forte comprovado. Um achado medio pode receber prioridade imediata por afetar muitos tenants, bloquear um fluxo essencial ou compor uma cadeia de ataque. Toda divergencia deve ser justificada.

## Niveis de severidade

### Critico

Comprometimento plausivel ou confirmado com dano extremo, pouca margem de contencao ou alcance amplo.

| Dimensao | Indicador tipico |
|---|---|
| Impacto | Controle relevante do sistema, quebra material de confidencialidade/integridade, fraude grave ou interrupcao generalizada. |
| Probabilidade e exploracao | Explorada, trivial nas condicoes reais, ou com pre-requisitos ja presentes. Exploit conhecido/KEV pode elevar urgencia. |
| Exposicao | Internet, cadeia de fornecimento, CI/CD privilegiado ou superficie compartilhada. |
| Dados e LGPD | Exposicao/alteracao ampla de dados pessoais, dados sensiveis ou incapacidade de conter incidente; exige acionar Privacidade/Juridico e o plano de incidentes. |
| Multi-tenant | Quebra confirmada ou plausivel de isolamento entre tenants/sites/clientes. |
| Acessibilidade | Excepcionalmente, barreira sistemica que torna todos os caminhos de um servico essencial indisponiveis sem alternativa e produz dano imediato; normalmente a classificacao sera alta. |
| Disponibilidade | Indisponibilidade ampla, perda irrecuperavel ou controle externo de recurso essencial. |
| Financeiro/reputacional | Fraude, perdas materiais, interrupcao de receita, notificacao/contencao ampla ou perda grave de confianca. |

Exemplos ficticios e nao exploraveis: segredo confirmado em codigo ou artifact; chave de API ativa exposta; metodo convidado alterando registros sem autorizacao; uso privilegiado de `ignore_permissions` sem validacao equivalente; injecao SQL confirmada em fluxo alcancavel; retorno de dados privados sem controle de acesso; dependencia alcancavel com vulnerabilidade critica e exploracao conhecida; bypass de autenticacao; webhook financeiro sem autenticidade quando ela e necessaria; RCE; isolamento entre tenants rompido.

### Alto

Dano material a um cliente, fluxo critico ou conjunto relevante de usuarios, com exploracao realista ou controle insuficiente.

| Dimensao | Indicador tipico |
|---|---|
| Impacto | Acesso ou alteracao indevida relevante, tomada de conta limitada, fraude localizada ou perda importante de funcao. |
| Probabilidade e exploracao | Caminho praticavel, embora possa exigir conta, estado ou conhecimento especifico. |
| Exposicao | Superficie publica ou autenticada amplamente acessivel; componente distribuido em producao. |
| Dados e LGPD | Dados pessoais de escopo relevante em logs, exportacoes ou autorizacao falha; avaliar risco aos titulares. |
| Multi-tenant | Um tenant pode afetar outro em funcao limitada, ou a falha se repete em muitos tenants sem cruzamento direto. |
| Acessibilidade | Barreira bloqueia fluxo critico para grupo de usuarios e nao ha alternativa equivalente. |
| Disponibilidade | Interrupcao relevante de funcao essencial ou degradacao ampla recuperavel. |
| Financeiro/reputacional | Perda material localizada, violacao contratual plausivel ou impacto importante na confianca. |

Exemplos ficticios e nao exploraveis: falta de rate limit em operacao sensivel com abuso plausivel; logs contendo dados pessoais; permissao excessiva em funcao relevante; token com validade excessiva e escopo amplo; upload inseguro com impacto material; falta de validacao em entrada critica; falha em reset de senha ou sessao; IDOR relevante; XSS com impacto material; dependencia alta, alcancavel e com exploit conhecido.

### Medio

Dano limitado, exploracao condicionada ou defesa em profundidade ausente sem demonstracao de comprometimento material imediato.

| Dimensao | Indicador tipico |
|---|---|
| Impacto | Vazamento restrito de informacao, reducao de defesa, erro operacional localizado ou barreira relevante com alternativa. |
| Probabilidade e exploracao | Requer combinacao de condicoes, privilegio, interacao ou conhecimento nao trivial. |
| Exposicao | Superficie interna/autenticada ou publica com impacto limitado. |
| Dados e LGPD | Metadado pessoal limitado, minimizacao inadequada ou controle incompleto sem alto risco demonstrado. |
| Multi-tenant | Afeta configuracao comum, mas sem evidencia de cruzamento de dados/acoes. |
| Acessibilidade | Barreira importante fora de fluxo critico, ou em fluxo critico com alternativa equivalente funcional. |
| Disponibilidade | Degradacao parcial, contornavel e de recuperacao simples. |
| Financeiro/reputacional | Custo operacional ou insatisfacao limitada, sem perda material imediata demonstrada. |

Exemplos ficticios e nao exploraveis: erro mostra detalhes internos sem segredo; headers de seguranca ausentes com risco contextual; dependencia desatualizada sem vulnerabilidade critica aplicavel; falha de acessibilidade importante; documentacao de seguranca incompleta que afeta execucao; configuracao de sessao aquem do baseline sem caminho material confirmado.

### Baixo

Impacto pequeno, exploracao improvavel ou oportunidade de hardening com risco residual limitado.

| Dimensao | Indicador tipico |
|---|---|
| Impacto | Efeito minimo e reversivel; nenhuma exposicao material demonstrada. |
| Probabilidade e exploracao | Condicoes pouco plausiveis ou dependencia de cadeia improvavel. |
| Exposicao | Interna, restrita ou protegida por controles independentes verificados. |
| Dados/LGPD/multi-tenant | Sem dado pessoal material e sem cruzamento de tenant demonstrado. |
| Acessibilidade | Inconsistencia menor que nao impede compreender, operar ou concluir a tarefa. |
| Disponibilidade | Sem interrupcao relevante. |
| Financeiro/reputacional | Custo e percepcao baixos. |

Exemplos ficticios e nao exploraveis: warning sem impacto claro apos triagem; documento desatualizado sem decisao incorreta atual; configuracao nao ideal sem risco imediato; melhoria adicional de hardening.

### Informativo

Observacao, inventario ou melhoria sem risco demonstrado. Nao deve inflar contagem de vulnerabilidades nem receber SLA de remediacao por severidade. Pode virar tarefa de qualidade ou ser reclassificada quando surgir impacto.

Exemplos: oportunidade de padronizacao; componente fora de uso identificado para remocao planejada; nota de cobertura de teste sem falha conhecida.

## Matriz impacto x probabilidade

Use quatro niveis qualitativos. Registre a justificativa; nao converta a tabela em precisao matematica artificial.

| Impacto \ Probabilidade | Improvavel | Possivel | Provavel | Observada/iminente |
|---|---|---|---|---|
| Extremo | Alto | Alto | Critico | Critico |
| Material | Medio | Alto | Alto | Critico |
| Moderado | Baixo | Medio | Medio | Alto |
| Pequeno | Baixo | Baixo | Medio | Medio |

### Como avaliar impacto

| Dimensao | Pergunta de triagem |
|---|---|
| Tecnico | Ha perda de confidencialidade, integridade, disponibilidade, autenticidade, autorizacao ou rastreabilidade? |
| Negocio | Afeta receita, contrato, operacao, continuidade, suporte, confianca ou estrategia? |
| Dados/LGPD | Quais categorias, titulares, volume, finalidade e risco/dano relevante podem estar envolvidos? |
| Multi-tenant | Um usuario/tenant pode observar ou influenciar outro? Quantos clientes e variantes compartilham o componente? |
| Acessibilidade | A barreira impede tarefa essencial, para quais usuarios, e existe alternativa equivalente? |
| Financeiro | Permite fraude, cobranca incorreta, perda de receita, custo de resposta ou penalidade contratual plausivel? |
| Reputacional | O evento exige comunicacao, afeta confianca ou revela falha sistemica? |

### Como avaliar probabilidade

| Fator | Aumenta prioridade quando... | Cuidado |
|---|---|---|
| Facilidade de exploracao | requer poucos pre-requisitos nas condicoes reais | scanner nao prova explorabilidade sozinho |
| Exposicao publica | componente vulneravel esta acessivel pela internet ou distribuido | confirmar rota, versao e configuracao |
| Exploit conhecido | ha metodo publico confiavel ou exploracao observada | nao armazenar PoC ofensiva no Git |
| CISA KEV | o CVE esta no catalogo e e aplicavel ao ativo | KEV nao classifica todo risco e nao substitui escopo |
| EPSS | probabilidade estimada e alta no modelo vigente | aplica-se a CVEs publicados; nao mede impacto nem falha propria |
| Capacidade do agente | acesso, privilegio e motivacao sao plausiveis | evitar suposicoes sem evidencia |
| Deteccao | exploracao pode ocorrer sem alerta ou resposta tempestiva | deteccao reduz janela/dano, nao elimina vulnerabilidade |
| Controles compensatorios | controles independentes bloqueiam ou limitam o cenario e foram testados | controle apenas declarado nao reduz classificacao |
| Escopo | muitos tenants, clientes, regioes ou artefatos compartilham a falha | amostragem insuficiente deve ser declarada |

## Metodo de classificacao e priorizacao

1. Confirmar o finding, ativo, versao, ambiente, alcance e evidencia minima.
2. Descrever um cenario seguro: condicao, ameaca plausivel, impacto e controles, sem payload ou detalhe exploravel.
3. Avaliar impacto tecnico e de negocio separadamente.
4. Avaliar probabilidade realista, exposicao, pre-requisitos, exploracao conhecida e capacidade de deteccao.
5. Obter severidade inicial na matriz impacto x probabilidade.
6. Aplicar modificadores contextuais e registrar a justificativa.
7. Definir prioridade, SLA, gate de release, owner, tratamento e reteste.
8. Submeter critico, alto em fluxo critico, privacidade material, acessibilidade bloqueante e incidente a revisores dos dominios aplicaveis.

### Modificadores contextuais

Podem elevar severidade ou prioridade: incidente/exploracao ativa; KEV aplicavel; segredo ativo; RCE, injecao, auth bypass ou autorizacao material; alcance multi-tenant; dado pessoal/sensivel; fluxo financeiro, autenticacao ou administracao; muitos clientes; baixa deteccao; release iminente; reincidencia; controle expirado.

Podem reduzir prioridade, raramente a severidade: codigo nao implantado; componente comprovadamente nao alcancavel; controle compensatorio independente, testado e monitorado; ativo descontinuado antes da exposicao. Reducao exige evidencia e data de revisao.

Esforco de correcao **nao reduz severidade**. Pode influenciar sequenciamento, mitigacao intermediaria e planejamento.

## Uso adequado das referencias

| Referencia | Uso adequado | Nao usar como |
|---|---|---|
| CVSS v4.0 | Comunicar caracteristicas tecnicas e ajustar metricas de ameaca/ambiente quando houver dados. Registrar vetor e versao da especificacao usada. | Risco de negocio, SLA automatico ou prova de alcance/exploracao. |
| CISA KEV | Sinal forte de exploracao no mundo real para CVE aplicavel; aumenta urgencia e exige verificar produto/versao. | Lista completa de vulnerabilidades importantes ou severidade autonoma. |
| SSVC | Estruturar decisao contextual com estado de exploracao, impacto tecnico, missao/bem-estar e exposicao, usando arvore e perfil aprovados. | Numero intercambiavel com CVSS ou resultado sem registrar versao/perfil/decisoes. |
| EPSS | Priorizar CVEs pela probabilidade estimada de exploracao nos proximos 30 dias; registrar score, percentil e data. | Impacto, certeza de ataque, priorizacao de falhas sem CVE ou substituto de KEV/contexto. |
| OWASP | Apoiar avaliacao de probabilidade e impacto em aplicacoes e APIs; mapear classes e controles. | Score universal ou evidencia de que toda ocorrencia de uma categoria tem mesma severidade. |
| Contexto de negocio | Determinar ativos, tenants, dados, fluxos, contratos, tolerancia, impacto e capacidade de resposta. | Justificativa informal para ignorar exploracao ou dano confirmado. |

O CVSS v4.0 define grupos Base, Threat, Environmental e Supplemental. O score Base mede severidade, nao risco. Se a ferramenta ainda usar CVSS v3.1, registrar essa versao e nao comparar numeros de versoes diferentes como se fossem equivalentes.

KEV e EPSS aplicam-se principalmente a vulnerabilidades com CVE. Achados de logica, autorizacao, LGPD, acessibilidade e configuracao propria precisam de contexto e evidencia local.

## Matriz de SLA interno

Os prazos contam da **confirmacao e notificacao ao owner**, salvo incidente ativo, que inicia resposta imediatamente. Contratos, regulacao, KEV aplicavel, exposicao ou impacto podem exigir prazo menor.

| Nivel | Triagem/owner | Contencao ou plano aprovado | Correcao-alvo | Reteste |
|---|---|---|---|---|
| Critico | Imediato, objetivo interno ate 4 horas | Ate 24 horas | Ate 72 horas ou antes do release | Antes de liberar; ate 24 horas apos correcao emergencial |
| Alto | Ate 1 dia util | Ate 3 dias corridos | Ate 15 dias corridos | Ate 3 dias uteis apos disponibilidade da correcao |
| Medio | Ate 5 dias uteis | Plano quando necessario | Ate 60 dias corridos | Ate 10 dias uteis apos correcao |
| Baixo | Ate 10 dias uteis | Normalmente backlog | Ate 120 dias ou ciclo trimestral | No ciclo de validacao aplicavel |
| Informativo | Revisao no ciclo normal | Nao aplicavel | Sem SLA de vulnerabilidade | Validacao se virar mudanca |

### Excecoes, reabertura e vencimento

- Incidente ativo, segredo confirmado, exploracao observada e quebra multi-tenant ignoram a fila normal e acionam resposta/contencao.
- SLA pode ser menor por contrato, risco aos titulares, prazo regulatorio aplicavel, release ou decisao executiva.
- Aceite ou mitigacao nao encerram o finding sem criterio e evidencia; mantem-se o risco residual rastreado.
- Reteste falho, regressao, controle expirado, aumento de exposicao ou nova evidencia reabrem o finding e recalculam o SLA.
- Aceite expira na data aprovada, na mudanca material ou no gatilho definido, o que ocorrer primeiro.
- Excecao de prazo exige owner, motivo, risco residual, controle, aprovador, nova data e monitoramento. Nao e renovacao automatica.

## Criterios de bloqueio de release

Bloquear merge/release quando aplicavel e confirmado:

- vulnerabilidade critica aberta;
- alto risco em autenticacao, autorizacao, pagamento, administracao, exportacao, exclusao ou outro fluxo critico;
- segredo ou credencial real exposta, ate revogacao/rotacao, investigacao e contencao;
- exposicao material de dado pessoal ou risco relevante nao avaliado pelos responsaveis;
- quebra de isolamento multi-tenant;
- RCE, injecao SQL, auth bypass ou autorizacao/IDOR material alcancavel;
- XSS com impacto material, como acao privilegiada ou exposicao relevante;
- dependencia implantada e alcancavel com exploit conhecido, especialmente KEV aplicavel;
- falha de CI/CD que exponha segredo, permita execucao nao confiavel com privilegio ou invalide gate obrigatorio;
- falha de acessibilidade que bloqueie fluxo critico sem alternativa equivalente;
- incidente ativo relacionado ao artefato, ambiente ou release;
- scanner/gate obrigatorio nao executado ou evidencia insuficiente para afirmar conformidade;
- excecao ou aceite expirado.

Um rotulo automatico critico/alto sem validacao pode bloquear a decisao ate a triagem, mas nao deve ser apresentado como fato confirmado. A liberacao exige correcao e reteste ou, quando permitido, excecao formal pela autoridade definida.

## Tratamento

| Decisao | Quando usar | Requisito minimo |
|---|---|---|
| Corrigir | Remover causa ou reduzir o risco por mudanca definitiva. | Criterio testavel, owner, prazo, teste de regressao e reteste. |
| Mitigar | Reduzir probabilidade/impacto enquanto a correcao nao esta pronta. | Controle independente, evidencia, monitoramento e expiracao. |
| Aceitar | Risco residual esta dentro da autoridade/apetite e nao ha proibicao aplicavel. | Registro formal, aprovador competente, prazo, controles e revalidacao. |
| Transferir | Contrato, seguro ou fornecedor assume parte das consequencias/operacao. | Responsabilidades verificadas; risco nao desaparece nem se transfere integralmente. |
| Evitar | Remover funcao, integracao, ativo ou exposicao que cria o risco. | Confirmar desativacao e ausencia de dependencia residual. |
| Monitorar | Incerteza ou risco baixo exige observacao antes de outra decisao. | Sinal, frequencia, owner, limite de acao e data de revisao. |
| Falso positivo | Condicao reportada nao existe ou nao e aplicavel no escopo validado. | Justificativa tecnica, evidencia segura, aprovador, escopo e gatilho de reabertura. |

## Aceite formal de risco

### Quando pode ser permitido

- risco residual dentro do apetite e da autoridade do aprovador;
- correcao imediata e desproporcional, com controle compensatorio efetivo e prazo definido;
- dependencia de fornecedor com mitigacao, monitoramento e plano de saida;
- achado baixo/medio cuja remediacao sera feita em ciclo posterior sem violar obrigacao aplicavel.

### Quando nao deve ser permitido

- para encerrar incidente ativo sem contencao;
- para manter segredo ativo exposto, quebra multi-tenant ou acesso nao autorizado material;
- para ignorar exploracao confirmada, RCE, injecao ou auth bypass alcancavel sem controle efetivo;
- para legitimar tratamento de dados sabidamente ilicito ou descumprimento aplicavel;
- para manter barreira que bloqueia fluxo essencial sem alternativa viavel;
- por falta de owner, evidencia, autoridade, prazo ou capacidade de monitoramento;
- como aceite permanente ou renovacao automatica.

### Campos minimos do registro

| Campo | Conteudo |
|---|---|
| IDs e titulo seguro | Identificador opaco e descricao sem vetor exploravel. |
| Escopo | Produto, componente, ambientes, releases e tenants afetados em nivel seguro. |
| Cenario e classificacao | Condicao, impacto, probabilidade, severidade, prioridade e metodo. |
| Evidencia | Referencias opacas; originais em armazenamento restrito. |
| Decisao e justificativa | Por que aceitar, alternativas avaliadas e custo/beneficio sem minimizar o dano. |
| Controles compensatorios | Controle, teste, monitoramento, owner e limite de falha. |
| Risco residual | Impacto/probabilidade apos os controles e incertezas restantes. |
| Owner e aprovadores | Produto/engenharia e autoridade de Seguranca; incluir Privacidade, Acessibilidade, Juridico ou Executivo conforme dominio. |
| Prazo | Inicio, expiracao, proxima revisao e plano de remediacao/saida. |
| Gatilhos | Mudanca de exposicao, KEV/exploit, incidente, novo tenant, falha de controle, release ou contrato. |
| Revalidacao | Evidencia e decisao antes do vencimento; sem aprovacao, volta a aberto. |

Critico requer aprovacao executiva e de Seguranca, alem dos dominios afetados, e somente pode ser excepcional, temporario e com contencao comprovada. Alguns cenarios acima permanecem inaceitaveis mesmo com essa autoridade.

## Gestao segura de issues e backlog

| Campo | Regra |
|---|---|
| Titulo | Resultado/controle abstrato, por exemplo `Reforcar autorizacao em fluxo administrativo`. Nao citar endpoint, cliente, segredo ou vetor. |
| Descricao | Condicao sanitizada, impacto, escopo generalizado, criterio de aceite e referencia restrita. |
| Labels | `security`, categoria (`sast`, `sca`, `privacy`, `accessibility`), severidade, prioridade, status e `release-blocker` quando aplicavel. |
| Owner | Papel/equipe responsavel com autoridade e prazo. |
| Prazo | Derivado do SLA, contrato, release e risco; registrar excecao separadamente. |
| Evidencia | ID opaco. Nao anexar logs, payload, request/response, dado pessoal ou relatorio cru. |
| Reteste | Metodo seguro, responsavel independente quando necessario, resultado e evidencia de regressao. |
| Release | Versao afetada/corrigida em identificacao nao sensivel; gate e decisao Go/No-Go. |

### Do finding ao backlog

1. Triar duplicidade, aplicabilidade e falso positivo.
2. Criar um item por resultado de seguranca verificavel; agrupar apenas quando causa, owner e correcao forem comuns.
3. Vincular dependencias, risco aceito, incidente e release por IDs, sem copiar evidencia sensivel.
4. Ordenar por prioridade, nao apenas por score: incidente/KEV/segredo/multi-tenant, bloqueadores, altos alcancaveis, medios acumulados e hardening.
5. Definir criterio de aceite e teste antes da implementacao.
6. Fechar somente apos evidencia de correcao e reteste; manter risco residual separado quando houver.

## Matriz por tipo de achado

| Tipo | Fatores que mais pesam | Gate tipico |
|---|---|---|
| SAST | Alcance, entrada controlavel, sink, autorizacao, linguagem/framework e validacao manual. | Critico/alto confirmado e alcancavel bloqueia. |
| DAST | Ambiente autorizado, reproducibilidade segura, autenticacao, dado retornado e impacto no fluxo. | Exposicao material confirmada bloqueia. |
| SCA | Produto/versao, alcance, fix disponivel, exploit/KEV, EPSS, exposicao e controle. | KEV/exploit aplicavel ou critico/alto alcancavel bloqueia conforme contexto. |
| Secrets | Validade, escopo, privilegio, historico, logs/artifacts e uso observado. | Segredo confirmado bloqueia ate revogacao/rotacao e contencao. |
| Containers | Imagem/digest implantado, pacote alcancavel, usuario, capacidade, base e runtime. | Critico/alto alcancavel ou configuracao privilegiada material bloqueia. |
| IaC | Estado real, exposicao, identidade, rede, armazenamento, criptografia e blast radius. | Exposicao publica/material ou privilegio excessivo critico bloqueia. |
| GitHub Actions | Fonte nao confiavel, permissions, secrets, actions, runner, artifact e branch gate. | Exposicao de segredo ou execucao privilegiada nao confiavel bloqueia. |
| Frappe/Python | Guest, permissoes, `ignore_permissions`, SQL, sites/tenants, jobs, arquivos e hooks. | Auth bypass, injecao, dado privado ou quebra de tenant bloqueia. |
| LGPD | Categoria/volume, titulares, finalidade, base, direitos, terceiros, retencao e risco/dano. | Tratamento material sem controle/avaliacao aplicavel ou incidente ativo bloqueia. |
| Acessibilidade | Tarefa, criterio aplicavel, usuarios afetados, tecnologia assistiva e alternativa. | Barreira em fluxo critico sem alternativa equivalente bloqueia. |
| Incidentes | Exploracao, persistencia, escopo, contencao, dados, tenants e servico. | Incidente ativo relacionado ao release bloqueia ate decisao do comando do incidente. |
| Fornecedores | Servico/dado, acesso, suboperadores, dependencia, incidente, contrato e saida. | Risco material sem controle contratual/tecnico ou fornecedor comprometido bloqueia integracao/release. |

## Exemplos ficticios de classificacao

| Cenario seguro | Severidade inicial | Prioridade | Justificativa resumida |
|---|---|---|---|
| Segredo ficticio detectado em artifact de CI e confirmado como ativo | Critico | P0/imediata | Exposicao direta; revogar, investigar e conter antes do release. |
| Falha de autorizacao permite que conta comum veja registro de outro tenant | Critico | P0/imediata | Quebra multi-tenant e dado privado. |
| Dependencia em producao consta no KEV, e o componente vulneravel e alcancavel | Critico/Alto | P0/P1 | Exploracao conhecida e aplicabilidade confirmada; impacto local define o nivel final. |
| Endpoint sensivel nao tem rate limit, mas exige conta e ha monitoramento parcial | Alto | P1 | Abuso realista; controles reduzem, mas nao eliminam, probabilidade. |
| Log de suporte registra identificador pessoal completo sem necessidade | Alto/Medio | P1/P2 | Nivel depende de volume, acesso, retencao e sensibilidade; exige Privacidade. |
| Header de defesa em profundidade ausente, sem cenario material isolado | Medio | P2 | Reduz defesa, mas impacto depende de outras falhas. |
| Fluxo de pagamento nao pode ser concluido por teclado e nao ha alternativa | Alto | P0/P1 | Barreira em fluxo critico bloqueia release. |
| Regra SAST aponta funcao perigosa, mas validacao prova valor constante e nao controlavel | Falso positivo | Encerrar com revisao | Sem cenario aplicavel; registrar evidencia e gatilho de reabertura. |
| Documento interno cita responsavel antigo, sem afetar controle atual | Baixo | P3 | Manutencao documental sem risco material imediato. |

`P0` a `P3` sao filas operacionais internas: P0 resposta imediata/bloqueio, P1 proxima correcao prioritaria, P2 ciclo planejado, P3 backlog. Nao substituem severidade nem SLA.

## Checklist de triagem

- [ ] Finding, fonte, data, commit/release e ambiente foram confirmados?
- [ ] Duplicidade, aplicabilidade e falso positivo foram avaliados?
- [ ] A descricao esta sanitizada e a evidencia crua permanece fora do Git?
- [ ] Ativo, fluxo, exposicao publica e criticidade foram identificados?
- [ ] Impactos tecnico, negocio, disponibilidade, financeiro e reputacional foram avaliados?
- [ ] Dados pessoais, titulares, LGPD e necessidade de Privacidade/Juridico foram avaliados?
- [ ] Alcance multi-tenant e numero de clientes/variantes foram avaliados?
- [ ] Impacto de acessibilidade em tarefa critica e alternativa foram avaliados?
- [ ] Pre-requisitos, explorabilidade, exploit conhecido, KEV e EPSS aplicaveis foram verificados?
- [ ] CVSS/SSVC foram usados com versao, perfil e limites registrados, quando aplicaveis?
- [ ] Controles compensatorios e deteccao foram testados, nao apenas declarados?
- [ ] Severidade, prioridade, SLA, gate, owner e tratamento foram definidos?
- [ ] Incidente ativo ou segredo confirmado acionou o processo apropriado?

## Checklist de reclassificacao

- [ ] Ha nova evidencia de exploracao, KEV, EPSS, exploit ou incidente?
- [ ] Exposicao, alcance, tenants, dados, fluxo ou ativo mudaram?
- [ ] O controle compensatorio foi testado, falhou, expirou ou deixou de ser monitorado?
- [ ] A versao do componente, CVE, CVSS ou perfil SSVC foi corrigida?
- [ ] O impacto tecnico e de negocio foi revisto pelos dominios competentes?
- [ ] A mudanca de severidade e prioridade tem justificativa e aprovador?
- [ ] SLA, gate, release, owner e risco residual foram atualizados?
- [ ] Clientes/contratos/regulacao afetados foram reavaliados sem registrar dados sensiveis?

## Checklist de fechamento e reteste

- [ ] A causa foi corrigida ou a decisao de tratamento esta formalmente valida?
- [ ] O criterio de aceite foi testado no artefato e ambiente corretos?
- [ ] Testes negativos, regressao, autorizacao e isolamento foram executados conforme risco?
- [ ] Segredo foi revogado/rotacionado e eventual uso indevido investigado?
- [ ] Dependencia/imagem/configuracao corrigida corresponde ao artefato implantavel?
- [ ] Fluxo acessivel foi validado manualmente quando aplicavel?
- [ ] Privacidade, incidente e fornecedor tiveram aprovacao dos dominios aplicaveis?
- [ ] Reteste foi aprovado por pessoa com competencia e independencia proporcionais?
- [ ] Evidencia de fechamento esta sanitizada; originais continuam restritos?
- [ ] Risco residual, versao corrigida, data, revisor e resultado foram registrados?
- [ ] Reteste falho ou regressao reabriu o finding e recalculou o SLA?
- [ ] Aceites, excecoes e falsos positivos mantem expiracao e gatilho de revisao?

## Governanca e revisao

- Revisar esta matriz ao menos anualmente e apos incidente grave, mudanca material de arquitetura, contrato relevante ou atualizacao importante das referencias.
- Seguranca mantem o metodo; Produto/Engenharia mantem owners e prazos; Privacidade, Acessibilidade, Juridico, Operacoes e lideranca decidem nos seus dominios.
- Metricas recomendadas: tempo de triagem, tempo de contencao/correcao, findings reabertos, excecoes vencidas, cobertura de reteste, KEV aplicaveis, bloqueios de release e reincidencia. Nao usar metas que incentivem ocultar findings ou rebaixar severidade.
- Referencias e incertezas de pesquisa estao em `research/sources/chunk-13.md`.
