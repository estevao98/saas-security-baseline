# Segurança de Aplicações

## Objetivo

Organizar referências de AppSec para revisão de código, APIs, autenticação, autorização, dependências, threat modeling e evidências.

Esta pasta é um ponto de navegação. Não registre aqui payloads, PoCs, requests/responses, secrets, dados pessoais, URLs internas ou achados exploráveis.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Tipos de auditoria | `../docs/audit-types.md` |
| Gatilhos de auditoria | `../docs/audit-trigger-matrix.md` |
| Ferramentas | `../docs/security-tools-catalog.md` |
| Segurança de API | `../docs/api-security-checklist.md`, `../checklists/owasp-api-top-10.md` |
| ASVS e Top 10 | `../checklists/owasp-asvs.md`, `../checklists/owasp-top-10.md` |
| Threat modeling | `../docs/threat-model.md`, `../templates/threat-model-template.md` |
| Frappe/Python | `../docs/frappe-python-security-audit.md`, `../checklists/frappe-security.md` |
| Findings e relatórios | `../templates/security-finding-template.md`, `../docs/security-audit-baseline.md` |

## Fluxo Recomendado

1. Identifique mudança, ativos, dados, papéis e superfície exposta.
2. Escolha checklist e auditoria pelo gatilho aplicável.
3. Execute revisão manual e automação autorizada.
4. Classifique findings por contexto, não apenas por ferramenta.
5. Guarde cru fora do Git e publique somente síntese sanitizada.

## Pendências

- Testes funcionais de scripts pertencem ao Lote 5.
- Fixtures e validações específicas de Frappe/Python pertencem ao Lote 7.
