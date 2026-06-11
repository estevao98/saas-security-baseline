# Modelo de Ameaças

## Objetivo

Guiar a criação de um threat model sanitizado para mudanças de arquitetura, fluxos críticos, integrações, dados pessoais, APIs, pagamentos, backend Python, cloud e IA.

Este arquivo não deve conter diagrama real detalhado, topologia interna, hostname, IP, tenant, segredo, request/response, payload ou instrução explorável. Modelos completos podem ser confidenciais e devem ficar em repositório restrito quando necessário.

## Fonte Canônica

| Tema | Fonte interna |
|---|---|
| Tipo e frequência de threat modeling | [Tipos de auditoria](audit-types.md) |
| Gatilhos por cenário | [Matriz de gatilhos](audit-trigger-matrix.md) |
| Requisitos AppSec e backend | `checklists/owasp-asvs.md`, [Checklist de segurança de API](api-security-checklist.md) |
| Privacidade e dados pessoais | [Programa LGPD](lgpd-privacy-program.md) |
| Evidências e redaction | [Política de evidências](evidence-and-reporting-policy.md) |
| Template reutilizável | `templates/threat-model-template.md` |

## Quando Usar

- antes de autenticação, autorização, pagamento, API pública, webhook ou integração crítica;
- antes de processar dado pessoal sensível ou dado de alto impacto;
- antes de mudança em multi-tenant, permissões, storage, filas ou jobs;
- antes de usar IA de forma material;
- após incidente, quase incidente ou mudança relevante de fornecedor/cloud.

## Estrutura Recomendada

| Seção | Conteúdo seguro |
|---|---|
| Escopo | Produto, fluxo, release, papéis e limites em termos genéricos. |
| Ativos | Categorias de dados, funções, integrações e processos críticos. |
| Fronteiras de confiança | Transições entre usuário, aplicação, API, fornecedor, job e storage sem topologia sensível. |
| Ameaças | Hipóteses de abuso com impacto, precondição e categoria, sem PoC. |
| Controles | Mitigações planejadas ou existentes e evidência esperada. |
| Riscos residuais | Owner, prazo, aceite formal e gatilho de revisão. |
| Validação | Testes, revisão manual, checklist e reteste necessários. |

## Checklist Mínimo

- [ ] O fluxo tem dono, escopo, dados e revisores definidos.
- [ ] As fronteiras de confiança foram identificadas.
- [ ] Ameaças de autenticação, autorização, tenant, API, logs, segredos, dados e fornecedores foram consideradas.
- [ ] Controles estão vinculados a teste, checklist ou evidência.
- [ ] Riscos sem mitigação têm tratamento, prazo ou aceite formal.
- [ ] O documento versionado foi sanitizado.

## Pendências Contextuais

- A ferramenta, método detalhado e diagrama completo devem ser escolhidos pelo time do SaaS consumidor.
- A validação operacional depende dos lotes de domínio, scripts, evidências e revisão final.
