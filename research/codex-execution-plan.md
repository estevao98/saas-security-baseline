# Plano de execução para Codex/agente de código

## Objetivo e limites

Este plano transforma o estado auditado do `saas-security-baseline` em um backlog executável. A entrada obrigatória é `research/coverage-audit.md`; portanto, presença de arquivo ou status histórico não é tratada como prova de implementação.

O plano não corrige as lacunas. Cada caminho futuro está marcado como existente, a alterar, ou **a criar**. A execução deve manter PRs pequenos, evidências cruas fora do Git e revisão humana proporcional ao domínio.

Não há declaração de conformidade, certificação ou ausência de vulnerabilidades. Versões de ferramentas, referências imutáveis, licenças, plano GitHub, requisitos enterprise, obrigações jurídicas e exigências contratuais devem ser confirmados no momento da implementação.

## Regras transversais para o agente

- Ler `AGENTS.md`, `research/task-queue.md`, `research/progress.md`, a issue e os documentos canônicos do domínio antes de editar.
- Verificar a árvore real e o `git status`; não sobrescrever trabalho existente nem assumir que um placeholder está implementado.
- Trabalhar em branch curta, com um objetivo verificável e um PR revisável.
- Usar somente dados e fixtures claramente fictícios, sem valores parecidos com credenciais reais.
- Não copiar para Git logs, dumps, backups, cookies, tokens, URLs internas, dados pessoais, requests/responses, payloads, PoCs, prints não redigidos ou relatórios crus.
- Manter saídas integrais em `reports/raw/`, ignorado pelo Git, e versionar somente sínteses minimizadas em `reports/sanitized/` após revisão humana.
- Não habilitar scanner ou gate antes de validar versão, origem, permissões, rede, telemetria, exit codes, logs, artifacts e falsos positivos.
- Não declarar um controle concluído quando a validação foi omitida, falhou tecnicamente ou depende de configuração externa não confirmada.
- Atualizar documentação de estado somente depois que a implementação correspondente estiver presente e revisada.
- Interromper e escalar para revisão humana se a tarefa exigir segredo real, dado pessoal, evidência sensível, acesso a produção ou decisão jurídica/contratual.

## Ordem recomendada

Os números dos lotes preservam o Chunk 20 original. A ordem prática é determinada pelas lacunas da auditoria:

| Ordem | Lote | Motivo |
|---:|---|---|
| 1 | 3 — Checklists | Recupera de fato o Chunk 15 e cria sua fonte ausente. |
| 2 | 1 — Estrutura inicial | Reconcilia inventário e status somente após a entrega real dos checklists. |
| 3 | 4 — Políticas | Torna segredos, contribuição e ownership operacionais. |
| 4 | 6 — GitHub Actions | Implementa somente automações aplicáveis e já apoiadas por política. |
| 5 | 2 — Documentos base | Resolve placeholders e fontes canônicas sem duplicação. |
| 6 | 7 — Frappe/Python | Fecha a lacuna operacional de stack com fixture fictícia. |
| 7 | 8 — LGPD | Converte o programa em artefatos mínimos, com revisão jurídica explícita. |
| 8 | 9 — Acessibilidade | Converte o programa em processo automatizado e manual. |
| 9 | 5 — Scripts | Valida os pontos de entrada depois de definir fixtures e controles. |
| 10 | 10 — Relatórios e evidências | Reforça prevenção, redaction e artefatos auxiliares de risco. |
| 11 | 11 — Revisão final | Confere inventário, links, placeholders, fontes e arquivos sensíveis. |

## Lote 1 — Estrutura inicial

### Objetivo

Reconciliar o estado declarado com a árvore real e criar um inventário confiável de artefatos implementados, exemplos, placeholders e itens planejados.

### Branch sugerida

`docs/reconcile-repository-state`

### Issue: Reconciliar inventário, status e arquitetura do repositório

**Contexto:** a auditoria encontrou divergências entre `research/progress.md`, `research/task-queue.md`, `README.md`, `docs/repository-architecture.md` e os arquivos reais, especialmente no Chunk 15.

**Arquivos afetados:** `research/progress.md`, `research/task-queue.md`, `docs/repository-architecture.md`; `README.md` somente no PR final deste lote e apenas se o estado implementado tiver mudado. Inventário auxiliar: `research/repository-inventory.md` **a criar**, se aprovado.

**Tarefas:**

- [ ] Gerar inventário `esperado x existente x substantivo x placeholder x planejado` a partir da árvore real.
- [ ] Confirmar que o Lote 3 foi aceito antes de declarar o Chunk 15 concluído.
- [ ] Reconciliar descrições históricas e estado atual sem apagar o histórico de execução.
- [ ] Marcar propostas futuras como “a criar”.
- [ ] Separar claramente documento canônico, índice, template, exemplo e backlog.
- [ ] Atualizar arquitetura e README somente quando refletirem arquivos já entregues.

**Conteúdo esperado:** visão verificável do estado do repositório, sem confundir presença com implementação e sem prometer controles ainda não testados.

**Critérios de aceite:**

- [ ] Cada divergência alta da auditoria possui estado e issue vinculada.
- [ ] Chunk 15, fonte e checklists têm declarações coerentes com a árvore.
- [ ] Nenhum arquivo inexistente é apresentado como existente.
- [ ] O README não anuncia cobertura maior que a sustentada.

**Validações locais:** inventário com `find` e `git ls-files`; busca de placeholders; verificação de links Markdown locais; revisão do diff contra `research/coverage-audit.md`.

**Validações de segurança:** confirmar que o inventário não inclui conteúdo de arquivos ignorados, nomes de clientes, URLs internas ou caminhos sensíveis; executar busca heurística de padrões proibidos sem imprimir valores encontrados.

**Riscos:** revelar estrutura interna excessiva; normalizar status incorreto; atualizar o README antes da implementação.

**Cuidados com segredos, dados pessoais, evidências e logs:** inventariar apenas caminhos versionados e classificações; não ler nem registrar `reports/raw/`, dumps, backups ou configurações reais.

**Reviewer sugerido:** mantenedor do repositório e responsável por Segurança/Governança.

**Labels sugeridas:** `research`, `governance`, `documentation`, `priority:high`.

**Prioridade:** alta. **Dependências:** Lote 3 aceito. **Tamanho estimado do PR:** S para inventário/status; S separado para arquitetura/README.

**Issues/PRs sugeridos:** PR 1.1 inventário e status; PR 1.2 arquitetura; PR 1.3 README somente se necessário.

**Ordem no lote:** inventário, reconciliação de pesquisa, arquitetura, README.

**Dependências de revisão humana:** decidir se placeholders permanecem no roadmap; validar linguagem pública do README.

**O agente NÃO deve:** marcar trabalho futuro como concluído, reescrever histórico, remover arquivos sem decisão humana ou alterar README por antecipação.

## Lote 2 — Documentos base

### Objetivo

Resolver documentos auxiliares placeholders por consolidação, redirecionamento ao canônico, preenchimento mínimo ou remoção planejada, sem criar fontes concorrentes.

### Branch sugerida

`docs/reconcile-supporting-docs`

### Issue: Reconciliar documentos auxiliares e fontes canônicas

**Contexto:** guias principais são substantivos, mas documentos de incidentes, continuidade, threat model, API, cloud, IA, acessibilidade, privacidade e risco continuam placeholders.

**Arquivos afetados:** `docs/incident-response-plan.md`, `docs/business-continuity-plan.md`, `docs/threat-model.md`, `docs/api-security-checklist.md`, `docs/cloud-security-checklist.md`, `docs/ai-governance-checklist.md`, READMEs de domínio e outros placeholders confirmados pelo inventário.

**Tarefas:**

- [ ] Classificar cada auxiliar como canônico, índice, template, exemplo ou redundante.
- [ ] Definir uma fonte canônica por assunto e links de navegação.
- [ ] Preencher somente artefatos necessários ao uso real ou substituir por redirecionamento explícito.
- [ ] Remover referências vencidas a chunks já executados.
- [ ] Registrar fontes oficiais adicionais por PR quando novo conteúdo normativo/técnico for introduzido.

**Conteúdo esperado:** documentos pequenos, sem duplicação contraditória, com escopo, owner, momento de uso, limites e relação com templates/checklists.

**Critérios de aceite:**

- [ ] Nenhum placeholder vencido permanece sem status planejado explícito.
- [ ] Cada assunto tem fonte canônica identificável.
- [ ] Links locais passam e não há conteúdo prometido sem evidência.

**Validações locais:** busca de placeholders; link check local; comparação de títulos/escopos; lint Markdown disponível no projeto.

**Validações de segurança:** revisar exemplos e diagramas para impedir topologia, endpoint, cliente, tenant, fornecedor ou vetor real.

**Riscos:** duplicar políticas, introduzir requisito inventado ou remover caminho consumido externamente.

**Cuidados:** usar abstrações e IDs fictícios; não converter documento-base em registro real.

**Reviewer sugerido:** Arquitetura, Segurança e owner do domínio documental.

**Labels sugeridas:** `documentation`, `architecture`, `priority:medium`.

**Prioridade:** média. **Dependências:** inventário do Lote 1. **Tamanho estimado do PR:** S por domínio; nunca um PR único para todos os documentos.

**Issues/PRs sugeridos:** uma issue de decisão; PRs separados para incidentes/continuidade, AppSec/cloud/IA e READMEs.

**Ordem no lote:** decisão canônica, domínios de maior risco, READMEs, validação de links.

**Dependências de revisão humana:** aprovação de owner, aplicabilidade contratual e eventual obrigação formal.

**O agente NÃO deve:** copiar normas, inventar edição/requisito, preencher dados organizacionais reais ou criar documentação duplicada apenas para eliminar a palavra placeholder.

## Lote 3 — Checklists

### Objetivo

Corrigir de fato o Chunk 15, criar sua rastreabilidade e só então reconciliar o status declarado.

### Branch sugerida

`docs/repair-chunk-15-checklists`

### Issue: Implementar o pacote real de checklists e a fonte do Chunk 15

**Contexto:** todos os `checklists/*.md` auditados têm sete ou oito linhas e são placeholders, enquanto fila e progresso declaram a entrega concluída; `research/sources/chunk-15.md` não existe.

**Arquivos afetados:** `checklists/index.md`, `checklists/README.md`, todos os checklists existentes em `checklists/*.md`, `research/sources/chunk-15.md` **a criar**, `research/progress.md` e `research/task-queue.md`.

**Tarefas:**

- [ ] Confirmar no prompt do Chunk 15 a lista exata e resolver a divergência entre “15 checklists” e a árvore atual.
- [ ] Implementar cada checklist em PR temático com objetivo, momento, revisor, evidências, itens `- [ ]`, níveis e critérios de aprovação/reprovação.
- [ ] Alinhar gates aos documentos canônicos e à matriz de severidade.
- [ ] Registrar versões, fontes oficiais, decisões e incertezas em `research/sources/chunk-15.md`.
- [ ] Revisar índice e README após todos os checklists.
- [ ] Corrigir status apenas depois do aceite dos PRs de conteúdo e fontes.

**Conteúdo esperado:** checklists aplicáveis a SaaS real, distinguindo obrigatório, desejável, melhoria futura e certificação formal quando pertinente; evidências descritas de forma sanitizada.

**Critérios de aceite:**

- [ ] Nenhum checklist permanece placeholder.
- [ ] Todos possuem itens marcáveis, owner/revisor, evidência, gate e não aplicabilidade justificável.
- [ ] OWASP, Frappe, LGPD e acessibilidade preservam versões e limites das fontes canônicas.
- [ ] `research/sources/chunk-15.md` existe e não inventa fontes.
- [ ] Progresso e fila refletem a entrega real.

**Validações locais:** contagem de arquivos; busca por `- [ ]`; busca de placeholders; links locais; comparação com o prompt; revisão cruzada com docs e templates.

**Validações de segurança:** garantir que exemplos não incluam credenciais, dados pessoais, endpoints, requests/responses, payloads ou evidência crua; revisar instruções de findings para evitar detalhes exploráveis.

**Riscos:** criar checklists superficiais; transformar referência em obrigação universal; declarar conformidade por marcação automática.

**Cuidados:** evidências apenas por IDs opacos; resultados reais ficam em sistema restrito; checklists preenchidos de clientes não devem ser versionados nesta baseline.

**Reviewer sugerido:** Segurança/AppSec; adicionar Privacidade, Acessibilidade, Frappe, Operações e Jurídico conforme o checklist.

**Labels sugeridas:** `documentation`, `security`, `priority:high`, `release-blocker`, `research`.

**Prioridade:** máxima do plano. **Dependências:** nenhuma além dos documentos canônicos existentes. **Tamanho estimado do PR:** S; agrupar no máximo 2 a 4 checklists do mesmo domínio.

**Issues/PRs sugeridos:** PR 3.1 gates de release; 3.2 OWASP/API; 3.3 LGPD/acessibilidade; 3.4 Frappe/cloud/CI; 3.5 operação/terceiros/IA/pagamentos; 3.6 índice, fontes e status.

**Ordem no lote:** confirmar escopo, criar fonte em paralelo ao conteúdo, implementar por domínio, revisar índice, reconciliar status.

**Dependências de revisão humana:** interpretação jurídica LGPD, avaliação WCAG manual, versão Frappe, requisitos de pagamento e exigências enterprise.

**O agente NÃO deve:** apenas trocar o texto do placeholder, marcar itens como atendidos, inventar obrigação/certificação, criar checklists preenchidos ou atualizar status antes do aceite.

## Lote 4 — Políticas

### Objetivo

Consolidar segurança, contribuição e ownership e tornar a proteção contra segredos operacional antes de ampliar CI.

### Branch sugerida

`security/operationalize-policies`

### Issue: Implementar políticas raiz e controles de segredo

**Contexto:** `SECURITY.md`, `CONTRIBUTING.md`, `CODEOWNERS` e `.gitleaks.toml` são iniciais; `.secrets.baseline` está vazia e o workflow ativo não faz secret scanning.

**Arquivos afetados:** `SECURITY.md`, `CONTRIBUTING.md`, `CODEOWNERS`, `.gitleaks.toml`, `.secrets.baseline`, `.gitignore`; fixture fictícia **a criar** em caminho aprovado, sem padrão semelhante a segredo real.

**Tarefas:**

- [ ] Definir reporte privado, triagem, resposta, divulgação e proibição de evidência sensível em `SECURITY.md`.
- [ ] Consolidar fluxo de contribuição, testes, PR, evidências e commits em `CONTRIBUTING.md`.
- [ ] Definir estrutura de `CODEOWNERS` sem inventar usuários; usar papéis/documentação até owners reais serem fornecidos.
- [ ] Configurar Gitleaks/detect-secrets com regras mínimas revisadas e allowlists justificadas.
- [ ] Criar teste positivo/negativo com marcador sintético inequívoco, sem formato de credencial.
- [ ] Documentar resposta a detecção e limites do controle.

**Conteúdo esperado:** políticas acionáveis e controle testável de segredo, sem valores reais ou parecidos com credenciais.

**Critérios de aceite:** reporte privado claro; contribuição coerente com o fluxo Git; owners reais validados no repositório consumidor; configuração parseável; fixture detectada conforme regra explícita; nenhum segredo no histórico.

**Validações locais:** parse/config test das ferramentas em versões fixadas; scan de fixture e árvore; `git diff --check`; validação de CODEOWNERS conforme GitHub e plano aplicável.

**Validações de segurança:** revisar stdout/stderr, baseline e allowlists; confirmar que detecção não imprime valor; verificar histórico somente em ambiente autorizado.

**Riscos:** fixture parecer credencial, allowlist ampla, falso senso de cobertura, exposição em logs e dependência de recurso GitHub não disponível.

**Cuidados:** nunca adicionar valor real à baseline; guardar incidente e evidência fora do Git; revogação/rotação é humana e externa ao agente.

**Reviewer sugerido:** Segurança, mantenedor e administrador GitHub; Jurídico/Comunicação para disclosure quando aplicável.

**Labels sugeridas:** `security`, `secrets`, `governance`, `priority:high`.

**Prioridade:** alta. **Dependências:** Lote 3 para checklist de CI/release; confirmação de owners e plano GitHub. **Tamanho estimado do PR:** S por política; M para configuração e testes.

**Issues/PRs sugeridos:** PR 4.1 SECURITY; 4.2 CONTRIBUTING/CODEOWNERS; 4.3 configuração e fixture de secret scanning.

**Ordem no lote:** política de resposta, contribuição/ownership, configuração, fixture, integração futura.

**Dependências de revisão humana:** canal privado real, SLAs internos, owners, plano/licença e decisão sobre scan de histórico.

**O agente NÃO deve:** criar contato pessoal fictício, segredo canário, auto-rotação, divulgação pública, allowlist genérica ou owner inexistente.

## Lote 5 — Scripts

### Objetivo

Validar os oito scripts existentes com fixtures fictícias, falha segura e matriz de versões antes de tratá-los como gates confiáveis.

### Branch sugerida

`test/audit-script-fixtures`

### Issue: Criar testes seguros para scripts locais de auditoria

**Contexto:** os scripts passaram somente em `bash -n`; ferramentas, flags, rede, outputs e exit codes não foram exercitados neste repositório.

**Arquivos afetados:** `scripts/*.sh`, `scripts/README.md`; `tests/scripts/` **a criar**; fixtures fictícias **a criar**; matriz de versões **a criar** em local aprovado.

**Tarefas:**

- [ ] Testar preflight, entradas válidas/inválidas, paths, URL loopback, consentimento de rede e ferramentas ausentes.
- [ ] Usar stubs ou fixtures locais para validar comandos sem enviar dados externamente.
- [ ] Confirmar criação em `reports/raw/` e resumo minimizado em `reports/sanitized/`.
- [ ] Validar propagação de exit codes e ausência de sobrescrita.
- [ ] Executar ShellCheck quando versão/configuração forem aprovadas.
- [ ] Registrar versões testadas e incertezas por ferramenta.

**Conteúdo esperado:** suite reproduzível que testa comportamento do wrapper, não a eficácia completa dos scanners.

**Critérios de aceite:** todos os scripts têm casos de sucesso controlado e falha segura; testes não exigem segredo, produção ou internet por padrão; nenhum cru é rastreado.

**Validações locais:** `bash -n`; ShellCheck; runner de testes; `git status --ignored`; inspeção dos resumos; testes em diretório temporário.

**Validações de segurança:** confirmar loopback, ausência de shell injection, allowlists de variáveis, permissões de arquivos, logs sem conteúdo de fixture e limpeza segura apenas em diretório temporário controlado.

**Riscos:** comando de scanner mudar por versão, teste tocar rede, fixture produzir relatório sensível ou limpeza apagar caminho incorreto.

**Cuidados:** fixtures pequenas e sintéticas; sem PII, segredo, payload ou app real; crus temporários não são commitados.

**Reviewer sugerido:** Engenharia de Segurança/DevSecOps e mantenedor Bash.

**Labels sugeridas:** `testing`, `scripts`, `security`, `priority:medium`.

**Prioridade:** média. **Dependências:** política do Lote 4 e fixtures de Frappe/acessibilidade dos Lotes 7/9 quando aplicáveis. **Tamanho estimado do PR:** S por família de scripts.

**Issues/PRs sugeridos:** orquestrador/segredos; Python/Node; containers/SBOM; API/acessibilidade; Frappe.

**Ordem no lote:** preflight comum, scripts sem rede, scripts com rede simulada, integrações especializadas.

**Dependências de revisão humana:** versões suportadas, licenças, telemetria, disponibilidade de ferramentas e política de rede.

**O agente NÃO deve:** instalar ferramenta automaticamente, executar contra produção/terceiros, habilitar rede sem aprovação, gerar payloads ou alterar exit code para esconder falha.

## Lote 6 — GitHub Actions

### Objetivo

Implementar somente workflows aplicáveis, um controle por PR, com referências imutáveis e revisão de permissões, logs e plano GitHub.

### Branch sugerida

`ci/secure-workflow-baseline`

### Issue: Selecionar e implementar workflows de segurança aplicáveis

**Contexto:** há um workflow ativo de política, 13 exemplos e 10 placeholders; referências atuais usam tags mutáveis e funcionalidades podem depender de plano/licença.

**Arquivos afetados:** `.github/workflows/security.yml`; workflows em `.github/workflows/` **a criar** somente após seleção; `examples/github-workflows/*.yml`; `docs/github-actions-strategy.md` apenas para refletir implementação validada.

**Tarefas:**

- [ ] Criar matriz `controle x stack x fase x plano/licença x gate`.
- [ ] Começar por policy check e secret scan; depois dependency review/SAST conforme aplicabilidade.
- [ ] Fixar actions por SHA completo e imagens por digest validado, mantendo comentário da versão humana.
- [ ] Definir eventos, `permissions`, concorrência, timeouts, caches, rede e artifacts mínimos.
- [ ] Testar PR de fork/código não confiável e impedir `pull_request_target` inseguro.
- [ ] Tornar obrigatório somente após período alert-only, triagem e aprovação humana.

**Conteúdo esperado:** poucos workflows ativos, contextualizados e testados; exemplos não aplicáveis permanecem claramente exemplos ou são removidos por decisão revisada.

**Critérios de aceite:** cada workflow tem owner, gatilho, permissão mínima, referência imutável, política de falha, saída segura e dependência externa registrada.

**Validações locais:** parser/linter YAML; actionlint em versão aprovada; revisão de diffs; teste em branch/PR controlado; confirmação de checks e branch protection no GitHub.

**Validações de segurança:** revisar permissions, secrets, OIDC, cache poisoning, artifacts, logs, código não confiável, dependências e egress.

**Riscos:** exfiltração por action, custo/DoS, falso bloqueio, logs sensíveis, recurso indisponível no plano e tag comprometida.

**Cuidados:** não injetar secrets em PRs; não fazer upload de `reports/raw/`; usar status e IDs opacos.

**Reviewer sugerido:** DevSecOps, Segurança e administrador GitHub.

**Labels sugeridas:** `devsecops`, `github-actions`, `security`, `priority:high`.

**Prioridade:** alta. **Dependências:** Lote 4; testes locais relevantes; confirmação de plano/licença. **Tamanho estimado do PR:** S, um workflow ou controle por PR.

**Issues/PRs sugeridos:** policy hardening; secret scan; dependency review; CodeQL/SAST; stack-specific; SBOM/release; acessibilidade apenas após Lote 9.

**Ordem no lote:** seleção, política/segredos, dependências/SAST, stacks, release/agendados.

**Dependências de revisão humana:** plano GitHub, branch protection, runners, custos, política de retenção e aceitação de gates.

**O agente NÃO deve:** ativar todos os exemplos, usar tags mutáveis em gate, executar código de fork com segredo, publicar cru ou presumir recurso enterprise.

## Lote 7 — Frappe/Python

### Objetivo

Fechar a lacuna operacional Frappe/Python com checklist, fixture fictícia e matriz de versões suportadas/validadas.

### Branch sugerida

`test/frappe-python-baseline`

### Issue: Validar baseline Frappe/Python em fixture fictícia

**Contexto:** o guia e scripts existem, mas o checklist é placeholder e não houve teste em app Frappe fictício; comportamento depende de versão.

**Arquivos afetados:** `checklists/frappe-security.md`, `scripts/run-frappe-audit.sh`, `scripts/run-python-audit.sh`; fixture Frappe mínima **a criar**; matriz de versões **a criar**; fontes do domínio se atualizadas.

**Tarefas:**

- [ ] Concluir checklist no Lote 3.
- [ ] Criar app/fixture mínima sem `sites/`, banco, config, usuário ou dado real.
- [ ] Cobrir padrões seguros e marcadores sintéticos de triagem sem PoC explorável.
- [ ] Testar exclusões, paths, resultados e falsos positivos dos scripts.
- [ ] Registrar versão Frappe/Python testada e diferenças não validadas.
- [ ] Documentar revisão manual de permissões, tenant, jobs, hooks e integrações.

**Conteúdo esperado:** demonstração segura de funcionamento da triagem; não uma aplicação vulnerável nem prova de cobertura completa.

**Critérios de aceite:** fixture não contém configuração real; scripts detectam marcadores esperados; achados exigem revisão manual; versões e limites estão explícitos.

**Validações locais:** `bash -n`; testes da fixture; buscas `rg`; testes Python aplicáveis; verificação de ausência de `sites/`, logs e backups.

**Validações de segurança:** revisar `allow_guest`, `ignore_permissions`, SQL, arquivos e tenant apenas em código sintético; impedir execução de servidor externo ou acesso a instância real.

**Riscos:** fixture ensinar padrão perigoso, versão divergir, falso positivo ou inclusão acidental de `site_config.json`.

**Cuidados:** usar nomes fictícios e código não operacionalizável; nenhum token, webhook, pagamento ou dado real.

**Reviewer sugerido:** mantenedor Frappe/Python e AppSec.

**Labels sugeridas:** `frappe`, `python`, `testing`, `security`, `priority:high`.

**Prioridade:** alta. **Dependências:** Lotes 3 e 5. **Tamanho estimado do PR:** M, podendo separar fixture e integração.

**Issues/PRs sugeridos:** fixture/matriz; testes dos scripts; ajustes documentais após validação.

**Ordem no lote:** versão alvo, fixture, testes, revisão manual, documentação.

**Dependências de revisão humana:** versão suportada, semântica de permissões e arquitetura multi-tenant do consumidor.

**O agente NÃO deve:** baixar site real, criar usuário/credencial, conectar a banco, executar migração em ambiente existente ou afirmar segurança do framework.

## Lote 8 — LGPD

### Objetivo

Converter o programa de privacidade em artefatos operacionais mínimos, sem duplicar templates e mantendo decisões jurídicas como humanas.

### Branch sugerida

`privacy/operational-lgpd-baseline`

### Issue: Reconciliar e operacionalizar artefatos LGPD

**Contexto:** `docs/lgpd-privacy-program.md` e templates são substantivos, mas `privacy/*.md`, `docs/lgpd-gap-assessment.md` e `checklists/lgpd.md` permanecem placeholders.

**Arquivos afetados:** `checklists/lgpd.md`, `privacy/*.md`, `docs/lgpd-gap-assessment.md`, templates de mapa/ROPA/DPIA e fontes somente quando necessário.

**Tarefas:**

- [ ] Definir quais arquivos são política, procedimento, índice, template ou registro restrito.
- [ ] Implementar checklist LGPD sem escolher base legal automaticamente.
- [ ] Reconciliar mapa, ROPA, retenção, direitos, terceiros, incidente e privacy by design.
- [ ] Criar gap assessment vazio/reutilizável ou redirecionar ao artefato canônico.
- [ ] Definir campos de owner, revisão, evidência opaca e armazenamento restrito.
- [ ] Registrar pontos que exigem Jurídico/DPO/encarregado.

**Conteúdo esperado:** fluxo mínimo de governança e operação, sem dados de titulares ou decisões jurídicas automáticas.

**Critérios de aceite:** fontes canônicas claras; templates não confundidos com registros reais; checklist aplicável; incertezas legais/contratuais explícitas.

**Validações locais:** links; placeholders; consistência entre programa, checklist e templates; teste de preenchimento com produto e categorias fictícias.

**Validações de segurança:** revisão de minimização, retenção, acesso, transferências e incidentes; impedir exemplos com PII ou fornecedor real.

**Riscos:** base legal incorreta, registro pessoal no Git, duplicação de ROPA/DPIA e promessa de conformidade.

**Cuidados:** somente categorias abstratas e IDs; registros reais em sistema restrito; incidentes não entram no Git.

**Reviewer sugerido:** Privacidade/DPO ou encarregado, Jurídico, Segurança e Produto.

**Labels sugeridas:** `privacy`, `lgpd`, `governance`, `priority:high`.

**Prioridade:** alta. **Dependências:** Lotes 2 e 3. **Tamanho estimado do PR:** S por artefato; M para reconciliação completa.

**Issues/PRs sugeridos:** checklist; mapa/ROPA/retention; direitos/terceiros; incidente/DPIA/gap assessment.

**Ordem no lote:** taxonomia, checklist, ciclo de dados, direitos/terceiros, incidentes e avaliação.

**Dependências de revisão humana:** bases legais, papéis, RIPD, retenção, transferências, contratos e comunicação à ANPD/titulares.

**O agente NÃO deve:** decidir base legal, prazo regulatório contextual, papel controlador/operador, comunicar incidente ou preencher registro real.

## Lote 9 — Acessibilidade

### Objetivo

Fechar a lacuna entre o programa de acessibilidade, checklist, modelo de auditoria, fixture e CI, preservando avaliação manual obrigatória.

### Branch sugerida

`accessibility/operational-baseline`

### Issue: Implementar processo operacional de acessibilidade

**Contexto:** programa e script existem, mas checklist, auditoria e workflow de exemplo são placeholders; automação não comprova WCAG 2.2 AA.

**Arquivos afetados:** `checklists/accessibility-wcag-22-aa.md`, `docs/accessibility-audit.md`, `accessibility/README.md`, fixture web **a criar**, workflow aplicável **a criar** ou exemplo a reconciliar.

**Tarefas:**

- [ ] Concluir checklist no Lote 3.
- [ ] Criar modelo de auditoria com escopo, tecnologias, métodos, achados, limites e revisão manual.
- [ ] Criar fixture sem dados reais para teclado, foco, nome acessível, contraste e fluxo crítico.
- [ ] Testar Pa11y/Lighthouse em versão aprovada e documentar limites.
- [ ] Definir roteiro manual e tecnologias assistivas conforme contexto.
- [ ] Integrar CI inicialmente como alert-only e sem screenshots/DOM publicados.

**Conteúdo esperado:** processo combinado de automação e teste humano; nenhum score isolado tratado como conformidade.

**Critérios de aceite:** checklist e modelo substantivos; fixture local; automação reproduzível; revisão manual obrigatória; gate limitado a regra aprovada.

**Validações locais:** teste do script em loopback; validação de teclado/foco manual; link check; inspeção de logs e relatórios.

**Validações de segurança:** fixture pública/fictícia; sem sessão, cookie, PII, DOM real, screenshot real ou URL externa.

**Riscos:** falso senso de conformidade, dados no DOM/log, navegador/tooling variável e gate instável.

**Cuidados:** crus fora do Git; findings sanitizados; testes com pessoas exigem consentimento e proteção específica fora deste repositório.

**Reviewer sugerido:** especialista em Acessibilidade, QA, Front-end e Segurança.

**Labels sugeridas:** `accessibility`, `testing`, `ci`, `priority:high`.

**Prioridade:** alta. **Dependências:** Lotes 3, 5 e 6. **Tamanho estimado do PR:** S para docs/fixture; S separado para CI.

**Issues/PRs sugeridos:** checklist/modelo; fixture/testes; workflow alert-only; gate após estabilidade.

**Ordem no lote:** checklist/modelo, fixture, automação local, roteiro manual, CI.

**Dependências de revisão humana:** interpretação de critérios, fluxos críticos, tecnologias assistivas e requisito contratual/normativo.

**O agente NÃO deve:** declarar conformidade, substituir teste humano, escanear produção, coletar sessão ou publicar DOM/screenshot.

## Lote 10 — Relatórios e evidências

### Objetivo

Ampliar controles preventivos de arquivos sensíveis e consolidar artefatos auxiliares de risco e evidência sem versionar material cru.

### Branch sugerida

`security/evidence-controls`

### Issue: Reforçar prevenção e ciclo de evidências sanitizadas

**Contexto:** a política é substantiva, mas o workflow cobre apenas parte dos formatos proibidos e `risk/risk-matrix.md` e `risk/risk-register.csv` são placeholders concorrentes.

**Arquivos afetados:** `.gitignore`, `.github/workflows/security.yml`, `docs/evidence-and-reporting-policy.md`, `reports/README.md`, `risk/risk-matrix.md`, `risk/risk-register.csv` ou redirecionamentos canônicos.

**Tarefas:**

- [ ] Mapear formatos proibidos da política para prevenção objetiva.
- [ ] Testar nomes fictícios sem criar conteúdo sensível.
- [ ] Evitar ecoar conteúdo detectado; reportar somente caminho/classificação segura.
- [ ] Consolidar a fonte canônica de severidade e o papel do registro de riscos.
- [ ] Definir revisão, retenção e descarte para resumos sanitizados.
- [ ] Confirmar que `reports/raw/` e formatos crus não são rastreados.

**Conteúdo esperado:** checks preventivos minimizados e artefatos de risco coerentes com `risk/severity-and-prioritization.md` e templates.

**Critérios de aceite:** cobertura aprovada de padrões; testes positivos/negativos; nenhuma leitura/impressão de conteúdo; fonte canônica de risco clara.

**Validações locais:** `git check-ignore`; `git ls-files`; testes do policy check; links; busca por arquivos proibidos; inspeção de staged files.

**Validações de segurança:** mensagens não revelam conteúdo; globbing não lê cru; artifacts desabilitados por padrão; permissões mínimas.

**Riscos:** falso positivo bloquear contribuição, padrão incompleto, exposição pelo próprio check e retenção indevida.

**Cuidados:** usar arquivos vazios ou texto marcador não sensível; nunca commitar scanner output para testar bloqueio.

**Reviewer sugerido:** Segurança, Governança de Dados e DevSecOps.

**Labels sugeridas:** `security`, `evidence`, `risk`, `ci`, `priority:medium`.

**Prioridade:** média. **Dependências:** Lotes 4 e 6. **Tamanho estimado do PR:** S por controle.

**Issues/PRs sugeridos:** prevenção de arquivos; consolidação de risco; revisão de reports/sanitized.

**Ordem no lote:** taxonomia de formatos, testes locais, CI, risco, documentação.

**Dependências de revisão humana:** classificação, retenção, armazenamento restrito, exigências contratuais e cadeia de custódia.

**O agente NÃO deve:** mover cru para Git, sanitizar automaticamente conteúdo desconhecido, publicar artifact, definir retenção jurídica universal ou apagar evidência.

## Lote 11 — Revisão final

### Objetivo

Executar verificação final reproduzível de inventário, links, placeholders, fontes, scripts, workflows e arquivos sensíveis antes de declarar a baseline pronta para novo ciclo.

### Branch sugerida

`quality/final-baseline-verification`

### Issue: Criar e executar verificação final do repositório

**Contexto:** a auditoria do Chunk 19 foi manual e pontual; o repositório precisa de critérios objetivos para impedir regressões de estado.

**Arquivos afetados:** configuração/check de qualidade **a criar** em caminho aprovado; documentação de execução **a criar**; `research/progress.md`, `research/task-queue.md`, `research/coverage-audit.md` somente por nova auditoria explicitamente autorizada; README/arquitetura apenas se o estado final exigir.

**Tarefas:**

- [ ] Verificar inventário esperado, arquivos substantivos e fontes por chunk.
- [ ] Verificar links locais e referências a arquivos inexistentes.
- [ ] Detectar placeholders vencidos com allowlist revisada para placeholders intencionais.
- [ ] Executar sintaxe/testes dos scripts e lint dos workflows/documentos disponíveis.
- [ ] Confirmar ausência de arquivos sensíveis rastreados e de `reports/raw/` no índice.
- [ ] Produzir somente resumo sanitizado de resultados e pendências.
- [ ] Atualizar estado público somente após revisão humana dos resultados.

**Conteúdo esperado:** check não destrutivo, sem rede por padrão, com mensagens claras e critérios objetivos; relatório final apenas sanitizado.

**Critérios de aceite:** execução reproduzível; falhas distinguem erro técnico de lacuna; nenhuma promessa de ausência de vulnerabilidade; inventário e status coerentes.

**Validações locais:** árvore limpa ou diferenças compreendidas; link check; placeholder check; `bash -n`; testes dos scripts; YAML/action lint; `git ls-files`; secret scan aprovado.

**Validações de segurança:** sem upload, sem rede por padrão, sem conteúdo de achados em stdout, sem leitura de ignorados e sem comandos destrutivos.

**Riscos:** check virar gate ruidoso, allowlist esconder dívida, relatório expor caminho sensível ou status ser atualizado automaticamente.

**Cuidados:** somente contagens, caminhos públicos e IDs; evidência integral permanece local/restrita.

**Reviewer sugerido:** mantenedor, Segurança, DevSecOps e representantes de Privacidade/Acessibilidade/Frappe conforme resultados.

**Labels sugeridas:** `quality`, `security`, `documentation`, `priority:high`.

**Prioridade:** alta ao final. **Dependências:** todos os lotes anteriores aplicáveis. **Tamanho estimado do PR:** M para o check; S separado para reconciliação documental.

**Issues/PRs sugeridos:** verificador local; integração CI alert-only; correções por domínio; reconciliação final.

**Ordem no lote:** definir regras, implementar check, executar, abrir issues, corrigir por PR, reconciliar documentação.

**Dependências de revisão humana:** aprovação da allowlist, interpretação das falhas e decisão de prontidão.

**O agente NÃO deve:** corrigir automaticamente todas as falhas, excluir arquivos, varrer dados ignorados, publicar resultados crus ou marcar o repositório como conforme/certificado/sem vulnerabilidades.

## Critério de encerramento do plano

O plano está consumido quando os 11 lotes tiveram suas decisões registradas, os lotes aplicáveis foram implementados em PRs pequenos e revisados, e a verificação final confirma coerência documental e operacional dentro dos limites declarados. Itens dependentes de contexto externo permanecem abertos com owner, condição e incerteza explícitos.
