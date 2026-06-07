# Checklist de Segurança de Pagamentos

## Objetivo

Verificar se fluxos de pagamento de um SaaS reduzem risco financeiro, operacional, de privacidade e de segurança antes de produção, mudança de gateway, alteração de checkout, webhooks, antifraude, conciliação, reembolso ou cobrança recorrente.

Este checklist não declara conformidade PCI, bancária, fiscal, contábil ou regulatória. Escopo PCI, exigências do arranjo, obrigações contratuais, impostos e controles financeiros exigem validação competente no caso concreto.

## Quando usar

- [ ] Antes de aceitar pagamentos reais.
- [ ] Antes de alterar checkout, plano, assinatura, cupom, trial, cobrança recorrente, invoice, reembolso ou chargeback.
- [ ] Antes de trocar ou adicionar `[GATEWAY-A]`, antifraude, ERP, conciliação ou provedor de cobrança.
- [ ] Após incidente financeiro, suspeita de fraude, divergência de conciliação, erro de autorização ou falha de webhook.
- [ ] Em revisão trimestral do fluxo financeiro quando houver pagamentos ativos.

## Revisor responsável

- [ ] Engenharia responsável por pagamentos revisou implementação, testes e rollback.
- [ ] Segurança/AppSec revisou autenticação, autorização, webhooks, logs, segredos e abuso de fluxo.
- [ ] Financeiro/Operações revisou conciliação, reembolso, chargeback, segregação e fechamento.
- [ ] Privacidade/Jurídico revisaram dados pessoais, bases, retenção e comunicações quando aplicável.
- [ ] Especialista qualificado revisou escopo PCI ou requisito regulatório quando o fluxo envolver dado de cartão ou obrigação formal.

## Evidências esperadas

- [ ] Diagrama sanitizado do fluxo entre SaaS, `[GATEWAY-A]`, antifraude, ERP e sistemas internos, sem URL interna ou ID real.
- [ ] Matriz de responsabilidades entre produto, gateway, antifraude, financeiro, suporte e segurança.
- [ ] Casos de teste em sandbox ou ambiente autorizado, com IDs fictícios e sem cartão real, chave Pix real, conta bancária real ou transação real.
- [ ] Evidência de assinatura/autenticidade de webhook, proteção contra replay e idempotência, registrada por ID opaco.
- [ ] Evidência de reconciliação entre pedido, cobrança, status de assinatura, ledger interno e extrato do provedor em nível agregado.
- [ ] Evidência sanitizada de autorização por papel para operações financeiras sensíveis.
- [ ] Registro de riscos, exceções, falsos positivos e retestes vinculados por IDs opacos.

## Itens obrigatórios

- [ ] O fluxo evita armazenar, registrar ou transmitir dado de cartão quando não for estritamente necessário e validado formalmente.
- [ ] A integração usa redirecionamento, tokenização ou mecanismo equivalente do provedor quando aplicável, sem segredo de gateway no código, template, log ou artifact.
- [ ] Segredos de gateway, webhook secrets, client secrets, tokens e certificados ficam em cofre ou secret manager aprovado, com menor privilégio e rotação definida.
- [ ] Webhooks verificam autenticidade, integridade, origem esperada conforme documentação do provedor, janela temporal e proteção contra replay.
- [ ] Webhooks e callbacks são idempotentes; reenvio, duplicidade e evento fora de ordem não geram cobrança, ativação ou reembolso duplicado.
- [ ] O servidor recalcula preço, desconto, imposto, plano e permissões; o cliente ou frontend não é fonte de verdade para valor cobrado.
- [ ] Alteração de plano, trial, cupom, cobrança manual, reembolso e cancelamento exigem autorização por papel e trilha auditável.
- [ ] Operações financeiras sensíveis têm segregação entre quem solicita, aprova e executa quando o risco justificar.
- [ ] Reembolso e chargeback possuem fluxo documentado, owner, evidência mínima, aprovação e reconciliação posterior.
- [ ] Antifraude está inventariado com dados enviados, finalidade, retenção, acesso, decisão humana quando aplicável e fallback operacional.
- [ ] Logs de pagamento não incluem cartão, CVV, chave Pix real, dados bancários, segredo, payload integral de webhook, token, e-mail real ou identificador de cliente real.
- [ ] Erros de pagamento retornam mensagens seguras, sem detalhes de gateway, assinatura, payload, stack trace ou regra antifraude sensível.
- [ ] Testes cobrem sucesso, falha, timeout, retry, cancelamento, reembolso, disputa, evento duplicado, evento atrasado e indisponibilidade do provedor.
- [ ] Conciliação identifica divergência entre cobrança, status de assinatura, invoice interna e ledger, com fila de tratamento e owner.
- [ ] Dependência do gateway tem plano de indisponibilidade, degradação segura, comunicação interna e critério de retomada.
- [ ] Mudanças em pagamentos acionam revisão de LGPD, terceiros, logs, incidentes, backup e acesso administrativo quando aplicável.

## Itens desejáveis

- [ ] Criar testes automatizados de contrato para eventos de `[GATEWAY-A]` usando fixtures sintéticas e não exploráveis.
- [ ] Manter monitoramento de anomalias de cobrança, reembolso, chargeback, tentativa repetida e divergência de status.
- [ ] Usar ledger interno imutável ou trilha append-only para eventos financeiros críticos, conforme maturidade e necessidade contábil.
- [ ] Exigir aprovação adicional para ajustes manuais de saldo, crédito, invoice interna e reprocessamento.
- [ ] Documentar playbook de indisponibilidade de gateway, incluindo comunicação com suporte e financeiro.
- [ ] Validar acessibilidade do checkout e mensagens de erro em fluxos críticos.
- [ ] Avaliar risco de fornecedor do gateway e antifraude, incluindo suboperadores, regiões, suporte, retenção e incidentes.

## Melhorias futuras

- [ ] Avaliar auditoria independente do fluxo de pagamentos quando escala, contrato, setor ou risco financeiro justificarem.
- [ ] Implementar detecção contínua de divergências e alertas com métricas de falso positivo.
- [ ] Formalizar matriz de segregação financeira com recertificação periódica de acessos.
- [ ] Avaliar certificação, atestação ou validação formal somente se escopo, obrigação e assessor competente forem definidos.

## Critérios de aprovação

- [ ] Itens obrigatórios aplicáveis foram atendidos ou possuem não aplicabilidade justificada e aprovada.
- [ ] Não há possibilidade confirmada de adulterar valor, falsificar evento com efeito financeiro, repetir cobrança, ativar serviço indevidamente ou expor dado de pagamento.
- [ ] Webhooks, idempotência, autorização, conciliação, reembolso e chargeback foram testados com dados fictícios em ambiente autorizado.
- [ ] Evidências foram sanitizadas, revisadas e vinculadas por IDs opacos.
- [ ] Riscos residuais possuem owner, prazo, controle compensatório, aprovador e expiração.

## Critérios de reprovação/bloqueio

- [ ] Dado de cartão, CVV, chave Pix real, dado bancário real, segredo, token ou payload sensível aparece em Git, log, artifact, print ou relatório versionado.
- [ ] Valor, plano, desconto, status financeiro ou autorização pode ser manipulado pelo cliente, frontend, API ou webhook sem validação do servidor.
- [ ] Webhook sem autenticidade, sem proteção contra replay ou sem idempotência pode gerar efeito financeiro ou ativação indevida.
- [ ] Reembolso, chargeback, ajuste ou acesso financeiro sensível não tem autorização, segregação ou trilha mínima.
- [ ] Conciliação material falha ou não existe para o fluxo alterado.
- [ ] Escopo PCI, obrigação regulatória ou requisito contratual material foi declarado como atendido sem validação formal.
- [ ] Incidente financeiro ativo, suspeita de fraude material ou divergência crítica permanece sem contenção e decisão competente.

## Cuidados contra vazamento

- [ ] Não registrar cartão real, chave Pix real, dados bancários reais, chargeback real, invoice real, ID real de transação ou gateway real de cliente.
- [ ] Não registrar segredo de gateway, webhook secret, token, client secret, certificado, cookie, header ou credencial.
- [ ] Não colar payload integral de webhook, request/response, log cru, print de painel, URL interna, tenant, cliente, titular ou conta financeira.
- [ ] Usar marcadores como `[GATEWAY-A]`, `[EVENTO-A]`, `[TRANSACAO-FICTICIA-A]`, `[TENANT-A]` e `[EV-SAN-001]`.
- [ ] Guardar evidência integral somente em armazenamento restrito; versionar apenas resumo sanitizado aprovado.
- [ ] Revisar nomes de branch, commit, issue, PR, arquivo e artifact para não revelar fornecedor real, cliente, incidente ou valor financeiro.
