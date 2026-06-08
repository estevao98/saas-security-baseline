# Continuidade de Negócio

## Objetivo

Organizar referências de continuidade, backup, restauração, operação degradada e recuperação de SaaS.

Não versionar backups, dumps, planos com topologia sensível, evidências de restore reais, logs crus ou detalhes de fornecedor/cliente.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Guia auxiliar de continuidade | `../docs/business-continuity-plan.md` |
| Roadmap e maturidade | `../docs/security-roadmap.md` |
| Auditorias e gatilhos | `../docs/audit-types.md`, `../docs/audit-trigger-matrix.md` |
| Checklist de backup/restore | `../checklists/backup-restore.md` |
| Template de teste | `../templates/backup-restore-test-template.md` |
| Evidências | `../docs/evidence-and-reporting-policy.md` |

## Como Usar

1. Defina serviços críticos, impacto, dependências, owners e fornecedores.
2. Derive RTO/RPO de BIA e capacidade testada, não de modelo genérico.
3. Teste restauração e continuidade com dados fictícios ou ambiente autorizado.
4. Registre somente resumo sanitizado e riscos pendentes.

## Pendências

- O plano real depende do SaaS consumidor.
- Validação funcional de scripts, backups e evidências pertence aos lotes posteriores.
