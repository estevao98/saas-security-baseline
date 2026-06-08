# Checklist de Segurança de API

## Objetivo

Servir como guia auxiliar para revisar APIs sem duplicar o checklist canônico `checklists/owasp-api-top-10.md`.

Use este arquivo para localizar fontes internas, decidir evidências e registrar limites. O checklist executável fica em `checklists/owasp-api-top-10.md`.

## Fonte Canônica

| Tema | Fonte interna |
|---|---|
| Riscos OWASP API Top 10 | `checklists/owasp-api-top-10.md` |
| Requisitos verificáveis | `checklists/owasp-asvs.md` |
| Tipos de teste de API | [Tipos de auditoria](audit-types.md) |
| Ferramentas e comandos | [Catálogo de ferramentas](security-tools-catalog.md), `scripts/run-api-audit.sh` |
| Evidências | [Política de evidências](evidence-and-reporting-policy.md) |
| Relatório final | [Modelo de auditoria](security-audit-baseline.md) |

## Escopo de Revisão

- inventário de endpoints, versões e métodos;
- autenticação, sessão, tokens e expiração;
- autorização por objeto, função, tenant e contexto;
- validação de entrada e saída;
- rate limit, quota, abuso e consumo de recursos;
- webhooks, callbacks e integrações externas;
- logs, erros, auditoria e proteção de dados pessoais;
- contrato OpenAPI/GraphQL quando aplicável.

## Evidência Segura

- matriz endpoint-papel-recurso com nomes genéricos;
- contagem de testes positivos/negativos e status;
- IDs opacos de findings, riscos e retestes;
- versão do contrato e commit analisado;
- resumo de ferramentas executadas sem request/response integral.

## Não Registrar Aqui

- URLs internas, tokens, headers, cookies ou credenciais;
- payloads ofensivos, PoCs, requests/responses reais ou HAR;
- IDs reais de cliente, tenant, usuário, pagamento ou documento;
- relatório cru de DAST, Schemathesis, ZAP, Newman ou ferramenta similar.

## Pendências Contextuais

- Testes funcionais de scripts de API pertencem ao Lote 5.
- Promover teste de API em CI/CD exige validação de workflow, ambiente efêmero, logs, artifacts e plano GitHub.
