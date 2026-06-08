# Riscos

## Objetivo

Organizar a navegação de severidade, priorização, aceite, registro e tratamento de riscos.

A fonte canônica atual é `severity-and-prioritization.md`. `risk-matrix.md` e `risk-register.csv` permanecem artefatos auxiliares a reconciliar no Lote 10; não devem ser tratados como registros reais prontos.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Severidade, SLA, gates e aceite | `severity-and-prioritization.md` |
| Registro de risco como template | `../templates/risk-register-template.csv` |
| Relatório de auditoria | `../docs/security-audit-baseline.md` |
| Fluxo Git e findings | `../docs/git-security-workflow.md` |
| Evidências | `../docs/evidence-and-reporting-policy.md` |

## Regras

- Risco real pode revelar arquitetura, vulnerabilidade, fornecedor, cliente e janela de exposição.
- Use IDs opacos e linguagem segura em Git, issues e PRs.
- Aceite de risco deve ter owner, aprovador, prazo, risco residual, controles e gatilhos de reavaliação.
- Esforço de correção não reduz severidade técnica; pode influenciar priorização operacional.

## Pendências

- O Lote 10 deve consolidar `risk-matrix.md` e `risk-register.csv` sem criar fonte concorrente.
