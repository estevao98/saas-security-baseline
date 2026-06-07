# Template de Relatório de Incidente

## Objetivo e quando usar

Coordenar fatos, decisões, contenção, recuperação e obrigações durante qualquer incidente confirmado ou suspeito. Abrir no início da resposta; não esperar conclusão forense.

> O registro operacional real é **restrito** e fica fora do Git. Este arquivo é apenas estrutura reutilizável.

## Campos obrigatórios

- ID `[INC-001]`, classificação, status, início, detecção e ciência;
- incident commander, owners e canal restrito;
- descrição factual, serviços/tenants em faixas agregadas e impacto;
- linha do tempo em UTC com fonte e decisão;
- contenção, erradicação, recuperação, validação e monitoramento;
- dados pessoais possivelmente afetados, papel controlador/operador e acionamento de Privacidade/Jurídico;
- avaliação de risco/dano relevante e decisões de comunicação;
- evidências, cadeia de custódia e localização restrita por IDs;
- critérios de encerramento, ações pendentes e aprovadores.

## Campos opcionais

Severidade operacional, causa provável, fornecedor, indicadores em repositório restrito, impacto financeiro, status page, seguro, autoridades, clientes enterprise, legal hold e postmortem.

## Linha do tempo

| Data/hora UTC | Evento factual | Ação/decisão | Owner | Evidência |
|---|---|---|---|---|
| `[AAAA-MM-DDThh:mm:ssZ]` | `[EVENTO-SANITIZADO]` | `[ACAO]` | `[PAPEL]` | `[EV-RES-001]` |

## Exemplo fictício

`[INC-001]`: indisponibilidade parcial de `[PRODUTO-A]` detectada em `[DATA-FICTICIA]`. O time isolou `[COMPONENTE-A]`, restaurou serviço por procedimento aprovado e iniciou avaliação de dados pessoais; nenhum cliente, endereço ou log é registrado aqui.

## Cuidados e revisão antes de compartilhar

- [ ] Não colocar logs, dumps, backups, indicadores, payloads, requests/responses, segredo, dado pessoal, cliente, usuário, IP, URL ou detalhe de contenção explorável no Git.
- [ ] Distinguir fato, hipótese e decisão; preservar horários e origem no sistema restrito.
- [ ] Confirmar comunicação e prazo com controlador, Encarregado e Jurídico no caso concreto; não presumir obrigação.
- [ ] Segurança/Operações aprovam encerramento; Privacidade/Jurídico aprovam decisões regulatórias e externas.
- [ ] Incidentes com dados pessoais seguem retenção mínima regulatória aplicável; validar requisitos adicionais.

## Relação com o repositório

Segue `docs/evidence-and-reporting-policy.md`, `docs/lgpd-privacy-program.md`, `risk/severity-and-prioritization.md` e `docs/audit-trigger-matrix.md`; pode originar `templates/postmortem-template.md`.
