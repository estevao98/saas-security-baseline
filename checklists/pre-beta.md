# Checklist Pré-Beta

## Objetivo

Verificar se um build candidato pode ser aberto a usuários beta sem expor riscos materiais não tratados em contas, dados, isolamento entre tenants, fluxos críticos, privacidade, acessibilidade, observabilidade e recuperação.

Este checklist apoia uma decisão humana de Go/No-Go. Seu preenchimento não declara conformidade, certificação ou ausência de vulnerabilidades.

## Quando usar

- [ ] Antes de abrir um beta fechado ou público para usuários reais.
- [ ] Antes de ampliar significativamente participantes, dados, funcionalidades ou integrações de um beta existente.
- [ ] Novamente quando houver mudança material em autenticação, autorização, tenants, pagamentos, dados pessoais, infraestrutura ou fluxo crítico.

Itens não aplicáveis devem ter justificativa, responsável e aprovação proporcionais ao risco. Um item obrigatório não executado não equivale a aprovado.

## Revisor responsável

- [ ] Produto confirma escopo, público, fluxos essenciais, suporte e critérios de saída do beta.
- [ ] Engenharia confirma o build candidato, testes, correções, rollback e limitações conhecidas.
- [ ] Segurança/AppSec revisa autenticação, autorização, isolamento, gates e riscos residuais.
- [ ] Privacidade/Jurídico revisa dados pessoais, transparência, termos e obrigações aplicáveis.
- [ ] Acessibilidade revisa os fluxos críticos com método adequado, incluindo avaliação manual.
- [ ] Operações/Plataforma confirma observabilidade, backup, restauração e resposta inicial.

Uma única pessoa não deve ser a única autora, revisora e aprovadora de risco material quando houver segregação viável.

## Evidências esperadas

- [ ] Identificação segura do build, revisão ou artefato candidato e do ambiente autorizado.
- [ ] Escopo do beta, funcionalidades incluídas, público, limites, duração e critérios de encerramento.
- [ ] Matriz de papéis e permissões, com resultados sanitizados de testes positivos e negativos entre usuários e tenants.
- [ ] Resumo sanitizado dos testes e scans obrigatórios, com versão/método, escopo, resultado, triagem e limitações.
- [ ] Mapa ou fluxo de dados, decisões de minimização, retenção, terceiros e transparência aplicáveis ao beta.
- [ ] Resultado de avaliação manual e automatizada dos fluxos críticos de acessibilidade.
- [ ] Evidência resumida de alertas sintéticos, backup e restauração recente.
- [ ] Lista sanitizada de riscos conhecidos, decisões, owners, prazos, exceções e retestes.

Evidências reais devem permanecer no sistema autorizado. No Git, use apenas referências sanitizadas e IDs opacos.

## Itens obrigatórios

### Escopo e produto

- [ ] O objetivo, público, capacidade, duração e funcionalidades do beta estão delimitados e aprovados.
- [ ] Os fluxos críticos e os critérios mensuráveis de sucesso, pausa e encerramento foram definidos.
- [ ] Há canal de suporte e procedimento para interromper convites, desabilitar função ou suspender o beta.
- [ ] Termos, avisos e comunicações não prometem controles, disponibilidade ou conformidade que não possam ser demonstrados.

### Build e segurança técnica

- [ ] O build candidato é rastreável ao código revisado e aos resultados de teste correspondentes.
- [ ] Revisão de código, testes de regressão, SAST, SCA/dependências e secret scanning aplicáveis foram executados e triados.
- [ ] DAST controlado foi executado no ambiente autorizado, sem dados reais desnecessários e sem scan ofensivo contra terceiros ou produção.
- [ ] APIs incluídas no beta possuem inventário, autenticação, autorização, validação, limites e testes de acesso indevido quando aplicáveis.
- [ ] Autenticação, sessão, logout, recuperação de conta e proteção de ações sensíveis foram testados.
- [ ] Autorizações foram testadas por papel, recurso e ação, incluindo negação horizontal, vertical e entre tenants.
- [ ] Contas administrativas e funções privilegiadas usam controles proporcionais ao risco e menor privilégio.
- [ ] Dependências, imagens, containers, IaC, cloud e integrações afetadas foram revisados conforme a arquitetura real.

### Dados, privacidade e acessibilidade

- [ ] Dados pessoais coletados no beta têm finalidade, necessidade, acesso, retenção e descarte definidos e revisados.
- [ ] Dados de teste são fictícios ou adequadamente sanitizados; dados reais não foram copiados para ambientes de teste sem autorização e controles.
- [ ] O fluxo de consentimento, transparência ou outra base aplicável foi validado por Privacidade/Jurídico no contexto do produto.
- [ ] Fornecedores e integrações que recebem dados ou executam função crítica foram identificados e avaliados no nível necessário.
- [ ] Os fluxos críticos foram avaliados manualmente quanto à acessibilidade, com automação usada apenas como apoio.
- [ ] Barreiras que impeçam tarefa essencial possuem correção ou alternativa equivalente aprovada antes da abertura.

### Operação e resposta

- [ ] Logs e métricas essenciais permitem detectar falhas e abuso sem registrar segredos, conteúdo excessivo ou dados pessoais desnecessários.
- [ ] Alertas críticos foram testados com sinais sintéticos e possuem owner e canal de atendimento.
- [ ] Backup aplicável foi verificado e uma restauração recente demonstrou recuperação compatível com o beta.
- [ ] Rollback, desativação da função e comunicação operacional possuem responsáveis e critérios de acionamento.
- [ ] Existe resposta mínima a incidentes, com contatos, triagem, contenção, preservação de evidência e escalonamento.
- [ ] Findings e riscos foram triados; correções sujeitas a gate foram retestadas e exceções estão válidas, temporárias e aprovadas.

## Itens desejáveis

- [ ] O threat model foi atualizado para usuários reais, abuso de conta, isolamento, integrações e mudanças desde o último gate.
- [ ] Foi realizado tabletop curto de incidente envolvendo indisponibilidade, acesso indevido ou vazamento suspeito.
- [ ] Limites de uso, rate limiting e comportamento sob carga esperada do beta foram validados.
- [ ] Integrações externas possuem fallback, timeout, monitoramento e procedimento de indisponibilidade.
- [ ] Há revisão independente das áreas de maior risco por pessoa não autora da mudança.
- [ ] Métricas do beta permitem acompanhar confiabilidade, segurança, privacidade e acessibilidade sem identificar participantes desnecessariamente.

## Melhorias futuras

- [ ] Executar avaliação independente de escopo limitado antes de ampliar o beta ou atingir exposição material.
- [ ] Automatizar testes de autorização entre papéis e tenants com dados sintéticos.
- [ ] Exercitar recuperação, incidentes e comunicação em cenários adicionais.
- [ ] Medir recorrência de findings, tempo de detecção, remediação e efetividade dos controles.

## Critérios de aprovação

- [ ] Todos os itens obrigatórios aplicáveis foram executados, revisados e sustentados por evidência suficiente.
- [ ] Isolamento entre tenants, recuperação de conta, observabilidade e restauração foram aprovados.
- [ ] Não existe condição de bloqueio aberta nem check obrigatório sem execução ou alternativa autorizada.
- [ ] Riscos residuais possuem owner, prazo, monitoramento e aceite formal válido pela autoridade competente.
- [ ] Produto, Engenharia, Segurança e os revisores de domínio aplicáveis registraram a decisão Go.

## Critérios de reprovação ou bloqueio

- [ ] Há segredo real ou potencialmente ativo exposto, sem revogação, investigação e contenção concluídas.
- [ ] Existe bypass de autenticação, recuperação insegura ou acesso horizontal, vertical ou entre tenants confirmado.
- [ ] Um fluxo crítico expõe dados, produz ação indevida ou impede acesso essencial sem alternativa equivalente aprovada.
- [ ] Backup não é restaurável, rollback necessário é inviável ou não há capacidade mínima de resposta a incidente.
- [ ] Existe finding crítico ou alto bloqueante sem correção e reteste, ou sem decisão formal permitida e válida.
- [ ] Um gate obrigatório não executou, falhou tecnicamente ou não gerou evidência suficiente.
- [ ] Há incidente ativo relacionado ao build, ambiente ou controle necessário para o beta.

Qualquer condição marcada nesta seção exige No-Go até correção e reteste ou decisão formal expressamente permitida pela política aplicável.

## Cuidados contra vazamento

- [ ] Não versionar checklist preenchido com nomes de clientes, participantes, usuários, tenants, hosts ou ambientes reais.
- [ ] Não anexar logs crus, dumps, backups, screenshots sem redaction, relatórios integrais, requests/responses ou evidência forense.
- [ ] Não registrar segredos, tokens, credenciais, cookies, chaves, strings de conexão ou fragmentos desses valores.
- [ ] Não incluir URLs internas, IPs, paths absolutos, nomes de buckets, contas cloud ou topologia desnecessária.
- [ ] Não publicar payloads, passos de reprodução ofensivos, detalhes exploráveis ou localização de evidência restrita.
- [ ] Armazenar material cru somente em `reports/raw/` local ou sistema restrito, fora do Git.
- [ ] Publicar em `reports/sanitized/` apenas resumo minimizado, reconstruído por allowlist e aprovado por revisor competente.
- [ ] Usar IDs opacos para build, finding, risco e evidência, sem codificar cliente, tenant, ambiente ou vulnerabilidade no identificador.
