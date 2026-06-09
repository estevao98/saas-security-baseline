# Auditoria de Acessibilidade

## Objetivo

Orientar a preparação, execução e registro sanitizado de auditorias de acessibilidade para SaaS web, preservando o [Programa de acessibilidade](accessibility-program.md) como fonte canônica.

Este arquivo não declara conformidade WCAG 2.2 AA, ABNT, ausência de barreiras ou acessibilidade integral. Automação é apoio parcial; avaliação manual, tecnologias assistivas e revisão humana competente continuam obrigatórias.

## Fontes Internas

| Tema | Fonte interna |
|---|---|
| Programa, critérios, gates e roteiro manual | [Programa de acessibilidade](accessibility-program.md) |
| Checklist executável | `../checklists/accessibility-wcag-22-aa.md` |
| Fixture fictícia | `../testing/accessibility/` |
| Ferramentas e comandos | [Catálogo de ferramentas](security-tools-catalog.md), `../scripts/run-accessibility-audit.sh` |
| Evidências e redaction | [Política de evidências](evidence-and-reporting-policy.md) |
| Relatório final amplo | [Modelo de relatório de auditoria](security-audit-baseline.md) |
| Finding de acessibilidade | `../templates/accessibility-finding-template.md` |

## Quando Usar

- antes de beta, release, venda enterprise ou auditoria externa;
- em PRs ou releases que alterem fluxo crítico, componente, design system, autenticação, pagamento, LMS ou conteúdo;
- após reclamação, barreira grave, regressão, troca de biblioteca UI, tema ou mudança normativa/contratual;
- em ciclos semestrais ou anuais quando houver compromisso de maturidade, conforme `audit-trigger-matrix.md`.

## Escopo Mínimo

| Dimensão | Registrar |
|---|---|
| Release | Versão, build ou commit em identificador seguro. |
| Fluxos | Cadastro, login, recuperação, dashboard, busca, formulário, upload, pagamento, suporte, cancelamento e LMS quando aplicáveis. |
| Estados | Inicial, loading, vazio, erro, sucesso, modal, timeout, sessão expirada e conteúdo dinâmico. |
| Variantes | Viewport, zoom, tema, idioma, papel, tenant fictício e componente de terceiro quando relevantes. |
| Critérios | Matriz dos critérios WCAG 2.2 A e AA aplicáveis, com `passou`, `falhou`, `não aplicável` ou `não testado`. |
| Exclusões | Motivo, risco, alternativa, aprovador e data de revisão. |

Não marque como aprovado um fluxo crítico quando a página inicial passou em scanner, mas estados de erro, modal, autenticação, formulário, pagamento ou conteúdo dinâmico não foram avaliados.

## Métodos Combinados

| Método | Uso | Limite |
|---|---|---|
| axe | Detectar falhas automatizáveis de semântica, nome acessível, ARIA, contraste e regras suportadas. | Não avalia qualidade completa de texto alternativo, operação real do fluxo, todas as relações cognitivas nem todos os critérios WCAG. |
| Lighthouse | Obter auditoria automatizada e tendência por página controlada. | Score agregado não é gate de conformidade e pode variar por ambiente, estado e página. |
| Pa11y | Executar checagens automatizadas em URL local ou lista controlada. | Resultado depende de estado, autenticação, runner e regras; ausência de achados não aprova WCAG. |
| Navegação por teclado | Confirmar operação sem mouse em processo completo. | Precisa cobrir modais, menus, foco inicial/final, erro, retorno e atalhos. |
| Foco visível | Verificar percepção, contraste, ordem e foco não encoberto. | Deve ser avaliado em todos os estados interativos, não apenas no botão principal. |
| Semântica HTML | Validar headings, landmarks, labels, tabelas, botões, links e estados. | ARIA não corrige semântica incorreta quando HTML nativo resolveria. |
| Contraste | Medir texto, ícones, bordas, estado, foco, erro e disabled quando aplicável. | Medição isolada não avalia dependência exclusiva de cor ou legibilidade em contexto. |
| Formulários | Validar labels, instruções, autocomplete, agrupamento, erros e revisão. | Placeholder não substitui label; erro visual não basta. |
| Mensagens de erro | Confirmar associação, clareza, anúncio e preservação de dados válidos. | Não colar mensagens reais, conteúdo de suporte ou prints sem redaction. |
| Conteúdo dinâmico | Avaliar loading, toast, alerta, atualização de resultado, modal e progresso. | Anúncio excessivo também pode ser barreira. |
| Leitores de tela | Validar nome, função, valor, estado, headings, landmarks e fluxo. | Uma combinação técnica não representa todas as pessoas nem todos os ambientes. |
| Fluxo crítico de SaaS | Verificar conclusão ponta a ponta com dados fictícios. | Processo parcial não sustenta decisão do processo completo. |

## Roteiro Operacional

1. Definir escopo, critérios aplicáveis, ambiente autorizado, dados fictícios e matriz de tecnologias assistivas.
2. Executar a fixture de referência em `../testing/accessibility/` para calibrar método e expectativa, sem tratar isso como auditoria de produto real.
3. Rodar axe, Lighthouse e Pa11y apenas em loopback ou ambiente efêmero autorizado, sem sessão real, cookie, dado pessoal, DOM real versionado ou URL interna.
4. Percorrer cada fluxo crítico por teclado, cobrindo entrada, erro, correção, confirmação, cancelamento e retorno.
5. Validar foco visível, ordem de foco, foco encoberto, skip link, modais, menus e conteúdo atualizado.
6. Inspecionar semântica HTML, labels, nomes acessíveis, estados, relações programáticas e mensagens de status.
7. Medir contraste e reflow nos estados padrão, hover, focus, selected, disabled, erro e sucesso.
8. Testar ao menos uma combinação definida de navegador, sistema e leitor de tela para fluxos críticos.
9. Triar findings automatizados com pessoa competente, separando finding confirmado, falso positivo, erro técnico e teste não executado.
10. Registrar findings por ID opaco, impacto funcional, critério, severidade, owner, correção esperada e reteste.
11. Produzir somente resumo sanitizado revisado; manter relatórios crus, vídeos, DOM, prints integrais e relatos em armazenamento restrito.

## Estrutura de Relatório Sanitizado

| Seção | Conteúdo esperado |
|---|---|
| Escopo | Fluxos, páginas, estados ou componentes em termos genéricos. |
| Ambiente | Navegador, viewport, zoom e tecnologia assistiva no nível necessário. |
| Métodos | axe, Lighthouse, Pa11y, teclado, foco, leitor de tela, zoom/reflow, contraste e revisão manual. |
| Critérios | WCAG 2.2 A/AA aplicáveis e normas ABNT somente quando validadas no contexto. |
| Cobertura | O que foi testado, não testado, não aplicável e por quê. |
| Resultados | Contagens revisadas, severidade, barreiras, impacto funcional e status. |
| Limitações | Páginas, estados, combinações, tecnologias, tenants ou conteúdo não cobertos. |
| Correção e reteste | Owner funcional, prazo, evidência sanitizada e resultado. |

## Evidências Permitidas

- descrição da tarefa e impacto sem identificar pessoa;
- componente, estado ou seletor genérico quando suficiente;
- print recortado e redigido somente quando indispensável;
- contagens por severidade, critério e fluxo após triagem humana;
- ID opaco para vídeo, DOM, relatório cru ou teste com usuário mantido fora do Git;
- indicação de ferramenta, versão confirmada, ambiente generalizado e limitação.

## Não Registrar Aqui

- DOM/HTML real, screenshots sem redaction, vídeo completo, voz, sessão ou dado de participante;
- URL interna, tenant, cliente, e-mail, pagamento, conteúdo de curso real, suporte ou analytics;
- relatório cru de axe, Lighthouse, Pa11y ou DevTools;
- cookie, token, header, storage, request/response, payload, log cru ou seletor que revele estrutura sensível;
- conclusão de conformidade WCAG/ABNT, certificação, ausência de barreiras ou prontidão enterprise.

## Interpretação de Resultado

| Resultado | Interpretação permitida |
|---|---|
| Automação sem achados | Nenhuma falha coberta pela ferramenta foi reportada no estado avaliado. Não prova conformidade nem ausência de barreiras. |
| Score alto do Lighthouse | Tendência favorável para aquela página. Não compensa barreira funcional nem substitui WCAG critério a critério. |
| Finding automatizado | Hipótese técnica até triagem humana confirmar impacto, critério, severidade e correção. |
| Teste manual aprovado | Evidência para o escopo, ambiente e fluxo testados. Não generaliza para todos os tenants, conteúdos e tecnologias. |
| Teste não executado | Lacuna explícita. Não pode ser tratado como aprovado. |

## Pendências Contextuais

- Promover CI de acessibilidade deve permanecer `alert-only` inicialmente, sem screenshots, DOM ou relatórios crus publicados, e depende de validação de versões, logs, artifacts e política de falha.
- Workflows ativos e exemplos não foram alterados neste Lote 9 por restrição de escopo; integração CI fica para tarefa própria após estabilização.
- Aplicabilidade normativa, obrigação contratual, declaração pública e alegações formais exigem revisão especializada.
