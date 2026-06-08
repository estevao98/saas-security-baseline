# Governança de IA

## Objetivo

Organizar referências para avaliar, aprovar, monitorar e revisar uso material de IA em SaaS.

Esta pasta não deve conter prompts reais, dados pessoais, dados de cliente, respostas sensíveis, contratos, logs de fornecedor ou avaliações preenchidas com informação confidencial.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Referências ISO/ABNT e limites | `../docs/standards-and-frameworks-matrix.md` |
| Guia auxiliar | `../docs/ai-governance-checklist.md` |
| Checklist executável | `../checklists/ai-governance.md` |
| Template de avaliação | `../templates/ai-risk-assessment-template.md` |
| Privacidade e dados pessoais | `../docs/lgpd-privacy-program.md` |
| Risco e aceite | `../risk/severity-and-prioritization.md` |

## Quando Usar

- IA gera, classifica, recomenda, resume, prioriza ou decide algo relevante para usuário ou operação.
- Dados pessoais, conteúdo de cliente, suporte, logs, anexos ou prompts entram no fluxo.
- Fornecedor externo, modelo hospedado, embeddings, agentes, RAG ou automação material são adotados.

## Pendências

- Testes especializados, red teaming, monitoramento contínuo e validação regulatória são contextuais.
- Se IA não for material no SaaS consumidor, registrar não aplicabilidade no checklist e revisar quando o escopo mudar.
