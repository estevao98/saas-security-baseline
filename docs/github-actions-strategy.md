# Estratégia de GitHub Actions e CI/CD

## Objetivo e escopo

Esta estratégia transforma os documentos aprovados do repositório em automações graduais para **MVP seguro**, **SaaS vendável para empresas** e **SaaS maduro**. Os workflows são controles técnicos e evidências auxiliares: não substituem triagem, testes manuais, análise de risco, validação jurídica ou certificação.

Os exemplos pressupõem GitHub.com e runners hospedados pelo GitHub. Recursos de Dependency Review, CodeQL/code scanning, rulesets, environments e retenção variam conforme tipo de proprietário, plano, licença e configuração do repositório privado. Confirmar a disponibilidade antes de tornar um check obrigatório.

## Princípios obrigatórios

- Usar `pull_request`, não `pull_request_target`, para analisar código não confiável. `pull_request_target` executa no contexto da base e pode expor token ou secrets se houver checkout/execução do código do PR.
- Declarar `permissions` no workflow ou job; começar com `contents: read` ou `{}` e acrescentar apenas a permissão necessária.
- Não disponibilizar secrets a PRs de forks, Dependabot ou código não confiável.
- Fixar actions de terceiros por SHA completo e imagens por digest após validação. Tags maiores usadas nos exemplos melhoram legibilidade, mas devem ser substituídas e mantidas por atualização automatizada.
- Não executar código de dependências durante scans quando isso não for necessário. Instalação e build podem executar scripts de pacote.
- Nunca usar `path: .` em `upload-artifact` nem publicar `reports/raw/` inteiro.
- Relatório cru pertence a `reports/raw/` no runner e, quando indispensável, a artifact privado de curta retenção. Somente resumo humano revisado vai para `reports/sanitized/` e para o Git.
- Um scanner indisponível, cancelado ou ignorado não equivale a resultado limpo.

## Catálogo dos workflows

Os caminhos abaixo são padronizados. O workflow não deve commitar automaticamente nenhum resultado.

| Workflow | Objetivo e riscos cobertos | Gatilhos recomendados | Ferramentas | Saída crua / resumo sanitizado | Gate e maturidade | Limitações, logs e secrets | `GITHUB_TOKEN` mínimo |
|---|---|---|---|---|---|---|---|
| `.github/workflows/basic-pr.yml` | Validar estrutura, lint, testes rápidos e build reproduzível. | `pull_request`; `push` em `main`; manual para diagnóstico. | Ferramentas nativas da stack, após adoção. | `reports/raw/basic-pr-*` / `reports/sanitized/pr-validation.md`. | **Merge:** sim quando testes aplicáveis falham. **Release:** indireto. **MVP seguro.** | Não imprimir ambiente; não fazer dump de configuração; artifacts apenas de testes selecionados. | `contents: read`. |
| `.github/workflows/security-weekly.yml` | Detectar deriva no branch padrão e mudanças em bases de vulnerabilidade. | `schedule` semanal em horário não óbvio; `workflow_dispatch`; opcional `push` em `main`. | Gitleaks, Semgrep, SCA, Trivy/Grype, conforme stack. | Arquivos individuais em `reports/raw/` / `reports/sanitized/security-weekly.md`. | **Merge:** não, pois não é check de PR. **Release:** crítico/alto confirmado abre bloqueio. **MVP seguro.** | Não agregar todos os relatórios em um artifact; cron roda na versão do workflow do branch padrão. Sem secrets salvo integração aprovada. | `contents: read`; `security-events: write` somente se houver SARIF. |
| `.github/workflows/dependency-review.yml` | Impedir nova dependência vulnerável ou fora de política. | `pull_request`; manual não substitui comparação de PR. | `actions/dependency-review-action`. | Summary/log do check; se houver exportação: `reports/raw/dependency-review.json` / `reports/sanitized/dependencies.md`. | **Merge:** alto/crítico novo; política de licença somente após aprovação. **SaaS vendável.** | API/feature pode não estar disponível no repositório privado. Logs revelam pacote e versão; não ecoar outputs. | `contents: read`. |
| `.github/workflows/secret-scan.yml` | Detectar segredo novo e histórico exposto. | `pull_request`, `push` em `main`, semanal e manual. | Gitleaks com `--redact`; detect-secrets como alternativa. | `reports/raw/gitleaks.json` / `reports/sanitized/secret-scan.md`. | **Merge e release:** segredo confirmado ou scan não executado. **MVP seguro.** | Relatório é de risco muito alto; não fazer upload por padrão. Se detectar segredo, rotacionar e tratar histórico, não apenas apagar a linha. | `contents: read`. |
| `.github/workflows/codeql.yml` | SAST semântico para Python e JavaScript/TypeScript. | `pull_request`, `push` em `main`, semanal e manual. | `github/codeql-action` ou default setup, não ambos sem justificativa. | Alertas no code scanning; SARIF apenas no GitHub / `reports/sanitized/sast.md`. | **Merge:** novo alto/crítico aplicável; inicialmente alertar até estabilizar build. **SaaS vendável.** | SARIF pode conter código e paths. Code scanning privado exige licença/configuração aplicável. | `contents: read`, `security-events: write`; `packages: read` apenas se build precisar. |
| `.github/workflows/semgrep.yml` | SAST rápido por padrões e regras locais. | `pull_request`, `push` em `main`, semanal e manual. | Semgrep CE: `semgrep scan --config auto`; plataforma: `semgrep ci`. | `reports/raw/semgrep.json` / `reports/sanitized/sast.md`. | **Merge:** regras maduras de alto/crítico; regras novas alertam. **MVP seguro.** | `auto` pode buscar regras na rede; plataforma envia código/metadados conforme produto. JSON pode conter snippets. | `contents: read`; `security-events: write` só para SARIF. |
| `.github/workflows/python-audit.yml` | SAST e SCA Python. | PR quando houver `*.py`, lockfile ou requirements; `push`, semanal e manual. | Bandit/Ruff e `pip-audit`. | `reports/raw/bandit.json`, `pip-audit.json` / `reports/sanitized/python-security.md`. | **Merge:** alto/crítico validado; ausência de lockfile alerta. **MVP seguro.** | Resolver dependências pode executar comportamento de instalação e revelar índice privado em erro. Não expor credenciais de registry. | `contents: read`. |
| `.github/workflows/node-audit.yml` | SCA e validação reproduzível Node. | PR quando houver `package*.json` ou lockfile; `push`, semanal e manual. | `npm ci` e `npm audit --json` ou equivalente do gerenciador adotado. | `reports/raw/npm-audit.json` / `reports/sanitized/node-security.md`. | **Merge:** alto/crítico aplicável; lockfile ausente ou divergente bloqueia release. **MVP seguro.** | Registry recebe metadados do grafo; scripts de instalação podem executar código. Usar `--ignore-scripts` quando compatível e revisar exceções. | `contents: read`. |
| `.github/workflows/container-audit.yml` | Avaliar a imagem exata candidata a release. | PR quando Dockerfile mudar; `push` em `main`; tag/release e manual. | Trivy ou Grype sobre digest imutável. | `reports/raw/trivy-image.json` / `reports/sanitized/container-security.md`. | **Merge:** configuração/segredo grave. **Release:** crítico/alto alcançável ou segredo em camada. **SaaS vendável.** | Relatório expõe camadas e componentes. O ecossistema Trivy sofreu comprometimento em março de 2026; usar versão corrigida e SHA/digest verificado. | `contents: read`, `packages: read` se imagem privada; nunca `packages: write` no scan. |
| `.github/workflows/zap-baseline.yml` | DAST passivo de ambiente efêmero autorizado. | `workflow_dispatch`; após deploy de preview controlado; agenda opcional. Evitar PR de fork com secrets. | OWASP ZAP Baseline. | `reports/raw/zap-baseline.json` e `.html` / `reports/sanitized/dast.md`. | **Merge:** normalmente alerta. **Release:** regra crítica confirmada ou scan obrigatório ausente. **SaaS vendável.** | URLs, headers e respostas são altamente sensíveis. Não criar issue nem artifact automático; não apontar para produção ou alvo externo sem autorização. | `contents: read`; `issues: write` não é necessário. |
| `.github/workflows/sbom.yml` | Inventariar componentes da fonte e da imagem candidata. | `push` em `main`, tag/release e manual; PR apenas para validar geração. | Syft em CycloneDX/SPDX. | `reports/raw/sbom.cdx.json` / `reports/sanitized/sbom-summary.md`. | **Release:** ausência/invalidade bloqueia quando requisito da fase. Componente isolado apenas alerta e segue para SCA. **SaaS vendável.** | SBOM revela arquitetura e fornecedores; artifact restrito, individual e com retenção definida. | `contents: read`, `packages: read` se necessário. |
| `.github/workflows/accessibility-audit.yml` | Detectar barreiras automatizáveis em fluxos críticos. | PR com UI; `push` em `main`; semanal e manual em ambiente efêmero. | axe, Pa11y ou Lighthouse, conforme catálogo. | `reports/raw/pa11y.json` ou equivalente / `reports/sanitized/accessibility.md`. | **Merge/release:** barreira grave validada em fluxo crítico; score agregado apenas alerta. **MVP seguro.** | HTML, seletores, screenshots e conteúdo podem ser sensíveis. Teste automático não prova WCAG 2.2 AA. | `contents: read`. |
| `.github/workflows/release-checklist.yml` | Consolidar presença e sucesso dos gates da versão. | `workflow_dispatch` com environment; tag/release após aprovação. | Checks GitHub, checklist e metadados do build; sem duplicar scanners. | `reports/raw/release-gates.json` / `reports/sanitized/release-checklist.md`. | **Release:** sim para gate obrigatório ausente, falho ou exceção expirada. **SaaS vendável.** | Não aceitar texto livre sensível como input; environment pode exigir reviewers. Não usar token de escrita salvo criação de release separada e aprovada. | `contents: read`; ampliar somente no job que publicar release. |

`security.yml` permanece como workflow transversal de controles do próprio repositório: verifica que caminhos proibidos não estão rastreados e que os workflows não usam padrões perigosos. Scanners especializados ficam nos arquivos próprios para manter ownership, logs e gates claros.

## Quando cada evento deve ser usado

| Evento | Uso | Restrições |
|---|---|---|
| `pull_request` | Código, testes, segredo, SAST, dependência e mudanças de configuração. | Token somente leitura por padrão; não acessar secrets nem executar deploy privilegiado. |
| `push` no branch padrão | Confirmar o estado integrado e produzir evidência contínua. | Não duplicar desnecessariamente todos os jobs do PR. |
| `schedule` | Full scan, novas advisories, deriva e auditoria recorrente. | Cron usa UTC, pode atrasar e executa o workflow do branch padrão; combinar com `workflow_dispatch`. |
| `workflow_dispatch` | Diagnóstico, adoção gradual, DAST autorizado e release controlado. | Inputs não são secrets; não aceitar URL, comando ou argumento arbitrário para interpolação em shell. |

## Estratégia de artifacts

1. Produzir cada saída crua em arquivo nominal dentro de `reports/raw/` no runner.
2. Preferir summary do job sem detalhes exploráveis. Não fazer upload quando o relatório puder conter segredo, resposta HTTP, código, URL interna ou dado pessoal.
3. Quando artifact for indispensável, enviar somente arquivos enumerados, nunca uma pasta ampla; usar nome único, `if-no-files-found: error`, retenção de 1 a 7 dias e acesso restrito ao repositório.
4. Não incluir arquivos ocultos. Não reutilizar cache como armazenamento de evidência.
5. SBOM e evidência de release podem exigir retenção maior por política contratual; definir fora do template após classificação e aprovação.
6. Gerar `reports/sanitized/*.md` somente após revisão humana. Workflows não devem redigir ou commitar automaticamente esses resumos.

Exemplo restrito:

```yaml
- name: Upload de um relatório aprovado para artifact
  if: always()
  uses: actions/upload-artifact@v7 # substituir por SHA completo validado
  with:
    name: pip-audit-${{ github.run_id }}
    path: reports/raw/pip-audit.json
    if-no-files-found: error
    retention-days: 3
    include-hidden-files: false
```

## Política de logs

- Não habilitar `ACTIONS_STEP_DEBUG` ou tracing de shell em jobs com secrets.
- Não executar `env`, `printenv`, dumps de contexto GitHub, headers, bodies, configurações ou lockfiles completos no log.
- Tratar masking como defesa adicional, não como autorização para imprimir segredo. Valores transformados ou fragmentados podem não ser mascarados.
- Direcionar saída detalhada ao arquivo cru e imprimir apenas contagens, status e caminho do relatório.
- Usar `::add-mask::` para valor sensível derivado em runtime antes de qualquer comando que possa registrá-lo.
- Revisar logs e artifacts antes de ampliar retenção ou conceder acesso a terceiros.

## Política de permissões

| Necessidade | Permissão mínima |
|---|---|
| Checkout, testes e scanners locais | `contents: read` |
| Upload de SARIF ao code scanning | `security-events: write` mais `contents: read` |
| Leitura de imagem/pacote privado | `packages: read` somente no job de imagem/SBOM |
| OIDC para cloud | `id-token: write` somente no job de deploy, com environment e trust policy restrita |
| Criar issue | Evitar para relatórios; se aprovado, `issues: write` somente no job correspondente |
| Publicar release/pacote | Workflow separado, environment protegido e permissão de escrita apenas no job de publicação |

Configurar o padrão do repositório como token somente leitura. Não usar `write-all`. Actions de terceiros recebem o contexto do job: reduzir permissões antes de executá-las.

## Política de secrets

- Preferir OIDC com credenciais temporárias a chaves estáticas para cloud.
- Guardar secrets por environment quando pertencem a deploy/release; exigir reviewers e limitar branches/tags.
- Nunca passar secret em argumento de linha de comando, input manual, nome de artifact, output, cache key ou arquivo versionado.
- Não usar secrets em jobs acionados por PR externo. Separar build não confiável de deploy privilegiado por workflow e artifact validado.
- Pin de certificado, token de registry e credencial de scanner SaaS exigem dono, rotação, escopo mínimo e registro fora deste repositório.
- Gitleaks, ZAP, Semgrep gerenciado, Safety e serviços similares podem enviar dados externamente; aprovar fornecedor, escopo e retenção antes de configurar credenciais.

## Branch protection por fase

| Fase | Proteção recomendada | Checks obrigatórios |
|---|---|---|
| **MVP seguro** | PR obrigatório, branch atualizada, 1 aprovação, resolver conversas, bloquear force-push/delete, impedir bypass rotineiro. | `Basic PR / policy`, `Repository Security Controls / repository-policy`; secret scan, testes e auditorias da stack tornam-se obrigatórios somente quando seus workflows reais estiverem ativos e estáveis. |
| **SaaS vendável** | 2 aprovações em áreas críticas, CODEOWNERS, dismiss stale approvals, commits assinados quando viável, environment protegido para release. | Todos do MVP mais Dependency Review, Python/Node conforme stack, Semgrep ou CodeQL, container audit, SBOM generation e release gate. DAST/acessibilidade obrigatórios nos fluxos críticos aplicáveis. |
| **SaaS maduro** | Rulesets organizacionais, merge queue validada, segregação de deploy, revisão de exceções e trilha de auditoria. | Todos os aplicáveis, CodeQL e Semgrep com políticas distintas, scan semanal monitorado, imagem por digest, SBOM/proveniência e checklist de release. Validar que checks também rodam em `merge_group` antes de exigir merge queue. |

Não tornar obrigatório um nome de check que não roda em todos os PRs relevantes: filtros de `paths`, jobs condicionais e merge queue podem deixar o PR permanentemente pendente.

## Matriz de workflows por fase

| Workflow | MVP seguro | SaaS vendável | SaaS maduro |
|---|---|---|---|
| Pull request básico | Obrigatório | Obrigatório | Obrigatório |
| Security scan semanal | Obrigatório, escopo inicial | Obrigatório | Obrigatório e monitorado por SLA |
| Dependency scan | Por stack | Obrigatório | Obrigatório com política de licença |
| Secret scan | Obrigatório | Obrigatório | Obrigatório e defesa em camadas |
| CodeQL | Conforme licença; Semgrep pode iniciar | Obrigatório quando disponível | Obrigatório para linguagens suportadas |
| Semgrep | Obrigatório ou alternativa SAST | Obrigatório com regras revisadas | Complementar ao CodeQL |
| Python audit | Obrigatório se Python | Obrigatório se Python | Obrigatório se Python |
| Node audit | Obrigatório se Node | Obrigatório se Node | Obrigatório se Node |
| Container audit | Obrigatório se container | Obrigatório | Obrigatório por digest |
| ZAP baseline | Alerta em fluxo público | Gate de release para crítico validado | Recorrente e por preview autorizado |
| SBOM | Desejável | Obrigatório no release | Obrigatório, validado e retido |
| Accessibility audit | Obrigatório para fluxo crítico aplicável | Obrigatório | Obrigatório mais revisão manual |
| Release checklist | Checklist manual | Workflow obrigatório | Gate com environment e evidência |

## Matriz de gates por severidade

| Resultado | PR/merge | Release | Tratamento |
|---|---|---|---|
| Segredo confirmado ou credencial válida | Bloquear | Bloquear | Revogar/rotacionar, investigar uso e limpar histórico conforme plano. |
| Crítico confirmado e aplicável | Bloquear | Bloquear | Corrigir ou registrar exceção formal, temporária e aprovada por responsável de segurança. |
| Alto novo e alcançável | Bloquear após estabilização do scanner | Bloquear | Triagem com dono e prazo; controle compensatório exige evidência. |
| Médio | Alertar; bloquear apenas por política específica | Avaliar exposição e acumulação | Issue/backlog com SLA. |
| Baixo/informativo | Alertar | Não bloquear isoladamente | Tendência e melhoria contínua. |
| Scanner falhou, foi cancelado ou não produziu saída obrigatória | Bloquear se check é obrigatório | Bloquear se gate de release | Corrigir a automação; não classificar como ausência de achados. |
| Falso positivo validado | Não bloquear após exceção | Não bloquear durante validade | Registrar regra, evidência, dono e expiração; revisar periodicamente. |

## Exemplos mínimos de YAML

Os quatro exemplos completos implementados estão em `security.yml`, `dependency-review.yml`, `codeql.yml` e `zap-baseline.yml`. Os trechos seguintes documentam a forma mínima dos demais workflows sem antecipar os scripts do Chunk 16.

### Pull request básico

```yaml
on: {pull_request: {}, workflow_dispatch: {}}
permissions: {contents: read}
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
      - run: echo "Substituir pelo lint/teste validado da stack"
```

### Security scan semanal

```yaml
on:
  schedule: [{cron: "23 4 * * 2"}]
  workflow_dispatch:
permissions: {contents: read}
```

### Secret scan

```yaml
- run: mkdir -p reports/raw
- run: >-
    docker run --rm -v "$PWD:/repo" ghcr.io/gitleaks/gitleaks:<versao-validada>
    git /repo --redact --report-format json
    --report-path /repo/reports/raw/gitleaks.json
```

Fixar a imagem por digest. Não fazer upload automático do JSON.

### Semgrep

```yaml
jobs:
  semgrep:
    runs-on: ubuntu-latest
    container: {image: "semgrep/semgrep:<versao-validada>"}
    permissions: {contents: read}
    steps:
      - uses: actions/checkout@v6
      - run: mkdir -p reports/raw && semgrep scan --config auto --json --json-output reports/raw/semgrep.json
```

### Python audit

```yaml
- run: mkdir -p reports/raw
- if: ${{ hashFiles('requirements.txt') != '' }}
  run: pip-audit -r requirements.txt -f json -o reports/raw/pip-audit.json
```

A instalação da ferramenta deve ser fixada e validada no SaaS adotante.

### Node audit

```yaml
- if: ${{ hashFiles('package-lock.json') != '' }}
  run: npm ci --ignore-scripts
- if: ${{ hashFiles('package-lock.json') != '' }}
  run: mkdir -p reports/raw && npm audit --json > reports/raw/npm-audit.json
```

### Container audit

```yaml
- run: docker build --tag local/security-candidate:${{ github.sha }} .
- run: mkdir -p reports/raw
- run: trivy image --format json --output reports/raw/trivy-image.json local/security-candidate:${{ github.sha }}
```

Instalar Trivy por versão corrigida e checksum verificado; não usar action/tag afetada pelo incidente de março de 2026.

### SBOM

```yaml
- run: mkdir -p reports/raw
- run: syft . -o cyclonedx-json=reports/raw/source-sbom.cdx.json
```

### Accessibility audit

```yaml
- run: mkdir -p reports/raw
- run: pa11y --reporter json http://127.0.0.1:3000 > reports/raw/pa11y.json
```

O SaaS deve iniciar uma aplicação efêmera em loopback antes do step.

### Release checklist

```yaml
on: {workflow_dispatch: {}}
permissions: {contents: read}
jobs:
  release-gate:
    environment: release
    runs-on: ubuntu-latest
    steps:
      - run: echo "Validar checks obrigatorios, SBOM e aprovacoes"
```

## Estratégia de falha: quando o CI deve quebrar?

O CI deve falhar quando o próprio controle não consegue executar, quando uma saída obrigatória não é gerada ou quando um gate aprovado detecta risco acima do limiar. Falha de infraestrutura pode admitir retry controlado, mas nunca sucesso artificial.

**Quebrar imediatamente:** segredo confirmado; teste obrigatório falho; alteração de dependência com crítico/alto novo conforme política; achado crítico confirmado; workflow com permissão indevida; relatório obrigatório ausente; imagem ou SBOM diferente do candidato; barreira grave validada em fluxo crítico.

**Alertar e exigir triagem:** scanner em adoção, regra heurística nova, médio/baixo, score agregado, dependência sem alcance confirmado, ZAP passivo sem criticidade validada ou licença ambígua sem política jurídica aprovada.

**Bloquear release, mas não necessariamente merge:** ZAP do ambiente candidato, imagem final, SBOM, licença, checklist operacional, backup/restore e controles que dependem do artifact ou environment de release.

Exceção não significa `continue-on-error: true` permanente. Deve ter risco, dono, justificativa, controle compensatório, aprovador e expiração. Checks em modo alerta precisam de prazo explícito para virar gate ou serem removidos.

## Incertezas e validações pendentes por SaaS

- Confirmar plano/licença para Dependency Review, CodeQL/code scanning, rulesets avançados, environments, artifact attestations e retenção em repositório privado.
- Confirmar linguagens CodeQL, gerenciadores, lockfiles, Dockerfile, rotas de acessibilidade e processo de inicialização do ambiente efêmero.
- Fixar SHA completo das actions e digest das imagens na implantação de cada SaaS; configurar Dependabot/Renovate para atualização revisada.
- Definir severidade, alcance, SLA e responsáveis no Chunk 13 antes de automatizar todos os gates por vulnerabilidade.
- Definir retenção e classificação detalhadas no Chunk 11; até lá, usar retenção mínima e não publicar relatórios de risco alto/muito alto.

## Fontes

As fontes oficiais, datas de acesso e decisões deste chunk estão registradas em `research/sources/chunk-07.md`.

## Observação operacional sobre este repositório-base

Este repositório é um baseline/template documental, não um SaaS executável.

Por isso, workflows que dependem de stack real, licença, plano GitHub, ambiente efêmero, aplicação em execução ou code scanning privado devem ficar como exemplos em:

- `examples/github-workflows/codeql.yml`
- `examples/github-workflows/dependency-review.yml`
- `examples/github-workflows/zap-baseline.yml`
- `examples/github-workflows/basic-pr.yml`
- `examples/github-workflows/security-weekly.yml`
- `examples/github-workflows/secret-scan.yml`
- `examples/github-workflows/semgrep.yml`
- `examples/github-workflows/python-audit.yml`
- `examples/github-workflows/node-audit.yml`
- `examples/github-workflows/container-audit.yml`
- `examples/github-workflows/sbom.yml`
- `examples/github-workflows/accessibility-audit.yml`
- `examples/github-workflows/release-checklist.yml`

O único workflow ativo por padrão neste repositório-base deve ser:

- `.github/workflows/security.yml`

Em um SaaS real, copie o workflow aplicável para `.github/workflows/`, valide plano/licença, stack, permissões, secrets, artifacts e gates antes de torná-lo obrigatório.
