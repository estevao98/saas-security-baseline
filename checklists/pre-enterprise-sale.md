# Checklist Pré-Venda Empresarial

## Objetivo

Verificar se compromissos de segurança, privacidade, disponibilidade, continuidade, acessibilidade e operação propostos a um cliente empresarial são precisos, sustentáveis e apoiados por controles, owners e evidências.

Este checklist não autoriza declarar certificação, conformidade integral ou capacidade não demonstrada. Questionários, contratos e materiais comerciais exigem revisão contextual.

## Quando usar

- [ ] Antes de responder due diligence, questionário ou solicitação material de evidência de cliente empresarial.
- [ ] Antes de assinar contrato, anexo de segurança, privacidade, SLA, acessibilidade ou continuidade.
- [ ] Antes de prometer novo controle, integração, região, suporte, prazo, certificação ou tratamento de dados.
- [ ] Novamente quando o escopo, produto, fornecedor, arquitetura, obrigação ou pacote de evidências mudar.

Itens não aplicáveis devem ser justificados. Requisito material não atendido deve ser negociado, tratado ou rejeitado, nunca marcado como cumprido sem evidência.

## Revisor responsável

- [ ] Segurança/Governança coordena controles, riscos, evidências e precisão das alegações.
- [ ] Plataforma/Operações confirma disponibilidade, observabilidade, backup, restauração, continuidade e suporte.
- [ ] Engenharia/Produto confirma arquitetura, isolamento, roadmap e capacidade real do serviço.
- [ ] Privacidade/Encarregado e Jurídico revisam papéis, dados, contratos, transferências, incidentes e obrigações aplicáveis.
- [ ] Comercial/Responsável contratual confirma que proposta, questionário e contrato não excedem a capacidade aprovada.
- [ ] Compras/Gestão de terceiros revisa fornecedores e suboperadores críticos quando aplicável.
- [ ] Acessibilidade revisa alegações, escopo, limitações e plano de correção do produto.

Certificações, normas, LGPD, requisitos setoriais e cláusulas específicas podem exigir especialista independente ou validação jurídica adicional.

## Evidências esperadas

- [ ] Matriz requisito-compromisso-controle-owner-evidência, com status e lacunas.
- [ ] Pacote sanitizado de due diligence adequado à audiência e aprovado para compartilhamento.
- [ ] Descrição de arquitetura e responsabilidade compartilhada em nível seguro, sem topologia sensível.
- [ ] Resumos de testes de autenticação, autorização, isolamento, vulnerabilidades e supply chain.
- [ ] SLI/SLO observados, histórico agregado, processo de suporte e exceções relevantes.
- [ ] Evidência resumida de backup, restauração, exercício de incidente e continuidade.
- [ ] Inventário aprovado de fornecedores/suboperadores críticos e responsabilidades aplicáveis.
- [ ] Registro de riscos, lacunas, planos, aceites temporários e aprovações contratuais.

Documentos reais de cliente, contratos, questionários preenchidos e evidências restritas devem ficar em sistemas autorizados, não nesta baseline.

## Itens obrigatórios

### Escopo e alegações

- [ ] Produto, serviço, regiões, ambientes, integrações, dados e responsabilidades incluídos na proposta estão delimitados.
- [ ] Cada requisito material do cliente foi classificado como atendido, parcialmente atendido, não atendido ou não aplicável, com justificativa revisada.
- [ ] Cada compromisso proposto possui controle correspondente, owner, evidência e capacidade operacional demonstrável.
- [ ] Materiais comerciais e respostas não declaram certificação, auditoria independente, conformidade ou cobertura que não exista no escopo declarado.
- [ ] Lacunas e dependências de roadmap foram comunicadas como futuras, sem apresentá-las como controles atuais.
- [ ] Exceções, customizações e obrigações novas foram avaliadas quanto a custo, prazo, risco, operação e aprovação competente.

### Segurança e engenharia

- [ ] Arquitetura, fronteiras de responsabilidade e modelo de isolamento entre tenants estão documentados e revisados.
- [ ] Autenticação, autorização, contas privilegiadas, acesso administrativo e ciclo de acesso possuem controles e revisão definidos.
- [ ] Processo de vulnerabilidades cobre recebimento, triagem, severidade, remediação, reteste, exceção e comunicação coordenada.
- [ ] Gates de CI/CD, revisão de código, segredos, dependências e artefatos são descritos conforme operam de fato.
- [ ] SCA/SBOM e componentes de terceiros são tratados conforme risco e compromisso; SBOM não é apresentado como prova de ausência de vulnerabilidades.
- [ ] Cloud, infraestrutura, configuração, criptografia e gestão de chaves/segredos têm responsabilidades e limites claros, sem revelar detalhes sensíveis.
- [ ] Incidentes, findings críticos, quebras de tenant e riscos materiais conhecidos foram encaminhados pelo processo restrito e considerados na decisão comercial.

### Privacidade, dados e terceiros

- [ ] Papéis de controlador, operador e demais responsabilidades foram analisados para o serviço e o contrato concretos.
- [ ] Categorias, finalidades, localização, retenção, exclusão, retorno, acesso e compartilhamento de dados estão documentados no nível necessário.
- [ ] Bases, direitos, RIPD/avaliação de impacto, transferência internacional e comunicação de incidente foram avaliados por Privacidade/Jurídico quando aplicáveis.
- [ ] Fornecedores e suboperadores críticos foram inventariados, avaliados e associados a responsabilidades, dados, continuidade e saída.
- [ ] O processo para solicitações de titulares, exclusão, exportação e encerramento de contrato é executável e possui owner.
- [ ] Dados e evidências do prospect ou cliente não foram reutilizados em demonstrações, testes ou documentos sem autorização e controles.

### Operação, continuidade e suporte

- [ ] SLI/SLO, SLA proposto, suporte, escalonamento e manutenção são mensuráveis e compatíveis com capacidade observada.
- [ ] Backup e restauração foram testados; RTO/RPO declarados são sustentados por evidência ou apresentados claramente como objetivos ainda não demonstrados.
- [ ] Plano de resposta a incidentes define papéis, triagem, contenção, evidência, comunicação e participação de Privacidade/Jurídico.
- [ ] Continuidade, dependências críticas, contingência e recuperação foram avaliadas e exercitadas no nível exigido pelo compromisso.
- [ ] Comunicação de incidentes e indisponibilidade possui critérios, canais e prazos revisados no contrato aplicável.
- [ ] Saída, portabilidade, devolução e exclusão de dados possuem responsabilidades e limitações documentadas.

### Acessibilidade e evidências

- [ ] Alegações de acessibilidade identificam escopo, método, data, limitações e versão do produto avaliada.
- [ ] Avaliação manual cobre fluxos críticos; resultados automatizados não são usados isoladamente para declarar conformidade.
- [ ] Barreiras materiais possuem owner, prioridade e plano; requisito contratual de acessibilidade não atendido foi tratado antes da assinatura.
- [ ] O pacote de evidências foi minimizado, sanitizado, revisado por segunda pessoa e aprovado para a audiência.
- [ ] Canal, destinatários, confidencialidade, validade e retenção do pacote de due diligence foram definidos.
- [ ] Riscos e exceções comerciais possuem owner, aprovador competente, prazo, monitoramento e expiração.

## Itens desejáveis

- [ ] Threat model amplo e revisão arquitetural recente cobrem o escopo ofertado.
- [ ] Avaliação independente de segurança foi concluída com escopo e limitações comunicados com precisão.
- [ ] Exercícios recentes de incidente e continuidade envolveram áreas técnicas, negócio, Privacidade e Jurídico.
- [ ] Fornecedores críticos possuem evidência independente ou testes adicionais proporcionais ao risco.
- [ ] Existe pacote de acessibilidade atualizado e revisado por especialista competente.
- [ ] Métricas de vulnerabilidades, disponibilidade, restauração e incidentes são consistentes e reproduzíveis por período suficiente.

## Melhorias futuras

- [ ] Buscar certificação ou atestação formal somente com objetivo, escopo, orçamento, organismo e demanda definidos.
- [ ] Automatizar coleta controlada de evidências e validade sem expor material cru.
- [ ] Ampliar exercícios de failover, portabilidade, saída e resposta conjunta com fornecedores críticos.
- [ ] Criar portal restrito de confiança/due diligence com conteúdo por audiência, revisão e expiração.
- [ ] Medir eficácia dos controles e tendência de riscos em vez de apenas presença documental.

## Critérios de aprovação

- [ ] Cada compromisso material possui controle, owner, evidência e capacidade operacional correspondente.
- [ ] Requisitos parcialmente atendidos, não atendidos e futuros estão explícitos e foram aceitos pela autoridade comercial/contratual competente.
- [ ] Não há risco material, incidente, fornecedor crítico ou obrigação aplicável omitido da decisão restrita.
- [ ] Continuidade, restauração, suporte e métricas sustentam os compromissos propostos.
- [ ] Segurança, Operações, Privacidade/Jurídico, Produto e responsável comercial registraram Go no escopo aplicável.

## Critérios de reprovação ou bloqueio

- [ ] Há requisito contratual material não atendido apresentado como cumprido ou sem negociação aprovada.
- [ ] Certificação, conformidade, auditoria, SLA, RTO/RPO ou controle é alegado sem escopo e evidência correspondentes.
- [ ] Fornecedor/suboperador crítico não foi avaliado ou não oferece responsabilidades, incidente, exclusão/retorno de dados ou contingência compatíveis com o risco.
- [ ] Continuidade, restauração ou capacidade de resposta não são demonstráveis para compromisso material proposto.
- [ ] Existe risco crítico, quebra multi-tenant, segredo exposto ou incidente ativo incompatível com a proposta e sem tratamento adequado.
- [ ] O pacote contém evidência fabricada, inconsistente, desatualizada, fora do escopo ou sem aprovação para compartilhamento.
- [ ] Dados pessoais, evidências de cliente ou informações restritas seriam compartilhados sem base, necessidade, canal e controles adequados.
- [ ] Risco ou exceção necessária está sem owner, aprovação, prazo, monitoramento ou validade.

Qualquer condição marcada nesta seção exige No-Go para a alegação, proposta ou assinatura afetada até correção, renegociação ou decisão formal permitida.

## Cuidados contra vazamento

- [ ] Não versionar questionário preenchido, contrato, anexo, proposta, nome de prospect/cliente, contato ou informação comercial real.
- [ ] Não incluir nomes ou IDs reais de tenants, usuários, fornecedores, suboperadores, ambientes ou contas cloud.
- [ ] Não compartilhar logs, dumps, backups, relatórios integrais, screenshots sem redaction, tickets, exports ou evidência forense.
- [ ] Não incluir segredos, tokens, credenciais, cookies, chaves, certificados privados, strings de conexão ou fragmentos desses valores.
- [ ] Não expor URLs internas, IPs, paths, buckets, registries, topologia, regras de detecção ou detalhes exploráveis.
- [ ] Não enviar requests/responses reais, payloads, PoCs, findings ainda exploráveis ou lista detalhada de versões em produção.
- [ ] Manter material cru em `reports/raw/` local ou sistema restrito; usar `reports/sanitized/` apenas para resumos aprovados.
- [ ] Compartilhar evidência por canal restrito, com destinatários, finalidade, retenção e expiração definidos.
- [ ] Usar IDs opacos que não revelem cliente, tenant, ambiente, ativo ou vulnerabilidade.
