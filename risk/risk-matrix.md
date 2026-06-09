# Matriz Auxiliar de Riscos

## Objetivo

Esta matriz ajuda a converter achados, limitações de auditoria, lacunas de controle e decisões de aceite em cenários de risco rastreáveis.

A fonte canônica para severidade, prioridade, SLA, gates, aceite, exceção, falso positivo e reteste continua sendo `severity-and-prioritization.md`. Este arquivo é auxiliar: ele orienta o preenchimento seguro de um registro de riscos, mas não substitui análise humana nem prova ausência de vulnerabilidades.

## Escopo seguro

Pode ir para Git nesta baseline:

- estrutura da matriz;
- campos esperados;
- exemplos claramente fictícios;
- decisões genéricas de governança;
- resumos sanitizados e revisados.

Não deve ir para Git:

- risco real com cliente, tenant, host, URL, IP, fornecedor sensível ou sistema identificável;
- evidência crua, log, dump, backup, request, response, DOM, screenshot, vídeo, payload ou PoC;
- segredo, token, cookie, credencial, chave, certificado privado ou string de conexão;
- relatório bruto de scanner, SARIF, JSON, HTML, XML, TXT ou LOG de ferramenta;
- dado pessoal real ou combinação que permita reidentificação.

## Relação entre severidade e risco

| Elemento | Fonte principal | Uso nesta matriz |
|---|---|---|
| Severidade | `severity-and-prioritization.md` | Classificar o cenário validado por impacto e probabilidade. |
| Prioridade | `severity-and-prioritization.md` | Ordenar tratamento por urgência, exposição, release, contrato e capacidade. |
| Evidência | `../docs/evidence-and-reporting-policy.md` | Referenciar somente por ID opaco e resumo sanitizado. |
| Decisão Go/No-Go | `../docs/audit-trigger-matrix.md` | Bloquear, liberar com ressalva ou exigir aceite formal conforme gatilho. |
| Relatório final | `../docs/security-audit-baseline.md` | Consolidar riscos, limitações, decisão e pendências sem anexos crus. |
| Registro auxiliar | `risk-register.csv` | Manter schema e exemplo fictício; registros reais ficam fora do Git por padrão. |

## Campos mínimos do cenário de risco

| Campo | Obrigatório | Orientação segura |
|---|---|---|
| `risk_id` | Sim | ID opaco, por exemplo `RISK-042` ou `RISK-EXAMPLE-001`. |
| Título seguro | Sim | Resultado ou controle em nível abstrato, sem vetor explorável. |
| Fonte | Sim | Finding, auditoria, incidente, checklist, fornecedor, exceção ou limitação. |
| Impacto | Sim | Técnico, negócio, dados, disponibilidade, acessibilidade, financeiro ou reputação. |
| Probabilidade | Sim | Improvável, possível, provável ou observada/iminente, com justificativa. |
| Severidade | Sim | Crítico, alto, médio, baixo ou informativo, conforme a fonte canônica. |
| Prioridade | Sim | `P0` a `P3` ou fila equivalente aprovada. |
| Evidência | Sim | IDs opacos de evidência ou `N/A`; originais ficam em armazenamento restrito. |
| Owner | Sim | Papel ou equipe, não pessoa real fictícia. |
| Status | Sim | Aberto, em tratamento, mitigado, aceito, transferido, evitado, monitorado, falso positivo ou fechado. |
| Decisão | Sim | Tratar, mitigar, aceitar, transferir, evitar, monitorar ou encerrar como falso positivo. |
| Risco residual | Sim, quando houver decisão | Nível e justificativa após controle ou aceite. |
| Pendência contextual | Sim, quando aplicável | Versão, plano GitHub, contrato, validação jurídica, ferramenta, ambiente ou owner real. |
| Revisão/expiração | Sim para aceite ou exceção | Data ou gatilho; aceite permanente não deve ser usado. |

## Matriz impacto x probabilidade

Use a matriz canônica sem transformar a decisão em cálculo automático.

| Impacto \ Probabilidade | Improvável | Possível | Provável | Observada/iminente |
|---|---|---|---|---|
| Extremo | Alto | Alto | Crítico | Crítico |
| Material | Médio | Alto | Alto | Crítico |
| Moderado | Baixo | Médio | Médio | Alto |
| Pequeno | Baixo | Baixo | Médio | Médio |

## Decisões permitidas

| Decisão | Quando usar | Exigência mínima |
|---|---|---|
| Tratar | A causa deve ser removida ou corrigida. | Owner, prazo, critério testável e reteste. |
| Mitigar | Controle reduz risco enquanto correção definitiva não existe. | Controle independente, evidência, monitoramento e expiração. |
| Aceitar | Risco residual cabe no apetite aprovado. | Aprovador competente, prazo, controles, justificativa e gatilhos. |
| Transferir | Contrato, seguro ou fornecedor assume parte da operação ou consequência. | Responsabilidades verificadas e risco residual mantido visível. |
| Evitar | Função, integração, ativo ou exposição será removida. | Confirmação de desativação e ausência de dependência residual. |
| Monitorar | Incerteza ou risco baixo exige observação. | Sinal, owner, frequência, limite de ação e data de revisão. |
| Falso positivo | Condição não existe ou não é aplicável ao escopo. | Justificativa técnica, revisor, validade e condição de reabertura. |

## Evidência e redaction

- Registre apenas IDs como `EV-SAN-001`, `FIND-042`, `RET-010` ou `IR-2026-004`.
- Não cole stdout/stderr, JSON, SARIF, HTML, XML, LOG, TXT, HAR, DOM, request, response, print, vídeo ou anexo bruto.
- Não preserve prefixo ou sufixo de segredo como prova. Para segredo real, registre tipo, origem abstrata, estado de revogação e referência restrita.
- Relatório cru fica fora do Git em `reports/raw/` ou armazenamento restrito aprovado.
- Resumo sanitizado só entra em `reports/sanitized/` após redaction, reconstrução por allowlist e revisão humana.

## Secret scanning e risco

Secret scanning é controle preventivo e investigativo, não prova de ausência de segredos.

- Não crie segredo real para testar ferramenta.
- Não crie token fictício com formato de provedor real.
- Não versione relatório bruto de Gitleaks, detect-secrets, TruffleHog, Trivy ou ferramenta equivalente.
- Fixture positiva ou negativa deve ser controlada, sintética, isolada e desenhada para não quebrar scans normais do repositório.
- Gitleaks e detect-secrets dependem de versão, regras, flags, saída, política de falha, redaction e revisão de falso positivo.

## Checklist antes de registrar um risco no Git

- [ ] O risco é exemplo fictício, estrutura vazia ou resumo sanitizado revisado?
- [ ] O título não revela vetor, ativo, cliente, tenant, URL, path ou segredo?
- [ ] A evidência está referenciada apenas por ID opaco?
- [ ] A severidade e a prioridade seguem `severity-and-prioritization.md`?
- [ ] Owner, status, decisão, prazo e pendência contextual estão claros?
- [ ] Aceite ou exceção possui aprovador, expiração e gatilho de reavaliação?
- [ ] Não há log, dump, payload, request/response, DOM, screenshot, vídeo ou relatório bruto?
- [ ] Não há dado pessoal real, segredo ou exemplo parecido com credencial real?
- [ ] A revisão humana confirmou redaction e necessidade de versionamento?

## Pendências contextuais

- Confirmar apetite de risco, autoridade de aceite e SLAs no SaaS consumidor.
- Definir sistema restrito para registro real de riscos e evidências.
- Validar versões e comportamento de scanners antes de qualquer gate.
- Confirmar plano GitHub, recursos nativos de secret scanning, push protection, code scanning e política de artifacts.
- Manter revisão periódica de links, placeholders, fontes e arquivos sensíveis antes de promover mudanças relevantes.
