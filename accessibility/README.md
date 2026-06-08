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
| Finding de acessibilidade | `../templates/accessibility-finding-template.md` |
| Evidências e redaction | `../docs/evidence-and-reporting-policy.md` |
| Script local | `../scripts/run-accessibility-audit.sh` |

## Como Usar

1. Defina fluxo, página, componente, tecnologia assistiva e critérios aplicáveis.
2. Execute revisão manual e automação somente em ambiente autorizado com dados fictícios.
3. Registre barreiras por ID opaco e guarde material cru fora do Git.
4. Versione apenas resumo sanitizado revisado.

## Pendências

- O Lote 9 deve operacionalizar fixture, automação/manual combinados e eventual CI alert-only.
- Conformidade formal, aplicabilidade ABNT e obrigação contratual exigem revisão especializada.
