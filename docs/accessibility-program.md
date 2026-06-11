# Programa de Acessibilidade para SaaS Web

## Objetivo e limites

Este programa integra acessibilidade ao produto, design, frontend, conteúdo, QA, suporte, auditoria e entrega contínua. O baseline interno é **WCAG 2.2 nível AA**, isto é, todos os critérios aplicáveis dos níveis A e AA, complementados pelas normas ABNT aplicáveis e por validação com pessoas com deficiência conforme risco e maturidade.

O documento é orientação técnica e de governança. Não declara conformidade, certificação ou obrigação jurídica para um produto específico. A aplicabilidade legal, contratual e setorial deve ser validada no contexto do SaaS.

## Classificação interna

- **Obrigatório:** requisito mínimo para fluxos críticos e releases deste baseline.
- **Desejável:** amplia cobertura, consistência ou experiência e deve entrar no planejamento.
- **Melhoria futura:** maturidade adicional, pesquisa e automação mais ampla.
- **Certificação formal:** avaliação externa ou mecanismo formal, quando exigido; não é substituída por checklist ou scanner.

## Referências normativas

### WCAG 2.2

A WCAG organiza a acessibilidade em quatro princípios:

| Princípio | Aplicação prática no SaaS |
|---|---|
| **Perceptível** | Disponibilizar texto alternativo, estrutura semântica, contraste, legendas e conteúdo adaptável a zoom e reflow. |
| **Operável** | Permitir teclado, foco previsível, tempo ajustável, alvos acionáveis e alternativas a gestos complexos. |
| **Compreensível** | Usar linguagem, navegação, labels, instruções, erros e confirmações consistentes. |
| **Robusto** | Expor nome, função, valor, estado e mensagens de status às tecnologias assistivas. |

Os níveis não são notas independentes:

| Nível | Uso neste programa |
|---|---|
| **A** | Base essencial. Uma falha aplicável pode inviabilizar uma tarefa. |
| **AA** | Alvo obrigatório interno. Inclui todos os critérios A e AA aplicáveis ao escopo avaliado. |
| **AAA** | Melhoria seletiva. Não se deve afirmar conformidade AAA de uma página sem cumprir todos os critérios A, AA e AAA aplicáveis. Mesmo AAA não atende toda necessidade de toda pessoa. |

Uma alegação de conformidade deve considerar páginas completas, processos completos e tecnologias das quais o produto depende. Aprovar somente a tela inicial de um checkout, por exemplo, não demonstra conformidade do processo.

### Critérios prioritários para SaaS web

Esta tabela orienta risco e teste, mas não reduz o conjunto aplicável da WCAG 2.2 AA.

| Tema | Critérios WCAG 2.2 especialmente relevantes | Aplicação prática |
|---|---|---|
| Conteúdo não textual e mídia | 1.1.1; 1.2.1 a 1.2.5 | Alternativas equivalentes, legendas e descrição do conteúdo essencial. |
| Estrutura e sequência | 1.3.1 a 1.3.5 | Headings, landmarks, listas, tabelas, ordem de leitura e propósito de inputs programaticamente determináveis. |
| Cor, contraste e adaptação | 1.4.1; 1.4.3 a 1.4.5; 1.4.10 a 1.4.13 | Não depender só de cor; contraste mínimo; zoom, reflow, espaçamento e conteúdo em hover/foco utilizáveis. |
| Teclado e foco | 2.1.1; 2.1.2; 2.1.4; 2.4.1 a 2.4.7; 2.4.11 | Toda ação por teclado, sem armadilha, com ordem lógica, foco visível e não encoberto. |
| Tempo, movimento e flashes | 2.2.1; 2.2.2; 2.3.1 | Controle de timeout, autoatualização, animação e conteúdo intermitente. |
| Ponteiro e toque | 2.5.1 a 2.5.4; 2.5.7; 2.5.8 | Alternativas a gestos e arrastar, cancelamento, label coerente e tamanho mínimo de alvo conforme exceções. |
| Idioma e previsibilidade | 3.1.1; 3.1.2; 3.2.1 a 3.2.4; 3.2.6 | Idioma correto; navegação, identificação e ajuda consistentes; mudanças não inesperadas. |
| Formulários e erros | 3.3.1 a 3.3.4; 3.3.7; 3.3.8 | Labels, instruções, erros identificados e sugeridos; revisão de transações; evitar redigitação e barreiras cognitivas de autenticação. |
| Componentes e mensagens | 4.1.2; 4.1.3 | Nome, função, valor e estado corretos; loading, sucesso e erro anunciados sem mover foco indevidamente. |

CAPTCHA visual ou auditivo isolado não é solução suficiente. Quando usado, deve possuir alternativas acessíveis e não transformar autenticação em teste cognitivo sem mecanismo alternativo compatível.

### Normas ABNT aplicáveis

| Referência | Aplicação adotada | Limites e incertezas |
|---|---|---|
| **ABNT NBR 17225:2025** | Referência brasileira para requisitos de acessibilidade em conteúdos e aplicações web, alinhada à WCAG 2.2. Deve orientar design, desenvolvimento, conteúdo e avaliação de SaaS web. | A edição e o escopo foram validados em material institucional do NIC.br sobre o lançamento. O texto normativo integral não foi reproduzido e deve ser consultado por acesso autorizado para auditoria formal. |
| **ABNT NBR 17060:2022** | Considerar quando o escopo inclui experiência móvel, site móvel, web app, aplicação híbrida ou nativa. | A edição foi identificada nos chunks anteriores, mas vigência, emendas, substituições e fronteira exata com a NBR 17225 devem ser reconfirmadas no Catálogo ABNT antes de contrato, declaração ou auditoria formal. |

Não se presume equivalência integral entre WCAG, ISO e normas ABNT apenas pela semelhança de tema. Quando houver conflito ou obrigação específica, registrar a fonte aplicável e obter validação especializada.

## Política de acessibilidade do SaaS

### Objetivo

Evitar que pessoas com deficiência sejam impedidas de perceber conteúdo, operar funções, compreender decisões ou usar tecnologias assistivas nos processos essenciais do SaaS.

### Escopo

- aplicação web pública e autenticada;
- interfaces administrativas e de suporte que afetem o atendimento;
- páginas responsivas, web apps e experiência móvel aplicável;
- design system, conteúdo, documentos e mídia produzidos pelo produto;
- autenticação, pagamentos e componentes de terceiros integrados ao fluxo;
- conteúdo configurável por tenant e, quando aplicável, conteúdo de plataformas educacionais SaaS.

### Responsabilidades

| Papel | Responsabilidade mínima |
|---|---|
| Produto | Priorizar fluxos, critérios de aceite, feedback e dívida de acessibilidade. |
| Design/UX | Projetar estados, contraste, foco, ordem, conteúdo, zoom e variantes acessíveis. |
| Design system | Manter componentes semânticos, tokens e testes reutilizáveis; documentar uso e limites. |
| Frontend | Usar HTML nativo primeiro; implementar teclado, foco, nomes, estados e anúncios. |
| Backend | Preservar erros compreensíveis, ordem de processo, alternativas e dados necessários ao frontend acessível. |
| Conteúdo | Usar linguagem simples, headings, links claros, alternativas textuais, legendas e documentos acessíveis. |
| QA | Combinar automação, inspeção, teclado, leitor de tela, zoom/reflow e regressão por fluxo. |
| Segurança/Privacidade | Evitar que controles antifraude, evidências e telemetria criem barreiras ou exponham dados. |
| Suporte | Manter canal acessível, registrar barreiras e oferecer alternativa operacional segura. |
| Responsável pelo release | Confirmar gates, exceções, evidência e reteste antes da liberação. |

### Critérios mínimos

- [ ] Critérios A e AA aplicáveis da WCAG 2.2 possuem aceite e evidência proporcional.
- [ ] Fluxos críticos funcionam apenas com teclado e com foco visível.
- [ ] Formulários têm labels, instruções, erros e confirmação acessíveis.
- [ ] Componentes reutilizáveis expõem semântica, nome, função, valor e estado.
- [ ] Conteúdo essencial permanece utilizável com zoom, reflow e contraste requeridos.
- [ ] Ao menos uma combinação definida de navegador, sistema e leitor de tela é testada nos fluxos críticos.
- [ ] Automação roda nas páginas/estados alcançáveis, sem ser tratada como prova de conformidade.
- [ ] Barreiras relatadas por usuários recebem triagem, responsável, prazo e retorno.

### Exceções

Exceção exige: escopo, critério ou barreira, impacto, justificativa, alternativa acessível, risco residual, responsável, aprovação, prazo e data de expiração. Custo ou prazo isolado não torna aceitável bloquear uma tarefa essencial. Conteúdo de terceiro ou de tenant deve ter contrato, orientação, validação e alternativa proporcionais; não deve ser silenciosamente excluído da avaliação.

### Revisão e evidências

- Revisar por mudança relevante de fluxo, componente, tema, autenticação, pagamento, editor ou dependência de UI.
- Executar regressão automatizada por PR aplicável e manual antes de release material.
- Rever o programa ao menos anualmente e após barreira grave, reclamação recorrente ou alteração normativa.
- Registrar versão, escopo, ambiente, métodos, critérios, resultados, limitações, correções e reteste.

## Fluxos críticos

Cada fluxo deve ser concluído sem mouse, com leitor de tela na combinação suportada, zoom/reflow e estados de erro/sucesso. Para processos completos, testar início, etapas intermediárias, confirmação e retorno.

| Fluxo | Verificações prioritárias |
|---|---|
| Cadastro | Labels, requisitos de senha, consentimentos, erros, confirmação e prevenção de redigitação. |
| Login | Nome acessível, password manager/colar, erro anunciado, MFA e autenticação sem teste cognitivo obrigatório. |
| Recuperação de senha | Identificação neutra, código/link acessível, timeout informado e retorno ao login. |
| Onboarding | Progresso, pular/retomar, foco, ajuda consistente e ausência de drag obrigatório. |
| Dashboard | Headings, landmarks, cards, gráficos com alternativa, filtros, tabelas e atualização anunciada. |
| Compra/pagamento | Terceiros acessíveis, labels, revisão, correção, confirmação e prevenção de erro financeiro. |
| Checkout | Sequência, resumo, cupom, endereço, frete, pagamento e confirmação como processo completo. |
| Gestão de conta | Perfil, preferências, MFA, sessão, plano, exportação e ações destrutivas confirmadas. |
| Upload | Botão de arquivo operável, formatos/limites, progresso, erro e alternativa a drag-and-drop. |
| Busca | Label, sugestões, filtros, quantidade de resultados, sem resultados e atualização de foco/status. |
| Emissão de relatório | Geração, loading, download, formato acessível e alternativa ao gráfico/imagem. |
| Curso/aula/LMS | Navegação, player, teclado, legendas, transcrição, progresso, avaliações e anexos acessíveis. |
| Suporte | Canal, formulário, chat, anexos, SLA comunicado e alternativa quando widget de terceiro falhar. |
| Cancelamento/exclusão | Localização, linguagem clara, confirmação, consequências, reversão quando aplicável e resultado anunciado. |

## Checklist manual de página e fluxo

### Teclado, foco e navegação

- [ ] Todas as ações funcionam com `Tab`, `Shift+Tab`, `Enter`, `Space`, setas e `Escape` conforme o padrão do componente.
- [ ] Não há armadilha de teclado; modais contêm o foco somente enquanto abertos e o devolvem ao acionador.
- [ ] O indicador de foco é visível, contrastante e não fica encoberto por header, cookie banner ou overlay.
- [ ] A ordem de foco acompanha a leitura e a operação; não depende de `tabindex` positivo.
- [ ] Há forma de ignorar blocos repetidos e chegar ao conteúdo principal.
- [ ] Menus, tabs, accordions, comboboxes e grids seguem interação documentada e previsível.

### Leitor de tela e semântica

- [ ] Título, idioma, headings e landmarks descrevem a página.
- [ ] Links e botões possuem nome acessível que explica o propósito no contexto.
- [ ] Ícones funcionais têm nome; decoração é ignorada por tecnologia assistiva.
- [ ] Nome, função, valor, seleção, expansão, invalidez e indisponibilidade são anunciados corretamente.
- [ ] Conteúdo dinâmico informa loading, empty, sucesso e erro sem anúncio excessivo.
- [ ] A leitura linear mantém relações e sequência significativas.

### Visual, zoom, reflow e responsividade

- [ ] Texto e elementos essenciais têm contraste aplicável; estado não é comunicado somente por cor.
- [ ] Zoom de texto e página não corta, sobrepõe nem esconde função essencial.
- [ ] Em viewport estreito/reflow, não surge rolagem bidimensional para conteúdo comum, ressalvadas exceções aplicáveis.
- [ ] Espaçamento de texto ajustado não quebra controles ou oculta conteúdo.
- [ ] Hover, tooltip e popover podem ser percebidos, dispensados e mantidos quando necessário.
- [ ] Alvos de toque e ponteiro são utilizáveis e não exigem precisão desnecessária.

### Formulários e erros

- [ ] Cada controle possui label persistente e programaticamente associado; placeholder não substitui label.
- [ ] Obrigatoriedade, formato e exemplo são informados antes do erro.
- [ ] Campos relacionados usam agrupamento e legenda quando necessário.
- [ ] Erros identificam campo e causa, sugerem correção e são anunciados.
- [ ] Após envio inválido, o usuário encontra o resumo/primeiro erro sem perder os dados válidos.
- [ ] Transações financeiras, legais ou destrutivas permitem revisar, corrigir, confirmar ou reverter conforme aplicável.
- [ ] Autocomplete e password managers não são bloqueados sem justificativa de segurança válida.

### Componentes e conteúdo

- [ ] Modais têm nome, descrição quando útil, fechamento por teclado e tratamento de foco.
- [ ] Menus e navegação permanecem consistentes entre páginas.
- [ ] Tabelas de dados têm caption/contexto, headers associados e alternativa responsiva adequada.
- [ ] Gráficos oferecem resumo, valores ou tabela equivalente para a decisão pretendida.
- [ ] Carrosséis, animações e autoatualizações podem ser pausados ou controlados quando aplicável.
- [ ] Conteúdo essencial não depende apenas de posição, forma, som, cor ou gesto.
- [ ] Linguagem é direta; links, headings, instruções e erros evitam jargão desnecessário.
- [ ] Estados loading, empty e error explicam o que ocorreu e a próxima ação disponível.

## Roteiro de teste manual

1. Definir release/build, tenant fictício, papéis, dados sintéticos, páginas, estados e processo completo.
2. Limpar estado do navegador quando necessário e registrar navegador, sistema, viewport e tecnologia assistiva.
3. Percorrer o fluxo somente por teclado, incluindo erro, cancelamento, timeout e retorno.
4. Repetir com leitor de tela usando navegação por headings, landmarks, controles, links e formulários.
5. Avaliar foco visível, ordem, foco encoberto, modal, menu e conteúdo atualizado.
6. Testar zoom, reflow, espaçamento de texto, orientação e responsividade aplicáveis.
7. Inspecionar labels, árvore de acessibilidade, nome/função/estado e relações programáticas no DevTools.
8. Testar contraste dos estados padrão, hover, focus, disabled, erro e seleção.
9. Executar automação nos estados alcançados e triar cada achado; não contar apenas a página inicial.
10. Registrar barreira, critério, impacto na tarefa, reprodução, evidência sanitizada, owner, SLA e reteste.

### Matriz mínima de tecnologias assistivas

Definir combinações suportadas conforme os usuários e ambientes reais. Exemplos de leitores de tela incluem NVDA no Windows, VoiceOver em plataformas Apple, TalkBack no Android e Orca no Linux. A lista não cria obrigação de testar todas as combinações em todo PR; fluxos críticos devem ter cobertura explícita, e incompatibilidades conhecidas devem ser documentadas.

## Ferramentas e comandos validados

Ferramentas ajudam a encontrar barreiras automatizáveis; não determinam conformidade nem substituem teclado, leitor de tela e avaliação humana. Os comandos abaixo são exatamente os já validados em `docs/security-tools-catalog.md`.

### axe-core

`axe-core` é a engine JavaScript; o comando usa o pacote CLI separado. Após instalar:

```bash
npm install @axe-core/cli -g
axe http://127.0.0.1:3000
```

Use em aplicação efêmera com dados fictícios. Para componentes e estados autenticados, prefira integração no test runner do produto, depois de validar a API e a versão adotadas.

### Lighthouse

```bash
lighthouse http://127.0.0.1:3000 --output json --output-path reports/raw/lighthouse.json
```

O score agregado serve para tendência, não como gate isolado nem prova de WCAG. Triar falhas específicas e considerar variabilidade de ambiente e cobertura por página.

### Pa11y

```bash
pa11y --reporter json http://127.0.0.1:3000 > reports/raw/pa11y.json
```

O resultado pode variar com runner, autenticação e estado da página. `pa11y-ci` pode ser avaliado quando houver lista controlada de URLs, mas nenhum comando adicional é definido neste chunk.

### Browser DevTools, leitores de tela e testes manuais

- Usar árvore de acessibilidade, inspeção de nome/função/estado, contraste e emulação responsiva do navegador.
- Validar com leitor de tela real; a árvore do DevTools não reproduz toda a interação.
- Realizar teste de teclado sem extensão ou script que mascare o comportamento do produto.
- Reproduzir estados dinâmicos, validação, overlays e conteúdo carregado após interação.

## Evidências e proteção de dados

### Pode ir para `reports/sanitized/`

- resumo por release e fluxo, sem URL interna nem conteúdo real;
- critérios avaliados, método, ambiente generalizado e resultado;
- contagem revisada de achados por severidade e status;
- descrição reproduzível com dados fictícios e seletores não sensíveis;
- imagem recortada/redigida quando indispensável;
- correção, decisão de risco, owner por função e confirmação de reteste;
- limitações conhecidas e alternativas publicáveis aprovadas.

### Deve ficar fora do Git

- relatórios crus de axe, Lighthouse, Pa11y ou DevTools;
- vídeos completos de sessão, gravações de leitor de tela e prints sem redaction;
- logs, DOM/HTML, URLs privadas, IDs de tenant, e-mails, nomes, pagamentos ou conteúdo de curso real;
- tickets e relatos de usuários com dados pessoais ou informação de deficiência;
- dados de analytics, suporte, produção ou testes autenticados;
- detalhes exploráveis de falhas, tokens, cookies, headers e credenciais.

Relatórios crus pertencem a `reports/raw/`, ignorado pelo Git, ou a armazenamento restrito do produto. Antes de publicar um resumo, remover metadados, notificações, abas, nomes, avatares, IDs, query strings, conteúdo digitado, voz e informações de tecnologias assistivas vinculadas a uma pessoa. Redaction visual deve ser irreversível no arquivo exportado e revisada por segunda pessoa.

## Gates de release

### Bloqueiam release

- fluxo crítico não pode ser concluído por pessoa que usa tecnologia assistiva suportada;
- função essencial não opera por teclado ou existe armadilha/foco preso;
- foco não é perceptível ou fica encoberto a ponto de impedir a tarefa;
- formulário essencial não tem label/nome acessível ou instrução necessária;
- erro de autenticação, cadastro, pagamento ou exclusão não é identificado/anunciado;
- contraste impede leitura ou identificação de controle/estado essencial;
- conteúdo, mídia, documento ou gráfico essencial não possui alternativa utilizável;
- CAPTCHA ou antifraude não oferece alternativa acessível viável;
- componente customizado essencial não expõe semântica, estado ou interação esperada;
- transação financeira/destrutiva não permite revisão/correção/confirmação aplicável;
- regressão grave confirmada ou teste obrigatório não executado/sem evidência.

Exceção de release para barreira grave exige alternativa operacional acessível, risco documentado, prazo curto, aprovação dos responsáveis e comunicação adequada. Não se usa score alto para compensar uma barreira crítica.

### Melhorias não bloqueantes

- refinamento visual que não reduz percepção nem operação;
- variação de score agregado sem nova barreira confirmada;
- problema menor fora de fluxo crítico com alternativa equivalente clara;
- melhoria de documentação, linguagem ou cobertura adicional;
- critério AAA selecionado, quando A e AA aplicáveis permanecem atendidos;
- expansão de matriz de navegador/leitor de tela sem incompatibilidade conhecida grave.

Todo item não bloqueante deve ter severidade, owner, SLA e justificativa. Referência inicial: alto em até 30 dias, médio em até 90 dias e baixo em backlog trimestral; o produto deve ajustar esses prazos ao impacto e ao compromisso contratual. Reincidência, acumulação ou alcance amplo pode elevar o gate.

## Tipos de avaliação e comunicação

| Tipo | O que demonstra | O que não demonstra |
|---|---|---|
| **Conformidade técnica** | Avaliação do escopo completo contra todos os critérios aplicáveis e requisitos de conformidade. | Satisfação de toda necessidade, certificação automática ou obrigação legal fora do escopo. |
| **Auditoria automatizada** | Barreiras detectáveis por regras na página e estado alcançados. | Conformidade WCAG, qualidade de texto alternativo, ordem útil ou sucesso do processo completo. |
| **Auditoria manual** | Resultado de inspeção humana, teclado, foco, zoom, semântica e tecnologia assistiva. | Representatividade de todas as pessoas, ambientes e estratégias de uso. |
| **Validação com usuários** | Evidência de experiência e barreiras reais com participantes e tarefas definidas. | Cobertura integral de critérios técnicos ou substituição de auditoria especializada. |
| **Declaração pública de acessibilidade** | Compromisso, padrão adotado, status honesto, limitações, compatibilidade e canal de feedback. | Certificado ou prova por si só. Deve refletir avaliação recente e não prometer mais que a evidência. |

## Integrações do programa

### LGPD, logs e evidências

Dados sobre deficiência, tecnologia assistiva, voz, comportamento e suporte podem ser dados pessoais e revelar informação sensível dependendo do contexto. Minimizar coleta, definir finalidade, acesso, retenção e base aplicável; usar dados sintéticos em teste; não expor relatos em issues ou artifacts. Acessibilidade não justifica telemetria invasiva.

### Design system e componentes reutilizáveis

Centralizar tokens de contraste, foco, espaçamento e estados. Cada componente deve documentar semântica, teclado, nome, estado, erros, responsividade e restrições. Corrigir o componente compartilhado reduz recorrência, mas cada composição e conteúdo ainda exige teste.

### CI/CD

Executar axe, Pa11y ou Lighthouse em aplicação efêmera e URLs controladas, conforme `docs/github-actions-strategy.md`. Não aceitar URL arbitrária em input, não publicar relatório cru por padrão e não bloquear por score agregado. O workflow orientativo completo permanece no escopo documental do Chunk 7; este chunk não cria workflow.

### Plataformas educacionais SaaS

- Validar portal, formulários, dialogs, relatórios, tabelas e componentes customizados da versão adotada.
- Não presumir que componente padrão da stack garante conformidade no tema, conteúdo ou composição customizada.
- Em plataformas educacionais, verificar player, legendas, transcrições, navegação de aulas, progresso, avaliações, certificados e anexos.
- Conteúdo criado por instrutor/tenant requer orientações, campos para alternativas, validação e tratamento de exceções.
- Atualizações da stack podem alterar DOM, foco ou ARIA; repetir regressão após upgrade.

### SaaS multi-tenant

- Temas, logos, cores, conteúdo, traduções, widgets e scripts de cada tenant podem criar regressões.
- Aplicar limites de contraste e componentes seguros na configuração, sem aceitar customização irrestrita que quebre função essencial.
- Testar tenant padrão e variantes de maior risco com dados fictícios.
- Separar evidências por produto/release sem expor identidade, conteúdo ou configuração de cliente.
- Definir responsabilidade contratual e alternativa para conteúdo fornecido pelo tenant, sem excluir o fluxo da experiência do usuário.

## Estrutura sugerida para `docs/accessibility-audit.md`

O arquivo do Chunk 10 permanece apenas como modelo estrutural; templates completos serão tratados no Chunk 17.

1. Identificação: produto, release, data, avaliadores e classificação da evidência.
2. Objetivo e padrão: WCAG 2.2 AA, ABNT aplicável e critérios adicionais selecionados.
3. Escopo: páginas, processos completos, tenants fictícios, papéis, conteúdo e exclusões justificadas.
4. Ambiente: navegadores, sistemas, viewports, leitores de tela e versões registradas na execução real.
5. Métodos: automação, inspeção, teclado, zoom/reflow, leitor de tela e validação com usuários.
6. Resumo executivo: status honesto, barreiras de release, risco residual e decisão Go/No-Go.
7. Cobertura por fluxo e critério: passou, falhou, não aplicável ou não testado, com justificativa.
8. Achados: ID, critério, componente, impacto, severidade, reprodução sanitizada, correção e owner.
9. Evidências: índice do resumo sanitizado e referência externa controlada para material restrito.
10. Exceções e limitações: alternativa, aprovação, prazo e expiração.
11. Plano de correção e SLA.
12. Reteste, regressão e aprovação final.

## Indicadores e maturidade

- fluxos críticos cobertos por automação e teste manual;
- componentes do design system com contrato acessível e regressão;
- barreiras por severidade, recorrência, origem e tempo de correção;
- releases bloqueados, exceções vencidas e falhas reabertas;
- feedback de usuários, tempo de resposta e resolução;
- cobertura de conteúdo, mídia, documentos e tenants configuráveis.

Contagem e score não substituem impacto na tarefa. A meta é remover barreiras e impedir recorrência, não otimizar um número do scanner.

## Fontes

As fontes oficiais, fontes internas e incertezas deste chunk estão registradas em `research/sources/chunk-10.md`.
