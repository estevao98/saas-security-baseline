# Checklist Pré-Deploy

## Objetivo

Verificar se uma revisão candidata pode ser promovida ao ambiente de destino com rastreabilidade, controles técnicos, recuperação, observabilidade e risco residual aceitável.

Este checklist orienta a decisão de deploy e release. Ele não substitui revisão humana, validação jurídica ou contratual, nem comprova conformidade ou ausência de vulnerabilidades.

## Quando usar

- [ ] Antes do primeiro deploy de um produto ou serviço.
- [ ] Antes de cada deploy em produção ou ambiente com dados, integrações ou impacto operacional relevante.
- [ ] Antes de migração, mudança de infraestrutura, autenticação, autorização, pagamentos, tenants ou tratamento de dados pessoais.
- [ ] Novamente quando o artefato, configuração, dependência ou plano de mudança for alterado após a aprovação.

Itens não aplicáveis devem ter justificativa e aprovação. Check obrigatório sem execução ou evidência suficiente bloqueia a decisão.

## Revisor responsável

- [ ] Tech lead ou owner do serviço confirma escopo, revisão candidata, testes e impacto técnico.
- [ ] Operações/Plataforma/SRE confirma infraestrutura, configuração, observabilidade, deploy, rollback e recuperação.
- [ ] Segurança/AppSec confirma gates, triagem, controles de acesso e riscos residuais.
- [ ] DBA ou responsável por dados revisa migrações, integridade, backup e reconciliação quando aplicável.
- [ ] Produto confirma impacto funcional, janela, comunicação e critérios de sucesso.
- [ ] Privacidade, Acessibilidade, Jurídico ou especialista de domínio revisa quando a mudança afetar sua área.

O aprovador do deploy deve ter autoridade definida e não deve ignorar bloqueio técnico ou obrigação aplicável por conveniência de prazo.

## Evidências esperadas

- [ ] ID opaco da mudança, revisão aprovada, artefato imutável e ambiente de destino.
- [ ] Resumo sanitizado de revisão, testes, scans, triagem, limitações e retestes do build candidato.
- [ ] Plano de deploy, responsáveis, janela, dependências, critérios de sucesso, abortagem e rollback.
- [ ] Evidência resumida de backup, restauração, migração e reconciliação quando aplicáveis.
- [ ] Matriz ou resultado de testes de autenticação, autorização, papéis e tenants afetados.
- [ ] Registro de findings, riscos, exceções, aceites e aprovações válidas.
- [ ] Evidência de dashboards, alertas sintéticos, logs necessários e monitoramento pós-deploy.

O checklist pode referenciar evidências por ID. Não copie material cru para commits, PRs, issues, comentários ou artifacts amplamente acessíveis.

## Itens obrigatórios

### Mudança e artefato

- [ ] Escopo, dependências, impacto, owner e ambiente de destino estão definidos.
- [ ] A revisão candidata corresponde ao código aprovado e não recebeu mudanças não revisadas após os gates.
- [ ] O artefato de deploy é identificável e foi produzido pelo processo autorizado.
- [ ] Revisão independente foi concluída para código, configuração e infraestrutura afetados.
- [ ] Testes unitários, integração, regressão e fluxos críticos aplicáveis passaram ou têm decisão formal válida.
- [ ] Notas de mudança e comunicação foram revisadas sem revelar cliente, ambiente, vulnerabilidade explorável ou evidência sensível.

### Gates de segurança e supply chain

- [ ] Secret scanning, SAST, SCA/dependências e demais gates obrigatórios da stack executaram no build candidato e foram triados.
- [ ] Lockfiles, dependências, imagens, actions, plugins e artefatos externos alterados têm origem e versão revisadas.
- [ ] Container, IaC, cloud e configuração foram avaliados quando fizerem parte do deploy.
- [ ] Permissões de pipeline, runner, registry, ambiente e publicação seguem menor privilégio.
- [ ] Segredos são fornecidos por mecanismo autorizado, não estão no código, artefato, logs ou configuração versionada e possuem escopo mínimo.
- [ ] SBOM ou inventário de componentes foi gerado quando exigido pelo risco, processo ou compromisso aplicável, sem ser tratado como atestado de segurança.

### Aplicação, API e dados

- [ ] Autenticação, sessão, recuperação de conta e autorização foram retestadas quando afetadas pela mudança.
- [ ] Testes negativos confirmam negação de acesso horizontal, vertical e entre tenants nas áreas alteradas.
- [ ] APIs alteradas possuem inventário, contrato/versionamento, validação, limites, erros seguros e logs adequados.
- [ ] Migrações possuem ordem, compatibilidade, critérios de integridade, reconciliação e procedimento de abortagem.
- [ ] Backup necessário existe e uma restauração compatível com o risco foi testada; backup não substitui rollback.
- [ ] Mudanças em coleta, finalidade, retenção, exclusão, compartilhamento ou localização de dados foram revisadas por Privacidade/Jurídico quando aplicável.
- [ ] Fluxos críticos alterados foram avaliados quanto à acessibilidade, incluindo teste manual adequado.

### Operação e release

- [ ] Plano de deploy define passos autorizados, responsáveis, janela, dependências e comunicação.
- [ ] Rollback ou roll-forward é viável, testado no nível proporcional ao risco e possui critério objetivo de acionamento.
- [ ] Configurações por ambiente foram revisadas para evitar debug, exposição pública, permissões excessivas e divergência não autorizada.
- [ ] Health checks, métricas, logs e alertas cobrem disponibilidade, erros e eventos de segurança necessários sem coletar conteúdo excessivo.
- [ ] Monitoramento pós-deploy tem duração, owner, limites de ação e canal de incidente definidos.
- [ ] Findings foram triados; bloqueadores foram corrigidos e retestados; falsos positivos e exceções têm escopo, aprovador e validade.
- [ ] A decisão Go/No-Go foi registrada por papel autorizado antes da promoção.

## Itens desejáveis

- [ ] Threat model ou análise de delta foi atualizada para mudanças de fronteira, privilégio, dados ou exposição.
- [ ] DAST passivo/controlado ou testes de API foram executados em ambiente autorizado quando aplicáveis.
- [ ] O deploy foi ensaiado em ambiente representativo com dados fictícios ou sanitizados.
- [ ] O artefato possui verificação de integridade, proveniência ou assinatura compatível com a maturidade adotada.
- [ ] Há segregação entre autoria, aprovação da mudança, aprovação de risco e publicação.
- [ ] Testes de desempenho, resiliência, idempotência ou failover cobrem o risco específico da mudança.

## Melhorias futuras

- [ ] Adotar deploy progressivo, canário ou feature flag com métricas e desligamento seguro quando a arquitetura permitir.
- [ ] Automatizar políticas de infraestrutura, permissões, proveniência e promoção entre ambientes.
- [ ] Proteger tags e ambientes, ampliar segregação e exigir aprovações adicionais para áreas críticas.
- [ ] Medir taxa de rollback, falhas de mudança, findings escapados e tempo de recuperação.

## Critérios de aprovação

- [ ] Todos os itens obrigatórios aplicáveis foram executados e possuem evidência suficiente e revisada.
- [ ] O artefato, a revisão aprovada e o ambiente de destino são rastreáveis entre si.
- [ ] Não há condição de bloqueio aberta; riscos residuais e exceções estão válidos e dentro da autoridade do aprovador.
- [ ] Backup/restauração, rollback e observabilidade são compatíveis com o impacto da mudança.
- [ ] O aprovador autorizado registrou Go e os owners do deploy e do monitoramento estão disponíveis.

## Critérios de reprovação ou bloqueio

- [ ] Há vulnerabilidade crítica aberta ou alto risco bloqueante em fluxo crítico, sem correção e reteste válidos.
- [ ] Existe segredo real ou potencialmente ativo exposto, acesso indevido confirmado ou quebra de isolamento entre tenants.
- [ ] Um gate obrigatório não executou, falhou tecnicamente ou foi aplicado a revisão diferente da candidata.
- [ ] Migração destrutiva não possui backup restaurável, rollback/roll-forward viável ou critérios de integridade.
- [ ] O artefato não é rastreável ao código revisado ou contém componente/configuração não aprovado.
- [ ] Não há observabilidade mínima, owner de resposta ou capacidade de interromper/reverter uma falha material.
- [ ] Há incidente ativo relacionado ao artefato, ambiente ou mudança.
- [ ] Aceite, exceção ou falso positivo usado na decisão está expirado, sem aprovador competente ou fora do escopo.

Qualquer condição marcada nesta seção exige No-Go até correção e reteste ou decisão formal expressamente permitida pela política aplicável.

## Cuidados contra vazamento

- [ ] Não registrar no checklist nomes de clientes, tenants, usuários, hosts, contas cloud, registries ou ambientes identificáveis.
- [ ] Não copiar comandos com argumentos sensíveis, saídas integrais, logs, dumps, backups, estados de infraestrutura ou relatórios de scanner.
- [ ] Não incluir tokens, credenciais, cookies, chaves, certificados privados, strings de conexão ou fragmentos desses valores.
- [ ] Não incluir URLs internas, IPs, paths absolutos, nomes de buckets ou topologia desnecessária.
- [ ] Não anexar requests/responses, payloads, PoCs, detalhes exploráveis ou screenshots sem redaction irreversível.
- [ ] Manter evidência crua em `reports/raw/` local ou armazenamento restrito, fora do Git e de artifacts comuns.
- [ ] Versionar somente resumo necessário em `reports/sanitized/`, reconstruído por allowlist e aprovado.
- [ ] Relacionar mudança, finding, risco e evidência por IDs opacos que não revelem cliente, tenant, ambiente ou vetor.
