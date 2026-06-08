# Auditoria de Acessibilidade

## Objetivo

Orientar a preparação e o registro sanitizado de auditorias de acessibilidade para SaaS web, preservando o [Programa de acessibilidade](accessibility-program.md) como fonte canônica.

Este arquivo não declara conformidade WCAG 2.2 AA, ABNT ou acessibilidade integral. Automação é apoio; avaliação manual e revisão competente continuam necessárias.

## Fonte Canônica

| Tema | Fonte interna |
|---|---|
| Política, roteiro manual e critérios | [Programa de acessibilidade](accessibility-program.md) |
| Checklist executável | `checklists/accessibility-wcag-22-aa.md` |
| Ferramentas | [Catálogo de ferramentas](security-tools-catalog.md), `scripts/run-accessibility-audit.sh` |
| Evidências e redaction | [Política de evidências](evidence-and-reporting-policy.md) |
| Finding de acessibilidade | `templates/accessibility-finding-template.md` |

## Quando Usar

- antes de beta, release, venda enterprise ou auditoria externa;
- em PRs ou releases que alterem fluxo crítico, componente, design system, autenticação, pagamento, LMS ou conteúdo;
- após reclamação, barreira grave ou mudança normativa/contratual.

## Estrutura de Relatório Sanitizado

| Seção | Conteúdo esperado |
|---|---|
| Escopo | Fluxos, páginas ou componentes em termos genéricos. |
| Ambiente | Navegador, viewport e tecnologia assistiva em nível necessário. |
| Métodos | Teclado, leitor de tela, zoom/reflow, contraste, automação e revisão manual. |
| Critérios | WCAG 2.2 A/AA aplicáveis e normas ABNT somente quando validadas no contexto. |
| Resultados | Contagens, severidade, barreiras, impacto funcional e status. |
| Limitações | Páginas, estados, tecnologias ou conteúdo não cobertos. |
| Correção e reteste | Owner funcional, prazo, evidência sanitizada e resultado. |

## Evidências Permitidas

- descrição da tarefa e impacto sem identificar pessoa;
- seletor ou componente genérico quando suficiente;
- print recortado e redigido somente quando indispensável;
- contagens por severidade e critério;
- ID opaco para vídeo, DOM, relatório cru ou teste com usuário mantido fora do Git.

## Não Registrar Aqui

- DOM/HTML real, screenshots sem redaction, vídeo completo, voz, sessão ou dado de participante;
- URL interna, tenant, cliente, e-mail, pagamento, conteúdo de curso real ou suporte;
- relatório cru de axe, Lighthouse, Pa11y ou DevTools.

## Pendências Contextuais

- O Lote 9 deve operacionalizar fixture, automação/manual combinados e eventuais workflows de acessibilidade.
- Aplicabilidade normativa, obrigação contratual e alegações formais exigem revisão especializada.
