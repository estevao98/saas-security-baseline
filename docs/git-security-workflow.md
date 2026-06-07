# Fluxo Git Seguro para Auditoria e Governança de SaaS

## Objetivo e escopo

Esta política define como branches, commits, issues, pull requests, findings, riscos, falsos positivos, hotfixes e releases devem ser tratados em um repositório privado de SaaS. Ela complementa os gates de `docs/github-actions-strategy.md`, a proteção de evidências de `docs/evidence-and-reporting-policy.md` e a priorização de `risk/severity-and-prioritization.md`.

Privado não significa adequado para evidência sensível. Git, issues, PRs, comentários, Actions, artifacts, releases e histórico não devem receber segredos, dados pessoais reais, logs crus, relatórios integrais, URLs internas, payloads exploráveis ou detalhes que permitam abuso.

## Níveis da política

- **Obrigatório:** aplicado a toda mudança versionada e a toda fase de maturidade.
- **Desejável:** adotado quando equipe, plano GitHub e automação suportarem sem criar bypass informal.
- **Melhoria futura:** controle para escala, segregação e assurance avançada.
- **Certificação formal:** esta política ajuda a produzir rastreabilidade, mas não comprova conformidade ou certificação.

## Princípios obrigatórios

1. `main` representa o estado integrado, revisado e potencialmente liberável; não é área de trabalho.
2. Toda mudança não emergencial nasce em branch curta e entra por pull request.
3. Nenhuma pessoa aprova a própria mudança como única revisão quando houver outro revisor disponível.
4. Findings críticos, segredos e incidentes usam canal restrito; não se abre issue comum com detalhe explorável.
5. A decisão de merge considera checks, revisão humana, risco, evidência e validade das exceções.
6. Scanner sem execução, cancelado ou com erro não equivale a resultado limpo.
7. Evidências cruas permanecem em `reports/raw/` local ou armazenamento restrito, fora do Git.
8. Somente resumos sanitizados, necessários, revisados e aprovados podem entrar em `reports/sanitized/`.
9. Bypass de proteção é excepcional, nominal, justificado, auditável e revisado depois do evento.
10. Branch, issue, PR, finding, risco e release se relacionam por identificadores seguros, sem duplicar conteúdo sensível.

## Estratégia de branches

O padrão recomendado é **trunk-based development com branches curtas**. `main` é a branch padrão e protegida. O uso permanente de `develop` não é recomendado para equipes pequenas ou deploy contínuo porque cria divergência, duplica gates e posterga integração.

### Padrões e usos

| Branch | Quando usar | Base e destino | Limite e cuidado |
|---|---|---|---|
| `main` | Estado revisado, integrado e candidato a release. | Recebe PRs aprovadas. | Sem push direto, force-push ou trabalho incompleto. |
| `develop` | Somente quando houver linha de integração real, ambiente próprio, releases agrupadas e responsáveis por promover `develop` para `main`. | Nasce de `main`; recebe branches de trabalho; promove por PR para `main`. | Proteger como `main`; não usar como depósito indefinido nem para contornar release gates. |
| `feat/<tema-seguro>` | Nova capacidade ou controle, como `feat/security-audit-baseline`. | De `main`, ou de `develop` se formalmente adotada; retorna à mesma base. | Nome não deve revelar cliente, ativo ou vulnerabilidade. |
| `fix/security-finding-<id>` | Corrigir finding confirmado e já registrado por ID seguro. | Da linha afetada; normalmente retorna a `main`. | Usar ID opaco, por exemplo `fix/security-finding-042`; não descrever vetor no nome. |
| `chore/security-tooling` | Manutenção de ferramenta, configuração, dependência, baseline ou CI sem nova função de produto. | Da branch de integração adotada. | Mudança em gate exige owner, teste e plano de rollback. |
| `docs/security-<tema>` | Política, guia ou resumo sanitizado, como `docs/security-evidence-policy`. | Da branch de integração adotada. | Documento não pode transportar relatório cru ou finding explorável. |
| `hotfix/<id-ou-tema-seguro>` | Correção urgente de produção ou condição que bloqueia operação/release. | Da revisão implantada ou de `main`, conforme rastreabilidade; retorna a todas as linhas ainda suportadas. | Escopo mínimo, revisão acelerada e retrospectiva obrigatória. |
| `release/<versao>` | Estabilização de uma versão quando há janela de release e múltiplas correções coordenadas. | Da linha integrada; retorna a `main` e, se existir, a `develop`. | Aceitar somente correções, versão, notas e evidências de gate; sem features novas. |

Use nomes em minúsculas, com hífens, curtos e sem nomes de pessoas, clientes, tenants, hosts, CVEs não divulgados ou natureza explorável. Exclua a branch após o merge, salvo linha de release ainda suportada.

### Quando criar branch

Crie uma branch antes da primeira mudança que será submetida a revisão. Uma branch deve representar um resultado coerente e pequeno. Separe mudanças com owners, riscos, rollbacks ou cadências diferentes.

Não crie branch para guardar relatório, backup, dump ou investigação. Não use branch não mesclada como controle de acesso: pessoas com acesso ao repositório podem conseguir visualizar refs, commits, caches ou cópias.

### Decisão sobre `develop`

Adote `develop` apenas se todas as condições forem verdadeiras:

- existe cadência de releases agrupadas, diferente de integração em `main`;
- há ambiente e gates próprios para a linha integrada;
- existe regra clara de promoção e backmerge;
- `develop` recebe a mesma proteção mínima de `main`;
- a equipe mede e limita divergência entre as duas linhas.

Sem essas condições, branches partem de `main` e retornam a `main` por PR.

## Fluxo geral de mudança

1. Classificar a demanda: feature, correção, tooling, documentação, hotfix ou release.
2. Abrir ou identificar o item rastreável adequado. Finding sensível fica no tracker restrito.
3. Criar branch com nome seguro a partir da base correta e atualizada.
4. Implementar mudança mínima, testes e documentação sem incluir evidência restrita.
5. Revisar arquivos staged, diff, histórico local e resultados de secret scanning.
6. Abrir PR com objetivo, risco, testes, rollback e IDs relacionados em nível sanitizado.
7. Executar checks obrigatórios e obter revisões dos owners aplicáveis.
8. Resolver conversas, retestar correções e atualizar risco/issue sem colar relatórios crus.
9. Fazer merge pelo método aprovado e excluir a branch.
10. Confirmar estado integrado, atualizar issue/finding e vincular a release quando aplicável.

## Fluxo de findings

| Estado | Ação e critério de saída |
|---|---|
| Detectado | Registrar fonte, data, revisão e ID em canal adequado; saída crua continua restrita. |
| Em triagem | Verificar duplicidade, escopo, aplicabilidade, severidade, prioridade, owner, SLA e possível incidente. |
| Confirmado | Criar item de remediação sanitizado; definir gate, critério de aceite e reteste. |
| Em correção | Vincular branch `fix/security-finding-<id>` e PR; manter detalhe técnico no tracker restrito. |
| Em reteste | Validar a revisão corrigida, regressão e risco residual por pessoa competente. |
| Encerrado | Exigir correção comprovada e reteste aprovado, ou decisão formal válida de tratamento. |
| Reaberto | Reteste falhou, regressão surgiu, escopo mudou, controle expirou ou nova evidência aumentou o risco. |

Achado crítico confirmado, segredo ativo, quebra multi-tenant, incidente ou exploração observada aciona contenção imediatamente. Não aguarde a cerimônia normal de backlog. O item comum pode registrar apenas um título abstrato e um ID; investigação, evidência e coordenação ficam no canal restrito.

## Fluxo de issues

### Quando criar

Crie issue comum somente quando a descrição puder ser sanitizada e o acesso ao repositório for compatível com sua classificação. Use tracker restrito próprio para vulnerabilidade explorável, incidente, segredo, dado pessoal ou cliente identificável.

### Conteúdo mínimo

- título orientado ao resultado, como `[Security] Reforçar autorização em fluxo administrativo`;
- contexto e impacto generalizados;
- ID do finding ou risco, sem localização de evidência restrita;
- severidade, prioridade, owner e prazo;
- critério de aceite verificável;
- dependências, milestone e release afetada/corrigida em nível seguro;
- método de reteste e condição de reabertura.

Não anexar relatório de scanner, log, print sem redaction, request/response, segredo, dado pessoal, URL interna ou PoC.

### Labels

Use labels em dimensões separadas e estáveis:

| Dimensão | Exemplos recomendados |
|---|---|
| Domínio | `security`, `privacy`, `accessibility`, `supply-chain`, `ci-cd` |
| Origem | `sast`, `dast`, `sca`, `secret-scan`, `manual-review` |
| Severidade | `severity:critical`, `severity:high`, `severity:medium`, `severity:low` |
| Prioridade | `priority:p0`, `priority:p1`, `priority:p2`, `priority:p3` |
| Estado | `status:triage`, `status:remediation`, `status:retest`, `status:blocked` |
| Decisão | `risk-accepted`, `false-positive`, `release-blocker` |

Labels não substituem justificativa, aprovação, SLA ou gate. Evite label que revele cliente, ativo ou vetor.

### Milestones

Use milestone para agrupar issues e PRs por resultado verificável: uma release, janela de remediação, auditoria ou objetivo trimestral. Não use milestone para ocultar atraso nem para representar severidade. Finding bloqueador continua bloqueador mesmo fora do milestone corrente.

## Fluxo de riscos aceitos

1. Confirmar o finding e calcular risco residual após controles compensatórios testados.
2. Avaliar alternativas: corrigir, mitigar, evitar, transferir ou monitorar.
3. Registrar `RISK-<id>` no sistema autorizado com cenário, escopo, justificativa, owner, aprovadores, controles, monitoramento, prazo, expiração e gatilhos.
4. Vincular issue e PR apenas pelo ID seguro e pela decisão sanitizada.
5. Aplicar label `risk-accepted` somente após aprovação válida; antes disso, usar estado pendente.
6. Revisar antes da expiração e a cada mudança material, incidente, falha de controle, nova exploração, contrato ou release relevante.
7. Ao expirar sem revalidação, reabrir o finding e restabelecer o gate.

Aceite não apaga o finding, não encerra incidente ativo e não autoriza segredo exposto, acesso não autorizado material ou obrigação aplicável sabidamente descumprida. Autoridade, limites e participação de Segurança, Privacidade, Jurídico, Acessibilidade ou liderança dependem do contexto e da política interna.

## Fluxo de falsos positivos

1. Reproduzir a regra em escopo autorizado e confirmar que a condição não existe ou não é aplicável.
2. Registrar `FP-<id>`, ferramenta/regra/versão, justificativa técnica, escopo, evidência segura, revisor e data.
3. Preferir ajuste específico de regra ou supressão mínima; não desabilitar categoria inteira por conveniência.
4. Exigir aprovação proporcional ao risco e definir expiração ou gatilho de revisão.
5. Vincular a configuração alterada e seu teste por ID, sem anexar a saída crua.
6. Reabrir quando regra, código, versão, fluxo, exposição ou controle mudar.

Um scanner pode estar errado sem que a classe de risco seja irrelevante. Falso positivo validado deixa de bloquear apenas no escopo e prazo aprovados.

## Fluxo para segredo vazado

1. Interromper push, merge, release, upload e compartilhamento.
2. Tratar o valor como comprometido e revogar ou rotacionar; apagar a linha não contém a exposição.
3. Acionar resposta a incidente e identificar alcance em commits, branches, forks, logs, artifacts, caches, issues e PRs.
4. Remover o segredo das fontes expostas, preservando evidência forense fora do Git quando necessária.
5. Avaliar reescrita de histórico com owner do repositório; ela pode quebrar clones e não substitui revogação.
6. Executar secret scanning novamente e corrigir a causa, como logging, configuração ou uso de credencial estática.
7. Registrar somente resumo sanitizado e decisão de encerramento.

Push protection deve bloquear a entrada de segredos quando disponível. Bypass por “corrigir depois” não é prática aceita por esta política; falso positivo exige análise e aprovação registradas.

## Fluxo de hotfix

1. Declarar incidente ou urgência e nomear owner técnico e decisor.
2. Criar `hotfix/<id-ou-tema-seguro>` da revisão implantada ou de `main`, documentando qualquer divergência.
3. Limitar o diff à contenção/correção e aos testes indispensáveis.
4. Manter PR, revisão independente e checks mínimos. Reduzir tempo não significa eliminar controles.
5. Se um check inviabilizar resposta imediata, o bypass exige autoridade prevista, justificativa, escopo, prazo e registro de auditoria.
6. Implantar com rollback definido, observar sinais de regressão e retestar o finding.
7. Mesclar a correção em todas as linhas suportadas, inclusive `develop` ou release branch existentes.
8. Fazer retrospectiva e completar testes/documentação pendentes em prazo aprovado.

Segredo, incidente ativo e vulnerabilidade crítica podem exigir contenção antes da correção definitiva. A comunicação externa segue Segurança, Privacidade, Jurídico, contrato e resposta a incidentes.

## Fluxo de releases

1. Definir escopo, commit candidato, milestone e decisão Go/No-Go.
2. Usar `main` diretamente para release contínua ou `release/<versao>` para estabilização controlada.
3. Congelar features na release branch; aceitar apenas correção, versão, notas e gates.
4. Executar os checks aplicáveis à fase e confirmar que o artefato testado é o que será publicado.
5. Resolver bloqueadores, retestar correções e validar riscos/exceções não expirados.
6. Aprovar release por papel autorizado e environment protegido quando disponível.
7. Criar tag a partir do commit aprovado. Tags e commits assinados são desejáveis na Fase 2 e recomendados na Fase 3.
8. Publicar notas sanitizadas; não expor vulnerabilidade ainda explorável, cliente, ambiente ou evidência.
9. Vincular release a milestone, PRs, issues e IDs sanitizados; preservar evidência detalhada fora do Git.
10. Monitorar pós-release e reabrir itens se houver regressão ou incidente.

Releases do GitHub são baseadas em tags e seus arquivos-fonte refletem o ponto marcado. Proteja padrões de tags de release quando o recurso estiver disponível. Correção de vulnerabilidade em projeto distribuído pode exigir advisory e divulgação coordenada; para este repositório privado, confirmar canal e capacidade do plano antes de usar recursos específicos do GitHub.

## Commits seguros

### Formato recomendado

Use uma convenção curta e orientada à mudança:

```text
<tipo>(<escopo opcional>): <resultado seguro>
```

Exemplos permitidos:

```text
security: add gitleaks baseline
fix(auth): enforce permission check on enrollment endpoint
docs(lgpd): add data retention policy
chore(ci): add semgrep workflow
fix(security): remediate FIND-042
docs(security): update sanitized audit summary
```

Tipos usuais: `feat`, `fix`, `security`, `docs`, `chore`, `test`, `refactor` e `revert`. A mensagem deve explicar o resultado sem registrar segredo, cliente, host, dado pessoal, exploit, payload ou evidência.

### Antes do commit

- revisar `git status`, lista de staged files e `git diff --cached`;
- confirmar que `reports/raw/`, logs, dumps, backups, estados e arquivos locais não estão staged;
- buscar segredos e dados sensíveis no conteúdo e na mensagem;
- verificar arquivos ocultos, binários, metadados e outputs gerados;
- usar dados fictícios inequívocos em testes e exemplos;
- evitar `git add .` sem revisar o conjunto exato de arquivos;
- assinar commits quando a política da fase exigir e a identidade estiver configurada.

Assinatura confirma origem e integridade do commit, não segurança do conteúdo nem aprovação da mudança.

## Pull requests seguros

Toda PR deve ser pequena o suficiente para revisão efetiva e conter:

- objetivo e escopo;
- tipo de mudança e branch base;
- issue/finding/risco por ID seguro;
- riscos introduzidos ou reduzidos;
- testes e checks executados, sem colar saída sensível;
- impacto em dados, tenants, autenticação, autorização, pagamentos, cloud e acessibilidade;
- plano de rollback ou justificativa de não aplicabilidade;
- evidência sanitizada aprovada, quando indispensável;
- dependências, riscos aceitos, falsos positivos e expirações relevantes.

Use `Closes #<issue>` ou `Fixes #<issue>` apenas quando a PR mira a branch padrão e o merge realmente satisfaz todo o critério de aceite. Em PR para `develop` ou release branch, faça vínculo manual e feche a issue somente após promoção/validação final, pois keywords de fechamento são interpretadas para a branch padrão.

Revisores devem avaliar código e configuração, ameaça, privilégio, logging, dados, testes, rollback, supply chain e suficiência da sanitização. Comentário de PR não é local para evidência crua.

## Relação entre registros

| Objeto | Identificador | Deve apontar para | Não deve conter |
|---|---|---|---|
| Finding | `FIND-042` | evidência restrita, issue, risco, PR, reteste | payload, segredo ou ativo identificável |
| Issue | `#123` | finding/risco por ID, milestone, PR, release | relatório cru ou reprodução explorável |
| Risco | `RISK-017` | finding, decisão, controles, owner, expiração | aprovação informal ou permanente |
| Falso positivo | `FP-009` | finding, regra, escopo, revisão, supressão | `ignore` sem justificativa |
| Evidência sanitizada | `EV-SAN-031` | finding, PR ou release conforme necessidade | caminho/localização da evidência restrita |
| PR | `#145` | issue, IDs seguros, testes e release | anexos crus, logs ou segredo |
| Release | tag/versão | commit, milestone, PRs e decisão Go/No-Go | detalhe de falha ainda explorável |

A fonte de verdade para detalhe sensível é o sistema restrito. O Git registra o mínimo necessário para auditoria de decisão e implementação.

## Fluxos por maturidade

### Fase 1 - MVP seguro

- `main` protegida, sem `develop` por padrão;
- branches curtas para toda mudança;
- PR obrigatória, uma aprovação independente e conversas resolvidas;
- checks básicos, política do repositório, testes e secret scan aplicáveis;
- issues sanitizadas com owner, prioridade e critério de aceite;
- release manual com checklist e decisão registrada;
- hotfix mantém PR e revisão, com bypass somente em emergência documentada.

### Fase 2 - SaaS vendável para empresas

- `develop` somente se houver cadência e ambiente de integração formais;
- CODEOWNERS e duas aprovações para áreas críticas;
- approvals obsoletas descartadas após novos commits;
- commits/tags assinados quando viável e compatível com o método de merge;
- checks de SAST, SCA, dependências, containers, SBOM, acessibilidade e release conforme stack;
- environments protegidos e segregação entre aprovação e publicação;
- milestones de release, SLAs, riscos aceitos temporários e evidência sanitizada com segunda revisão.

### Fase 3 - SaaS maduro

- rulesets organizacionais para branches e tags, com bypass mínimo e monitorado;
- merge queue somente após todos os checks funcionarem também em `merge_group`;
- proteção de tags, commits assinados, histórico linear se compatível e proveniência do artefato;
- segregação de funções entre autoria, revisão, aprovação de risco e deploy;
- métricas de bypass, tempo de triagem, reabertura, exceções vencidas e regressões;
- revisão periódica de rulesets, labels, owners, SLAs e acessos;
- fluxo coordenado de disclosure/advisory quando o produto distribuído e o plano aplicável exigirem.

## Branch protection recomendada

Prefira rulesets quando disponíveis, pois podem se sobrepor e proteger branches e tags. Branch protection clássica continua válida quando rulesets não estiverem disponíveis. Nunca configure check obrigatório que não roda em todos os PRs-alvo.

| Controle | MVP seguro | SaaS vendável | SaaS maduro |
|---|---|---|---|
| PR antes de merge | Obrigatório | Obrigatório | Obrigatório |
| Aprovações | 1 | 1 geral; 2 em áreas críticas | 2 ou mais conforme risco e segregação |
| CODEOWNERS | Desejável | Obrigatório em áreas críticas | Obrigatório e revisado periodicamente |
| Dismiss stale approvals | Desejável | Obrigatório | Obrigatório |
| Aprovação do último push | Desejável | Obrigatório para alto risco | Obrigatório |
| Resolver conversas | Obrigatório | Obrigatório | Obrigatório |
| Status checks | Básicos e estáveis | Todos os aplicáveis da fase | Gates completos e monitorados |
| Branch atualizada/merge queue | Atualização quando necessário | Avaliar custo e concorrência | Merge queue validada |
| Force-push e delete | Bloquear | Bloquear | Bloquear |
| Bypass de admins | Evitar | Restringir e auditar | Lista nominal mínima, revisão periódica |
| Commits assinados | Desejável | Desejável/obrigatório conforme política | Obrigatório quando suportado ponta a ponta |
| Histórico linear | Opcional | Desejável se compatível | Recomendado se compatível |
| Deploy antes de merge | Não | Para fluxos críticos quando aplicável | Por environment e política |
| Proteção de tags | Desejável | Recomendada | Obrigatória para releases |

Incertezas: disponibilidade de rulesets, push rulesets, merge queue, code scanning, secret scanning, environments, custom roles e controles de bypass depende de proprietário, plano, licença e configuração atuais do GitHub. Push rulesets para repositórios privados têm restrições de plano adicionais. Confirmar na organização antes de declarar controle obrigatório.

## Checklist antes de merge

- [ ] Branch correta, atualizada e com nome não sensível?
- [ ] Escopo pequeno e sem mudança não relacionada?
- [ ] Issue, finding, risco e milestone relacionados por IDs seguros?
- [ ] Critério de aceite atendido e testes de regressão executados?
- [ ] Checks obrigatórios concluíram com sucesso, sem cancelamento ou bypass oculto?
- [ ] Findings de scanner foram triados; falsos positivos têm aprovação e validade?
- [ ] Não há segredo, dado pessoal, URL interna, log, dump, payload ou relatório cru no diff, histórico, mensagem, PR ou artifact?
- [ ] Evidência versionada está em `reports/sanitized/`, foi reconstruída por allowlist e revisada por segunda pessoa?
- [ ] Mudanças de autenticação, autorização, tenant, pagamento, dados, cloud e CI receberam owner/revisor adequado?
- [ ] Risco residual e exceções estão aprovados, monitorados e não expirados?
- [ ] Conversas foram resolvidas e approvals continuam válidas após o último push?
- [ ] Rollback, migração e compatibilidade foram avaliados?
- [ ] Correção de finding passou por reteste proporcional ao risco?
- [ ] Não existe condição de bloqueio de release aplicável?

## Checklist antes de release

- [ ] Commit/tag candidato corresponde exatamente ao artefato testado?
- [ ] Escopo, milestone, notas e decisão Go/No-Go foram aprovados?
- [ ] Todos os checks e auditorias obrigatórios da fase foram executados no escopo correto?
- [ ] Não há crítico aberto, alto bloqueante, segredo ativo, quebra multi-tenant ou incidente relacionado?
- [ ] Findings corrigidos foram retestados; regressões reabriram os itens quando necessário?
- [ ] Riscos aceitos, falsos positivos e exceções estão dentro do escopo e da validade?
- [ ] SBOM, imagem/digest, dependências, migrações e rollback foram validados quando aplicáveis?
- [ ] Fluxos críticos de autenticação, autorização, pagamento, administração, privacidade e acessibilidade foram verificados?
- [ ] Release notes e assets foram revisados contra segredos, dados pessoais, detalhes exploráveis e metadados?
- [ ] Evidências cruas permanecem fora do Git; resumos sanitizados têm aprovação?
- [ ] Tag está protegida/assinada conforme a fase e foi criada do commit aprovado?
- [ ] Environments, aprovadores e permissões de publicação seguem menor privilégio?
- [ ] Monitoramento pós-release, owner, rollback e canal de incidente estão definidos?
- [ ] Contrato, plano GitHub, política interna e validação jurídica foram considerados quando aplicáveis?

## Governança e revisão

- Segurança mantém esta política; Engenharia mantém branches, checks e owners; Produto prioriza; Privacidade, Jurídico, Acessibilidade e Operações aprovam decisões nos seus domínios.
- Revisar ao menos anualmente e após incidente grave, bypass relevante, mudança de plano GitHub, alteração de método de merge ou falha de gate.
- Métricas não devem incentivar ocultar findings ou rebaixar severidade. Acompanhar tempo de revisão, branches antigas, bypasses, exceções vencidas, falhas de reteste e regressões.
- Fontes, limitações de plano e decisões de pesquisa estão em `research/sources/chunk-14.md`.
