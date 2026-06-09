# Relatórios

## Objetivo

Separar relatórios crus de resumos revisados e sanitizados.

- `reports/raw/`: saídas cruas locais, fora do Git.
- `reports/sanitized/`: somente resumos minimizados, redigidos, revisados e aprovados antes de versionamento.

Este diretório não é um cofre de evidências. Evidência sensível ou integral deve ficar em armazenamento restrito aprovado, com acesso, retenção e descarte proporcionais à classificação.

## Fonte Canônica

| Uso | Arquivo |
|---|---|
| Política de evidências e artifacts | `../docs/evidence-and-reporting-policy.md` |
| Modelo de relatório final | `../docs/security-audit-baseline.md` |
| Templates de resumo e remediação | `../templates/executive-summary-template.md`, `../templates/remediation-plan-template.md` |
| Severidade e tratamento | `../risk/severity-and-prioritization.md` |

## Regras

- Nunca versionar `reports/raw/` nem copiar seu conteúdo para PR, issue, commit ou artifact amplo.
- Publicar em `reports/sanitized/` somente síntese nova, minimizada, redigida e revisada.
- Não incluir segredo, cookie, dado pessoal real, URL interna, path sensível, payload, request/response, log cru, dump, backup, screenshot sem redaction ou relatório integral.
- Usar ID opaco para evidência restrita.
- Não versionar JSON, SARIF, HTML, XML, LOG ou TXT de scanner em `reports/sanitized/`; produza Markdown revisado ou outro formato aprovado pela política.
- Não versionar DOM, HAR, vídeo, gravação de voz, screenshot real, trace, request, response ou export bruto.
- Não declarar ausência de vulnerabilidades, ausência de secrets, conformidade, certificação ou prontidão enterprise a partir de relatório ou scanner isolado.

## Fluxo mínimo

1. Planejar escopo, ambiente autorizado, ferramenta, owner, retenção e destino da evidência.
2. Coletar saída integral somente em `reports/raw/` local ou armazenamento restrito aprovado.
3. Triar achados, falsos positivos, erros técnicos e verificações não executadas.
4. Reconstruir resumo sanitizado por allowlist, sem copiar campos sensíveis do cru.
5. Revisar redaction e necessidade de versionamento com pessoa competente.
6. Versionar apenas o resumo aprovado em `reports/sanitized/`, quando houver justificativa.
7. Descartar cópias locais intermediárias conforme política e registrar apenas metadados seguros.

## CI artifacts

Artifacts de CI devem ser evitados para evidência sensível. Quando forem indispensáveis:

- enumerar arquivos exatos; nunca usar `path: .` nem pacote amplo;
- não publicar `reports/raw/` inteiro;
- aplicar permissões mínimas, audiência restrita e retenção curta;
- revisar conteúdo antes do upload sempre que possível;
- não incluir secrets, dados pessoais, logs, dumps, DOM, screenshots, vídeos, requests, responses ou relatórios brutos;
- excluir artifact e iniciar resposta se houver exposição indevida.

## Secret scanning

- Não crie segredo real para testar scanner.
- Não crie token fictício com prefixo ou formato de provedor real.
- Não publique relatório bruto de Gitleaks, detect-secrets, TruffleHog, Trivy ou equivalente.
- Fixture positiva ou negativa deve ser sintética, controlada e compatível com scans normais do repositório.
- Resultado limpo de scanner não prova ausência de segredos; resultado positivo exige triagem, possível revogação/rotação e registro sanitizado.
- Versão da ferramenta, regras, flags, redaction, stdout/stderr, exit code, baseline, política de falha e falso positivo devem ser revisados antes de gate.

## Pendências

- Confirmar no SaaS consumidor armazenamento restrito, owners, retenção, descarte, cadeia de custódia e revisão de artifacts.
- Executar revisão final de links, placeholders, fontes e arquivos sensíveis no Lote 11.
