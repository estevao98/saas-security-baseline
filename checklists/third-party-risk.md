# Checklist de Risco de Terceiros

## Objetivo

Avaliar risco técnico, operacional, de privacidade, segurança, continuidade e saída de terceiros antes de contratação, integração, renovação, ampliação de escopo, incidente ou offboarding em SaaS.

Este checklist não emite parecer jurídico, contratual, financeiro ou regulatório definitivo. Contratos, DPAs, SLAs, transferências internacionais, responsabilidades e cláusulas devem ser validados por pessoas competentes no contexto real.

## Quando usar

- [ ] Antes de contratar `[FORNECEDOR-A]` para `[SISTEMA-A]`, integração, cloud, pagamento, IA, suporte, analytics, observabilidade ou comunicação.
- [ ] Antes de compartilhar dados pessoais, dados de cliente, credenciais, logs, acesso administrativo ou informação confidencial com terceiro.
- [ ] Em renovação, mudança de plano, novo suboperador, nova região, novo recurso ou mudança material de contrato.
- [ ] Após incidente, indisponibilidade relevante, alteração de segurança, notícia pública material ou falha de suporte.
- [ ] No offboarding, encerramento de contrato, migração ou redução de escopo.

## Revisor responsável

- [ ] Owner do sistema ou produto aprovou necessidade, finalidade, criticidade e alternativa.
- [ ] Segurança revisou controles técnicos, acesso, incidentes, vulnerabilidades, logs e segregação.
- [ ] Privacidade/Encarregado revisou dados tratados, papéis, suboperadores, retenção, transferência e direitos.
- [ ] Jurídico/Compras revisaram contrato, DPA, SLA, auditoria, responsabilidade, suporte e offboarding quando aplicável.
- [ ] Operações/SRE revisou continuidade, dependência, monitoramento, suporte e plano de saída.

## Evidências esperadas

- [ ] Ficha de avaliação de `[FORNECEDOR-A]` com serviço, criticidade, owner, uso pretendido e decisão.
- [ ] Inventário de dados tratados, acesso concedido, sistemas integrados, regiões e suboperadores, sem nomes reais de cliente.
- [ ] Mapeamento sanitizado de fluxo entre `[SISTEMA-A]` e `[FORNECEDOR-A]`, sem URL interna, token, tenant ou endpoint real.
- [ ] Evidência de revisão contratual por ID de `[CONTRATO-A]`, sem anexar contrato real ao Git.
- [ ] Evidência de controles de segurança e privacidade do fornecedor em resumo validado, sem questionário cru ou relatório sensível.
- [ ] Registro de riscos, lacunas, condições de aprovação, owner, prazo, monitoramento e próxima revisão.
- [ ] Plano de offboarding, exportação, exclusão, revogação de acesso e contingência.

## Itens obrigatórios

- [ ] Necessidade, finalidade, criticidade e alternativa a `[FORNECEDOR-A]` estão registradas.
- [ ] Dados tratados estão classificados por categoria, sensibilidade, volume aproximado, titulares, tenant e finalidade, sem valores reais.
- [ ] Acesso do fornecedor segue menor privilégio, escopo mínimo, segregação por tenant e revisão periódica.
- [ ] Credenciais, tokens, webhooks, chaves e integrações usam cofre ou mecanismo seguro; não são compartilhados por canal informal.
- [ ] Contrato ou termo aplicável define responsabilidades, segurança, confidencialidade, suporte, incidentes, auditoria, retorno, exclusão e encerramento conforme risco.
- [ ] Papéis de controlador, operador, suboperador ou terceiro foram analisados por tratamento, não apenas por rótulo contratual.
- [ ] Suboperadores, países/regiões, suporte remoto e transferências internacionais foram inventariados e encaminhados para validação competente.
- [ ] Requisitos de retenção, exportação, exclusão, portabilidade e retorno de dados foram definidos antes de produção.
- [ ] Segurança do fornecedor foi avaliada quanto a identidade, MFA quando aplicável, criptografia, segregação, SDLC, vulnerabilidades, logs, backup e incidentes.
- [ ] Continuidade foi avaliada: SLA, status, suporte, backup, dependência, contingência, degradação segura e alternativa.
- [ ] Integração com API/webhook valida autenticação, autorização, assinatura, replay, retry, rate limit, erros e logs minimizados.
- [ ] Evidências independentes ou declarações do fornecedor foram verificadas quanto a escopo, validade e limitações; logotipo ou autodeclaração não basta.
- [ ] Riscos residuais possuem tratamento, owner, aprovador, prazo, expiração e gatilho de reavaliação.
- [ ] Offboarding cobre revogação de acesso, remoção de credenciais, exportação, exclusão, atestado, migração, dependências e monitoramento pós-saída.
- [ ] Incidente no fornecedor aciona avaliação de impacto, comunicação, contenção, alternativa e revisão de contrato/risco.

## Itens desejáveis

- [ ] Manter inventário central de fornecedores por criticidade, dados, owners, revisão e status.
- [ ] Exigir revisão anual de fornecedores críticos e trimestral de acessos/escopos técnicos relevantes.
- [ ] Validar direito de auditoria, relatórios independentes, SBOM, histórico de disponibilidade e processo de vulnerabilidades quando aplicável.
- [ ] Testar contingência ou substituição para fornecedor crítico em cenário fictício.
- [ ] Monitorar alterações de suboperadores, termos, regiões, status page e notificações de segurança.
- [ ] Avaliar acessibilidade, sustentabilidade operacional e dependência comercial quando o fornecedor afeta usuários finais ou operação crítica.

## Melhorias futuras

- [ ] Automatizar recertificação de acessos, escopos e fornecedores críticos.
- [ ] Criar score interno de risco de terceiros com pesos aprovados e revisão humana.
- [ ] Integrar gestão de terceiros a threat modeling, LGPD, incidentes, continuidade e release gates.
- [ ] Avaliar auditoria independente de fornecedores críticos conforme contrato, setor, escala e risco.

## Critérios de aprovação

- [ ] Fornecedor, serviço, finalidade, dados, acesso, contrato, segurança, privacidade, continuidade, suporte, localização, subcontratados e offboarding foram avaliados.
- [ ] Lacunas materiais possuem condição de aprovação, mitigação, owner, prazo e decisão competente.
- [ ] Nenhum dado, acesso ou integração produtiva é liberado antes dos controles mínimos aplicáveis.
- [ ] Evidências são sanitizadas, com contratos e relatórios reais mantidos em sistema restrito.
- [ ] Próxima revisão e gatilhos de reavaliação estão definidos.

## Critérios de reprovação/bloqueio

- [ ] `[FORNECEDOR-A]` crítico não tem avaliação mínima antes de receber dado, acesso ou integração produtiva.
- [ ] Dados pessoais, dados de pagamento, logs, segredos ou informação de cliente seriam compartilhados sem contrato, papel, finalidade, segurança ou transferência avaliados.
- [ ] Suboperadores, localização, retenção, exclusão ou resposta a incidentes são desconhecidos e materialmente relevantes.
- [ ] Acesso técnico é amplo, permanente, não auditável ou incompatível com menor privilégio.
- [ ] Não há plano de saída, exportação, exclusão ou contingência para fornecedor crítico.
- [ ] Evidência real de contrato, cliente, fornecedor, relatório sensível, contato, preço, URL, token ou incidente foi colocada no Git.
- [ ] Parecer jurídico, contratual ou regulatório foi presumido sem revisão competente.

## Cuidados contra vazamento

- [ ] Não usar nomes reais de fornecedores, clientes, contratos, suboperadores, processadores, contatos, preços, tickets ou incidentes.
- [ ] Usar marcadores como `[FORNECEDOR-A]`, `[CONTRATO-A]`, `[SISTEMA-A]`, `[SUBOPERADOR-A]`, `[REGIAO-A]` e `[EV-SAN-001]`.
- [ ] Não anexar contrato real, DPA, questionário cru, relatório de pentest, relatório de auditoria, certificado, print de portal ou comunicação do fornecedor.
- [ ] Não registrar URL interna, endpoint, chave, token, webhook secret, tenant, cliente, log, payload ou resposta de API.
- [ ] Versionar apenas modelo, decisão sanitizada ou resumo aprovado; manter artefatos reais em sistema de compras, jurídico, risco ou evidências restrito.
- [ ] Revisar metadados de PDFs, planilhas e imagens antes de qualquer compartilhamento externo ou interno ampliado.
