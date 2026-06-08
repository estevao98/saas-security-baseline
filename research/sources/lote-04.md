# Fontes do Lote 4 - Politicas

Data de acesso: **8 de junho de 2026**.

## Escopo

Este registro documenta fontes, decisoes, incertezas e limites usados na reconciliacao do Lote 4 - Politicas.

O lote atualizou politicas raiz, ownership comentado, configuracao inicial de secret scanning e controles preventivos de ignore. Nao foram alterados scripts, workflows, templates completos, checklists individuais ou documentos auxiliares fora do escopo.

## Fontes internas consultadas

| Fonte | Uso na reconciliacao |
|---|---|
| `AGENTS.md` | Regras obrigatorias de fontes, evidencias, dados sensiveis e atualizacao de progresso. |
| `README.md` | Navegacao publica, limites e estado declarado apos Lote 1 e Lote 3. |
| `research/codex-execution-plan.md` | Escopo, criterios de aceite, riscos e proibicoes do Lote 4. |
| `research/coverage-audit.md` | Lacunas historicas de politicas raiz e protecao contra segredos. |
| `research/progress.md` | Historico e estado antes da reconciliacao. |
| `research/task-queue.md` | Fila corretiva e proximo lote. |
| `research/repository-inventory.md` | Confirmacao de que politicas raiz estavam iniciais e dominios fora do lote permaneciam pendentes. |
| `docs/git-security-workflow.md` | Fluxo seguro de branches, commits, issues, PRs, findings, riscos e segredo vazado. |
| `docs/evidence-and-reporting-policy.md` | Classificacao, redaction, armazenamento, retencao e proibicao de evidencias sensiveis no Git. |
| `docs/github-actions-strategy.md` | Limites de workflows, politica de secrets e dependencia de plano GitHub. |
| `docs/security-tools-catalog.md` | Uso, limites e riscos de Gitleaks e detect-secrets. |
| `checklists/ci-cd-security.md` e `checklists/incident-response.md` | Relacao entre politicas, gates, secrets, incidentes e evidencias. |

## Fontes oficiais consultadas

| Fonte | Organizacao | URL | Uso |
|---|---|---|---|
| Adding a security policy to your repository | GitHub Docs | `https://docs.github.com/en/code-security/getting-started/adding-a-security-policy-to-your-repository` | Confirmar finalidade de `SECURITY.md`: instrucoes para relatar vulnerabilidade e versoes suportadas. |
| About code owners | GitHub Docs | `https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners` | Confirmar local, sintaxe, permissao de escrita e comportamento de `CODEOWNERS`. |
| Gitleaks README | Projeto Gitleaks | `https://github.com/gitleaks/gitleaks` | Confirmar `extend.useDefault`, comandos, `--redact`, baseline e formato de configuracao. |
| detect-secrets README | Projeto Yelp detect-secrets | `https://github.com/Yelp/detect-secrets` | Confirmar uso de `.secrets.baseline`, plugins, filtros, hook e limites. |
| `.secrets.baseline` do detect-secrets | Projeto Yelp detect-secrets | `https://raw.githubusercontent.com/Yelp/detect-secrets/master/.secrets.baseline` | Usado apenas como referencia de formato JSON; nenhum finding, hash ou caminho do projeto externo foi copiado para a baseline deste repositorio. |

## Decisoes

- `SECURITY.md` foi promovido de placeholder para politica de reporte, triagem, segredo exposto, divulgacao e evidencias.
- `CONTRIBUTING.md` foi alinhado ao fluxo Git seguro, evidencias, fontes e limites de escopo.
- `CODEOWNERS` manteve somente exemplos comentados porque nao ha usuarios, emails ou equipes reais validados neste template.
- `.gitleaks.toml` passou a estender regras padrao do Gitleaks e adicionou regras especificas para caminhos restritos e marcadores sinteticos de bloqueio.
- `.secrets.baseline` foi convertida de `{}` para uma baseline vazia no formato do detect-secrets 1.5.0, sem findings e sem hashes de segredo.
- `.gitignore` foi ampliado para padroes comuns de credenciais, chaves, configuracoes locais e relatorios de scanners.
- `README.md`, `docs/repository-architecture.md` e `research/repository-inventory.md` foram atualizados apenas para refletir que o Lote 4 foi reconciliado e que workflows, owners reais, canal privado e fixture controlada continuam pendentes.
- Nenhuma fixture positiva versionada foi criada neste lote porque um arquivo que dispara secret scanning faria scans normais do repositorio falharem antes da definicao do workflow e da estrategia de teste do Lote 6. A fixture deve ser criada ou gerada em ambiente controlado no lote de automacao, com allowlist especifica e sem valor parecido com credencial.

## Incertezas e pendencias

- Canal privado real para reporte de vulnerabilidade ainda depende do repositorio consumidor.
- Owners reais de `CODEOWNERS` dependem de usuarios ou equipes GitHub com permissao de escrita.
- Plano GitHub, rulesets, branch protection, private vulnerability reporting, secret scanning nativo e push protection precisam ser confirmados no projeto real.
- Gitleaks e detect-secrets nao estavam instalados localmente nesta execucao; a validacao foi limitada a revisao de formato e fontes oficiais.
- A fixture positiva/negativa de secret scanning permanece pendente para o Lote 6 ou para uma tarefa controlada com ferramenta instalada e estrategia de nao quebrar scans normais.
- `docs/README.md` e `policies/README.md` ainda sao placeholders, mas pertencem a documentos auxiliares/READMEs de dominio e devem ser tratados no Lote 2 ou revisao final, nao neste lote.

## Limites de seguranca

- Nao foram criados dados pessoais, dados de cliente, tenants, URLs internas, logs crus, dumps, backups, payloads, PoCs, requests/responses, tokens, cookies, credenciais ou exemplos semelhantes a credenciais.
- Nao foram executados scanners, workflows, scripts de auditoria, testes ofensivos ou coleta de evidencias reais.
- Nao ha declaracao de certificacao, conformidade formal, prontidao enterprise, acessibilidade integral ou ausencia de vulnerabilidades.
