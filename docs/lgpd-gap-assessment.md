# Avaliação de Lacunas LGPD

## Objetivo

Orientar uma avaliação de lacunas LGPD para SaaS sem duplicar o [Programa LGPD](lgpd-privacy-program.md) nem substituir validação jurídica.

Este arquivo é um guia-base. Avaliações reais podem revelar dados pessoais, fornecedores, contratos, bases legais, incidentes e lacunas sensíveis; portanto, devem ser preenchidas em sistema autorizado ou como resumo sanitizado revisado.

## Fonte Canônica

| Tema | Fonte interna |
|---|---|
| Programa, papéis, bases, direitos e incidentes | [Programa LGPD](lgpd-privacy-program.md) |
| Checklist executável | `checklists/lgpd.md` |
| Evidências e redaction | [Política de evidências](evidence-and-reporting-policy.md) |
| Dados, ROPA e RIPD/DPIA | `templates/data-map-template.md`, `templates/ropa-template.md`, `templates/dpia-template.md` |
| Terceiros | `checklists/third-party-risk.md`, `templates/vendor-risk-assessment-template.md` |
| Risco | `risk/severity-and-prioritization.md` |

## Quando Usar

- antes de produção com dados pessoais;
- antes de nova finalidade, integração, analytics, IA, pagamento ou fornecedor;
- antes de venda enterprise ou due diligence;
- após incidente, reclamação, mudança regulatória ou alteração material de arquitetura.

## Estrutura Recomendada

| Área | Pergunta de avaliação | Evidência segura |
|---|---|---|
| Governança | Há papéis, owners, canal e revisão definidos? | Matriz sanitizada de responsabilidades. |
| Inventário | Tratamentos, sistemas, dados, logs, backups e fornecedores estão mapeados? | Resumo por categoria, sem dado pessoal. |
| Bases e finalidades | Cada finalidade tem hipótese candidata e validação competente? | ID de decisão, não parecer integral. |
| Direitos | A organização consegue receber, autenticar, executar e responder pedidos? | Resultado de teste fictício. |
| Retenção | Há critérios, exceções e descarte por categoria? | Tabela genérica e teste agregado. |
| Terceiros | Fornecedores e suboperadores têm avaliação, contrato e incidente? | Registro sanitizado por categoria. |
| Segurança | Acesso, tenant, logs, secrets, backups e incidentes estão tratados? | Links para checklists e findings opacos. |
| Incidentes | Papéis, avaliação de risco e comunicação estão definidos? | Exercício ou decisão sanitizada. |

## Resultado Esperado

- lacuna;
- risco e impacto;
- fonte interna ou obrigação aplicável a confirmar;
- owner;
- prioridade;
- prazo;
- critério de aceite;
- dependência jurídica, técnica, contratual ou de fornecedor;
- referência opaca da evidência.

## Não Registrar Aqui

- dados pessoais reais, pedidos de titulares, comunicações à ANPD/titulares ou parecer jurídico integral;
- nomes de clientes, tenants, fornecedores reais, URLs internas, contratos assinados ou anexos;
- logs, dumps, backups, screenshots sem redaction ou relatórios crus.

## Pendências Contextuais

- O Lote 8 deve reconciliar `privacy/*.md` e operacionalizar artefatos LGPD sem decidir base legal automaticamente.
- Prazos, papéis, RIPD, transferência internacional e comunicação de incidente dependem de validação jurídica no caso concreto.
