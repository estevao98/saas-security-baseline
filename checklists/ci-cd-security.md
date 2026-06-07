# Checklist de Seguranca de CI/CD

> Este checklist revisa pipelines e controles de CI/CD. Ele nao altera workflows, nao habilita scanner, nao ativa gate e nao declara pipeline seguro sem validacao tecnica e humana.

## Objetivo

Verificar seguranca de CI/CD para SaaS, com foco em eventos, permissions, logs, artifacts, caches, branch protection, secrets, runners, dependencias, actions fixadas por SHA ou imagens por digest e politica de falha.

## Quando usar

- [ ] Antes de habilitar ou tornar obrigatorio qualquer workflow, scanner, gate, environment, runner, deploy ou release automation.
- [ ] Apos mudanca em workflow, action, imagem, permissao, secret, cache, artifact, branch protection, runner, ambiente, dependencia ou politica de falha.
- [ ] Antes de venda enterprise, release relevante, deploy de producao, integracao cloud, publicacao de pacote ou uso de OIDC.
- [ ] Apos incidente, segredo em log/artifact, bypass de check, falha de gate, comprometimento de dependencia ou suspeita de supply chain.
- [ ] Em revisao periodica mensal para inventario e trimestral para permissoes, branch protection, runners, secrets e gates materiais.

## Revisor responsavel

- [ ] DevSecOps ou plataforma revisa workflows, runners, permissions, artifacts, caches, environments e branch protection.
- [ ] Seguranca revisa secrets, OIDC, supply chain, actions de terceiros, logs, gates, falsos positivos e resposta a incidentes.
- [ ] Engenharia revisa build, testes, dependencias, scripts, lockfiles, artefato candidato, rollback e impacto no produto.
- [ ] Administrador GitHub ou owner do repositorio revisa plano/licenca, rulesets, permissões, CODEOWNERS, bypass, environments e retencao.
- [ ] Privacidade/Juridico revisa logs, artifacts, SBOM, relatorios e fornecedores quando houver dados pessoais, contrato ou compartilhamento externo.

## Evidencias esperadas

- [ ] Inventario sanitizado de workflows, eventos, jobs, actions, imagens, runners, environments, secrets, artifacts, caches, checks e owners.
- [ ] Matriz de `permissions` por workflow/job, incluindo justificativa para qualquer permissao de escrita, `id-token: write`, `security-events: write`, `packages:*` ou `issues: write`.
- [ ] Registro de branch protection, rulesets, CODEOWNERS, checks obrigatorios, merge queue quando aplicavel e controles de bypass.
- [ ] Registro de actions fixadas por SHA completo e imagens por digest validado quando usadas como gate ou controle material.
- [ ] Amostra sanitizada de logs e artifacts revisados, sem conteudo sensivel, com retencao e acesso aprovados.
- [ ] Resultado de testes controlados de falha do workflow, scanner, artifact, cache e permissao, sem secrets reais.
- [ ] Decisoes de gate, excecoes, falsos positivos, aceites de risco e retestes por ID opaco.

## Itens obrigatorios

- [ ] Confirmar que este PR nao altera workflows, nao habilita scanner e nao torna check obrigatorio.
- [ ] Inventariar todos os workflows ativos e exemplos, distinguindo workflow operacional, exemplo, rascunho inerte, controle em alerta e gate obrigatorio.
- [ ] Confirmar plano/licenca GitHub e disponibilidade de recursos como Dependency Review, CodeQL, code scanning, environments, rulesets, merge queue, secret scanning, OIDC e artifact retention antes de exigir controles.
- [ ] Revisar eventos usados por cada workflow, especialmente `pull_request`, `push`, `schedule`, `workflow_dispatch`, `release`, `workflow_run` e `pull_request_target`.
- [ ] Alertar explicitamente que `pull_request_target` e arriscado para codigo nao confiavel e nao deve fazer checkout/execucao de codigo do PR com token ou secrets privilegiados.
- [ ] Confirmar que PRs de forks, Dependabot ou codigo nao confiavel nao recebem secrets nem executam jobs privilegiados.
- [ ] Declarar `permissions` no workflow ou job e reduzir para `contents: read` ou `{}` quando possivel.
- [ ] Justificar cada permissao de escrita e limitar ao job que realmente precisa dela.
- [ ] Revisar uso de `GITHUB_TOKEN`, tokens pessoais, deploy keys, GitHub Apps, OIDC, registry credentials e secrets externos.
- [ ] Confirmar que secrets nao sao passados por argumento de linha de comando, input manual, cache key, artifact name, output, log, arquivo versionado ou summary.
- [ ] Revisar OIDC, quando usado, para trust policy restrita a repositorio, branch/tag/environment, audiencia e job esperado.
- [ ] Revisar environments, reviewers, branches permitidas, protecoes de deploy e segregacao entre build nao confiavel e deploy privilegiado.
- [ ] Fixar actions de terceiros por SHA completo validado antes de usa-las como gate ou controle obrigatorio.
- [ ] Fixar imagens de container por digest validado antes de usa-las como gate ou controle obrigatorio.
- [ ] Revisar actions compostas, actions locais, scripts chamados por workflows e instaladores remotos quanto a supply chain e execucao de codigo.
- [ ] Revisar dependencias de build, lockfiles, package managers, scripts de instalacao, registries e downloads para evitar execucao desnecessaria de codigo nao confiavel.
- [ ] Revisar caches para impedir cache poisoning, escopo amplo, restore key perigosa, inclusao de secrets e compartilhamento entre contexto confiavel e nao confiavel.
- [ ] Revisar artifacts para evitar `path: .`, upload amplo, `reports/raw/`, arquivos ocultos, logs, dumps, secrets, dados pessoais e relatorios sensiveis.
- [ ] Definir artifacts por allowlist, retencao minima, nome nao sensivel, `if-no-files-found` adequado e revisao antes de publicar.
- [ ] Revisar logs para impedir `set -x`, dumps de ambiente, contextos GitHub completos, headers, bodies, tokens mascarados parcialmente, URLs internas, tenants e dados pessoais.
- [ ] Confirmar que masking nao e justificativa para imprimir segredo ou valor derivado.
- [ ] Revisar runners hospedados e self-hosted quanto a isolamento, labels, acesso a rede, persistencia de workspace, ferramentas instaladas, limpeza, usuarios e exposicao a PRs nao confiaveis.
- [ ] Impedir que runner self-hosted sensivel execute codigo de fork ou PR nao confiavel sem isolamento e aprovacao especifica.
- [ ] Revisar branch protection ou rulesets para PR obrigatoria, approvals, CODEOWNERS quando aplicavel, conversas resolvidas, checks obrigatorios, bloqueio de force-push/delete e bypass nominal.
- [ ] Confirmar que check obrigatorio roda em todos os PRs relevantes; filtros por path, jobs condicionais e merge queue nao podem deixar o check pendente ou ausente.
- [ ] Confirmar que falha, cancelamento, timeout, scanner ausente, output ausente ou erro tecnico de gate obrigatorio resulta em falha segura, nao em aprovacao.
- [ ] Definir politica de `continue-on-error` somente para modo alerta, com prazo, owner e criterio para virar gate ou ser removido.
- [ ] Revisar SBOM, SAST, SCA, secret scan, container scan, IaC scan, DAST e acessibilidade como controles separados, sem declarar cobertura quando nao foram executados e triados.
- [ ] Registrar falsos positivos e excecoes com regra, escopo, justificativa, owner, aprovador, expiracao e gatilho de reabertura.
- [ ] Validar que relatorios crus ficam fora do Git e nao sao anexados automaticamente a issues, PRs ou artifacts amplos.

## Itens desejaveis

- [ ] Manter matriz de workflows por maturidade, stack, risco, plano GitHub, owner, gatilho, permissao, artifact, gate e politica de falha.
- [ ] Usar Dependabot, Renovate ou processo equivalente para revisar atualizacoes de actions, imagens, CLIs e dependencias fixadas.
- [ ] Executar actionlint ou validador equivalente em versao aprovada antes de tornar workflow obrigatorio.
- [ ] Usar ambientes efemeros e dados ficticios para DAST, acessibilidade e testes de API.
- [ ] Produzir summaries seguros com contagens, status e caminhos, sem snippets, payloads, requests, responses, logs ou valores.
- [ ] Separar workflows de build/teste, seguranca, release e deploy para reduzir permissoes por job.
- [ ] Usar attestations, proveniencia e assinatura de artefato somente apos validar recurso, plano, workflow e threat model.
- [ ] Monitorar bypasses, falhas tecnicas, checks cancelados, tempo de execucao, excecoes vencidas e artifacts publicados.
- [ ] Revisar periodicamente secrets e variaveis por escopo de repositorio, environment e organizacao.
- [ ] Testar cenarios de fork, Dependabot, branch protegida, merge queue, tag/release e workflow manual antes de exigir branch protection.

## Melhorias futuras

- [ ] Criar workflows ativos por controle em PRs separados, com um objetivo por PR e modo alerta inicial quando apropriado.
- [ ] Criar fixtures ficticias para validar scanners e gates sem dados reais, segredos, producao ou internet por padrao.
- [ ] Implementar policy as code para impedir `write-all`, `pull_request_target` inseguro, artifact amplo, action sem SHA e imagem sem digest em gates.
- [ ] Implementar revisao automatizada de permissões, actions e artifacts com allowlist aprovada.
- [ ] Integrar metricas de eficacia de CI/CD a risco e remediacao, sem incentivar ocultar achados ou rebaixar severidade.
- [ ] Avaliar runners dedicados, ephemeral self-hosted runners ou isolamento adicional para stacks que exigem acesso a rede interna ou artefatos sensiveis.
- [ ] Avaliar certificacao, atestacao ou auditoria independente apenas quando houver escopo, contrato e maturidade operacional.

## Criterios de aprovacao

- [ ] Todos os itens obrigatorios aplicaveis foram executados ou possuem justificativa de nao aplicabilidade aprovada.
- [ ] Workflows, eventos, permissions, secrets, runners, caches, artifacts, dependencies, actions e politica de falha foram revisados.
- [ ] Nenhum workflow usa permissao ampla, secret em contexto nao confiavel, action/tag mutavel como gate ou artifact amplo sem justificativa e controle.
- [ ] `pull_request_target`, se existir, tem risco explicitamente documentado e nao executa codigo nao confiavel com privilegio ou secrets.
- [ ] Branch protection ou rulesets exigem apenas checks que realmente executam nos cenarios relevantes.
- [ ] Gate obrigatorio falha de forma segura quando scanner, output, permissao, artifact ou ambiente falha.
- [ ] Logs e artifacts foram revisados contra segredos, dados pessoais, URLs internas, tenants, requests/responses, payloads e relatorios crus.
- [ ] Excecoes, falsos positivos e aceites de risco possuem owner, aprovador, prazo, escopo e condicao de reabertura.

## Criterios de reprovacao ou bloqueio

- [ ] Workflow executa codigo nao confiavel com secrets, token de escrita, OIDC privilegiado ou runner sensivel.
- [ ] `pull_request_target` e usado sem alerta de risco ou com checkout/execucao de codigo do PR em contexto privilegiado.
- [ ] `permissions: write-all`, permissao de escrita ampla ou permissao nao justificada permite alterar codigo, release, pacote, artifact, issue, token ou ambiente.
- [ ] Secret, token, cookie, credencial, chave, string de conexao ou valor derivado aparece em log, artifact, cache, output, summary, issue, PR ou arquivo versionado.
- [ ] Action de terceiro ou imagem usada como gate obrigatorio nao esta fixada por SHA/digest validado.
- [ ] Cache pode ser escrito por contexto nao confiavel e restaurado por job privilegiado sem isolamento adequado.
- [ ] Artifact publica `reports/raw/`, workspace inteiro, arquivo oculto, log cru, relatorio sensivel, SBOM nao aprovado ou evidencia com dados reais.
- [ ] Branch protection exige check que nao roda consistentemente ou permite bypass rotineiro sem registro nominal.
- [ ] Runner self-hosted sensivel executa PR externo ou codigo nao confiavel sem isolamento, limpeza e aprovacao.
- [ ] Scanner ou gate obrigatorio falhou, foi cancelado, nao executou ou nao gerou saida e mesmo assim foi tratado como aprovado.
- [ ] Pipeline foi declarado seguro sem validacao de plano, permissões, logs, artifacts, secrets, runners, falso positivo e politica de falha.

## Cuidados contra vazamento

- [ ] Nao inserir secrets em exemplos, inputs, YAML, comandos, nomes de artifact, outputs, summaries, variaveis, cache keys ou documentacao.
- [ ] Nao colar logs de Actions, contextos GitHub, payloads de eventos, headers, bodies, requests, responses, stack traces, env dumps ou reports crus.
- [ ] Nao registrar URLs internas, endpoints, IPs, tenants, nomes reais de ambientes, branches sensiveis, repositorios privados externos ou fornecedores reais de cliente.
- [ ] Nao publicar `reports/raw/`, SARIF cru, JSON de scanner, HTML de DAST, HAR, VCR, SBOM detalhado, screenshots, dumps, lockfiles sensiveis ou artifacts amplos sem revisao.
- [ ] Usar IDs opacos para workflow, run, artifact, finding, runner, environment, tenant, release e evidencia quando o nome real revelar informacao sensivel.
- [ ] Reconstruir resumos por allowlist com contagens, status, escopo e decisao, evitando trechos de codigo, payloads, requests/responses e valores.
- [ ] Tratar checklists preenchidos de CI/CD como confidenciais, pois revelam controles, bypasses, permissões, runners, actions e lacunas.
- [ ] Remover ou restringir imediatamente artifact/log indevido e acionar resposta a incidente quando segredo ou dado pessoal for exposto.
