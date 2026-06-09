# Registro das Operações de Tratamento

## Objetivo

Orientar o registro de operações de tratamento de dados pessoais, mantendo rastreabilidade de finalidade, papéis, dados, retenção, segurança, fornecedores e evidências sem armazenar registros reais neste repositório.

Use `../templates/ropa-template.md` para a estrutura preenchível. Este arquivo define governança e revisão.

## Natureza do artefato

`ROPA` é usado aqui como nome prático para registro de operações. O conteúdo exigível e a obrigação concreta dependem do papel do agente, do contrato, do setor, dos titulares e de validação jurídica.

## Quando criar ou revisar

- Antes de iniciar tratamento material em produção.
- Ao alterar finalidade, categoria de dado, titular, sistema, fornecedor, país, retenção ou papel.
- Ao introduzir analytics, IA, decisão automatizada, suporte remoto, integração externa ou nova telemetria.
- Após incidente, reclamação, pedido recorrente de titular ou gap assessment.
- Na revisão anual do programa ou em periodicidade definida pelo controlador.

## Conteúdo mínimo

| Bloco | Conteúdo esperado | Validação |
|---|---|---|
| Identificação | ID, operação, owner, status e revisão. | Privacidade e owner do produto. |
| Finalidade | Finalidade específica e necessidade. | Produto, Privacidade e Jurídico quando aplicável. |
| Papéis | Controlador, operador, suboperador ou terceiro por tratamento. | Jurídico/Privacidade. |
| Titulares e dados | Categorias abstratas, incluindo sensíveis ou vulneráveis quando houver. | Privacidade. |
| Operações | Coleta, uso, compartilhamento, armazenamento, retenção e descarte. | Engenharia e Operações. |
| Base candidata | Hipótese legal a validar por finalidade. | Jurídico/Privacidade; nunca automática. |
| Segurança | Acesso, tenant, criptografia, logs, backup e direitos. | Segurança e Engenharia. |
| Terceiros | Fornecedores, suboperadores, regiões e contratos. | Compras, Segurança, Privacidade e Jurídico. |
| Evidência | IDs opacos e resumo sanitizado quando aprovado. | Owner do domínio. |

## Fluxo de revisão

1. Criar ou atualizar o mapa de dados em `data-map.md`.
2. Agrupar fluxos por finalidade e operação de tratamento.
3. Registrar base candidata em `legal-bases.md`, sem escolher por padrão.
4. Confirmar retenção em `retention-policy.md` e fornecedores em `third-party-processors.md`.
5. Avaliar se há gatilho de RIPD/DPIA usando `dpia-template.md`.
6. Registrar pendências, riscos e exceções com owner e data de revisão.

## Não registrar

- Nome, e-mail, documento, telefone, mensagem, aluno, cliente, titular ou fornecedor real.
- URL interna, IP, path, tabela, query, tenant, contrato real ou ticket.
- Pedido de titular, evidência de incidente, log, dump, backup ou relatório cru.

## Referências

- `../templates/ropa-template.md`
- `../docs/lgpd-privacy-program.md`
- `data-map.md`
- `legal-bases.md`
- `third-party-processors.md`
- `../docs/evidence-and-reporting-policy.md`
