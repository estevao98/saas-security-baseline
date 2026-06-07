# Checklist de Seguranca em Cloud

> Este checklist e agnostico de provedor. Adapte para a arquitetura, regiao, contrato, plano, servicos gerenciados, responsabilidades compartilhadas e requisitos do SaaS. Nao use este arquivo como prova de conformidade formal.

## Objetivo

Verificar controles praticos de seguranca, governanca e operacao em ambientes cloud usados por SaaS, incluindo IAM, rede, secrets, storage, logs, backups, exposicao publica, custo, regiao, criptografia e acesso administrativo.

## Quando usar

- [ ] Antes de criar ambiente de producao, homologacao com dados sensiveis ou tenant real.
- [ ] Antes de contratar provedor cloud, servico gerenciado, marketplace, CDN, storage, fila, banco, observabilidade ou terceiro critico.
- [ ] Antes de mudanca em IAM, rede, firewall, DNS, storage, banco, secrets, chaves, logs, backup, regiao ou acesso administrativo.
- [ ] Antes de primeiro deploy, venda enterprise, migracao grande, processamento de dados pessoais sensiveis ou integracao critica.
- [ ] Apos incidente, suspeita de exposicao publica, custo anomalo, acesso indevido, alteracao de permissao ou drift relevante.
- [ ] Mensalmente para postura basica e trimestralmente ou semestralmente para revisao ampliada, conforme risco.

## Revisor responsavel

- [ ] Responsavel cloud ou plataforma revisa arquitetura, rede, servicos, backups, logs, criptografia, regiao e operacao.
- [ ] Seguranca revisa IAM, secrets, exposicao publica, deteccao, resposta, evidencias e risco residual.
- [ ] Engenharia revisa dependencias do produto, deploy, escalabilidade, observabilidade, rollback e integracoes.
- [ ] Privacidade/Juridico revisa dados pessoais, regioes, suboperadores, transferencia internacional, contrato e retencao quando aplicavel.
- [ ] FinOps ou responsavel financeiro revisa custo, budgets, alertas, desperdicio, previsibilidade e abuso.

## Evidencias esperadas

- [ ] Inventario sanitizado de contas, projetos, assinaturas, tenants, ambientes, regioes, servicos, workloads, identidades e owners.
- [ ] Diagrama de alto nivel com fronteiras de rede, componentes publicos, componentes privados, fluxos de dados e responsabilidades, sem IPs internos reais ou nomes sensiveis.
- [ ] Matriz de IAM por papel, grupo, identidade tecnica, acesso administrativo, break-glass, federacao, MFA e privilegios de alto impacto.
- [ ] Registro de recursos expostos publicamente, justificativa, controles, owner e data de revisao.
- [ ] Evidencia de criptografia, gestao de chaves, storage, backup, restore, logs, alertas e retencao por ID opaco.
- [ ] Resultado de scanners, CSPM, IaC scanning ou revisoes nativas quando aplicaveis, com relatorios crus fora do Git.
- [ ] Decisoes de risco, excecoes, falsos positivos e retestes com owner, prazo e aprovador.

## Itens obrigatorios

- [ ] Confirmar provedor, modelo de responsabilidade compartilhada, contratos, regioes permitidas, owners e escopo exato antes da revisao.
- [ ] Inventariar contas, projetos, assinaturas, tenants, ambientes e servicos sem registrar IDs reais de conta, IPs internos, buckets reais, dominios reais ou nomes reais de ambientes no Git.
- [ ] Separar ambientes de producao, homologacao, desenvolvimento e testes conforme risco, evitando acesso cruzado desnecessario.
- [ ] Definir owner, finalidade, classificacao e criticidade para cada conta, ambiente e servico material.
- [ ] Revisar IAM por menor privilegio, segregacao de funcoes, acesso administrativo, identidades tecnicas, grupos, papeis, permissoes herdadas e usuarios externos.
- [ ] Exigir MFA ou controle equivalente para acesso administrativo e acesso a console ou painel critico, conforme suporte do provedor.
- [ ] Revisar contas break-glass com owner, escopo minimo, armazenamento seguro, monitoramento, teste e revisao periodica.
- [ ] Proibir chaves ou credenciais estaticas longas quando alternativa mais segura, federada ou temporaria estiver disponivel e validada.
- [ ] Confirmar rotacao, revogacao, escopo, inventario e monitoramento de credenciais cloud, tokens, chaves de API e chaves de acesso.
- [ ] Armazenar secrets em mecanismo apropriado do provedor ou cofre aprovado, nunca em Git, logs, artifacts, variaveis impressas, imagens ou templates.
- [ ] Revisar rede para segmentacao, portas expostas, regras de entrada e saida, origem/destino, servicos publicos, NAT, VPN, peering, load balancer e DNS.
- [ ] Confirmar que qualquer exposicao publica tem justificativa, owner, autenticacao, protecao de borda, logging e revisao de risco.
- [ ] Revisar storage, buckets, volumes, snapshots, bancos e filas para impedir acesso publico indevido e permissao ampla.
- [ ] Confirmar criptografia em transito e em repouso para dados, backups, snapshots, filas, logs e storage quando aplicavel.
- [ ] Revisar gestao de chaves, incluindo owner, acesso, rotacao, exclusao, uso por servico e impacto de perda.
- [ ] Revisar logs de auditoria, acesso administrativo, rede, storage, banco, deploy, secrets, alertas e eventos de seguranca.
- [ ] Confirmar que logs nao coletam segredo, cookie, token, payload, dado pessoal desnecessario, URL interna sensivel ou identificador de tenant real.
- [ ] Definir retencao, acesso e exportacao de logs conforme evidencias, privacidade, contrato e resposta a incidentes.
- [ ] Revisar backups, snapshots e replicas quanto a escopo, frequencia, criptografia, segregacao, acesso, retencao, regiao e descarte.
- [ ] Executar ou verificar restore testado para sistemas criticos antes de migracao, producao, venda enterprise ou mudanca destrutiva.
- [ ] Confirmar que backups, snapshots e exports nao sao versionados, sincronizados em local amplo ou expostos publicamente.
- [ ] Revisar regioes, residencia de dados, suboperadores, suporte remoto e transferencia internacional quando houver dados pessoais ou compromisso contratual.
- [ ] Revisar acesso administrativo de pessoas, fornecedores, suporte do provedor e automacoes, incluindo aprovacao, prazo, trilha e remocao.
- [ ] Revisar monitoramento de disponibilidade, seguranca, custo, quotas, abuso, consumo inesperado e eventos fora do padrao.
- [ ] Definir budgets, alertas de custo, limites ou salvaguardas contra consumo inesperado quando suportado e aplicavel.
- [ ] Revisar imagens, templates, IaC, policies e configuracoes para evitar hardening inconsistente e drift.
- [ ] Confirmar que scanner ou check obrigatorio que falhou, foi cancelado ou nao gerou evidencia nao e tratado como aprovado.
- [ ] Registrar excecoes com owner, justificativa, risco residual, controle compensatorio, prazo, aprovador e condicao de reavaliacao.

## Itens desejaveis

- [ ] Usar IaC versionado e revisado para recursos materiais, com estado real protegido e fora do Git quando sensivel.
- [ ] Executar IaC scanning, CSPM ou verificacoes nativas do provedor em modo validado e com triagem humana.
- [ ] Implementar policy as code para proibicoes claras, como storage publico nao aprovado, IAM amplo, falta de logs e criptografia ausente.
- [ ] Usar federacao, SSO e grupos gerenciados para acesso humano, reduzindo usuarios locais do provedor.
- [ ] Implementar deteccao de drift e revisao periodica de recursos criados fora do processo aprovado.
- [ ] Definir padroes de tags ou labels para owner, ambiente, classificacao, custo, criticidade, dados pessoais e prazo de revisao.
- [ ] Revisar e testar alertas para criacao de recurso publico, IAM privilegiado, chave nova, desativacao de log, aumento de custo e acesso anomalo.
- [ ] Implementar segmentacao por ambiente, tenant, criticidade ou dominio de dados quando o risco justificar.
- [ ] Validar hardening de imagens, bancos, containers, Kubernetes, serverless e servicos gerenciados conforme o provedor adotado.
- [ ] Manter runbook de incidente cloud com contatos, acesso de emergencia, preservacao de evidencias, contencao e comunicacao.

## Melhorias futuras

- [ ] Criar baseline por provedor somente apos escolher arquitetura e fontes oficiais aplicaveis.
- [ ] Criar matriz de responsabilidades compartilhadas por servico, incluindo o que fica com o provedor e o que fica com o SaaS.
- [ ] Implementar revisao independente ou auditoria externa para cloud quando exigido por contrato, risco, setor ou maturidade.
- [ ] Automatizar recertificacao de acessos administrativos, identidades tecnicas e permissoes privilegiadas.
- [ ] Implementar simulacoes controladas de incidente, indisponibilidade, falha de regiao, perda de chave e restore.
- [ ] Medir postura com metricas de cobertura, drift, tempo de remediacao, excecoes vencidas, custo anomalo e recursos sem owner.
- [ ] Avaliar certificacao formal ou atestacoes do provedor somente quando houver objetivo, escopo e demanda definidos.

## Criterios de aprovacao

- [ ] Todos os itens obrigatorios aplicaveis foram executados ou possuem justificativa de nao aplicabilidade aprovada.
- [ ] IAM, rede, secrets, storage, logs, backups, exposicao publica, custo, regiao, criptografia e acesso administrativo foram revisados por responsaveis competentes.
- [ ] Nao ha recurso publico indevido, IAM critico sem justificativa, segredo exposto, log sensivel ou backup sem protecao conhecida.
- [ ] Restore, monitoramento e alertas minimos foram comprovados para recursos criticos.
- [ ] Regioes, terceiros, suporte e transferencia de dados foram avaliados quando houver dados pessoais ou compromisso contratual.
- [ ] Achados bloqueantes foram corrigidos e retestados ou possuem decisao formal permitida pela politica.
- [ ] Evidencias foram registradas por IDs opacos, sem dados reais, URLs internas, IPs internos, IDs de conta, tenants, logs crus ou relatorios sensiveis no Git.

## Criterios de reprovacao ou bloqueio

- [ ] Recurso, storage, banco, snapshot, backup, painel administrativo, fila ou endpoint critico esta publicamente acessivel sem justificativa e controle aprovados.
- [ ] IAM permite administracao ampla, movimento lateral, acesso a dados sensiveis ou alteracao de logs sem owner, MFA/controle equivalente, monitoramento e aprovacao.
- [ ] Segredo cloud, chave, token, credencial, cookie, string de conexao ou certificado privado esta no Git, log, artifact, imagem, template ou relatorio.
- [ ] Logs de auditoria essenciais estao ausentes, desativados, inacessiveis ou sem retencao definida para o risco.
- [ ] Backup, snapshot ou restore necessario nao existe, nao foi testado ou esta acessivel de forma indevida.
- [ ] Criptografia, chave ou regiao exigida por risco, contrato ou privacidade nao foi validada.
- [ ] Mudanca cloud cria transferencia, suboperador, suporte remoto ou regiao nao avaliada quando ha dados pessoais ou compromisso aplicavel.
- [ ] Excecao critica esta sem owner, prazo, controle compensatorio ou aprovador competente.
- [ ] Evidencia crua, identificador real de conta, IP interno, bucket real, dominio real, tenant real ou informacao de cliente foi versionada.
- [ ] Scanner/check obrigatorio nao executou ou falhou tecnicamente e foi tratado como sucesso.

## Cuidados contra vazamento

- [ ] Nao registrar IPs internos reais, IDs reais de conta, subscription, project, organization, tenant, bucket, database, cluster, dominio, hostname, regiao sensivel, ambiente ou fornecedor de cliente.
- [ ] Nao criar exemplos de credenciais cloud, chaves, tokens, strings de conexao, arquivos de configuracao real, profiles, kubeconfig, state, planos, dumps, backups ou logs.
- [ ] Nao commitar `terraform.tfstate`, planos com valores sensiveis, snapshots, exports, evidencias de console, prints sem redaction ou relatorios crus.
- [ ] Nao colar outputs integrais de CLI, requests/responses, headers, eventos, trilhas de auditoria, nomes reais de recursos ou topologia detalhada em Git, issue, PR ou artifact.
- [ ] Usar marcadores genericos como `[CONTA-A]`, `[REGIAO-A]`, `[RECURSO-A]`, `[TENANT-A]` e `[SERVICO-A]` em resumos versionados.
- [ ] Tratar diagramas, matrizes IAM, inventario de recursos e checklists preenchidos como confidenciais ate revisao.
- [ ] Reconstruir resumos por allowlist e revisar metadados de imagens, PDFs, JSON, CSV e HTML antes de qualquer versionamento.
- [ ] Evitar comandos destrutivos em documentacao operacional deste checklist; validacoes reais devem ocorrer em procedimento aprovado e ambiente autorizado.
