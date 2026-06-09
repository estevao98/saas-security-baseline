# SaaS Security Baseline

Template reutilizavel para organizar auditoria, governanca, seguranca, DevSecOps, privacidade, acessibilidade, operacao e maturidade tecnica de produtos SaaS.

> Este repositorio é uma baseline de trabalho. Ele não prova conformidade, nao concede certificacao e nao substitui validacao tecnica, juridica, contratual ou auditoria independente.

## 1. Proposito

Transformar referencias de seguranca e governanca em um fluxo pratico: definir escopo, escolher controles, executar auditorias autorizadas, classificar riscos, proteger evidencias, acompanhar remediacao e decidir sobre releases.

O ponto de partida para entender a organizacao e [Arquitetura do repositorio](docs/repository-architecture.md).

## 2. Para quem e este repositorio

- equipes de engenharia, produto, plataforma, seguranca e DevSecOps;
- responsaveis por privacidade, LGPD, acessibilidade, risco e compliance;
- liderancas preparando um MVP, uma venda enterprise ou uma operacao madura;
- auditores e revisores de SaaS em Python, Frappe, ERPNext, Frappe Learning, JavaScript, TypeScript, SQL, containers, APIs, cloud, autenticacao, pagamentos e integracoes.

Adapte papeis, escopo e controles ao produto. Requisitos concretos podem variar por legislacao, contrato, setor, cliente, arquitetura, plano GitHub e maturidade.

## 3. O que este repositorio cobre

- roadmap de seguranca por maturidade;
- normas, leis, frameworks e referencias tecnicas;
- tipos e gatilhos de auditoria;
- seguranca de aplicacao, APIs, dependencias, containers, IaC e supply chain;
- GitHub Actions, CI/CD, branches, commits, issues e pull requests;
- Frappe, ERPNext, Frappe Learning e Python;
- LGPD, privacidade e terceiros;
- acessibilidade para SaaS web;
- evidencias, relatorios, severidade, riscos e aceite formal;
- scripts locais, checklists e templates reutilizaveis.

## 4. O que este repositorio não e

- um selo de seguranca, conformidade ou acessibilidade;
- uma certificacao ISO, ABNT ou de qualquer outro organismo;
- parecer juridico, decisao automatica de base legal ou garantia de atendimento contratual;
- pentest ofensivo, autorizacao para testar terceiros ou conjunto de payloads exploraveis;
- substituto para threat modeling, revisao humana, testes manuais, resposta a incidentes ou gestao de risco;
- repositorio para evidencias reais sensiveis, logs crus, dumps, backups, credenciais ou dados pessoais.

## 5. Estrutura do repositorio

| Area | Uso principal |
|---|---|
| [`docs/`](docs/) | Guias, matrizes, programas e modelos transversais. |
| [`checklists/`](checklists/) | Verificacoes por dominio e momento do produto. |
| [`scripts/`](scripts/) | Auditorias locais defensivas e geracao de SBOM. |
| [`templates/`](templates/) | Modelos reutilizaveis, vazios ou ficticios. |
| [`risk/`](risk/) | Severidade, prioridade, tratamento e registro de riscos. |
| [`privacy/`](privacy/) | Estruturas auxiliares de privacidade e LGPD. |
| [`reports/`](reports/) | Separacao entre material cru local e resumo sanitizado. |
| [`examples/github-workflows/`](examples/github-workflows/) | Exemplos de CI/CD que exigem adaptacao antes do uso. |
| [`research/`](research/) | Prompts, progresso, fila, inventario, auditorias, plano corretivo e fontes da pesquisa. |

A arvore completa e as regras de reutilizacao estao em [Arquitetura do repositorio](docs/repository-architecture.md).

## 6. Como usar em um SaaS novo

1. Crie um repositorio privado a partir desta baseline, sem importar evidencias de outro produto.
2. Defina escopo, stack, ambientes, owners e revisores; configure responsaveis reais no [`CODEOWNERS`](CODEOWNERS).
3. Escolha a fase inicial no [Roadmap de seguranca](docs/security-roadmap.md).
4. Selecione checklists aplicaveis e justifique itens nao aplicaveis.
5. Copie os templates necessarios para um sistema de trabalho com classificacao e acesso adequados.
6. Valide ferramentas, versoes, rede, telemetria, permissoes e saidas antes de executar scripts ou habilitar CI.
7. Mantenha relatorios crus fora do Git e publique somente resumos sanitizados revisados.

## 7. Como usar em um SaaS existente

1. Inventarie arquitetura, dados, tenants, dependencias, integracoes, releases e controles existentes.
2. Use a [Matriz de gatilhos](docs/audit-trigger-matrix.md) para priorizar auditorias pelo risco e pelos eventos recentes.
3. Execute uma baseline autorizada sem dados de producao e sem carregar segredos no workspace.
4. Registre findings com IDs opacos, classifique contexto e impacto e defina owner, SLA, gate e reteste.
5. Transforme lacunas recorrentes em controles de CI/CD, politicas e revisoes periodicas.
6. Reavalie a maturidade e avance pelo roadmap somente quando os criterios da fase estiverem sustentaveis.

## 8. Fluxo recomendado por maturidade

| Fase | Resultado esperado | Prioridades |
|---|---|---|
| **MVP seguro** | Reduzir riscos obvios antes de beta e producao. | Segredos, autenticacao, autorizacao, dependencias, backups, logs, privacidade basica, acessibilidade de fluxos criticos e gates minimos. |
| **SaaS vendavel para empresas** | Produzir governanca e evidencias consistentes para operacao e clientes. | CI/CD estavel, SAST/SCA, imagem, SBOM, terceiros, incidentes, continuidade, LGPD, acessibilidade e controles de release. |
| **SaaS maduro** | Operar controles continuos, mensuraveis e auditaveis. | Gestao de risco integrada, supply chain, segregacao, monitoramento, exercicios, metricas, auditoria independente e certificacao quando houver objetivo formal. |

Consulte os criterios, bloqueios e planos de **30, 60, 90 e 180 dias** em [Roadmap de seguranca](docs/security-roadmap.md).

## 9. Normas, leis, frameworks e referencias

A [Matriz de normas e frameworks](docs/standards-and-frameworks-matrix.md) organiza referencias como LGPD e ANPD, OWASP, NIST, CISA, CIS, W3C/WAI, ISO e ABNT por objetivo e aplicacao.

Use a matriz como orientacao de escopo, nao como declaracao automatica de obrigatoriedade. Edicao aplicavel, equivalencia ABNT, certificacao, requisito enterprise e obrigacao juridica devem ser confirmados no contexto do SaaS.

## 10. Tipos de auditoria

O catalogo em [Tipos de auditoria](docs/audit-types.md) cobre revisao manual, SAST, DAST, SCA, secrets, IaC, containers, dependencias, APIs, threat modeling, privacidade, LGPD, acessibilidade, autenticacao, autorizacao, logs, backups, incidentes, CI/CD, cloud, pagamentos, terceiros e IA.

Nenhuma ferramenta isolada comprova ausencia de vulnerabilidades. Combine automacao, revisao humana, testes de negocio e validacao de arquitetura.

## 11. Quando rodar auditorias

Use a [Matriz de gatilhos de auditoria](docs/audit-trigger-matrix.md) para decidir verificacoes em PRs, releases, mudancas de arquitetura, incidentes, novas integracoes, onboarding enterprise e ciclos periodicos.

Um gate obrigatorio que nao executou, falhou tecnicamente ou nao gerou evidencia nao deve ser tratado como aprovado.

## 12. Ferramentas e scripts

O [Catalogo de ferramentas](docs/security-tools-catalog.md) descreve finalidade, limites, falsos positivos, saidas e uso em gates. Os oito pontos de entrada locais estao documentados em [Scripts locais de auditoria](scripts/README.md).

### Como rodar auditoria local

Exemplo inicial restrito ao secret scanning local:

```bash
AUDIT_COMPONENTS=secrets ./scripts/run-security-audit.sh
```

Os scripts nao instalam dependencias, nao corrigem codigo e exigem preparacao previa. Operacoes que consultam registries, indices, regras ou bases externas dependem de consentimento explicito e avaliacao de exposicao.

## 13. Como interpretar relatorios

- conclusao da ferramenta nao significa conformidade ou ausencia de falhas;
- diferencie finding confirmado, falso positivo, erro tecnico e verificacao nao executada;
- valide alcance, exposicao, explorabilidade, tenant, dados, fluxo de negocio e controles compensatorios;
- use [Severidade e priorizacao](risk/severity-and-prioritization.md) para definir prioridade, SLA, gate e reteste;
- use o [Modelo de relatorio final](docs/security-audit-baseline.md) para consolidar escopo, metodologia, achados, riscos e decisao Go/No-Go.

## 14. GitHub Actions e CI/CD

A [Estrategia de GitHub Actions](docs/github-actions-strategy.md) define eventos, permissoes minimas, logs, secrets, artifacts, gates e branch protection por maturidade.

Neste repositorio-base, somente [`.github/workflows/security.yml`](.github/workflows/security.yml) fica ativo por padrao. Ele executa controles minimos de politica do repositorio e higiene documental, sem publicar artifacts, sem usar secrets e sem executar secret scanning completo. Os demais arquivos em [`examples/github-workflows/`](examples/github-workflows/) sao exemplos: copie apenas o necessario, fixe actions e imagens de forma validada e confirme stack, licenca/plano GitHub, ambientes, secrets e retencao antes de exigir checks.

## 15. Frappe, ERPNext, Frappe Learning e Python

O guia [Auditoria Frappe e Python](docs/frappe-python-security-audit.md) orienta revisao de DocTypes, papeis, permissoes, metodos whitelisted, APIs, jobs, hooks, SQL/ORM, arquivos, integracoes, pagamentos e isolamento entre sites.

Execute [`run-frappe-audit.sh`](scripts/run-frappe-audit.sh) e [`run-python-audit.sh`](scripts/run-python-audit.sh) apenas em clone autorizado, sem `sites/`, backups, logs ou configuracoes reais. Confirme as versoes instaladas: APIs, hooks e permissoes podem variar entre releases do ecossistema Frappe.

## 16. LGPD e privacidade

O [Programa de LGPD e privacidade](docs/lgpd-privacy-program.md) cobre ciclo de vida de dados, papeis, bases legais, direitos dos titulares, terceiros, incidentes e privacy by design.

Use os modelos de mapa de dados, ROPA e RIPD/DPIA pelo [Indice de templates](templates/index.md). A base legal, necessidade de RIPD, comunicacao de incidente, retencao e papeis de controlador/operador dependem dos fatos e exigem validacao juridica quando aplicavel.

## 17. Acessibilidade

O [Programa de acessibilidade](docs/accessibility-program.md) organiza WCAG 2.2, avaliacao manual, automacao, fluxos criticos, evidencias e gates de release.

Pa11y, Lighthouse, axe e ferramentas similares detectam apenas parte das barreiras. Conformidade e impacto funcional exigem revisao manual, tecnologias assistivas e avaliador competente; aplicabilidade normativa e contratual deve ser confirmada.

## 18. Evidencias, relatorios e artifacts

A [Politica de evidencias](docs/evidence-and-reporting-policy.md) define classificacao, redaction, acesso, retencao, descarte e compartilhamento.

- `reports/raw/`: saidas integrais locais; permanece no `.gitignore` e nunca deve ser versionada.
- `reports/sanitized/`: somente resumos minimizados, redigidos e revisados por pessoa competente.
- GitHub issues, PRs e logs: apenas contexto seguro e IDs opacos, sem detalhes exploraveis.
- Artifacts de CI: publicar somente quando indispensavel, com arquivos enumerados, acesso restrito e retencao aprovada.

### Politica de segredos

Segredos nunca devem ser armazenados no Git, em templates, exemplos, logs, artifacts ou relatorios sanitizados. Se uma credencial real for encontrada, interrompa a exposicao, preserve somente a evidencia minima em canal restrito, revogue ou rotacione o valor e avalie historico e uso indevido. Apagar apenas a linha do arquivo nao encerra o incidente.

Use tambem [`SECURITY.md`](SECURITY.md) para reporte privado, triagem e resposta, e `.gitleaks.toml`/`.secrets.baseline` como configuracoes iniciais de apoio. Esses arquivos nao substituem canal privado real, owners, secret scanning nativo, push protection ou workflow validado.

## 19. Modelo de relatorio final

Use [Modelo de relatorio final de auditoria](docs/security-audit-baseline.md) para registrar capa, escopo, metodologia, ferramentas, execucao, findings, matriz de riscos, remediacao, evidencias, limitacoes e decisao de release.

Uma copia preenchida pode se tornar confidencial ou restrita. Nao versione anexos crus nem transforme o modelo central em relatorio de um cliente ou ambiente real.

## 20. Severidade, priorizacao e riscos

[Severidade e priorizacao](risk/severity-and-prioritization.md) separa severidade tecnica, prioridade operacional, SLA, tratamento e gate. CVSS, CISA KEV, SSVC, EPSS e categorias OWASP apoiam a decisao, mas nao substituem contexto de negocio.

Riscos criticos, segredos ativos, quebra multi-tenant, incidente em curso e outros cenarios materiais podem bloquear release. Esforco de correcao nao reduz severidade.

## 21. Findings e aceite de risco

Para abrir um finding:

1. confirme aplicabilidade e remova detalhes sensiveis;
2. use titulo abstrato, ID opaco, impacto, escopo generalizado, owner e criterio de aceite;
3. mantenha evidencia original em armazenamento restrito;
4. vincule remediacao e reteste sem copiar payloads, logs ou requests/responses.

Aceite de risco deve ser formal, temporario, aprovado pela autoridade competente e conter justificativa, risco residual, controles, monitoramento, expiracao e gatilhos de reavaliacao. Consulte [Fluxo Git seguro](docs/git-security-workflow.md) e [Severidade e priorizacao](risk/severity-and-prioritization.md).

## 22. Branches, commits, issues e PRs

O [Fluxo Git seguro](docs/git-security-workflow.md) define estrategia de branches, findings, issues, falsos positivos, hotfixes, releases, commits e pull requests.

Nao inclua segredo, cliente, tenant, URL privada, IP interno, evidencia crua ou vetor exploravel em nome de branch, commit, issue, PR, label ou milestone. Regras detalhadas de contribuicao estao nesse guia; [`CONTRIBUTING.md`](CONTRIBUTING.md) e [`CODEOWNERS`](CODEOWNERS) servem como ponto de entrada operacional e template de ownership para o repositorio consumidor.

### Como contribuir

Use mudancas pequenas, revisaveis e vinculadas a um objetivo. Confirme o escopo, atualize documentacao e testes aplicaveis, execute os checks autorizados e revise o diff contra exposicao de dados antes do commit. Mudancas em controles, gates, risco, privacidade ou acessibilidade devem receber revisao do owner competente.

## 23. Checklists

Use os checklists conforme stack, fase e evento. Os principais grupos sao:

- release: [pre-beta](checklists/pre-beta.md), [pre-deploy](checklists/pre-deploy.md) e [pre-enterprise-sale](checklists/pre-enterprise-sale.md);
- AppSec: [OWASP Top 10](checklists/owasp-top-10.md), [OWASP ASVS](checklists/owasp-asvs.md) e [OWASP API Top 10](checklists/owasp-api-top-10.md);
- produto e plataforma: [Frappe](checklists/frappe-security.md), [cloud](checklists/cloud-security.md), [CI/CD](checklists/ci-cd-security.md) e [pagamentos](checklists/payment-security.md);
- governanca: [LGPD](checklists/lgpd.md), [acessibilidade](checklists/accessibility-wcag-22-aa.md), [terceiros](checklists/third-party-risk.md), [incidentes](checklists/incident-response.md), [backup](checklists/backup-restore.md) e [IA](checklists/ai-governance.md).

Checklist preenchido pode revelar arquitetura, lacunas e dados operacionais; trate-o conforme a politica de evidencias.

## 24. Templates

O [Indice de templates](templates/index.md) reune modelos de finding, remediacao, risco, resumo executivo, dados, ROPA, RIPD/DPIA, incidentes, postmortem, backup, fornecedores, acessibilidade, threat modeling e IA.

Os arquivos centrais devem permanecer genericos. Preencha copias em local autorizado e aplique classificacao, controle de acesso e revisao antes de qualquer versionamento.

## 25. Proximos passos, avisos e fontes

O trabalho de pesquisa esta registrado em [Progresso](research/progress.md), [Fila de tarefas](research/task-queue.md), [Auditoria de cobertura](research/coverage-audit.md), [Plano para Codex/agente de codigo](research/codex-execution-plan.md) e [Inventario reconciliado](research/repository-inventory.md).

Estado atual resumido: os Lotes 1 a 10 foram reconciliados dentro dos limites registrados em `research/task-queue.md`, e o Lote 11 executou revisao final de consistencia, links locais, placeholders vencidos, estado declarado e arquivos sensiveis rastreados. Permanecem pendencias contextuais do SaaS consumidor, como owners reais, canal privado, plano GitHub, versoes de ferramentas, validacao juridica, armazenamento restrito de evidencias, testes reais autorizados e promocao de gates/workflows especializados.

Avisos de seguranca:

- nunca adicione segredos, tokens, credenciais, cookies, dados pessoais reais ou exemplos que se parecam com credenciais;
- nao versione logs, dumps, backups, `site_config.json`, `terraform.tfstate`, screenshots sem redaction ou relatorios crus;
- nao execute scans contra producao, terceiros ou alvos sem autorizacao explicita;
- trate descoberta de segredo ou incidente pelo canal restrito definido pela organizacao, nao por issue comum;
- confirme versoes, comandos, licencas, planos, contratos e requisitos legais antes da implantacao.

As referencias oficiais e suas incertezas estao na [Matriz de normas e frameworks](docs/standards-and-frameworks-matrix.md) e nos registros de [`research/sources/`](research/sources/). As fontes usadas nesta consolidacao inicial estao em [Fontes do Chunk 18](research/sources/chunk-18.md). As reconciliacoes corretivas estao registradas em [Lote 1](research/sources/lote-01.md), [Lote 2](research/sources/lote-02.md), [Lote 4](research/sources/lote-04.md), [Lote 5](research/sources/lote-05.md), [Lote 6](research/sources/lote-06.md), [Lote 7](research/sources/lote-07.md), [Lote 8](research/sources/lote-08.md), [Lote 9](research/sources/lote-09.md), [Lote 10](research/sources/lote-10.md) e [Lote 11](research/sources/lote-11.md).
