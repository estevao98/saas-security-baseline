# Testes

## Objetivo

Organizar referências para testes de segurança, qualidade, acessibilidade, API, restauração, scripts e gates de release.

Esta pasta não deve conter massa real de produção, dumps, backups, logs crus, screenshots sem redaction, fixtures com segredos, payloads ofensivos ou relatórios integrais.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Tipos de auditoria e teste | `../docs/audit-types.md` |
| Gatilhos | `../docs/audit-trigger-matrix.md` |
| Scripts locais | `../scripts/README.md` |
| Acessibilidade | `../docs/accessibility-program.md`, `../docs/accessibility-audit.md` |
| API | `../docs/api-security-checklist.md` |
| Backup/restore | `../business-continuity/README.md`, `../checklists/backup-restore.md` |
| Frappe/Python | `../docs/frappe-python-security-audit.md`, `frappe-python/README.md` |
| Evidências | `../docs/evidence-and-reporting-policy.md` |
| Relatório | `../docs/security-audit-baseline.md` |

## Regras de Teste

- Usar dados sintéticos claramente fictícios.
- Rodar DAST/API apenas em ambiente autorizado, preferencialmente loopback ou efêmero.
- Tratar ferramenta ausente ou falha técnica como teste não executado.
- Não publicar stdout, logs ou relatórios crus sem revisão.

## Pendências

- Fixture ficticia Frappe/Python esta em `frappe-python/`; validacao funcional dos scripts pertence ao Lote 5.
- Processo operacional de acessibilidade pertence ao Lote 9.
