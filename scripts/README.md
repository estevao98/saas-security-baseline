# Scripts locais de auditoria

## Objetivo e limites

Estes scripts padronizam verificacoes locais de segurança, qualidade, dependencias, segredos, containers, IaC, acessibilidade, APIs, Frappe e SBOM. Eles nao corrigem codigo, nao instalam ferramentas, nao aceitam producao por padrao e nao substituem revisao humana.

Relatorios integrais podem conter codigo, paths, dependencias, URLs, DOM, requests, responses ou outros dados sensiveis. Todo cru vai para `reports/raw/`, que permanece fora do Git. `reports/sanitized/` recebe apenas resumos operacionais sem detalhes de findings; antes de versionar, uma pessoa deve aplicar redaction, minimizacao e revisao independente conforme `docs/evidence-and-reporting-policy.md`.

## Preparacao segura

1. Use clone descartavel, workspace local ou ambiente efemero sem dados de cliente.
2. Instale e fixe as ferramentas pelo processo aprovado do projeto; confirme versao, checksum/provenance e documentacao oficial.
3. Nao carregue `.env`, cookies, tokens, headers, dumps, backups, `site_config.json`, `terraform.tfstate` ou dados pessoais reais.
4. Inicie servicos somente em loopback, por exemplo `http://127.0.0.1:3000` ou `http://127.0.0.1:8000`.
5. Revise registries, proxies, telemetria e metadados antes de autorizar rede com `ALLOW_NETWORK=1`.

Os scripts usam Bash, `set -euo pipefail`, validacao de entrada e preflight de dependencias. Uma ferramenta ausente interrompe a execucao com mensagem clara; nada e instalado automaticamente.

## Execucao

| Script | Exemplo seguro | Dependencias | Saidas principais |
|---|---|---|---|
| `run-security-audit.sh` | `AUDIT_COMPONENTS=secrets ./scripts/run-security-audit.sh` | Gitleaks, detect-secrets; scripts selecionados | `security-*`, `gitleaks.json`, `detect-secrets.json` |
| `run-python-audit.sh` | `PYTHON_TOOLS=bandit ./scripts/run-python-audit.sh` | Bandit; opcionalmente pip-audit e Semgrep | `bandit.json`, `pip-audit.json`, `semgrep.json` |
| `run-node-audit.sh` | `ALLOW_NETWORK=1 NODE_TOOLS=auto ./scripts/run-node-audit.sh` | npm ou pnpm; opcionalmente OSV-Scanner | `npm-audit.json`, `pnpm-audit.json`, `osv-results.json` |
| `run-container-audit.sh` | `CONTAINER_TOOLS=trivy,checkov ./scripts/run-container-audit.sh` | Trivy e Checkov; Grype opcional | relatórios Trivy, Grype e Checkov |
| `run-accessibility-audit.sh` | `TARGET_URL=http://127.0.0.1:3000 ./scripts/run-accessibility-audit.sh` | Pa11y, Lighthouse, Chrome/Chromium compativel | `pa11y.json`, `lighthouse.json` |
| `run-api-audit.sh` | `API_SCHEMA=./openapi.yaml TARGET_URL=http://127.0.0.1:8000 ./scripts/run-api-audit.sh` | Schemathesis; Docker/ZAP opcional | log/JUnit Schemathesis e relatórios ZAP |
| `run-frappe-audit.sh` | `FRAPPE_TARGET=. ./scripts/run-frappe-audit.sh` | ripgrep (`rg`) | arquivos de triagem por categoria |
| `generate-sbom.sh` | `SBOM_KIND=directory SBOM_TARGET=. ./scripts/generate-sbom.sh` | Syft | CycloneDX JSON e SPDX JSON |

Os nomes possuem timestamp UTC para evitar sobrescrita. Nenhum script apaga resultados anteriores.

## Configuracoes relevantes

- `AUDIT_COMPONENTS`: lista entre `secrets,python,node,container,accessibility,api,frappe,sbom`. O padrao e somente `secrets`.
- `SECRET_TOOLS`: `gitleaks,detect-secrets` por padrao. detect-secrets usa `--no-verify` para impedir validacao externa.
- `PYTHON_TOOLS`: `bandit` por padrao. Para pip-audit, use `ALLOW_NETWORK=1`. Para Semgrep, defina `SEMGREP_CONFIG` como arquivo local; `auto` exige consentimento de rede e usa `--metrics off`.
- `NODE_TOOLS`: `auto`, `npm`, `pnpm` e/ou `osv-scanner`. Todos exigem `ALLOW_NETWORK=1`, pois podem enviar metadados de dependencias a registry/advisory service.
- `CONTAINER_TOOLS`: `trivy,checkov` por padrao; `grype` exige `IMAGE_REF`. Sem rede, Trivy/Grype usam apenas bases locais e podem falhar se o cache estiver ausente.
- `IMAGE_REF`: somente imagem ja existente localmente. O script confirma com `docker image inspect` e nao faz pull.
- `TARGET_URL`: somente HTTP em `127.0.0.1` ou `localhost`, sem query, fragmento ou credenciais.
- `API_TOOLS`: `schemathesis` por padrao; inclua `zap` apenas apos obter e validar manualmente a imagem definida em `ZAP_IMAGE`.
- `SBOM_KIND`: `directory` ou `image`; imagem tambem precisa existir localmente.

Variaveis que selecionam ferramentas aceitam apenas os nomes documentados. Nao passe argumentos shell, headers, cookies, tokens ou URLs por essas variaveis.

## Comandos incluidos e incertezas

Os scripts incluem Bandit, pip-audit, Semgrep, Gitleaks, detect-secrets, npm audit, pnpm audit, OSV-Scanner, Trivy, Grype, Syft/CycloneDX, Checkov, Pa11y, Lighthouse, ZAP Baseline, Schemathesis e verificacoes Frappe com `rg`.

Flags, formatos, exit codes, telemetria, bases e requisitos de runtime mudam entre versoes. Antes de promover qualquer comando a gate, fixe uma versao, execute `--help`, valide em projeto ficticio e compare com a documentacao oficial registrada em `research/sources/chunk-16.md`. Em especial:

- Semgrep `auto`, pip-audit, npm/pnpm audit, OSV-Scanner e atualizacoes de bases consultam servicos externos.
- Trivy pode precisar baixar base de vulnerabilidades e bundle de checks; o modo sem rede depende de cache previo.
- Grype depende de base local atual; versoes antigas podem usar schema de base descontinuado.
- Schemathesis gera requests a partir do contrato e pode alterar estado mesmo sem payload ofensivo.
- ZAP Baseline e passivo, mas faz spider e registra URLs/respostas; nao use scan ativo neste fluxo.
- Lighthouse e Pa11y nao determinam conformidade WCAG 2.2 AA.

## Interpretacao

| Estado | Significado operacional |
|---|---|
| `SUCESSO` | A ferramenta concluiu. Nao prova ausencia de vulnerabilidade ou conformidade. |
| `ALERTA_OU_FALHA` | Pode ser finding, threshold, erro tecnico, schema invalido, cache ausente ou indisponibilidade local. O cru precisa ser revisado. |
| Falha de preflight | Dependencia, entrada ou consentimento ausente. A verificacao nao foi executada e nao pode ser marcada como aprovada. |

## Exit codes e preflight

| Exit code | Uso local |
|---:|---|
| `0` | O script concluiu as ferramentas selecionadas sem erro tecnico reportado pelo comando. Ainda exige triagem humana. |
| `1` | Uma ferramenta executada retornou achado, threshold, alerta ou falha tecnica capturada em `reports/raw/`. Nao tratar como resultado limpo. |
| `2` | Preflight falhou antes da auditoria: dependencia ausente, valor nao permitido, alvo fora do repositorio, URL nao loopback, imagem ausente, schema inexistente ou consentimento de rede ausente. |

Falha de preflight nao deve criar scan parcial nem ser registrada como aprovacao. Os scripts imprimem somente mensagem curta em `stderr`; detalhes de ferramenta ficam em arquivos crus locais quando a ferramenta chegou a executar.

Falsos positivos devem registrar ferramenta/regra/versao, justificativa, escopo, revisor, validade e gatilho de reabertura. Falsos negativos permanecem possiveis; combine automacao com revisao de arquitetura, autorizacao, isolamento multi-tenant, fluxos de negocio, privacidade e testes manuais.

Use `risk/severity-and-prioritization.md` para separar severidade tecnica, prioridade, alcance, explorabilidade, impacto, SLA e gate. Nao bloqueie release apenas por score bruto; tambem nao reduza finding sem evidencia.

## Frappe e Python

Em app Frappe, execute `run-frappe-audit.sh` no diretorio do app e `run-python-audit.sh` no mesmo clone. Exclua `sites/`, logs, backups e configuracoes reais. Revise `@frappe.whitelist`, `allow_guest`, DocPerm/User Permission, `ignore_permissions`, SQL direto, jobs, hooks, arquivos, autenticacao, webhooks, pagamentos e isolamento entre tenants conforme `docs/frappe-python-security-audit.md`.

As buscas `rg` sao triagem sintatica. Uma ocorrencia pode ser legitima; uma ausencia nao prova que permissao, tenant ou regra de negocio estejam corretos.

## Uso em CI/CD

Adapte os scripts somente apos estabilizar versoes e exit codes localmente. Em runner efemero:

- use permissoes minimas, codigo confiavel e dependencias fixadas por SHA/digest/checksum;
- nao injete secrets em scans que nao precisam deles;
- nao use `pull_request_target` para executar codigo nao confiavel;
- mantenha stdout reduzido e nunca use shell tracing (`set -x`);
- nao faca upload automatico de `reports/raw/`;
- quando artifact cru for indispensavel, enumere arquivos, restrinja acesso, aplique retencao curta e revise antes do upload;
- publique em PR somente status e IDs opacos, nunca finding exploravel, request/response, DOM, path sensivel ou segredo;
- trate scanner obrigatorio nao executado como falha de gate.

A estrategia completa esta em `docs/github-actions-strategy.md`. A politica de classificacao, redaction, retencao, descarte e revisao esta em `docs/evidence-and-reporting-policy.md`.

## Revisao de `reports/sanitized/`

Antes de commitar um resumo:

- [ ] Confirmar que nenhum valor, header, cookie, token, dado pessoal, URL privada, tenant, path interno ou payload foi copiado do cru.
- [ ] Reconstruir por allowlist apenas data, ferramenta, versao, escopo abstrato, status, contagem agregada e ID opaco necessarios.
- [ ] Registrar limitacoes, falsos positivos/negativos e verificacoes nao executadas.
- [ ] Classificar findings no contexto e vincular evidencia restrita sem revelar sua localizacao.
- [ ] Obter segunda revisao para redaction e necessidade de versionamento.
- [ ] Confirmar que `reports/raw/` e formatos crus nao estao staged.

Os resumos gerados automaticamente sao pontos de partida revisaveis, nao evidencia aprovada nem relatorio final.

## Validacao local segura dos wrappers

O Lote 5 inclui uma suite de smoke tests que copia os scripts para um diretorio temporario, cria fixtures sinteticas e usa stubs locais de ferramentas. Ela valida sintaxe Bash, preflight, paths, exit codes e criacao de `reports/raw/` e `reports/sanitized/` sem rede externa real, sem alvo real, sem instalar ferramentas e sem gerar relatorio cru versionado.

```bash
./tests/scripts/run-script-smoke-tests.sh
```

Esses testes verificam o comportamento dos wrappers, nao a eficacia dos scanners. ShellCheck, versoes reais de ferramentas, stdout/stderr completos, telemetria, caches e falsos positivos ainda precisam ser validados no SaaS consumidor antes de qualquer gate.
