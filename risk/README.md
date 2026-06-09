# Riscos

## Objetivo

Organizar a navegação de severidade, priorização, aceite, registro e tratamento de riscos.

A fonte canônica atual é `severity-and-prioritization.md`. `risk-matrix.md` e `risk-register.csv` são artefatos auxiliares: ajudam a estruturar cenários e registros seguros, mas não substituem análise humana, sistema restrito de risco ou evidência original.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Severidade, SLA, gates e aceite | `severity-and-prioritization.md` |
| Matriz auxiliar de risco | `risk-matrix.md` |
| Registro auxiliar seguro e fictício | `risk-register.csv` |
| Registro de risco como template completo | `../templates/risk-register-template.csv` |
| Relatório de auditoria | `../docs/security-audit-baseline.md` |
| Fluxo Git e findings | `../docs/git-security-workflow.md` |
| Evidências | `../docs/evidence-and-reporting-policy.md` |

## Regras

- Risco real pode revelar arquitetura, vulnerabilidade, fornecedor, cliente e janela de exposição.
- Use IDs opacos e linguagem segura em Git, issues e PRs.
- Aceite de risco deve ter owner, aprovador, prazo, risco residual, controles e gatilhos de reavaliação.
- Esforço de correção não reduz severidade técnica; pode influenciar priorização operacional.
- `risk-register.csv` versionado deve permanecer estrutural ou fictício; registro real de produto deve ficar em sistema restrito por padrão.
- Evidência crua, relatório bruto de scanner, log, dump, payload, request, response, DOM, screenshot, vídeo, segredo e dado pessoal real não devem ser anexados a riscos versionados.
- Secret scanning auxilia prevenção, mas não comprova ausência de segredos; versões, regras, saída, falha de gate e falsos positivos exigem validação própria.

## Pendências

- Definir no SaaS consumidor o sistema restrito de risco, owners reais, apetite, autoridade de aceite e retenção.
- Validar integração futura com secret scanning, CI e relatórios sanitizados sem publicar relatórios crus.
