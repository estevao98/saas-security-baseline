# Plano de Resposta a Incidentes

## Objetivo

Guiar a preparação, triagem, contenção, comunicação, recuperação e aprendizado de incidentes em um SaaS que reutilize este baseline.

Este arquivo é um guia-base. O registro real de incidente, evidência forense, linha do tempo detalhada, lista de pessoas afetadas, logs, indicadores sensíveis e comunicações formais devem ficar em canal restrito, nunca neste repositório.

## Fonte Canônica

| Tema | Fonte interna |
|---|---|
| Reporte privado, segredo exposto e divulgação | `SECURITY.md` |
| Evidências, redaction e retenção | [Política de evidências](evidence-and-reporting-policy.md) |
| Severidade, SLA, gate e aceite de risco | `risk/severity-and-prioritization.md` |
| Incidente com dados pessoais | [Programa LGPD](lgpd-privacy-program.md) |
| Checklist operacional | `checklists/incident-response.md` |
| Registro e postmortem | `templates/incident-report-template.md`, `templates/postmortem-template.md` |

## Quando Usar

- suspeita de segredo exposto;
- vulnerabilidade crítica ou alta confirmada;
- indisponibilidade material;
- exposição, perda, alteração indevida ou acesso não autorizado a dados;
- quebra de isolamento entre tenants;
- abuso de API, conta, pagamento, webhook ou integração;
- falha de controle obrigatório de release ou CI/CD com impacto material.

## Fluxo Mínimo

1. **Receber e classificar:** registrar ID opaco, origem, janela aproximada, área afetada e sensibilidade provável.
2. **Conter:** interromper exposição, bloquear abuso, revogar ou rotacionar segredo quando aplicável e preservar operação segura.
3. **Preservar evidência:** guardar cru fora do Git com acesso restrito; não colar logs, payloads, tokens ou dados pessoais em issues ou PRs.
4. **Avaliar impacto:** confirmar escopo, tenants, dados, fornecedores, disponibilidade, integridade, confidencialidade e obrigações aplicáveis.
5. **Definir comunicação:** acionar Segurança, Privacidade/Jurídico, Operações, Produto, Comunicação e cliente/controlador quando aplicável.
6. **Recuperar:** aplicar correção, validar mitigação, monitorar recorrência e decidir retorno operacional.
7. **Encerrar:** produzir postmortem sanitizado, backlog de prevenção, atualização de riscos e reteste.

## Critérios de Bloqueio

- segredo ativo ou potencialmente ativo sem revogação/rotação;
- exposição entre tenants;
- dado pessoal exposto ou incidente em avaliação sem decisão competente;
- vulnerabilidade crítica explorável sem mitigação;
- evidência crua sendo publicada em Git, PR, issue, chat amplo ou artifact;
- correção sem reteste proporcional.

## Evidência Permitida no Git

- resumo sanitizado com ID opaco, tipo de incidente, impacto agregado, medidas, status e lições aprendidas;
- checklist vazio ou preenchido apenas com dados fictícios;
- postmortem sem vetor explorável, segredo, cliente, tenant, URL interna, log cru ou dado pessoal.

## Pendências Contextuais

- Definir canal privado real, escalação, plantão, SLAs e matriz de comunicação no repositório consumidor.
- Validar obrigações legais, contratuais, regulatórias e de comunicação com Privacidade/Jurídico.
- Exercícios de incidente e validação funcional pertencem aos lotes de scripts, evidências e revisão final.
