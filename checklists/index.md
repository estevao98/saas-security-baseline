# Índice de Checklists

## Objetivo

Este índice organiza os checklists principais do repositório por momento de uso e domínio. Eles ajudam a preparar decisões de Go/No-Go, auditorias internas, revisões de risco e evidências sanitizadas para SaaS.

Marcar um checklist não declara conformidade formal, certificação, acessibilidade integral, atendimento jurídico ou ausência de vulnerabilidades. Cada uso exige escopo, evidência, revisor competente e tratamento de itens não aplicáveis.

## Como usar

1. Defina o evento: beta, deploy, venda enterprise, incidente, mudança técnica, nova integração ou revisão periódica.
2. Escolha os checklists aplicáveis à stack, aos dados, aos fornecedores, ao risco e ao compromisso assumido.
3. Preencha uma cópia em local autorizado quando houver informações de produto real, cliente, tenant, ambiente ou evidência sensível.
4. Registre itens não aplicáveis com justificativa, aprovador e data.
5. Trate critérios de reprovação como bloqueio até correção, reteste ou decisão formal permitida pelos documentos canônicos.
6. Versione somente modelos vazios e resumos sanitizados revisados; mantenha material cru fora do Git.

## Checklists por fase ou evento

| Checklist | Quando usar | Foco principal |
|---|---|---|
| [Pré-Beta](pre-beta.md) | Antes de abrir beta para usuários reais ou ampliar escopo. | Risco material, dados, tenants, suporte, acessibilidade e operação mínima. |
| [Pré-Deploy](pre-deploy.md) | Antes de promover mudança para ambiente relevante. | Artefato, gates, rollback, backup, observabilidade e autorização. |
| [Pré-Venda Empresarial](pre-enterprise-sale.md) | Antes de due diligence, contrato ou promessa enterprise. | Compromissos sustentáveis, evidências, privacidade, continuidade e limites comerciais. |
| [Resposta a Incidentes](incident-response.md) | Em preparação, exercício, suspeita, incidente confirmado ou encerramento. | Triagem, contenção, preservação, comunicação, recuperação e postmortem. |
| [Backup e Restauração](backup-restore.md) | Antes de produção, migração, mudança destrutiva ou revisão periódica. | Escopo, RPO/RTO, restore testado, segregação, retenção e descarte. |

## Checklists de AppSec e aplicação

| Checklist | Quando usar | Foco principal |
|---|---|---|
| [OWASP Top 10](owasp-top-10.md) | Em triagem de riscos recorrentes de aplicação web. | Taxonomia OWASP Top 10:2025 e encaminhamento para controles verificáveis. |
| [OWASP ASVS](owasp-asvs.md) | Ao selecionar requisitos técnicos verificáveis. | ASVS 5.0.0, nível, escopo, matriz requisito a requisito e evidência. |
| [OWASP API Top 10](owasp-api-top-10.md) | Em desenho, mudança ou revisão de APIs. | Autorização, autenticação, objetos, propriedades, recursos, inventário e integrações. |
| [Segurança Frappe](frappe-security.md) | Em SaaS com Frappe, ERPNext ou Frappe Learning. | DocTypes, roles, permissions, métodos whitelisted, jobs, hooks, arquivos e tenants. |
| [Pagamentos](payment-security.md) | Antes de aceitar pagamentos ou alterar fluxo financeiro. | Gateway, webhooks, idempotência, conciliação, reembolso, logs e escopo PCI contextual. |

## Checklists de plataforma e operação

| Checklist | Quando usar | Foco principal |
|---|---|---|
| [Cloud](cloud-security.md) | Antes de produção, mudança cloud, migração ou revisão periódica. | IAM, rede, secrets, storage, logs, backups, regiões, custo e exposição pública. |
| [CI/CD](ci-cd-security.md) | Antes de habilitar ou exigir workflow, gate, runner ou deploy automation. | Eventos, permissions, secrets, artifacts, caches, runners, branch protection e supply chain. |
| [Risco de Terceiros](third-party-risk.md) | Antes de contratar, integrar, renovar, ampliar escopo ou desligar fornecedor. | Dados, acesso, contrato, segurança, privacidade, continuidade, suboperadores e offboarding. |
| [Governança de IA](ai-governance.md) | Antes de PoC, lançamento ou mudança material com IA. | Finalidade, dados, fornecedor, retenção, revisão humana, prompt injection e monitoramento. |

## Checklists de governança, privacidade e acessibilidade

| Checklist | Quando usar | Foco principal |
|---|---|---|
| [LGPD e Privacidade](lgpd.md) | Antes de dados pessoais, nova finalidade, fornecedor, incidente ou revisão periódica. | Papéis, bases candidatas, direitos, RIPD, minimização, fornecedores e incidentes. |
| [Acessibilidade WCAG 2.2 AA](accessibility-wcag-22-aa.md) | Em design, PRs de UI, beta, release, venda enterprise ou auditoria periódica. | Critérios A/AA aplicáveis, teste manual, tecnologia assistiva, processos completos e barreiras. |

## Limites e evidências

- Checklists preenchidos podem revelar arquitetura, lacunas, fornecedores, clientes, tenants, controles e decisões comerciais.
- Não registre segredos, tokens, credenciais, cookies, dados pessoais reais, logs crus, dumps, backups, requests/responses, payloads, URLs internas ou evidências exploráveis.
- Relatórios crus e saídas integrais devem ficar em `reports/raw/` ou armazenamento restrito fora do Git.
- Resumos versionáveis devem ser minimizados, redigidos, revisados e preferencialmente vinculados por IDs opacos.
- Validação jurídica, contratual, normativa, enterprise, de ferramenta e de versão permanece contextual.
