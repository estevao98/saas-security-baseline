# Fontes do Chunk 15 - PRs corretivos do Lote 3

Data de acesso: **7 de junho de 2026**.

## Escopo deste registro

Este arquivo registra incrementalmente as fontes internas, fontes oficiais, decisões e incertezas dos PRs corretivos do Lote 3.

O primeiro PR foi limitado aos checklists de release:

- `checklists/pre-beta.md`;
- `checklists/pre-deploy.md`;
- `checklists/pre-enterprise-sale.md`.

O segundo PR é limitado aos checklists OWASP e API:

- `checklists/owasp-top-10.md`;
- `checklists/owasp-asvs.md`;
- `checklists/owasp-api-top-10.md`.

O pacote completo do Chunk 15 ainda não foi reconciliado. `research/progress.md`, `research/task-queue.md`, índices, scripts, workflows, templates e demais checklists não foram alterados nestes dois PRs.

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
| `docs/standards-and-frameworks-matrix.md` | Versões internas adotadas: OWASP Top 10:2025, API Security Top 10:2023 e ASVS 5.0.0; limites de uso e certificação. |
| `docs/audit-types.md` | Combinação de revisão manual, testes de autenticação/autorização e ferramentas como evidência parcial. |
| `docs/audit-trigger-matrix.md` | Auditorias, revisores, evidências e Go/No-Go para primeiro deploy, beta e venda empresarial. |
| `docs/security-tools-catalog.md` | Limites e riscos de SAST, DAST, SCA, testes de API, logs e relatórios automatizados. |
| `docs/evidence-and-reporting-policy.md` | Classificação, redaction, `reports/raw/`, `reports/sanitized/`, compartilhamento e retenção contextual. |
| `docs/security-audit-baseline.md` | Estrutura de evidência, findings, risco, reteste e critérios de decisão. |
| `docs/git-security-workflow.md` | Gates de release, revisão independente, IDs opacos e proibição de evidência crua em Git, issues e PRs. |
| `risk/severity-and-prioritization.md` | Severidade, aceite, reteste e condições de bloqueio de release. |
| `checklists/index.md` | Contexto do conjunto de checklists; permaneceu inalterado por pertencer à reconciliação posterior. |

## Fontes oficiais

| Fonte oficial | Versão/estado confirmado em 7 de junho de 2026 | Uso neste PR |
|---|---|---|
| [OWASP Top Ten Web Application Security Risks](https://owasp.org/www-project-top-ten/) | A página oficial informa o OWASP Top 10:2025 como versão publicada mais atual. | Nomes e ordem das dez categorias; uso como documento de conscientização e taxonomia inicial, não como padrão completo de verificação. |
| [OWASP Top 10:2025 - Introduction](https://owasp.org/Top10/2025/0x00_2025-Introduction/) | Lista oficial A01:2025 a A10:2025. | Estrutura do checklist web, incluindo supply chain e tratamento de condições excepcionais. |
| [OWASP API Security Top 10:2023](https://owasp.org/API-Security/editions/2023/en/0x00-header/) | Edição estável publicada de 2023. | Nomes e ordem de API1:2023 a API10:2023. |
| [OWASP API Security Project](https://owasp.org/www-project-api-security/) | Projeto oficial mantém 2023 como versão estável publicada. | Limite de escopo e aplicação a APIs públicas, internas e de parceiros. |
| [OWASP Application Security Verification Standard](https://owasp.org/www-project-application-security-verification-standard/) | Versão estável mais recente indicada: ASVS 5.0.0, publicada em 30 de maio de 2025. | Finalidade do ASVS, uso de requisitos verificáveis e formato recomendado de IDs versionados `v5.0.0-x.y.z`. |
| [Repositório oficial OWASP ASVS - tag v5.0.0](https://github.com/OWASP/ASVS/tree/v5.0.0/5.0/en) | Estrutura publicada da versão 5.0.0. | Confirmação dos capítulos V1 a V17 usados para organizar o checklist de adoção. |

As fontes oficiais herdadas dos demais domínios permanecem nos registros anteriores de `research/sources/`. Nenhuma referência foi convertida em obrigação universal, prova automática de segurança ou certificação.

## Decisões deste PR

- Os três arquivos foram tratados como gates diferentes, não como duplicações: beta considera usuários reais e isolamento; deploy considera promoção técnica, migração e rollback; venda empresarial considera compromissos, due diligence e capacidade operacional.
- Todos os itens permanecem desmarcados para evitar aparência de avaliação de produto real.
- Itens não aplicáveis exigem justificativa e revisão; check obrigatório não executado não equivale a aprovação.
- Evidências são descritas por conteúdo mínimo e IDs opacos. Material real deve permanecer em sistema restrito.
- Os critérios de bloqueio foram alinhados à matriz interna: segredo exposto, autenticação/autorização quebrada, acesso entre tenants, finding crítico/alto bloqueante, gate obrigatório ausente, incidente ativo e recuperação insuficiente conforme o cenário.
- Certificação formal aparece apenas como melhoria futura condicionada a objetivo, escopo e validação próprios.
- RTO, RPO, SLA, SBOM, DAST, controles cloud e avaliações independentes são aplicados conforme risco, arquitetura ou compromisso; sua simples presença não prova segurança ou conformidade.
- Este PR cria o registro incremental de fontes do Chunk 15, mas não declara o chunk concluído.

### Decisões do segundo PR - OWASP e API

- O OWASP Top 10:2025 foi tratado como taxonomia de triagem. Cada categoria recebeu verificações práticas para SaaS, mas o checklist direciona requisitos verificáveis e maior profundidade ao ASVS.
- O checklist ASVS fixa a versão 5.0.0 e exige IDs no formato `v5.0.0-x.y.z` na matriz formal. O arquivo não reproduz a lista integral do padrão e não permite alegar conformidade por simples marcação.
- A seleção de nível ASVS permanece proporcional ao risco. Nível 2 é referência interna a avaliar para SaaS autenticado, B2B, com dados pessoais, pagamentos ou funções administrativas; isso não foi apresentado como obrigação universal da OWASP.
- O checklist ASVS foi organizado pelos capítulos da versão 5.0.0 e exige avaliação requisito a requisito no conjunto oficial selecionado, incluindo justificativa para não aplicabilidade.
- O OWASP API Security Top 10:2023 foi aplicado a APIs públicas, de parceiros, mobile, internas e administrativas. Ocultação, rede interna ou gateway não substituem autenticação e autorização.
- Autorização por objeto, propriedade e função foi separada, com testes explícitos de isolamento multi-tenant e negação segura.
- Abuso de fluxos de negócio, consumo de recursos, inventário, SSRF e consumo de APIs de terceiros foram tratados como controles de desenho e operação, não apenas como achados de scanner.
- Testes de API ativos só são admitidos em escopo autorizado, preferencialmente efêmero e com dados fictícios; nenhum request, response, payload ou PoC foi incluído.
- Critérios de bloqueio foram alinhados a `risk/severity-and-prioritization.md`: quebra de autenticação/autorização/tenant, segredo exposto, integridade de build comprometida, finding crítico ou alto bloqueante, gate ausente e incidente ativo.
- Os três checklists exigem evidência mínima, revisão humana, IDs opacos, tratamento de findings e reteste. Resultado automatizado isolado não aprova categoria nem requisito.

## Incertezas e validações contextuais

- Requisitos jurídicos, LGPD, comunicação de incidentes, papéis de tratamento, transferências e cláusulas contratuais dependem dos fatos e exigem revisão competente.
- Requisitos enterprise variam por cliente, setor, região, contrato, criticidade e dados tratados.
- Acessibilidade exige avaliação humana; automação isolada não comprova conformidade.
- Ferramentas, versões, comandos, ambientes, retenção, frequência e thresholds devem ser definidos e validados no produto consumidor.
- Recursos de GitHub, cloud, CI/CD, assinatura, proveniência e segregação dependem do plano, arquitetura e configuração adotados.
- Um checklist preenchido pode revelar lacunas, arquitetura e decisões comerciais; sua classificação deve ser definida antes de armazenar ou compartilhar.
- O OWASP Top 10 e o API Security Top 10 podem receber novas edições; o produto consumidor deve confirmar a versão antes de iniciar uma nova avaliação e controlar migração de mapeamentos.
- IDs e conteúdo de requisitos ASVS podem mudar entre versões. Uma atualização de versão exige análise de delta; não se deve renomear IDs históricos como se fossem equivalentes.
- O checklist ASVS resume áreas de controle, mas a avaliação formal depende da lista oficial completa, do nível selecionado, do escopo e de evidência requisito a requisito.
- GraphQL, WebRTC, OAuth/OIDC, webhooks, gateways, filas e integrações são aplicáveis somente quando presentes; não aplicabilidade precisa ser documentada sem produzir falsa cobertura.

## Limites de segurança observados

- Não foram criados dados pessoais, dados de cliente, segredos, credenciais, cookies, URLs internas, logs crus, payloads, PoCs ou requests/responses.
- Não foram executados testes contra ambientes, chamadas de API, scans ou coleta de evidências reais.
- Não foram criados relatórios preenchidos nem declarações de conformidade, certificação ou ausência de vulnerabilidades.
- Não foram copiados trechos longos das publicações OWASP nem listas integrais de requisitos ASVS.
- Não foram executados DAST, fuzzing ou procedimentos ofensivos.
