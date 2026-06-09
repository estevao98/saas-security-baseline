# Acessibilidade

## Objetivo

Organizar a navegação de acessibilidade para SaaS web: programa, checklist, auditoria, evidências e templates.

Esta pasta não deve receber evidências reais, vídeos, prints sem redaction, DOM, sessões, dados de participantes ou relatórios crus.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Programa canônico | `../docs/accessibility-program.md` |
| Modelo de auditoria sanitizada | `../docs/accessibility-audit.md` |
| Checklist executável | `../checklists/accessibility-wcag-22-aa.md` |
| Fixture fictícia | `../testing/accessibility/` |
| Finding de acessibilidade | `../templates/accessibility-finding-template.md` |
| Evidências e redaction | `../docs/evidence-and-reporting-policy.md` |
| Script local | `../scripts/run-accessibility-audit.sh` |

## Como Usar

1. Defina fluxo, página, componente, tecnologia assistiva e critérios aplicáveis.
2. Use a fixture fictícia em `../testing/accessibility/` para calibrar automação e roteiro manual.
3. Execute revisão manual e automação somente em ambiente autorizado com dados fictícios.
4. Combine axe, Lighthouse e Pa11y com teclado, foco visível, semântica HTML, contraste, formulários, erros, conteúdo dinâmico, leitor de tela e fluxo crítico completo.
5. Registre barreiras por ID opaco e guarde material cru fora do Git.
6. Versione apenas resumo sanitizado revisado.

## Limites Operacionais

- Automação sem achados não prova conformidade WCAG 2.2 AA, ABNT, ausência de barreiras ou prontidão para venda enterprise.
- Score de Lighthouse, resultado de axe ou saída de Pa11y não substitui revisão humana competente.
- Testes reais com pessoas, tecnologias assistivas, voz, vídeo, prints, tickets e relatos podem revelar dados pessoais ou informação sensível e devem seguir `../docs/evidence-and-reporting-policy.md`.
- Workflows de acessibilidade devem começar como `alert-only`, sem publicar DOM, screenshots ou relatórios crus, após validação contextual.

## Pendências

- CI alert-only de acessibilidade permanece pendente em tarefa própria, sem alteração de workflow ativo neste lote.
- Validar versões reais de axe, Lighthouse, Pa11y, navegador e tecnologias assistivas no SaaS consumidor.
- Conformidade formal, aplicabilidade ABNT e obrigação contratual exigem revisão especializada.
