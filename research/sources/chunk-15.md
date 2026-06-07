# Fontes do Chunk 15 - PR 3.1

Data de acesso: **7 de junho de 2026**.

## Escopo deste registro

Este arquivo registra as fontes internas e decisões do primeiro PR corretivo do Lote 3, limitado aos checklists de release:

- `checklists/pre-beta.md`;
- `checklists/pre-deploy.md`;
- `checklists/pre-enterprise-sale.md`.

O pacote completo do Chunk 15 ainda não foi reconciliado. `research/progress.md`, `research/task-queue.md`, índices, scripts, workflows, templates e demais checklists não foram alterados neste PR.

## Fontes internas consultadas

| Fonte | Uso nos checklists |
|---|---|
| `AGENTS.md` | Regras de escopo, evidências, fontes, arquivos sensíveis e estilo dos checklists. |
| `README.md` | Propósito da baseline, fases de maturidade, interpretação de relatórios e limites de conformidade. |
| `research/codex-execution-plan.md` | Escopo do Lote 3, ordem por PR, critérios de aceite e proibição de reconciliar status antes do pacote completo. |
| `research/coverage-audit.md` | Confirmação de que os checklists eram placeholders e de que `research/sources/chunk-15.md` estava ausente. |
| `research/prompts.md` | Requisitos originais do Chunk 15 e categorias esperadas. |
| `research/task-queue.md` | Estado declarado e critérios históricos, consultados sem alteração. |
| `research/progress.md` | Divergência histórica do Chunk 15, consultada sem reconciliação neste PR. |
| `docs/security-roadmap.md` | Fases MVP seguro e SaaS vendável para empresas, evidências, gates e critérios de não avançar. |
| `docs/audit-trigger-matrix.md` | Auditorias, revisores, evidências e Go/No-Go para primeiro deploy, beta e venda empresarial. |
| `docs/evidence-and-reporting-policy.md` | Classificação, redaction, `reports/raw/`, `reports/sanitized/`, compartilhamento e retenção contextual. |
| `docs/security-audit-baseline.md` | Estrutura de evidência, findings, risco, reteste e critérios de decisão. |
| `docs/git-security-workflow.md` | Gates de release, revisão independente, IDs opacos e proibição de evidência crua em Git, issues e PRs. |
| `risk/severity-and-prioritization.md` | Severidade, aceite, reteste e condições de bloqueio de release. |
| `checklists/index.md` | Contexto do conjunto de checklists; permaneceu inalterado por pertencer à reconciliação posterior. |

## Fontes oficiais herdadas

Não houve nova consulta externa neste PR. Os checklists sintetizam decisões já sustentadas pelos documentos canônicos acima. URLs, edições, datas de acesso e limitações das fontes oficiais permanecem nos registros anteriores de `research/sources/`, especialmente os chunks de roadmap, auditorias, LGPD, acessibilidade, evidências, risco e fluxo Git.

As referências herdadas incluem fontes oficiais de OWASP, ANPD, W3C/WAI, NIST, CISA, CIS, GitHub e documentação das ferramentas, conforme o domínio. Nenhuma referência foi convertida em obrigação universal por este PR.

## Decisões deste PR

- Os três arquivos foram tratados como gates diferentes, não como duplicações: beta considera usuários reais e isolamento; deploy considera promoção técnica, migração e rollback; venda empresarial considera compromissos, due diligence e capacidade operacional.
- Todos os itens permanecem desmarcados para evitar aparência de avaliação de produto real.
- Itens não aplicáveis exigem justificativa e revisão; check obrigatório não executado não equivale a aprovação.
- Evidências são descritas por conteúdo mínimo e IDs opacos. Material real deve permanecer em sistema restrito.
- Os critérios de bloqueio foram alinhados à matriz interna: segredo exposto, autenticação/autorização quebrada, acesso entre tenants, finding crítico/alto bloqueante, gate obrigatório ausente, incidente ativo e recuperação insuficiente conforme o cenário.
- Certificação formal aparece apenas como melhoria futura condicionada a objetivo, escopo e validação próprios.
- RTO, RPO, SLA, SBOM, DAST, controles cloud e avaliações independentes são aplicados conforme risco, arquitetura ou compromisso; sua simples presença não prova segurança ou conformidade.
- Este PR cria o registro incremental de fontes do Chunk 15, mas não declara o chunk concluído.

## Incertezas e validações contextuais

- Requisitos jurídicos, LGPD, comunicação de incidentes, papéis de tratamento, transferências e cláusulas contratuais dependem dos fatos e exigem revisão competente.
- Requisitos enterprise variam por cliente, setor, região, contrato, criticidade e dados tratados.
- Acessibilidade exige avaliação humana; automação isolada não comprova conformidade.
- Ferramentas, versões, comandos, ambientes, retenção, frequência e thresholds devem ser definidos e validados no produto consumidor.
- Recursos de GitHub, cloud, CI/CD, assinatura, proveniência e segregação dependem do plano, arquitetura e configuração adotados.
- Um checklist preenchido pode revelar lacunas, arquitetura e decisões comerciais; sua classificação deve ser definida antes de armazenar ou compartilhar.

## Limites de segurança observados

- Não foram criados dados pessoais, dados de cliente, segredos, credenciais, cookies, URLs internas, logs crus, payloads, PoCs ou requests/responses.
- Não foram executados scans, testes contra ambientes, consultas de rede ou coleta de evidências reais.
- Não foram criados relatórios preenchidos nem declarações de conformidade, certificação ou ausência de vulnerabilidades.
