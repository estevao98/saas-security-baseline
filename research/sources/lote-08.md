# Fontes do Lote 8 - LGPD

Data de acesso: **9 de junho de 2026**.

## Escopo

Este registro documenta fontes internas, decisoes, incertezas e limites usados na reconciliacao do Lote 8 - LGPD.

O lote reconciliou `privacy/*.md` como artefatos operacionais pequenos e reutilizaveis. Nao preencheu registros reais, nao escolheu base legal, nao emitiu parecer juridico e nao alterou scripts, workflows, exemplos de workflows, templates completos, checklists individuais, politicas raiz ou documentos auxiliares fora de `privacy/`.

## Fontes internas consultadas

| Fonte | Uso na reconciliacao |
|---|---|
| `AGENTS.md` | Regras obrigatorias de fontes, evidencias, dados sensiveis e atualizacao de progresso. |
| `README.md` | Estado publico declarado para LGPD, privacidade, evidencias, checklists e templates. |
| `SECURITY.md` | Limites para reporte, incidentes, comunicacao externa e evidencias sensiveis. |
| `CONTRIBUTING.md` | Escopo de contribuicao, proibicao de dados reais e validacoes proporcionais. |
| `research/codex-execution-plan.md` | Escopo, criterios, riscos e proibicoes do Lote 8. |
| `research/coverage-audit.md` | Lacuna historica de `privacy/*.md` e necessidade de reconciliacao operacional. |
| `research/prompts.md` | Origem dos lotes corretivos e do dominio LGPD. |
| `research/progress.md` | Historico e estado antes da reconciliacao. |
| `research/task-queue.md` | Fila corretiva e proximo lote. |
| `research/repository-inventory.md` | Estado reconciliado antes do Lote 8. |
| `research/sources/chunk-09.md` | Fontes oficiais LGPD/ANPD e incertezas originais do programa de privacidade. |
| `research/sources/chunk-11.md` | Politica de evidencias, incidentes com dados pessoais e retencao de registros. |
| `research/sources/chunk-12.md` | Modelo de relatorio e limites de LGPD, evidencias e validacao juridica. |
| `research/sources/chunk-15.md` | Checklist LGPD e decisoes de nao escolher base legal nem declarar conformidade. |
| `research/sources/chunk-17.md` | Templates de mapa, ROPA, RIPD/DPIA, fornecedor e incidentes. |
| `research/sources/lote-01.md`, `research/sources/lote-02.md`, `research/sources/lote-04.md`, `research/sources/lote-06.md` | Estado anterior de estrutura, documentos, politicas, workflows e backend/Python. |
| `docs/lgpd-privacy-program.md` | Fonte canonica para ciclo de vida, papeis, bases, direitos, terceiros, incidentes e privacy by design. |
| `docs/lgpd-gap-assessment.md` | Guia auxiliar de gap assessment e pendencia do Lote 8. |
| `docs/evidence-and-reporting-policy.md` | Classificacao, redaction, `reports/raw/`, `reports/sanitized/`, incidentes e dados pessoais. |
| `docs/audit-trigger-matrix.md` | Gatilhos de LGPD gap, RIPD/PIA, incidentes, fornecedores e Go/No-Go. |
| `checklists/lgpd.md`, `checklists/incident-response.md`, `checklists/third-party-risk.md` | Checklists existentes usados como referencia; nao foram alterados. |
| `templates/data-map-template.md`, `templates/ropa-template.md`, `templates/dpia-template.md`, `templates/incident-report-template.md`, `templates/vendor-risk-assessment-template.md` | Templates completos referenciados sem duplicacao integral. |
| `privacy/*.md` | Artefatos reconciliados neste lote. |
| `compliance/README.md`, `reports/README.md` | Navegacao de compliance e evidencias; nao foram alterados. |

## Fontes oficiais

Nao foram consultadas novas fontes externas neste lote. As fontes oficiais aplicaveis continuam registradas principalmente em `research/sources/chunk-09.md`, incluindo LGPD, orientacoes e regulamentos da ANPD sobre titulares, agentes, RIPD, incidentes, transferencias internacionais, cookies e seguranca para agentes de pequeno porte.

O uso formal em caso real deve revalidar o texto oficial consolidado, regulamentos vigentes, obrigacoes setoriais e contratos aplicaveis.

## Artefatos alterados

| Arquivo | Decisao |
|---|---|
| `privacy/README.md` | Reconciliado como indice operacional e limite de uso da pasta. |
| `privacy/data-map.md` | Convertido em roteiro operacional para mapa de dados e cobertura de fluxos. |
| `privacy/ropa.md` | Convertido em roteiro de registro de operacoes, sem substituir o template completo. |
| `privacy/legal-bases.md` | Convertido em triagem de hipoteses legais candidatas, sem escolha automatica. |
| `privacy/dpia-template.md` | Convertido em guia de uso do template RIPD/DPIA e gatilhos de triagem. |
| `privacy/data-subject-rights.md` | Convertido em procedimento minimo de direitos dos titulares. |
| `privacy/retention-policy.md` | Convertido em guia de retencao, descarte, excecoes e evidencias. |
| `privacy/third-party-processors.md` | Convertido em registro sanitizado de operadores, suboperadores, terceiros e transferencias. |
| `privacy/incident-personal-data.md` | Convertido em playbook minimo de incidentes com dados pessoais. |
| `privacy/privacy-by-design-checklist.md` | Convertido em checklist operacional por feature/mudanca material. |
| `research/progress.md`, `research/task-queue.md`, `research/repository-inventory.md` | Atualizados para refletir o fechamento real do Lote 8. |

## Decisoes

- `docs/lgpd-privacy-program.md` permanece como fonte canonica de programa; `privacy/*.md` sao guias operacionais auxiliares.
- Templates completos permanecem em `templates/`; os arquivos em `privacy/` apontam para eles e nao os duplicam integralmente.
- Bases legais foram tratadas apenas como triagem por finalidade e categoria de dado. A decisao final depende de Privacidade/Juridico.
- ROPA, mapa, RIPD/DPIA, direitos, fornecedores, retencao e incidentes foram descritos como processos e campos seguros, nao como registros reais preenchidos.
- Transferencia internacional foi registrada como decisao contextual que depende de caracterizacao, mecanismo aplicavel e validacao juridica.
- Evidencias reais, incidentes, pedidos de titulares, comunicações, contratos, relatorios crus, logs, dumps, backups e dados pessoais permanecem fora do Git.

## Incertezas e pendencias

- Papeis controlador/operador/suboperador, bases legais, RIPD, retencao, transferencias internacionais, contratos, direitos e comunicacao de incidentes exigem validacao competente no SaaS consumidor.
- Prazos e conteudos de resposta a titulares, incidentes e conservacao devem ser confirmados contra texto consolidado vigente e contexto real.
- O Lote 8 nao executou teste ponta a ponta com produto ficticio, nao validou ferramenta e nao criou relatorio sanitizado.
- `docs/lgpd-gap-assessment.md` e `checklists/lgpd.md` ja estavam substantivos; nao foram alterados porque a solicitacao atual restringiu checklists, templates e documentos auxiliares a erro objetivo.
- Acessibilidade operacional permanece para o Lote 9; scripts para o Lote 5; risco/evidencias para o Lote 10; revisao final para o Lote 11.

## Limites de seguranca

- Nao foram criados dados pessoais reais, dados de cliente, alunos, fornecedores, titulares, tenants, URLs internas, logs crus, dumps, backups, payloads, PoCs, requests/responses, tokens, cookies, credenciais ou exemplos semelhantes a credenciais.
- Nao foram executados scanners, workflows, scripts de auditoria, chamadas externas, testes ofensivos, coleta de evidencias reais ou publicacao de artifact.
- Nao ha declaracao de conformidade com LGPD, certificacao, parecer juridico, prontidao enterprise, ausencia de risco ou ausencia de vulnerabilidades.
