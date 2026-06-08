# Templates

## Objetivo

Centralizar modelos reutilizáveis sem dados reais ou sensíveis.

O catálogo canônico está em `index.md`. Os arquivos desta pasta são estruturas genéricas ou exemplos fictícios; uma cópia preenchida pode se tornar confidencial ou restrita.

## Como Usar

1. Escolha o template pelo [índice](index.md).
2. Preencha uma cópia no sistema autorizado do SaaS consumidor quando houver dado real, evidência, cliente, tenant, fornecedor ou incidente.
3. Mantenha no Git somente modelos vazios, exemplos fictícios ou resumos sanitizados revisados.
4. Aplique `../docs/evidence-and-reporting-policy.md` antes de versionar qualquer derivado.

## Relação Com Documentos

| Tema | Template principal | Documento de apoio |
|---|---|---|
| Finding e remediação | `security-finding-template.md`, `remediation-plan-template.md` | `../docs/security-audit-baseline.md` |
| Risco | `risk-register-template.csv` | `../risk/severity-and-prioritization.md` |
| Privacidade | `data-map-template.md`, `ropa-template.md`, `dpia-template.md` | `../docs/lgpd-privacy-program.md` |
| Incidentes | `incident-report-template.md`, `postmortem-template.md` | `../docs/incident-response-plan.md` |
| Continuidade | `backup-restore-test-template.md` | `../docs/business-continuity-plan.md` |
| Acessibilidade | `accessibility-finding-template.md` | `../docs/accessibility-audit.md` |
| IA | `ai-risk-assessment-template.md` | `../docs/ai-governance-checklist.md` |

## Limites

- Não transformar template central em registro de produto real.
- Não incluir segredos, dados pessoais reais, logs crus, URLs internas, requests/responses, payloads ou evidências sensíveis.
- Não declarar conformidade, certificação ou ausência de vulnerabilidades por preencher um template.
