# Fontes do Lote 6 - GitHub Actions

Data de acesso: **8 de junho de 2026**.

## Escopo

Este registro documenta fontes, decisoes, incertezas e limites usados na reconciliacao do Lote 6 - GitHub Actions.

O lote reconciliou somente o workflow ativo minimo deste repositorio-base e o estado documental necessario. Nao promoveu exemplos para gates ativos, nao configurou deploy, nao publicou artifacts e nao executou scanners especializados.

## Fontes internas consultadas

| Fonte | Uso na reconciliacao |
|---|---|
| `AGENTS.md` | Regras obrigatorias de escopo, fontes, evidencias, dados sensiveis e atualizacao de progresso. |
| `README.md` | Estado publico declarado para GitHub Actions, evidencias e proximos passos. |
| `SECURITY.md` | Politica de reporte, resposta a segredos, evidencias e limites dos workflows. |
| `CONTRIBUTING.md` | Validacoes proporcionais, escopo de PR e restricoes de evidencias. |
| `.gitignore`, `.gitleaks.toml` e `.secrets.baseline` | Padroes de arquivos sensiveis, marcadores sinteticos e configuracao inicial de secret scanning. |
| `CODEOWNERS` | Pendencia de owners reais e efeito de exemplos comentados. |
| `research/codex-execution-plan.md` | Escopo, criterios de aceite, riscos, dependencias e proibicoes do Lote 6. |
| `research/coverage-audit.md` | Lacunas historicas de workflows, secret scanning e actions por tag mutavel. |
| `research/progress.md` | Historico e estado antes da reconciliacao. |
| `research/task-queue.md` | Fila corretiva e dependencia do Lote 6. |
| `research/repository-inventory.md` | Estado reconciliado dos workflows ativos e exemplos antes da execucao. |
| `research/sources/chunk-07.md` | Fontes e decisoes originais de GitHub Actions e CI/CD. |
| `research/sources/chunk-16.md` | Limites de scripts, scanners, rede, saidas e ferramentas locais. |
| `research/sources/lote-01.md` e `research/sources/lote-04.md` | Estado anterior de inventario, politicas, segredos e pendencias contextuais. |
| `docs/github-actions-strategy.md` | Eventos, permissões, logs, secrets, artifacts, gates e limites por maturidade. |
| `docs/security-tools-catalog.md` | Ferramentas, comandos, riscos de relatorios e incertezas de versao. |
| `docs/evidence-and-reporting-policy.md` | Politica de `reports/raw/`, artifacts, logs, secrets e redaction. |
| `docs/git-security-workflow.md` | Branch protection, checks obrigatorios, findings, PRs e evidencias. |
| `checklists/ci-cd-security.md`, `checklists/pre-deploy.md`, `checklists/pre-beta.md`, `checklists/pre-enterprise-sale.md` | Criterios para nao ativar gates indevidos e nao prometer controles nao validados. |
| `.github/workflows/security.yml` | Workflow ativo reconciliado. |
| `.github/workflows/.gitkeep` | Arquivo estrutural, sem automacao. |
| `examples/github-workflows/` | Inventario documental de exemplos; nao foram alterados nem promovidos para ativos. |

## Fontes oficiais consultadas

| Fonte | Organizacao | URL | Uso |
|---|---|---|---|
| Workflow syntax for GitHub Actions | GitHub Docs | `https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax` | Confirmar estrutura de workflow, eventos, `permissions`, `concurrency`, jobs, steps e `timeout-minutes`. |
| Security hardening for GitHub Actions | GitHub Docs | `https://docs.github.com/en/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions` | Confirmar risco de codigo nao confiavel, pin por SHA, secrets, tokens e actions de terceiros. |
| Automatic token authentication | GitHub Docs | `https://docs.github.com/en/actions/security-for-github-actions/security-guides/automatic-token-authentication` | Confirmar uso de `GITHUB_TOKEN` com menor privilegio e `permissions` explicitas. |
| Events that trigger workflows | GitHub Docs | `https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows` | Confirmar uso de `pull_request`, `push` e `workflow_dispatch`, e evitar `pull_request_target` sem necessidade. |
| `actions/checkout` | GitHub Actions | `https://github.com/actions/checkout` | Confirmar action oficial de checkout e resolver `refs/tags/v6` para SHA completo. |
| Gitleaks README | Projeto Gitleaks | `https://github.com/gitleaks/gitleaks` | Confirmar que secret scanning completo exigiria versao/configuracao validada e saida com `--redact`; mantido como pendencia neste lote. |
| detect-secrets README | Projeto Yelp detect-secrets | `https://github.com/Yelp/detect-secrets` | Confirmar que baseline e scan exigem revisao e validacao local; mantido como pendencia neste lote. |

## Validacoes locais executadas

| Validacao | Resultado |
|---|---|
| `git ls-remote https://github.com/actions/checkout.git refs/tags/v6` | Resolvido para `df4cb1c069e1874edd31b4311f1884172cec0e10`. |
| Parsing YAML com Ruby | Executado sem erro para `.github/workflows/*.yml` e `.github/workflows/*.yaml`. |
| `git diff --check` | Executado sem erro. |
| Script de arquivos sensiveis rastreados | Executado localmente sem detectar arquivo proibido rastreado. |
| Script de marcador sintetico sensivel | Executado localmente sem detectar marcador proibido fora da configuracao permitida. |
| Script de politica de workflows ativos | Executado localmente sem detectar `pull_request_target`, permissao de escrita, secrets, artifacts ou referencias mutaveis. |
| Script de higiene Markdown | Executado localmente sem detectar arquivo vazio, CRLF ou marcador de conflito. |
| `actionlint` | Nao executado; ferramenta nao estava instalada no ambiente local. |

## Decisoes

- `.github/workflows/security.yml` permaneceu como unico workflow ativo por padrao neste repositorio-base.
- `actions/checkout@v6` foi substituido por SHA completo no workflow ativo: `df4cb1c069e1874edd31b4311f1884172cec0e10`.
- O workflow ativo usa somente `permissions: contents: read`, `persist-credentials: false`, timeouts curtos e `concurrency` por branch/ref.
- O workflow ativo nao usa `pull_request_target`, secrets, permissao de escrita, upload de artifacts, caches, OIDC, deploy, release, runners self-hosted ou inputs arbitrarios.
- A verificacao de arquivos sensiveis rastreados imprime apenas contagem, nao caminhos, para reduzir exposicao em logs.
- A verificacao de marcadores sinteticos nao imprime linhas correspondentes e nao substitui secret scanning completo.
- A higiene Markdown foi limitada a controles objetivos e estaveis: arquivo vazio, CRLF e marcadores de conflito.
- Gitleaks/detect-secrets nao foram integrados como workflow ativo porque faltam versao/local validada, fixture controlada, revisao de stdout/stderr, decisao de artifact e estrategia para nao publicar relatorio cru.
- Dependency Review, CodeQL, Semgrep, DAST, container scan, IaC scan, SBOM, acessibilidade, release gate e deploy nao foram ativados porque dependem de stack, plano/licenca, SHA/digest, ambiente, scripts/fixtures ou validacao de dominio ainda pendente.
- Os exemplos em `examples/github-workflows/` foram inventariados como referencia documental, mas nao foram alterados nem copiados para `.github/workflows/`.

## Workflows inventariados

| Categoria | Arquivo | Estado apos Lote 6 | Decisao |
|---|---|---|---|
| Ativo | `.github/workflows/security.yml` | Workflow minimo de politica e higiene documental. | Manter ativo por padrao; nao tratar como secret scanning completo. |
| Estrutural | `.github/workflows/.gitkeep` | Arquivo sem automacao. | Manter apenas para preservar diretorio quando necessario. |
| Exemplos substantivos | `examples/github-workflows/dependency-review.yml`, `examples/github-workflows/codeql.yml`, `examples/github-workflows/zap-baseline.yml` | Exemplos documentais, nao ativos. | Nao promover sem plano/licenca, SHA/digest, logs, artifacts e gate validados. |
| Exemplos placeholder | Demais arquivos em `examples/github-workflows/` | Placeholders/inertes. | Corrigir ou substituir apenas em tarefa propria; nao viram gate neste lote. |

## Incertezas e pendencias

- Plano GitHub, licenca, rulesets, branch protection, secret scanning nativo, push protection, Dependency Review, CodeQL/code scanning, environments, merge queue e retencao precisam ser confirmados no repositorio consumidor.
- Owners reais em `CODEOWNERS` e canal privado real de reporte continuam pendentes do consumidor.
- Gitleaks, detect-secrets e demais scanners ainda precisam de versao fixada, instalacao/execucao validada, fixture ficticia, analise de falsos positivos, stdout/stderr revisados e politica de artifacts.
- Actions de terceiros e imagens de container dos exemplos precisam de SHA/digest validado antes de gate material.
- O workflow ativo nao prova ausencia de segredos, vulnerabilidades, problemas de dependencia, falhas de acessibilidade, falhas de container, IaC, API, cloud ou prontidao enterprise.
- A execucao local nao substitui teste real em PR/branch no GitHub nem configuracao de branch protection.

## Limites de seguranca

- Nao foram criados dados pessoais, dados de cliente, tenants, URLs internas, logs crus, dumps, backups, payloads, PoCs, requests/responses, tokens, cookies, credenciais ou exemplos semelhantes a credenciais.
- Nao foram publicados artifacts, relatorios crus, SARIF, JSON de scanner, HTML de DAST, SBOM ou evidencias reais.
- Nao foram executados DAST, SAST completo, cloud scan, IaC scan, container scan, SBOM, deploy, release gate ou scanners que dependem de ferramenta nao validada.
- Nao ha declaracao de certificacao, conformidade formal, prontidao enterprise, acessibilidade integral, pipeline seguro ou ausencia de vulnerabilidades.
