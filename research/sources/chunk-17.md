# Fontes do Chunk 17

Data de acesso: **7 de junho de 2026**.

## Critério de pesquisa

Foram priorizadas fontes oficiais e os documentos já aprovados do repositório. Os templates sintetizam campos operacionais; não reproduzem normas, não substituem parecer jurídico e adotam proteção mais restritiva para evidências, dados pessoais e detalhes exploráveis.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Escopo, proteção de evidências, fontes e limites do chunk. |
| `research/prompts.md` | Lista e requisitos originais dos 14 templates. |
| `research/task-queue.md` | Critérios de aceite e proibição de executar outros chunks. |
| `research/progress.md` | Estado anterior e registro de conclusão. |
| `docs/repository-architecture.md` | Papel da pasta `templates/` e separação de relatórios. |
| `docs/standards-and-frameworks-matrix.md` | Relações com segurança, privacidade, continuidade, acessibilidade e IA. |
| `docs/security-roadmap.md` | Fases de maturidade, decisões e evidências. |
| `docs/audit-types.md` e `docs/audit-trigger-matrix.md` | Momento de uso, revisores e gates. |
| `docs/security-tools-catalog.md` e `scripts/README.md` | Limites de ferramentas, falsos positivos e saídas sensíveis. |
| `docs/github-actions-strategy.md` | Logs, artifacts, gates e relatórios de CI/CD. |
| `docs/security-tools-catalog.md` | Riscos de aplicação, autorização, tenant e evidências. |
| `docs/lgpd-privacy-program.md` | Mapa de dados, ROPA, RIPD, fornecedores e incidentes pessoais. |
| `docs/accessibility-program.md` | Avaliação, impacto funcional, revisão manual e WCAG. |
| `docs/evidence-and-reporting-policy.md` | Classificação, redaction, armazenamento, retenção e compartilhamento. |
| `docs/security-audit-baseline.md` | Estrutura de findings, plano, resumo e evidências. |
| `docs/git-security-workflow.md` | IDs opacos e conteúdo seguro em Git, issue e PR. |
| `risk/severity-and-prioritization.md` | Severidade, prioridade, tratamento, aceite e reteste. |
| `checklists/index.md` | Referência ao conjunto de checklists sem alteração de seus arquivos. |

## Fontes oficiais

| ID | Fonte | URL | Aplicação nos templates |
|---|---|---|---|
| S1 | ANPD - Relatório de Impacto à Proteção de Dados Pessoais | https://www.gov.br/anpd/pt-br/canais_atendimento/agente-de-tratamento/relatorio-de-impacto-a-protecao-de-dados-pessoais-ripd | Responsabilidade do controlador, contexto de alto risco e conteúdo mínimo do RIPD. |
| S2 | ANPD - Comunicação de Incidente de Segurança | https://www.gov.br/anpd/pt-br/canais_atendimento/agente-de-tratamento/comunicado-de-incidente-de-seguranca-cis | Avaliação de risco/dano relevante, prazo regulatório e comunicação pelo controlador. |
| S3 | ANPD - Resolução CD/ANPD nº 15/2024 | https://www.gov.br/anpd/pt-br/assuntos/noticias/anpd-aprova-o-regulamento-de-comunicacao-de-incidente-de-seguranca | Registro de incidentes com dados pessoais e retenção mínima de cinco anos. |
| S4 | NIST SP 800-61 Rev. 3 | https://csrc.nist.gov/pubs/sp/800/61/r3/final | Preparação, detecção, resposta, recuperação e melhoria em incidentes. |
| S5 | NIST SP 800-34 Rev. 1 | https://csrc.nist.gov/pubs/sp/800/34/r1/final | Planejamento de contingência, testes, recuperação e manutenção. |
| S6 | NIST SP 800-161 Rev. 1 Update 1 | https://csrc.nist.gov/pubs/sp/800/161/r1/upd1/final | Gestão de risco de fornecedores e supply chain ao longo do ciclo de aquisição. |
| S7 | OWASP Threat Modeling | https://owasp.org/www-community/Threat_Modeling | Escopo, ameaças, contramedidas, validação e revisão contínua. |
| S8 | OWASP Threat Modeling Process | https://owasp.org/www-community/Threat_Modeling_Process | Ativos, entradas, trust boundaries, DFDs, ameaças, mitigação e revisão. |
| S9 | W3C/WAI - Conformance Evaluation and Reports | https://www.w3.org/WAI/test-evaluate/conformance/ | Escopo, método e relatório de avaliação de acessibilidade. |
| S10 | W3C/WAI - WCAG-EM Report Tool | https://www.w3.org/WAI/eval/report-tool/ | Estrutura de relatório e necessidade de avaliador experiente; a ferramenta não executa testes. |
| S11 | NIST AI Risk Management Framework 1.0 | https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10 | Riscos de IA para pessoas, organizações e sociedade; governança voluntária e contextual. |
| S12 | NIST AI RMF Playbook | https://airc.nist.gov/airmf-resources/playbook/ | Ações de Govern, Map, Measure e Manage ao longo do ciclo de vida de IA. |

## Decisões e incertezas

- `ROPA` é usado como nome prático para o registro de operações de tratamento. Os campos e a obrigação concreta dependem do papel do agente, do contrato, do setor e da validação jurídica.
- O template `DPIA` usa a denominação combinada RIPD/DPIA para facilitar reutilização. No contexto da LGPD, a responsabilidade e os campos mínimos do RIPD devem seguir a legislação e a orientação vigente da ANPD.
- A necessidade de comunicar incidente, o marco de ciência, os destinatários e o conteúdo dependem dos fatos e do papel controlador/operador. O template não automatiza decisão jurídica.
- Prazos de retenção, RPO, RTO, SLA e frequência de testes não foram fixados: dependem de análise de impacto, contrato, setor, arquitetura e política aprovada.
- Certificações, questionários e relatórios de fornecedor têm escopo e validade próprios. A existência de certificado não prova que o serviço, região, plano ou controle contratado está coberto.
- WCAG-EM 2.0 estava em rascunho em 2026. O template não declara conformidade automática e exige validação manual por avaliador competente.
- O NIST AI RMF 1.0 é voluntário, não setorial e agnóstico a caso de uso. Obrigações de IA e decisões automatizadas devem ser confirmadas conforme jurisdição, setor, contrato e uso real.
- Diagramas, modelos de ameaças, registros de risco, RIPDs, incidentes e avaliações reais podem revelar arquitetura e detalhes pessoais ou exploráveis; por padrão, ficam fora do Git e apenas versões sanitizadas são compartilhadas.
