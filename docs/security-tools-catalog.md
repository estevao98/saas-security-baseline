# Catálogo de Ferramentas de Segurança

## Objetivo e limites

Este catálogo orienta a seleção de ferramentas para auditoria de SaaS. Ele não substitui triagem humana, teste manual, parecer jurídico ou a validação de licenças e planos comerciais. Os comandos foram confirmados em documentação oficial ou primária consultada em 6 de junho de 2026; versões devem ser fixadas e revalidadas antes da automação.

Relatórios crus, inclusive SARIF, JSON, HTML, HAR, SBOM e logs, podem revelar segredos, caminhos, código, URLs, componentes ou dados pessoais. Grave-os em `reports/raw/`, fora do Git. Publique somente sínteses revisadas em `reports/sanitized/`.

### Política de gates

| Política | Uso recomendado |
|---|---|
| **Bloqueia merge** | Segredo confirmado; regressão crítica/alta validada em código, dependência, IaC ou teste obrigatório; falha contratual de API; barreira grave em fluxo crítico. |
| **Bloqueia release** | DAST controlado, imagem, SBOM/licenças, privacidade ou risco operacional que depende do build e do ambiente candidato. |
| **Alerta e exige triagem** | Resultado heurístico, achado sem contexto de alcance, licença ambígua, baixa severidade ou ferramenta em adoção. |

Nenhuma supressão deve ser criada apenas para “deixar o CI verde”. Exceções precisam de dono, justificativa, prazo, evidência e risco residual aprovado.

## Integração mínima com GitHub Actions

Os exemplos abaixo são orientação documental, não os workflows finais do Chunk 7. Fixar actions por SHA é a opção mais resistente a alteração de tags; a versão/SHA aplicável deve ser validada no momento da implementação.

**Padrão A — CLI instalada no job**

```yaml
- uses: actions/checkout@v4 # fixar por SHA no workflow final
- name: Executar scanner
  run: <comando-validado-deste-catalogo>
```

**Padrão B — relatório cru como artifact restrito**

```yaml
- name: Upload de relatório cru
  if: always()
  uses: actions/upload-artifact@v4 # fixar por SHA no workflow final
  with:
    name: security-report
    path: reports/raw/<arquivo>
    retention-days: 7
```

Não usar `path: .`; revisar o arquivo antes do upload. Artifacts e logs continuam sendo dados acessíveis no GitHub, portanto não devem conter credenciais ou dados pessoais desnecessários.

## 1. Secret scanning

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **Gitleaks** [S1] | Detectar segredos em Git, diretórios e stdin; agnóstico de linguagem. | Rápido; histórico Git; JSON, CSV, JUnit e SARIF; redaction. | Regex/entropia não provam validade; exemplos, hashes e IDs podem gerar falso positivo. | `gitleaks git . --redact --report-format json --report-path reports/raw/gitleaks.json` | Padrão A; falhar o step em achado novo. | **Muito alto:** valor, linha, caminho, autor, e-mail e commit podem aparecer; manter `--redact`. | Merge bloqueado para segredo confirmado ou check não executado. Cru: `reports/raw/gitleaks.json`; resumo: `reports/sanitized/secret-scan.md`. |
| **detect-secrets** [S2] | Baseline e pre-commit para arquivos; agnóstico de linguagem. | Baseline armazena hash, plugins configuráveis e auditoria humana. | Baseline pode normalizar segredo real sem revisão; alta entropia gera ruído; não substitui histórico completo. | `detect-secrets scan > reports/raw/detect-secrets.baseline.json` | Padrão A; comparar baseline revisado, sem imprimir conteúdo. | **Alto:** caminhos, linhas e metadados; o baseline não deve conter o valor, mas ainda é sensível. | Merge bloqueado para novo segredo validado; baseline versionável somente após revisão e sem evidência sensível. Cru no caminho acima; resumo padrão. |
| **TruffleHog** [S3] | Buscar e, para alguns detectores, verificar credenciais em Git e outros data sources. | Histórico Git e verificadores de validade reduzem parte do ruído. | Verificação pode realizar chamadas ao serviço externo; resultados não verificados podem ser falsos positivos; custo maior. | `trufflehog git file://. --json > reports/raw/trufflehog.json` | Padrão A; evitar verificação externa quando política/rede não permitir. | **Muito alto:** segredo detectado, URL, commit e identidade podem aparecer; não publicar stdout. | Merge bloqueado para credencial verificada/confirmada; alerta para não verificada até triagem. Cru: `reports/raw/trufflehog.json`; resumo padrão. |

## 2. Python security

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **Bandit** [S4] | SAST heurístico para Python via AST. | Simples, recursivo, severidade/confiança e JSON. | Não entende toda validação, fluxo ou framework; testes e wrappers seguros podem gerar falso positivo. | `bandit -r . -f json -o reports/raw/bandit.json` | Padrão A após instalar dependências da ferramenta. | **Alto:** inclui caminho, linha e trecho de código. | Bloquear merge somente para alto/crítico aplicável e validado; demais alertam. Cru: `reports/raw/bandit.json`; resumo: `reports/sanitized/python-security.md`. |
| **pip-audit** [S5] | Vulnerabilidades conhecidas em ambiente, requirements e projetos Python. | Fonte PyPI/OSV; JSON/CycloneDX; action oficial; exit code próprio. | Não é SAST nem detector geral de pacote malicioso; resolução pode executar comportamento equivalente a `pip install`; advisories e alcance exigem triagem. | `pip-audit -r requirements.txt -f json -o reports/raw/pip-audit.json` | Action oficial `pypa/gh-action-pip-audit` ou Padrão A; validar release/SHA. | **Médio:** pacotes, versões, índices e descrições; índice privado pode aparecer em erro. | Bloquear merge para vulnerabilidade alta/crítica alcançável sem tratamento; release para lock/SBOM divergente. Cru e resumo Python. |
| **Safety CLI** [S6] | Vulnerabilidades e pacotes maliciosos conhecidos em projetos Python. | Política, JSON/HTML/SPDX e integração CI. | Fluxo atual exige autenticação; plano, telemetria, base e disponibilidade devem ser confirmados; achados podem ser falsos positivos contextuais. | `safety scan --target . --save-as json reports/raw/safety.json` | Padrão A com autenticação por secret do GitHub, nunca em argumento/log; validar plano. | **Alto:** metadados do projeto e dependências são enviados/associados à plataforma; relatório pode conter caminhos. | Inicialmente alerta; bloquear release após contrato, privacidade, política e confiabilidade validados. Cru e resumo Python. |
| **Ruff rules `S`** [S7] | Regras Python reimplementadas de `flake8-bandit`, além de lint geral. | Muito rápido; útil por PR; configuração em `pyproject.toml`. | Cobertura menor que análise de fluxo; `S101`, senhas fictícias e bindings intencionais geram falsos positivos. | `ruff check --select S --output-format json . > reports/raw/ruff-security.json` | Padrão A; não aplicar `--fix` automaticamente em segurança. | **Alto:** caminhos, linhas e mensagens; algumas mensagens reproduzem literais. | Bloquear merge apenas para regra material validada; adoção inicial em alerta. Cru e resumo Python. |

## 3. JavaScript e TypeScript

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **npm audit** [S8] | Vulnerabilidades da árvore npm. | Nativo do npm; usa lockfile; JSON e `audit-level`. | Depende do registry; severidade não prova alcance; metadados da árvore são enviados ao endpoint de audit. | `npm audit --json > reports/raw/npm-audit.json` | `npm ci` seguido do comando no Padrão A. | **Médio/alto:** nomes, versões, paths da árvore e registry/erros. | Bloquear merge para alto/crítico aplicável; release se lockfile não reproduz. Cru: `reports/raw/npm-audit.json`; resumo: `reports/sanitized/node-security.md`. |
| **pnpm audit** [S9] | Vulnerabilidades em dependências geridas por pnpm. | Integra o fluxo pnpm e suporta saída JSON. | Mesmas limitações de advisory/alcance; confirmar comportamento do registry e versão do pnpm adotada. | `pnpm audit --json > reports/raw/pnpm-audit.json` | `pnpm install --frozen-lockfile` e Padrão A. | **Médio/alto:** grafo, versões, paths e registry. | Mesma política de `npm audit`; cru: `reports/raw/pnpm-audit.json`; resumo Node. |
| **OSV-Scanner** [S10] | SCA multi-ecossistema por lockfiles, SBOMs e diretórios. | Base OSV; recursivo; entende vários ecossistemas e SBOMs; call analysis em suporte específico. | Lockfile ausente reduz precisão; call analysis não cobre todos os ecossistemas; advisory pode não ser alcançável. | `osv-scanner scan source -r .` | Padrão A; capturar stdout somente em artifact restrito após validar formato da versão fixada. | **Médio/alto:** arquivos, pacotes, versões e vulnerabilidades. | Bloquear conforme severidade, alcance e correção; cru: `reports/raw/osv-scanner.txt`; resumo: `reports/sanitized/sca.md`. |

## 4. SAST

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **Semgrep** [S11] | SAST por padrões e análise suportada em múltiplas linguagens. | Regras rápidas, customizáveis; JSON/SARIF; bom para PR. | Qualidade depende das regras; fluxo interarquivo/recursos avançados variam por engine/plano; falsos positivos são comuns. | `semgrep scan --config auto --json --json-output reports/raw/semgrep.json` | Padrão A; `semgrep ci` é recomendado quando integrado à plataforma/políticas da organização. | **Alto:** trechos, caminhos, fingerprints e metadados; uso de plataforma pode enviar resultados. | Bloquear merge para alto/crítico validado; novas regras começam alertando. Cru: `reports/raw/semgrep.json`; resumo: `reports/sanitized/sast.md`. |
| **CodeQL** [S12] | Análise semântica de linguagens suportadas e upload para code scanning. | Data flow, queries mantidas pelo GitHub, SARIF e integração nativa. | Build/extraction pode falhar; suporte por linguagem; falso positivo e falso negativo; uso em repositório privado depende do plano/licença GitHub aplicável. | `codeql database analyze <database> --format=sarif-latest --output=reports/raw/codeql.sarif` | Preferir default setup ou `github/codeql-action/init` + `analyze`; permissões mínimas `contents: read` e `security-events: write`. | **Muito alto:** SARIF pode conter código, paths e fingerprints; alertas ficam no GitHub. | Bloquear merge para achado material validado; check obrigatório sem análise pode bloquear. Cru: `reports/raw/codeql.sarif`; resumo SAST. |

## 5. DAST

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **OWASP ZAP Baseline** [S13] | Spider e passive scan de aplicação web; agnóstico de backend. | Open source; imagem oficial; baseline não executa ataques ativos; HTML/JSON/XML/Markdown. | Cobertura de SPA/autenticação limitada sem configuração; headers e páginas esperadas geram ruído. Scan ativo pode alterar dados e não pertence ao comando abaixo. | `docker run --rm -v "$(pwd)/reports/raw:/zap/wrk:rw" -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t http://127.0.0.1:8000 -J zap-baseline.json -r zap-baseline.html` | Subir ambiente efêmero, executar Padrão A e restringir artifacts; nunca contra alvo sem autorização. | **Muito alto:** URLs, parâmetros, headers, respostas e arquitetura. | Baseline alerta por padrão; regras críticas confirmadas bloqueiam release. Crus: JSON/HTML; resumo: `reports/sanitized/dast.md`. |

## 6. Dependências e SCA

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **OWASP Dependency-Check** [S14] | Identificar vulnerabilidades conhecidas, especialmente por evidências/CPE e ecossistemas suportados. | Open source; formatos HTML, JSON, JUnit e SARIF; ampla base histórica. | Matching CPE gera falsos positivos; atualização NVD pode ser lenta e exigir configuração/chave conforme uso. | `dependency-check.sh --project saas --scan . --format JSON --out reports/raw/dependency-check` | Padrão A com cache protegido; não imprimir chave NVD. | **Médio/alto:** paths, componentes, evidências de matching e vulnerabilidades. | Começar alertando; bloquear alto/crítico após confirmar componente e alcance. Cru na pasta indicada; resumo SCA. |
| **OSV-Scanner** [S10] | Ver seção JavaScript/TypeScript; também é a opção multi-ecossistema recomendada para lockfile/SBOM. | Evita duplicar scanners por linguagem e usa esquema OSV. | Não substitui inventário completo de sistema/container ou revisão de licença. | `osv-scanner scan source -L reports/raw/sbom.cdx.json` | Padrão A após gerar SBOM. | **Médio/alto.** | Mesmo gate da seção 3; cru `reports/raw/osv-sbom.txt`; resumo SCA. |

## 7. Containers

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **Trivy** [S15] | Vulnerabilidades, misconfiguration, secrets, licenses e SBOM em imagens/filesystems conforme alvo e scanners habilitados. | Um binário; JSON/SARIF/CycloneDX; bom para imagem e IaC. | Resultado varia por base/distro/feed; segredo e CPE podem gerar ruído; confirmar scanners efetivamente ativos. | `trivy image --format json --output reports/raw/trivy-image.json <image-ref>` | Construir imagem, escanear digest imutável e aplicar Padrão B. | **Muito alto:** pacotes, paths/camadas, segredos e configuração. | Bloquear release para crítico/alto alcançável, segredo em camada ou configuração grave. Cru indicado; resumo: `reports/sanitized/container-security.md`. |
| **Grype** [S16] | Vulnerabilidades em imagens, filesystems e SBOMs. | Integra com Syft; JSON/SARIF; mostra tipo de match/confiança. | CPE match exige revisão; feed e fix status mudam; não avalia configuração de runtime. | `grype <image-ref> --output json > reports/raw/grype.json` | Escanear a mesma imagem/digest do release no Padrão A. | **Alto:** componentes, paths, CPEs e vulnerabilidades. | Mesmo gate de Trivy; usar como alternativa ou segunda opinião, não somar achados sem deduplicar. Cru indicado; resumo container. |

## 8. Infrastructure as Code

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **Checkov** [S17] | Policies para Terraform, CloudFormation, Kubernetes, Dockerfile, workflows e outros frameworks suportados. | Cobertura ampla; JSON/SARIF; baseline e checks customizados. | Policy genérica pode ignorar controles compensatórios; parsing/variáveis e plano incompleto afetam resultado. | `checkov -d . -o json > reports/raw/checkov.json` | Padrão A; usar somente diretórios IaC necessários. | **Muito alto:** código IaC, paths, recursos, valores e possíveis URLs. Nunca guardar plan/state. | Bloquear merge para configuração crítica/alta validada; alerta na adoção. Cru: `reports/raw/checkov.json`; resumo: `reports/sanitized/iac-security.md`. |
| **tfsec** [S18] | Análise estática de Terraform; projeto incorporado ao ecossistema Trivy. | Simples e rápido para Terraform; saída estruturada. | Escopo menor que Checkov/Trivy; o projeto direciona novas adoções para Trivy e concentra nele a atenção de engenharia; falso positivo por contexto ausente. | `tfsec . --format json > reports/raw/tfsec.json` | Padrão A para legado; para nova adoção, preferir `trivy config` após validar o comando da versão fixada. | **Muito alto:** código, caminhos, recursos e valores. | Alertar ou bloquear alto/crítico validado; manter apenas quando houver justificativa de legado. Cru e resumo IaC. |
| **Terrascan** [S19] | Policy as code para Terraform, Kubernetes e outros IaC suportados. | Rego/policies, JSON/YAML/XML/JUnit/SARIF; exit codes próprios. | Cobertura varia por provider/policy; pode baixar módulos; projeto e releases devem ser reavaliados antes de padronizar. | `terrascan scan -o json > reports/raw/terrascan.json` | Padrão A; controlar download de módulos e rede. | **Muito alto:** recursos normalizados, paths, valores e logs. | Alertar inicialmente; bloquear regra crítica/alta validada. Cru e resumo IaC. |

## 9. SBOM

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **Syft** [S20] | Gerar SBOM de imagens e filesystems em Syft JSON, SPDX e CycloneDX. | Multi-ecossistema; múltiplos formatos; integra com Grype. | Inventário depende do alvo e dos catalogers; componente pode ser duplicado ou não identificado; SBOM não prova vulnerabilidade. | `syft <image-ref> -o cyclonedx-json=reports/raw/sbom.cdx.json` | Gerar após build sobre digest imutável; Padrão B com acesso restrito. | **Alto:** inventário detalhado, paths, fornecedores e arquitetura tecnológica. | Bloquear release se SBOM obrigatório não é gerado/validado; achados de componentes passam à SCA. Cru indicado; resumo: `reports/sanitized/sbom-summary.md`. |
| **CycloneDX** [S21] | Padrão e família de geradores por ecossistema, não um único scanner. | Formato interoperável para componentes, serviços, vulnerabilidades e VEX. | Qualidade depende do gerador; esquema/versão e compatibilidade do consumidor precisam ser fixados; não há um comando universal. | Comando validado via Syft: `syft . -o cyclonedx-json=reports/raw/source-sbom.cdx.json` | Selecionar gerador oficial do ecossistema ou Syft; validar o BOM antes do artifact. | **Alto:** pode listar serviços, endpoints, propriedades e componentes internos. | Bloquear release quando SBOM é requisito e está ausente/inválido; não bloquear por simples presença de componente. Cru e resumo SBOM. |

## 10. Licenças

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **FOSSA CLI** [S22] | SCA, licenças e políticas em múltiplos package managers, integrado à plataforma FOSSA. | Políticas e `fossa test` para gate; relatórios de atribuição. | Comercial/SaaS; requer autenticação e envio de metadados; plano e recursos variam. Detecção de licença pode ser ambígua. | `fossa analyze` seguido de `fossa test` | Padrão A com chave em GitHub Secret e política aprovada; nunca imprimir a chave. | **Alto:** grafo, código vendorizado e metadados são enviados à plataforma. | Bloquear release somente após política jurídica aprovada; até lá alerta. Cru fica na plataforma/`reports/raw/fossa.txt`; resumo: `reports/sanitized/licenses.md`. |
| **ScanCode Toolkit** [S23] | Detectar licenças, copyrights, pacotes, URLs e e-mails em fonte/binários. | Open source, detalhado e multi-ecossistema; vários formatos. | Pode ser lento; fragmentos e textos geram múltiplas licenças/false positives; requer revisão especializada. | `scancode -clpieu --json-pp reports/raw/scancode.json .` | Padrão A, preferencialmente em job agendado/release. | **Muito alto:** paths, copyrights, e-mails, URLs e trechos/licenças. | Alerta por padrão; bloqueia release para licença incompatível confirmada. Cru indicado; resumo de licenças. |
| **OSS Review Toolkit (ORT)** [S24] | Toolchain open source para dependências, scans, advisories, avaliação de políticas e relatórios. | Modular, muitos package managers, policy DSL e integração com ScanCode. | Implantação complexa; scanners externos e curations; documentação do tutorial consultado declara partes desatualizadas. | `docker run --rm ghcr.io/oss-review-toolkit/ort analyze --help` | Antes de uso real, fixar imagem e validar o comando completo `analyze/scan/evaluate/report` para o projeto; não presumir pipeline neste chunk. | **Muito alto:** árvore, código baixado, copyrights, licenças e vulnerabilidades. | Apenas alerta durante PoC; gate somente após pipeline e ruleset validados. Cru: `reports/raw/ort/`; resumo de licenças. |
| **Alternativas open source** | Syft/CycloneDX para inventário; ScanCode para evidência textual; ORT para política; Trivy para licenças conforme alvo. | Evitam dependência imediata de SaaS comercial. | Nenhuma ferramenta isolada decide compatibilidade jurídica; resultados divergem. | Usar os comandos já validados nas linhas correspondentes. | Combinar jobs sem publicar relatórios integrais. | **Alto/muito alto.** | Gate por política de licença aprovada, não por nome bruto detectado. |

## 11. Acessibilidade

Automação encontra apenas parte das barreiras. Testes de teclado, foco, leitor de tela, zoom/reflow, conteúdo e fluxos críticos continuam obrigatórios conforme o programa de acessibilidade.

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **axe-core / `@axe-core/cli`** [S25] | Engine JavaScript para WCAG automatizável; CLI separado para páginas web. | Regras maduras, integração com testes e navegadores. | `axe-core` é biblioteca, não CLI; não cobre toda WCAG; componentes dinâmicos e estado incorreto geram omissões/ruído. | `axe http://127.0.0.1:3000` após instalar `npm install @axe-core/cli -g`. | Subir app e executar Padrão A; para produto, preferir integração no test runner. | **Alto:** seletores, HTML, URLs e conteúdo de tela. | Bloquear merge/release para barreira grave validada em fluxo crítico; demais alertam. Cru: `reports/raw/axe.txt`; resumo: `reports/sanitized/accessibility.md`. |
| **Lighthouse** [S26] | Auditorias de acessibilidade, performance, boas práticas e SEO em páginas web. | Fácil, headless, JSON/HTML, útil para tendência. | Score agregado não prova conformidade; variabilidade de ambiente; falso positivo/negativo e cobertura por página. | `lighthouse http://127.0.0.1:3000 --output json --output-path reports/raw/lighthouse.json` | Padrão A com Chrome no runner; controlar URL e estado. | **Alto:** URL, DOM/audits, screenshots e detalhes técnicos. | Score alerta; falha específica grave validada pode bloquear. Cru indicado; resumo de acessibilidade. |
| **Pa11y** [S27] | Teste automatizado de URL com HTML_CodeSniffer e/ou axe. | CLI simples, JSON/CSV, threshold e nível de falha. | Cobertura automatizada parcial; autenticação/estado exigem configuração; mensagens podem duplicar achados. | `pa11y --reporter json http://127.0.0.1:3000 > reports/raw/pa11y.json` | Subir app e Padrão A; usar `pa11y-ci` para lista de URLs quando adotado. | **Alto:** URL, seletores e snippets. | Mesmo gate de axe; cru indicado; resumo de acessibilidade. |

## 12. API testing

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **Schemathesis** [S28] | Testes property-based a partir de OpenAPI ou GraphQL. | Gera casos de borda; JUnit, HAR, VCR e NDJSON; action oficial. | Pode alterar dados; contrato incompleto limita cobertura; falha pode refletir schema incorreto, não implementação. | `st run openapi.yaml --url http://127.0.0.1:8000 --report junit --report-dir reports/raw/schemathesis` | `schemathesis/action` ou Padrão A; ambiente efêmero e dados fictícios. | **Muito alto:** HAR/VCR podem conter tokens, bodies e dados pessoais. Não gerar esses formatos sem necessidade. | Bloquear merge para contrato quebrado reproduzível; release para falha destrutiva/isolamento. Cru na pasta; resumo: `reports/sanitized/api-testing.md`. |
| **Dredd** [S29] | Validar implementação contra API Blueprint/OpenAPI. | Language-agnostic, hooks e xUnit/HTML. | OpenAPI 3 é documentado como experimental; exemplos/ordem e hooks influenciam resultado; pode alterar dados. | `dredd ./openapi2.yaml http://127.0.0.1:8000 -r xunit -o reports/raw/dredd.xml` | Padrão A com backend efêmero. | **Muito alto:** requests/responses, URLs e detalhes de falha. | Bloquear merge para contrato estável suportado; OpenAPI 3 apenas alerta até validação. Cru e resumo API. |
| **Postman/Newman** [S30] | Executar collections e assertions de API em CLI. | Ecossistema conhecido; JSON/JUnit; bom para regressão. | Collection pode esconder cobertura ruim; Newman não é compatível com collection v3 do Postman v12+ segundo docs atuais; variáveis podem vazar. | `newman run collection.json -r cli,junit --reporter-junit-export reports/raw/newman.xml` | Padrão A; usar environment sem valores secretos versionados. | **Muito alto:** requests, headers, bodies, cookies e variáveis podem aparecer. | Bloquear merge/release para teste crítico falho; migração para Postman CLI deve ser avaliada. Cru e resumo API. |
| **OWASP ZAP API Scan** [S31] | DAST ativo de API descrita por OpenAPI, SOAP ou GraphQL conforme suporte. | Segurança dinâmica e importação de contrato. | Pode atacar/alterar dados; autenticação e cobertura exigem contexto; falso positivo comum. | Validar o formato e alvo antes de executar: `docker run -t ghcr.io/zaproxy/zaproxy:stable zap-api-scan.py -t http://127.0.0.1:8000/openapi.json -f openapi` | Somente ambiente autorizado/efêmero; artifact restrito. | **Muito alto.** | Bloqueia release para achado crítico/alto confirmado; nunca rodar ativo em produção por padrão. Cru: `reports/raw/zap-api.*`; resumo DAST/API. |

## 13. CI/CD

| Ferramenta | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | Integração | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **GitHub Actions** [S32] | Orquestrar jobs, gates, schedules, artifacts e code scanning. | Integração nativa com PR, environments e permissões. | Não é scanner; actions de terceiros ampliam supply chain; logs/artifacts e contextos podem vazar dados. | Não há comando Linux único: workflows são YAML em `.github/workflows/` e steps usam `run`. | Usar permissões mínimas, SHA fixo, dependabot para actions e evitar `pull_request_target` com código não confiável. | **Muito alto:** logs, caches e artifacts podem conter qualquer dado processado. | Workflow obrigatório que não executa bloqueia; relatórios crus não são commitados. Estratégia completa pertence ao Chunk 7. |

## 14. Gestão de risco

| Modelo | Finalidade e formato | Pontos fortes | Limitações/falsos positivos | Comando | GitHub Actions | Risco | Política e saídas |
|---|---|---|---|---|---|---|---|
| **Markdown** | Matriz, método, decisão e narrativa revisável. | Diff legível e links para controles. | Avaliação subjetiva; não valida evidência automaticamente. | Não aplicável; usar revisão Git e schema/checklist do repositório. | Lint/link check pode alertar; decisão exige reviewer. | **Alto:** ameaça, vulnerabilidade e arquitetura. | Bloqueia release apenas quando registro/aceite obrigatório está ausente. Template em `risk/`; casos reais restritos; resumo sanitizado. |
| **CSV** | Registro tabular para owner, probabilidade, impacto, tratamento, prazo e status. | Portável e analisável. | Tipos e listas são frágeis; fórmulas maliciosas em planilhas; conflito de merge. | Não aplicável. | Validar cabeçalhos e valores enumerados sem publicar conteúdo real. | **Alto.** | Mesmo gate; prefixar texto não confiável para evitar formula injection quando exportado. |
| **YAML** | Registro estruturado e validável por schema. | Automação e policy as code. | Erros de indentação/tipos; âncoras e parsers; menos amigável para negócio. | Não aplicável. | Validar por schema definido no chunk apropriado, sem antecipar scripts. | **Alto.** | Mesmo gate; arquivo real pode ficar fora do template central. |

## 15. Threat modeling

| Ferramenta/modelo | Finalidade e ecossistema | Pontos fortes | Limitações e falsos positivos | Comando Linux validado | GitHub Actions | Risco do relatório | Política e saídas |
|---|---|---|---|---|---|---|---|
| **OWASP Threat Dragon** [S33] | DFD, ameaças e mitigações; desktop/web; STRIDE e outros métodos suportados. | Open source, modelo JSON e relatório visual. | Não descobre ameaças sozinho; sugestões exigem julgamento; modelo pode ficar desatualizado. | Desktop documenta: `OWASP-Threat-Dragon --pdf ./threat-model.json --verbose` | Não usar como gate automático; validar presença/revisão do modelo. | **Muito alto:** arquitetura, trust boundaries, ameaças e mitigação. | Bloquear design/release quando modelagem é gatilho obrigatório e está ausente ou há ameaça alta sem tratamento. Cru restrito; resumo em `docs/threat-model.md`. |
| **Modelos manuais** | DFD, trust boundaries, assets, abuse cases, STRIDE quando adequado e backlog. | Independe de ferramenta e adapta-se ao domínio. | Viés, omissão e desatualização; “falso positivo” é hipótese não aplicável após análise. | Não aplicável. | Checklist de revisão, sem automatizar decisão. | **Muito alto.** | Mesmo gate; diagramas e modelo real podem exigir armazenamento restrito; versão sanitizada no Git. |

## 16. LGPD e privacy

Ferramentas genéricas não determinam base legal, necessidade de RIPD ou conformidade. Os itens abaixo são modelos de governança a serem validados por privacidade/jurídico no caso concreto [S34][S35].

| Modelo | Finalidade e campos mínimos | Pontos fortes | Limitações e falsos positivos | Comando/GitHub Actions | Risco | Política e armazenamento |
|---|---|---|---|---|---|---|
| **ROPA/registro de operações** | Finalidade, categorias de titulares/dados, base, compartilhamento, operadores, retenção, segurança, transferências e owner. | Inventário e rastreabilidade. | Fica obsoleto; não prova licitude ou eficácia. “Falso positivo” não se aplica, mas classificação pode estar errada. | Sem comando universal; revisão humana e validação estrutural apenas. | **Muito alto:** fluxo, fornecedor, sistema e dado pessoal. | Bloqueia lançamento de tratamento material sem registro mínimo. Template versionável vazio; registro real restrito; resumo sanitizado. |
| **DPIA/RIPD** | Contexto, necessidade/proporcionalidade, riscos a titulares, medidas, responsáveis, consulta e aprovação. | Explicita risco e mitigação. | Aplicabilidade é contextual e jurídica; modelo não substitui análise. | Sem comando universal. | **Muito alto:** riscos, grupos afetados e controles. | Bloqueia tratamento de alto risco quando avaliação exigida está ausente ou risco alto não foi tratado/aceito. Real fora do Git; resumo aprovado. |
| **Consentimento** | Finalidade específica, evidência, versão do aviso, ação afirmativa, revogação e efeitos. | Auditabilidade quando consentimento é a base adequada. | Consentimento não deve ser usado por conveniência; validade depende do contexto; logs podem ser dados pessoais. | Sem comando universal. | **Muito alto.** | Bloqueia fluxo quando consentimento é a base definida e coleta/revogação/evidência falham. Evidência real em sistema restrito. |
| **Bases legais** | Operação, finalidade, hipótese aplicável, dados, titular, justificativa, owner e revisão. | Evita base genérica sem vínculo com operação. | Seleção incorreta exige validação jurídica; uma ferramenta não decide. | Sem comando universal. | **Alto/muito alto.** | Bloqueia tratamento sem hipótese aplicável documentada. Matriz real restrita; resumo sem detalhes sensíveis. |
| **Retenção e descarte** | Categoria, finalidade, evento inicial, prazo/critério, exceção legal, método de descarte, sistema e owner. | Torna retenção executável e testável. | Prazo pode depender de obrigação e litígio; apagar em um sistema não garante cadeia completa. | Sem comando universal. | **Muito alto:** inventário, sistemas e obrigações. | Bloqueia release se produto não consegue cumprir retenção/exclusão material prometida. Política genérica no Git; cronogramas/evidências reais restritos. |

## Matriz de adoção recomendada

| Fase | Conjunto mínimo |
|---|---|
| **MVP seguro — obrigatório** | Gitleaks ou detect-secrets; Bandit/Ruff para Python; `pip-audit`; `npm/pnpm audit` ou OSV-Scanner; Semgrep ou CodeQL conforme disponibilidade; Trivy/Grype se houver container; Checkov/Trivy config se houver IaC; ZAP baseline e axe/Pa11y nos fluxos públicos aplicáveis; modelos manuais de risco, threat model e privacidade. |
| **SaaS vendável — desejável** | Redundância controlada em secrets/SCA; SBOM por release; política de licenças; API contract/property testing; DAST autenticado autorizado; artifacts restritos e gates estáveis. |
| **SaaS maduro — melhoria futura** | ORT/FOSSA conforme necessidade, policies customizadas, VEX, correlação/deduplicação, métricas de eficácia, revisão independente e plataforma central de findings. |

## Checklist de adoção de uma ferramenta

- [ ] Confirmar licença, plano, telemetria, manutenção e documentação vigente.
- [ ] Fixar versão e integridade do binário, imagem ou action.
- [ ] Executar em repositório/ambiente fictício antes do produto real.
- [ ] Verificar exit codes, formatos e comportamento sem rede.
- [ ] Identificar conteúdo sensível em stdout, logs e arquivo de saída.
- [ ] Definir severidade, alcance e validação necessários para gate.
- [ ] Definir owner, SLA, exceção e expiração de suppressions.
- [ ] Guardar cru em `reports/raw/` e publicar apenas resumo sanitizado.
- [ ] Medir falsos positivos e falsos negativos conhecidos.
- [ ] Revalidar comando e versão em cada atualização relevante.

## Incertezas registradas

- Safety CLI atualmente exige autenticação para scan; plano, retenção, telemetria e tratamento dos resultados precisam de validação contratual e de privacidade.
- CodeQL em repositórios privados depende dos termos e recursos GitHub aplicáveis à organização.
- Dredd documenta OpenAPI 3 como experimental; não deve ser gate rígido nesse formato sem prova local.
- Newman não suporta o formato Collection v3 do Postman v12+ segundo a documentação consultada; avaliar Postman CLI para novos fluxos.
- `tfsec` continua disponível, mas o projeto orienta transição para Trivy e concentra nele a atenção de engenharia; novas adoções devem preferir Trivy.
- O tutorial oficial do ORT consultado se declara parcialmente desatualizado. O comando completo de produção deve ser validado com a imagem e configuração fixadas; este chunk não o inventa.
- CycloneDX é um padrão com vários geradores. Selecionar e validar o gerador oficial do ecossistema; Syft é o exemplo multi-ecossistema confirmado neste catálogo.
- Threat Dragon é predominantemente uma ferramenta interativa. Exportar PDF por CLI não transforma threat modeling em análise automatizada.

O registro completo das fontes está em `research/sources/chunk-06.md`.
