# Plano de Continuidade de Negócio

## Objetivo

Orientar a criação de um plano proporcional de continuidade, recuperação e operação degradada para SaaS.

Este arquivo não define RTO, RPO, SLA ou estratégia universal. Esses valores dependem de análise de impacto no negócio, arquitetura, contratos, custos, fornecedores, criticidade e capacidade real testada.

## Fonte Canônica

| Tema | Fonte interna |
|---|---|
| Maturidade, continuidade e plano 30/60/90/180 | [Roadmap de segurança](security-roadmap.md) |
| Tipos de auditoria de backup, logs e continuidade | [Tipos de auditoria](audit-types.md) |
| Gatilhos antes/depois de incidentes e migrações | [Matriz de gatilhos](audit-trigger-matrix.md) |
| Evidência, retenção e material cru | [Política de evidências](evidence-and-reporting-policy.md) |
| Checklist operacional | `checklists/backup-restore.md` |
| Template de teste | `templates/backup-restore-test-template.md` |

## Escopo Mínimo

- serviços críticos do SaaS e dependências externas;
- dados, filas, arquivos, integrações, pagamentos, autenticação e suporte;
- backups, restauração, failover, rollback e operação manual temporária;
- comunicação interna, clientes, fornecedores e suporte;
- critérios de retorno, validação e lições aprendidas.

## Passos de Uso

1. Inventariar serviços, dados, dependências, owners e fornecedores críticos.
2. Fazer BIA proporcional e definir impactos por indisponibilidade, perda de dados, integridade e atraso operacional.
3. Definir RTO/RPO por serviço somente após validar capacidade técnica e custo.
4. Documentar estratégias de backup, restauração, rollback, contingência, comunicação e operação degradada.
5. Testar restauração com dados fictícios ou ambiente autorizado, sem versionar dumps, logs ou relatórios crus.
6. Registrar resumo sanitizado, lacunas, riscos aceitos, plano de melhoria e próxima data de teste.

## Decisões Que Exigem Revisão Humana

- prometer SLA, RTO ou RPO a cliente;
- aceitar perda de dados ou janela de indisponibilidade;
- armazenar backup fora da região, conta ou fornecedor principal;
- usar dados reais em teste de restore;
- descartar backup, snapshot ou evidência durante incidente, disputa ou legal hold.

## Evidências Seguras

- data e escopo do teste;
- serviço ou componente em termos genéricos;
- status agregado de restore/failover;
- duração medida quando não revelar capacidade sensível;
- lacunas, owner, prazo e reteste;
- ID opaco da evidência restrita.

## Pendências Contextuais

- O plano real deve ser preenchido pelo SaaS consumidor com arquitetura, contratos e capacidade própria.
- Testes funcionais de scripts, backups e evidências pertencem aos lotes de scripts, relatórios/evidências e revisão final.
