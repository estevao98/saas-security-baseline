# Operadores, Suboperadores e Terceiros

## Objetivo

Orientar o registro sanitizado de fornecedores que acessam, recebem, armazenam ou processam dados pessoais, incluindo operadores, suboperadores e terceiros com papel próprio.

Use `../templates/vendor-risk-assessment-template.md` e `../checklists/third-party-risk.md` para avaliação completa. Este arquivo mantém a visão operacional de privacidade sem registrar fornecedores reais neste baseline.

## Quando usar

- Antes de contratar ou habilitar cloud, autenticação, e-mail, WhatsApp/API, pagamentos, analytics, suporte, observabilidade, IA, storage ou gateway.
- Antes de compartilhar dados pessoais, logs, tickets, arquivos, prompts, metadados ou acesso administrativo.
- Em mudança de plano, região, suboperador, finalidade, recurso, contrato ou suporte remoto.
- Em renovação, incidente, falha de direito, offboarding ou revisão periódica.

## Campos mínimos

| Campo | Conteúdo seguro |
|---|---|
| ID | `[FORN-001]` ou `[SUBOPERADOR-A]`. |
| Serviço | Categoria de serviço, sem nome real neste baseline. |
| Papel | Operador, suboperador, terceiro ou papel a validar. |
| Finalidade | Finalidade específica e necessidade. |
| Dados | Categorias abstratas e sensibilidade. |
| Titulares | Categorias abstratas de titulares. |
| Regiões | País/região em nível aprovado; validar transferência internacional. |
| Suboperadores | Lista controlada no sistema restrito ou categoria sanitizada. |
| Contrato/DPA | ID opaco de contrato, sem anexar documento. |
| Segurança | Controles, evidências e limitações em resumo. |
| Retenção/saída | Retorno, exclusão, exportação e offboarding. |
| Incidentes | Canal, prazo interno, informações esperadas e escalonamento. |
| Owner | Produto, Segurança, Privacidade, Compras ou Operações. |

## Transferência internacional

Região de cloud, suporte remoto no exterior, suboperador estrangeiro ou acesso administrativo fora do país podem exigir análise de transferência internacional. O mecanismo aplicável deve ser validado por Privacidade/Jurídico; não presumir adequação apenas pelo país, fornecedor ou contrato padrão.

## Fluxo de aprovação

1. Confirmar necessidade e alternativa com o owner do produto.
2. Mapear dados, titulares, finalidade e sistemas com `data-map.md`.
3. Avaliar papel, suboperadores, regiões e transferência internacional.
4. Revisar contrato, DPA, segurança, continuidade, direitos e incidentes.
5. Definir riscos residuais, condições, plano de saída e próxima revisão.
6. Registrar decisão por ID opaco e manter evidências reais em sistema restrito.

## Bloqueios comuns

- Fornecedor crítico sem avaliação mínima antes de receber dados ou acesso.
- Papel, finalidade, contrato, suboperadores ou regiões desconhecidos quando materialmente relevantes.
- Ausência de canal de incidente, retorno, exclusão ou offboarding compatível com o risco.
- Transferência internacional presumida sem validação competente.
- Evidência real de contrato, relatório, contato, preço, URL, token ou incidente no Git.

## Referências

- `../checklists/third-party-risk.md`
- `../templates/vendor-risk-assessment-template.md`
- `../docs/lgpd-privacy-program.md`
- `data-map.md`
- `ropa.md`
- `retention-policy.md`
- `../docs/evidence-and-reporting-policy.md`
