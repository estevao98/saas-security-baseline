# Checklist de Acessibilidade WCAG 2.2 AA para SaaS

## Objetivo

Avaliar fluxos, paginas, componentes e conteudos de um SaaS contra os criterios aplicaveis dos niveis A e AA da WCAG 2.2, com teste humano e tecnologias assistivas. Este checklist nao declara conformidade automatica com WCAG, nao substitui avaliador competente e nao permite aprovar acessibilidade apenas com scanner ou score.

## Quando usar

- no discovery e design de novos fluxos ou componentes;
- em PRs que alterem interface, conteudo, tema, navegacao, autenticacao, pagamento ou componentes de terceiros;
- antes de beta, release material, venda empresarial ou mudanca do design system;
- apos upgrade de framework, biblioteca de UI, editor, player, CAPTCHA ou widget externo;
- apos relato de barreira, regressao, incidente ou mudanca de requisito legal, contratual ou normativo;
- na auditoria periodica de paginas e processos completos.

Itens nao aplicaveis precisam de justificativa por criterio, pagina ou processo. Nao testado nao equivale a aprovado.

## Revisor responsavel

- **Responsavel primario:** especialista ou pessoa competente em acessibilidade digital.
- **Revisores tecnicos:** Design/UX, Frontend, Conteudo e QA.
- **Revisores conforme o fluxo:** Produto, Backend, Seguranca, Privacidade, Suporte e owner do fornecedor.
- **Aprovacao de release:** owner de Produto e responsavel pelo release, com Acessibilidade para barreiras materiais.

Quem implementou o componente nao deve ser seu unico avaliador em fluxo critico. Testes com pessoas com deficiencia complementam, mas nao substituem, a avaliacao tecnica completa.

## Evidencias esperadas

- matriz de paginas, estados, processos completos e criterios A/AA aplicaveis;
- registro de navegador, sistema, viewport, zoom e tecnologias assistivas usados;
- roteiro e resultado de teclado, foco, leitor de tela, zoom, reflow, contraste e conteudo;
- resultados automatizados triados por pessoa competente, sem usar score agregado como conclusao;
- findings com criterio WCAG, impacto na tarefa, severidade, owner, correcao e reteste;
- excecoes temporarias com alternativa acessivel, aprovador e expiracao;
- evidencias sanitizadas por IDs opacos; material integral fora do Git.

Uma alegacao formal de conformidade exige escopo completo, paginas completas, processos completos e todos os criterios A e AA aplicaveis. Marcar este checklist nao satisfaz esses requisitos por si so.

## Itens obrigatorios

### Escopo e metodo de avaliacao

- [ ] O escopo identifica release, paginas, estados, componentes, conteudos, processos completos, breakpoints e tecnologias dependentes?
- [ ] Cadastro, login, recuperacao, MFA, onboarding, navegacao, busca, formularios, upload, relatorios, suporte, pagamento e cancelamento foram incluidos quando presentes?
- [ ] Variantes de tenant, tema, idioma, permissao, erro, vazio, loading, timeout e sessao expirada foram amostradas conforme risco?
- [ ] Existe matriz de todos os criterios WCAG 2.2 A e AA aplicaveis, com `passou`, `falhou`, `nao aplicavel` ou `nao testado` e justificativa?
- [ ] A avaliacao combina inspecao humana, teclado, tecnologia assistiva, zoom/reflow, contraste e automacao?
- [ ] O ambiente de teste usa contas e conteudos sinteticos, sem dados de cliente ou producao?
- [ ] Limitacoes de cobertura, combinacoes nao testadas e dependencias de terceiros estao declaradas?

### Perceptivel

- [ ] Imagens informativas possuem alternativa textual equivalente; imagens decorativas sao ignoradas por tecnologia assistiva?
- [ ] Icones, graficos, canvas e visualizacoes essenciais possuem nome, resumo ou alternativa de dados adequada a tarefa?
- [ ] Audio e video possuem alternativas, legendas, transcricao e audiodescricao conforme o conteudo e os criterios aplicaveis?
- [ ] Headings, landmarks, listas, tabelas, grupos e relacoes visuais estao representados programaticamente?
- [ ] A ordem de leitura e a sequencia significativa permanecem corretas sem depender da apresentacao visual?
- [ ] Instrucao e estado nao dependem apenas de cor, forma, posicao, tamanho, orientacao ou som?
- [ ] Contraste de texto, texto em imagem, componentes, estados e indicador de foco atende ao criterio aplicavel em todos os estados relevantes?
- [ ] Conteudo permanece utilizavel com zoom e ampliacao de texto aplicaveis, sem perda de informacao ou funcao?
- [ ] Reflow em viewport estreito evita rolagem bidimensional para conteudo comum, respeitadas as excecoes do criterio?
- [ ] Ajuste de espacamento de texto nao corta, sobrepoe ou esconde conteudo e controles?
- [ ] Conteudo exibido em hover ou foco pode ser percebido, mantido e dispensado conforme aplicabilidade?

### Operavel

- [ ] Toda funcao pode ser operada por teclado sem exigir mouse, toque ou gesto especifico?
- [ ] Nao existe armadilha de teclado; o usuario consegue entrar, operar e sair de componentes e overlays?
- [ ] Atalhos de tecla por caractere podem ser desativados, remapeados ou ativados apenas com foco quando o criterio se aplica?
- [ ] Limites de tempo podem ser desligados, ajustados ou estendidos, salvo excecao aplicavel e documentada?
- [ ] Movimento, carrossel, animacao e atualizacao automatica podem ser pausados, interrompidos ou ocultados quando necessario?
- [ ] Conteudo intermitente respeita limites aplicaveis e nao introduz risco evitavel?
- [ ] Existe mecanismo para ignorar blocos repetidos e acessar o conteudo principal?
- [ ] Titulos de pagina, headings, labels e links descrevem topico ou proposito no contexto?
- [ ] A ordem de foco e logica e preserva significado e operacao?
- [ ] O foco por teclado e visivel, suficientemente perceptivel e nao fica totalmente encoberto por conteudo do autor?
- [ ] Arrastar, gestos multiponto ou baseados em caminho possuem alternativa de ponteiro simples quando aplicavel?
- [ ] Eventos de ponteiro permitem cancelamento e evitam acionamento acidental conforme o criterio aplicavel?
- [ ] O nome acessivel inclui o texto visivel de controles rotulados?
- [ ] Funcao acionada por movimento do dispositivo possui alternativa e pode ser desativada quando aplicavel?
- [ ] Alvos de ponteiro atendem ao tamanho minimo ou a uma excecao valida do criterio 2.5.8?

### Compreensivel

- [ ] O idioma principal da pagina e as mudancas de idioma estao definidos programaticamente?
- [ ] Foco ou alteracao de valor nao dispara mudanca inesperada de contexto sem aviso e acao clara?
- [ ] Navegacao, identificacao de componentes e mecanismos de ajuda permanecem consistentes?
- [ ] Formas de localizar ajuda repetida aparecem em ordem relativa consistente quando o criterio 3.2.6 se aplica?
- [ ] Cada campo possui label persistente, instrucao e identificacao de obrigatoriedade; placeholder nao substitui label?
- [ ] Erros identificam o campo e a causa em texto, sao associados ao controle e anunciados por tecnologia assistiva?
- [ ] Sugestoes de correcao sao oferecidas quando conhecidas e seguras?
- [ ] Transacoes financeiras, legais, de dados ou destrutivas permitem revisar, corrigir, confirmar ou reverter conforme aplicabilidade?
- [ ] Informacao previamente fornecida no mesmo processo e reutilizada ou selecionavel, salvo excecao aplicavel?
- [ ] Autenticacao nao exige teste cognitivo sem alternativa, mecanismo ou assistencia permitida pelo criterio 3.3.8?
- [ ] Colar, password managers e preenchimento automatico nao sao bloqueados sem justificativa valida e alternativa acessivel?

### Robusto

- [ ] Elementos nativos sao preferidos e componentes customizados seguem padrao de interacao apropriado?
- [ ] Controles expoem nome, funcao, valor, estado, selecao, expansao, invalidez e indisponibilidade corretos?
- [ ] IDs, associacoes, `for`, `aria-labelledby`, `aria-describedby` e relacionamentos nao estao quebrados ou duplicados?
- [ ] Mudancas de status como loading, sucesso, erro, progresso e resultado sao anunciadas sem mover foco indevidamente?
- [ ] Modais possuem nome, contexto, foco inicial adequado, contencao enquanto abertos e retorno ao acionador?
- [ ] Menus, tabs, accordions, comboboxes, grids e outros widgets seguem semantica e teclado previsiveis?

### Processos e componentes criticos de SaaS

- [ ] Cadastro e login permitem compreender requisitos, corrigir erros e concluir autenticacao com teclado e tecnologia assistiva?
- [ ] Recuperacao de conta, MFA, CAPTCHA e antifraude oferecem alternativa acessivel e nao bloqueiam password managers sem necessidade?
- [ ] Dashboard, tabelas, filtros, busca e paginacao preservam headings, foco, estado e atualizacoes anunciadas?
- [ ] Upload funciona sem drag-and-drop obrigatorio e informa formato, limite, progresso, sucesso e erro?
- [ ] Pagamento ou checkout de ponta a ponta, inclusive componente de terceiro, permite revisar, corrigir e confirmar dados?
- [ ] Relatorios, documentos e downloads essenciais possuem formato acessivel ou alternativa equivalente?
- [ ] Cancelamento, exclusao e outras acoes destrutivas comunicam consequencias e resultado de forma acessivel?
- [ ] Canal de suporte e alternativa operacional continuam acessiveis quando widget externo falha?
- [ ] Conteudo de tenant, tema, editor, curso ou LMS possui orientacao, campos de alternativa, limites e validacao proporcionais?

### Teste manual e tecnologias assistivas

- [ ] O fluxo completo foi percorrido apenas por teclado, incluindo erro, cancelamento, timeout e retorno?
- [ ] Foco foi inspecionado ao abrir e fechar modal, menu, tooltip, alerta, validacao e navegacao entre etapas?
- [ ] Ao menos uma combinacao definida de navegador, sistema e leitor de tela foi usada nos fluxos criticos?
- [ ] Navegacao por headings, landmarks, links, controles, formularios e tabelas foi avaliada com leitor de tela?
- [ ] Zoom, reflow, orientacao e espacamento de texto foram testados nos breakpoints aplicaveis?
- [ ] Contraste foi medido nos estados padrao, hover, focus, selected, disabled, erro e sucesso?
- [ ] Findings automaticos foram confirmados ou descartados por analise humana com justificativa?
- [ ] Um resultado automatico sem achados foi tratado apenas como ausencia de falhas detectadas, nao como aprovacao de WCAG?

### Findings, reteste e release

- [ ] Cada barreira registra ID opaco, criterio, tarefa afetada, usuarios impactados, severidade, owner e criterio de aceite?
- [ ] Evidencia de reproducao usa dados ficticios e omite URL, tenant, conteudo e seletor sensivel?
- [ ] Correcao foi retestada manualmente no componente e no processo completo, com regressao proporcional?
- [ ] Excecao possui alternativa acessivel equivalente, risco residual, aprovador, prazo curto e expiracao?
- [ ] Feedback de usuario recebe triagem, retorno e protecao de dados pessoais, inclusive informacao sobre deficiencia ou tecnologia assistiva?

## Itens desejaveis

- [ ] Componentes do design system possuem contrato documentado de semantica, teclado, foco, estados, responsividade e erros?
- [ ] Testes automatizados de componente e fluxo cobrem estados acessiveis em aplicacao efemera com dados ficticios?
- [ ] Regras de lint e testes impedem regressao de labels, nomes acessiveis, headings, foco e atributos invalidos?
- [ ] Matriz de tecnologias assistivas e navegadores e baseada em usuarios, suporte e risco reais?
- [ ] Conteudo, documentos, graficos, e-mails e midias possuem processo editorial de acessibilidade?
- [ ] Pessoas com deficiencia participam de pesquisa e validacao com consentimento, acessibilidade, remuneracao e privacidade adequados?
- [ ] Fornecedores de UI, pagamento, chat, CAPTCHA, video e documentos possuem requisitos, evidencias e plano de alternativa?
- [ ] Metricas acompanham barreiras por severidade, fluxo, componente, recorrencia, tempo de correcao e excecoes vencidas?

## Melhorias futuras

- [ ] Ampliar cobertura manual para mais combinacoes de tecnologia assistiva conforme uso real?
- [ ] Integrar testes de acessibilidade ao design, storybook, testes de componente e pipeline sem transformar automacao em gate unico?
- [ ] Criar testes de regressao para temas e configuracoes de tenants de maior risco?
- [ ] Realizar auditoria independente de escopo completo e publicar declaracao de acessibilidade honesta quando houver evidencia suficiente?
- [ ] Avaliar criterios AAA selecionados por beneficio aos usuarios, sem alegar nivel AAA para o produto inteiro?
- [ ] Avaliar certificacao ou atestacao formal somente com escopo, metodo, referencia e avaliador definidos?

## Criterios de aprovacao

- [ ] Todos os criterios WCAG 2.2 A e AA aplicaveis ao escopo foram avaliados, nao apenas uma lista de temas prioritarios?
- [ ] Todos os itens obrigatorios aplicaveis possuem evidencia humana suficiente e revisao competente?
- [ ] Processos criticos completos podem ser concluidos por teclado e pela combinacao de tecnologia assistiva definida?
- [ ] Nao existe barreira alta/bloqueante, regressao grave ou gate obrigatorio sem execucao?
- [ ] Findings nao bloqueantes possuem severidade, owner, prazo e reteste planejado?
- [ ] Itens nao aplicaveis, limitacoes e excecoes estao justificados, aprovados e datados?
- [ ] A decisao registra apenas **aprovado para o escopo avaliado**, sem declarar conformidade WCAG automatica ou integral?

## Criterios de reprovacao ou bloqueio

- [ ] Fluxo critico nao pode ser concluido por teclado ou por tecnologia assistiva suportada?
- [ ] Existe armadilha de teclado, foco imperceptivel ou foco encoberto que impede a tarefa?
- [ ] Controle essencial nao possui nome, funcao, estado, label ou instrucao acessivel?
- [ ] Erro de cadastro, autenticacao, pagamento, exportacao ou exclusao nao e identificado e anunciado?
- [ ] Contraste, zoom, reflow ou espacamento torna informacao ou funcao essencial indisponivel?
- [ ] Conteudo, documento, midia, grafico ou CAPTCHA essencial nao possui alternativa utilizavel?
- [ ] Transacao financeira, legal ou destrutiva nao permite revisao, correcao ou confirmacao aplicavel?
- [ ] Componente de terceiro bloqueia o processo e nao existe alternativa equivalente?
- [ ] Avaliacao manual obrigatoria nao ocorreu, ou a aprovacao se baseia apenas em automacao ou score?
- [ ] Criterio aplicavel foi omitido, marcado como nao aplicavel sem justificativa ou nao possui evidencia?
- [ ] Regressao grave esta aberta, reteste falhou ou excecao expirou?
- [ ] Evidencia contem dado pessoal, informacao de cliente, URL interna, tenant, voz, relato identificavel ou material sensivel indevido?

Qualquer condicao marcada nesta secao exige decisao **No-Go** ate correcao e reteste ou excecao formal permitida, com alternativa acessivel efetiva. Score agregado alto nao compensa barreira bloqueante.

## Cuidados contra vazamento

- [ ] Contas, perfis, cursos, pedidos, mensagens e conteudos usados no teste sao sinteticos?
- [ ] Nao foram incluidos nomes, e-mails, telefones, enderecos, pagamentos, relatos ou informacoes de deficiencia de pessoas reais?
- [ ] Nao foram incluidos segredos, tokens, credenciais, cookies, headers, session storage ou valores parecidos com credenciais?
- [ ] Nao foram incluidos DOM/HTML integral, logs crus, requests, responses, payloads, traces ou relatorios integrais de ferramentas?
- [ ] URLs internas, query strings, paths, nomes de tenant, cliente, fornecedor e identificadores correlacionaveis foram removidos?
- [ ] Prints mostram apenas a area necessaria, com redaction irreversivel de abas, notificacoes, nomes, avatares, IDs e conteudo digitado?
- [ ] Videos e gravacoes de leitor de tela nao revelam voz, notificacoes, historico, ambiente ou tecnologia assistiva vinculada a pessoa real?
- [ ] Metadados de imagens, PDFs, audio e video foram removidos e a redaction foi revisada por segunda pessoa?
- [ ] Relatorios crus de axe, Lighthouse, Pa11y ou DevTools permanecem em `reports/raw/` ou armazenamento restrito, fora do Git?
- [ ] O resumo em `reports/sanitized/` contem somente criterio, tarefa, ambiente generalizado, impacto, correcao e reteste por ID opaco?

## Referencias internas

- `docs/accessibility-program.md`
- `docs/evidence-and-reporting-policy.md`
- `docs/audit-trigger-matrix.md`
- `docs/security-audit-baseline.md`
- `docs/git-security-workflow.md`
- `risk/severity-and-prioritization.md`
- `research/sources/chunk-15.md`
