# Checklists

## Objetivo

Esta pasta reúne checklists reutilizáveis para auditoria, governança, segurança, DevSecOps, LGPD, acessibilidade, operação, terceiros, pagamentos, IA e maturidade técnica de SaaS.

Os checklists são modelos de trabalho. Eles apoiam decisão, revisão e rastreabilidade, mas não declaram conformidade formal, certificação, acessibilidade integral, atendimento jurídico, operação segura ou ausência de vulnerabilidades.

## Visão geral

Use o [índice de checklists](index.md) para escolher o arquivo aplicável por fase, evento ou domínio.

Grupos principais:

- release e decisão: [pré-beta](pre-beta.md), [pré-deploy](pre-deploy.md), [pré-venda empresarial](pre-enterprise-sale.md);
- AppSec e aplicação: [OWASP Top 10](owasp-top-10.md), [OWASP ASVS](owasp-asvs.md), [OWASP API Top 10](owasp-api-top-10.md), [pagamentos](payment-security.md);
- plataforma e operação: [cloud](cloud-security.md), [CI/CD](ci-cd-security.md), [incidentes](incident-response.md), [backup e restauração](backup-restore.md);
- governança: [LGPD](lgpd.md), [acessibilidade WCAG 2.2 AA](accessibility-wcag-22-aa.md), [terceiros](third-party-risk.md), [IA](ai-governance.md).

## Como usar

1. Defina escopo, produto, release, ambiente, stack, dados, fornecedores e risco.
2. Selecione os checklists aplicáveis e registre por que algum domínio ficou fora do escopo.
3. Preencha uma cópia em local autorizado quando houver evidência real, cliente, tenant, ambiente, fornecedor ou achado.
4. Vincule evidências por IDs opacos e mantenha material cru fora do Git.
5. Trate itens obrigatórios não executados, gates com falha técnica e critérios de reprovação como bloqueios até correção, reteste ou decisão formal permitida.
6. Revise não aplicabilidades, exceções e aceites de risco com owner, prazo e aprovador competente.

## Limites

- Um checklist marcado não substitui revisão humana, auditoria independente, parecer jurídico, validação contratual ou teste técnico adequado.
- Resultado de scanner, score ou ausência de alerta não prova aprovação do checklist.
- Certificação formal só deve ser tratada quando houver objetivo, escopo, norma, organismo e validação próprios.
- Checklists preenchidos podem ser confidenciais porque revelam arquitetura, lacunas, controles e decisões de risco.
- Não versionar segredos, credenciais, dados pessoais reais, logs crus, dumps, backups, payloads, requests/responses, URLs internas, tenants, evidências sensíveis ou relatórios integrais.

## Evidências

- `reports/raw/`: saídas integrais locais ou material bruto; permanece fora do Git.
- `reports/sanitized/`: apenas resumos minimizados, redigidos e revisados.
- Issues, PRs e commits: use contexto seguro, IDs opacos e descrições sem detalhes exploráveis.

Consulte também `docs/evidence-and-reporting-policy.md`, `docs/audit-trigger-matrix.md`, `docs/security-audit-baseline.md` e `risk/severity-and-prioritization.md`.
