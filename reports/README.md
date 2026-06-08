# Relatórios

## Objetivo

Separar relatórios crus de resumos revisados e sanitizados.

- `reports/raw/`: saídas cruas locais, fora do Git.
- `reports/sanitized/`: resumos revisados aptos a versionamento.

## Fonte Canônica

| Uso | Arquivo |
|---|---|
| Política de evidências e artifacts | `../docs/evidence-and-reporting-policy.md` |
| Modelo de relatório final | `../docs/security-audit-baseline.md` |
| Templates de resumo e remediação | `../templates/executive-summary-template.md`, `../templates/remediation-plan-template.md` |
| Severidade e tratamento | `../risk/severity-and-prioritization.md` |

## Regras

- Nunca versionar `reports/raw/` nem copiar seu conteúdo para PR, issue, commit ou artifact amplo.
- Publicar em `reports/sanitized/` somente síntese nova, minimizada, redigida e revisada.
- Não incluir segredo, cookie, dado pessoal real, URL interna, path sensível, payload, request/response, log cru, dump, backup, screenshot sem redaction ou relatório integral.
- Usar ID opaco para evidência restrita.

## Pendências

- O Lote 10 deve reforçar controles preventivos, revisar artefatos auxiliares de risco e confirmar que materiais crus continuam fora do Git.
