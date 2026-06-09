# Fontes do Lote 9 - Acessibilidade

Data de acesso: **9 de junho de 2026**.

## Escopo

Este registro documenta fontes internas, decisoes, validacoes, incertezas e limites usados na reconciliacao do Lote 9 - Acessibilidade.

O lote operacionalizou acessibilidade para SaaS web com roteiro combinado de automacao e revisao manual, fixture ficticia estatica e navegacao minima. Nao declarou conformidade WCAG, conformidade ABNT, certificacao, ausencia de barreiras, ausencia de risco ou prontidao enterprise.

## Fontes internas consultadas

| Fonte | Uso na reconciliacao |
|---|---|
| `AGENTS.md` | Regras obrigatorias de fontes, evidencias, dados sensiveis e atualizacao de progresso. |
| `README.md` | Estado publico declarado para acessibilidade, evidencias, checklists, scripts e limites. |
| `SECURITY.md` | Limites para reporte, evidencias sensiveis, incidentes e divulgacao. |
| `CONTRIBUTING.md` | Escopo de contribuicao, proibicao de dados reais e validacoes proporcionais. |
| `research/codex-execution-plan.md` | Escopo, criterios, riscos e proibicoes do Lote 9. |
| `research/coverage-audit.md` | Lacuna historica de acessibilidade operacional, checklist, modelo, workflow e automacao. |
| `research/prompts.md` | Origem do Chunk 10, Chunk 15, Chunk 17 e lote corretivo de acessibilidade. |
| `research/progress.md` | Historico e estado antes da reconciliacao. |
| `research/task-queue.md` | Fila corretiva e proximo lote. |
| `research/repository-inventory.md` | Estado reconciliado antes do Lote 9. |
| `research/sources/chunk-10.md` | Fontes oficiais e incertezas de WCAG, W3C/WAI, ABNT e ferramentas. |
| `research/sources/chunk-11.md` | Evidencias, dados pessoais, testes com usuarios, logs, artifacts e redaction. |
| `research/sources/chunk-12.md` | Modelo de relatorio, dominio de acessibilidade e limites de automacao. |
| `research/sources/chunk-15.md` | Checklist de acessibilidade, decisoes de nao declarar conformidade e revisao humana obrigatoria. |
| `research/sources/chunk-17.md` | Template de finding de acessibilidade e relatorio WCAG-EM como referencia estrutural. |
| `research/sources/lote-02.md`, `research/sources/lote-07.md`, `research/sources/lote-08.md` | Estado anterior de documentos auxiliares, fixture Frappe/Python e privacidade operacional. |
| `docs/accessibility-program.md` | Fonte canonica para programa, criterios, roteiro manual, ferramentas, evidencias e gates. |
| `docs/accessibility-audit.md` | Roteiro operacional reconciliado neste lote. |
| `docs/evidence-and-reporting-policy.md` | Protecao de relatórios crus, prints, voz, DOM, dados pessoais e resumos sanitizados. |
| `docs/audit-trigger-matrix.md` | Gatilhos, revisores e Go/No-Go de auditoria de acessibilidade. |
| `docs/security-audit-baseline.md` | Relatorio final amplo e dominio de acessibilidade. |
| `docs/security-tools-catalog.md` | Limites e comandos de axe, Lighthouse e Pa11y. |
| `docs/github-actions-strategy.md` | Pendente de CI alert-only, artifacts, logs e permissoes; nao foi alterado. |
| `checklists/accessibility-wcag-22-aa.md` | Checklist substantivo usado como referencia; nao foi alterado. |
| `scripts/run-accessibility-audit.sh`, `scripts/README.md` | Ponto de entrada existente e limite de validacao funcional futura; nao foram alterados. |
| `templates/accessibility-finding-template.md`, `templates/index.md`, `templates/README.md` | Templates existentes referenciados sem duplicacao integral. |

## Fontes oficiais

Nao foram consultadas novas fontes externas neste lote. As fontes oficiais aplicaveis continuam registradas principalmente em `research/sources/chunk-10.md`, incluindo W3C/WAI, WCAG 2.2, orientacoes de avaliacao, axe, Lighthouse, Pa11y e referencias ABNT ja registradas com incertezas.

O uso formal em caso real deve revalidar WCAG, W3C/WAI, Catalogo ABNT, versoes de ferramentas, navegadores, tecnologias assistivas, contrato e obrigacoes aplicaveis.

## Artefatos criados ou alterados

| Arquivo | Decisao |
|---|---|
| `docs/accessibility-audit.md` | Reconciliado como roteiro operacional de avaliacao combinada automatizada/manual, limites de interpretacao e protecao de evidencias. |
| `accessibility/README.md` | Atualizado como indice operacional para programa, checklist, auditoria, fixture, evidencias, script local e pendencias. |
| `testing/README.md` | Atualizado apenas para apontar para a fixture ficticia de acessibilidade. |
| `testing/accessibility/README.md` | Criado guia da fixture, comandos em loopback, roteiro manual, casos incluidos e limites. |
| `testing/accessibility/fixture-saas-flow.html` | Criada pagina estatica ficticia com casos positivos e barreiras controladas para triagem. |
| `testing/accessibility/fixture-styles.css` | Criados estilos locais para foco, contraste, responsividade e exemplos negativos controlados. |
| `research/progress.md`, `research/task-queue.md`, `research/repository-inventory.md` | Atualizados para refletir o fechamento real do Lote 9. |

## Decisoes

- `docs/accessibility-program.md` permanece como fonte canonica do programa; `docs/accessibility-audit.md` detalha execucao e registro sanitizado.
- `checklists/accessibility-wcag-22-aa.md` ja estava substantivo; nao foi alterado porque a solicitacao atual restringiu checklists individuais a erro objetivo ou navegacao minima.
- `templates/accessibility-finding-template.md` nao foi duplicado nem alterado; findings reais devem usar copia em sistema autorizado.
- A fixture e estatica, ficticia e local. Ela existe para calibrar metodo e validacoes, nao para representar SaaS real, prova de explorabilidade ou cobertura completa.
- Casos negativos da fixture sao marcadores controlados de triagem, sem dados pessoais, sem segredo, sem URL interna, sem request/response e sem payload ofensivo.
- Workflows ativos e exemplos em `examples/github-workflows/` nao foram alterados nem promovidos. CI de acessibilidade permanece pendente, inicialmente `alert-only` quando aprovado.
- `scripts/run-accessibility-audit.sh` nao foi alterado; validacao funcional de ferramentas, stdout/stderr, exit codes e relatorios pertence ao Lote 5.

## Validacoes locais seguras executadas

| Validacao | Resultado |
|---|---|
| Leitura do escopo em `research/codex-execution-plan.md`, `research/task-queue.md` e `research/repository-inventory.md` | Executada antes de editar. |
| Conferencia de arquivos existentes em `accessibility/`, `testing/` e `templates/` | Executada por leitura e glob local. |
| Revisao de conteudo da fixture contra proibicoes de dados reais, credenciais, URLs internas, logs crus, prints, videos e evidencias sensiveis | Executada durante a edicao. |

Validacoes funcionais com axe, Lighthouse, Pa11y, navegador, leitor de tela ou `scripts/run-accessibility-audit.sh` nao foram executadas neste lote; pertencem ao Lote 5 ou ao SaaS consumidor com versoes e ambiente aprovados.

## Incertezas e pendencias

- Confirmar versoes reais de axe, Lighthouse, Pa11y, Chrome/Chromium, navegador, sistema operacional e tecnologias assistivas antes de uso como gate.
- Definir matriz real de tecnologia assistiva e leitores de tela conforme usuarios, contrato, suporte, plataforma e risco.
- Promover CI somente em tarefa propria, inicialmente `alert-only`, sem publicar DOM, screenshots, videos, cookies, sessoes ou relatorios crus.
- Testes com pessoas exigem protocolo, consentimento, privacidade, acessibilidade do proprio teste, compensacao quando aplicavel e armazenamento restrito.
- Declaracao publica, aplicabilidade ABNT, alegacao de conformidade e obrigacao contratual exigem revisao especializada.
- Validacao funcional dos scripts permanece no Lote 5; risco/evidencias no Lote 10; revisao final no Lote 11.

## Limites de seguranca

- Nao foram criados dados pessoais reais, dados de cliente, alunos, titulares, tenants, URLs internas, logs crus, dumps, backups, payloads, PoCs, requests/responses, tokens, cookies, credenciais ou exemplos semelhantes a credenciais.
- Nao foram criados prints, videos, gravacoes de voz, DOM real, relatorios crus, tickets, relatos de usuarios, sessoes autenticadas ou evidencias sensiveis.
- Nao foram executados scanners, workflows, scripts de auditoria, chamadas externas, testes ofensivos, coleta de evidencias reais ou publicacao de artifact.
- Nao ha declaracao de conformidade WCAG, conformidade ABNT, certificacao, ausencia de barreiras, ausencia de risco, aprovacao de release ou prontidao enterprise.
