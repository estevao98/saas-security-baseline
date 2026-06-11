# Documentação

## Objetivo

Centralizar guias, matrizes, programas e modelos auxiliares para auditoria, governança, segurança, DevSecOps, privacidade, acessibilidade, operação e maturidade técnica de SaaS.

Os documentos desta pasta são referências de baseline. Eles não declaram conformidade formal, certificação, prontidão enterprise, acessibilidade integral ou ausência de vulnerabilidades.

## Como Navegar

| Necessidade | Documento principal | Complementos |
|---|---|---|
| Entender a estrutura | [Arquitetura do repositório](repository-architecture.md) | `research/repository-inventory.md` |
| Escolher maturidade e próximos controles | [Roadmap de segurança](security-roadmap.md) | [Matriz de normas](standards-and-frameworks-matrix.md) |
| Decidir tipo e momento de auditoria | [Tipos de auditoria](audit-types.md) | [Matriz de gatilhos](audit-trigger-matrix.md) |
| Selecionar ferramentas | [Catálogo de ferramentas](security-tools-catalog.md) | `scripts/README.md` |
| Planejar CI/CD | [Estratégia GitHub Actions](github-actions-strategy.md) | `examples/github-workflows/`, `.github/workflows/security.yml` |
| Auditar backend Python | [Catálogo de ferramentas](security-tools-catalog.md) | `scripts/README.md`, `checklists/owasp-asvs.md` |
| Operar LGPD e privacidade | [Programa LGPD](lgpd-privacy-program.md) | [Gap assessment LGPD](lgpd-gap-assessment.md), `privacy/`, `checklists/lgpd.md` |
| Operar acessibilidade | [Programa de acessibilidade](accessibility-program.md) | [Auditoria de acessibilidade](accessibility-audit.md), `checklists/accessibility-wcag-22-aa.md` |
| Proteger evidências | [Política de evidências](evidence-and-reporting-policy.md) | `reports/README.md`, `reports/sanitized/` |
| Preparar relatório final | [Modelo de auditoria](security-audit-baseline.md) | `templates/security-finding-template.md` |
| Trabalhar com Git seguro | [Fluxo Git seguro](git-security-workflow.md) | `CONTRIBUTING.md`, `SECURITY.md` |

## Documentos Auxiliares

Estes arquivos existem para guiar uso e navegação, sem duplicar a fonte canônica:

- [Plano de resposta a incidentes](incident-response-plan.md);
- [Plano de continuidade de negócio](business-continuity-plan.md);
- [Modelo de ameaças](threat-model.md);
- [Checklist de segurança de API](api-security-checklist.md);
- [Checklist de segurança em cloud](cloud-security-checklist.md);
- [Checklist de governança de IA](ai-governance-checklist.md);
- [Auditoria de acessibilidade](accessibility-audit.md);
- [Avaliação de lacunas LGPD](lgpd-gap-assessment.md).

## Regras de Uso

- Preencha cópias em local autorizado quando houver produto, cliente, tenant, ambiente, fornecedor ou evidência real.
- Não coloque no Git segredos, credenciais, cookies, dados pessoais reais, logs crus, dumps, backups, URLs internas, requests/responses, payloads, PoCs ou relatórios integrais.
- Use IDs opacos para findings, evidências, riscos e incidentes.
- Trate qualquer documento preenchido como potencialmente confidencial até revisão.
- Registre fontes novas em `research/sources/` quando introduzir referência normativa, técnica ou oficial.
