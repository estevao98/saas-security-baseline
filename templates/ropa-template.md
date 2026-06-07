# Template de ROPA

## Objetivo e quando usar

Registrar operações de tratamento de dados pessoais de forma rastreável. Usar antes de iniciar tratamento material e revisar após mudança de finalidade, dado, titular, sistema, fornecedor, país, retenção, base legal ou papel do agente.

> ROPA é uma denominação prática de registro de operações. O conteúdo exigível depende do papel, contexto, contrato e orientação jurídica aplicável.

## Campos obrigatórios

| Campo | Valor |
|---|---|
| ID, operação e owner | `[ROPA-001]`, `[OPERACAO-FICTICIA]`, `[PAPEL]` |
| Finalidade e necessidade | `[FINALIDADE]` e `[POR-QUE-E-NECESSARIO]` |
| Controlador/operador | `[PAPEL-A-VALIDAR]` |
| Titulares e dados | Categorias, incluindo sensíveis quando aplicável |
| Operações e sistemas | Coleta, uso, armazenamento, compartilhamento e descarte em nível abstrato |
| Hipótese legal | `[BASE-A-VALIDAR-JURIDICAMENTE]` |
| Destinatários/suboperadores | `[FORNECEDOR-A]` e papel |
| Retenção e descarte | Evento inicial, prazo/critério e exceção |
| Segurança e direitos | Controles, canal e capacidade de atendimento |
| Transferência e evidência | País/mecanismo a validar; IDs opacos |

## Campos opcionais

Volume/faixa, frequência, LIA, RIPD, decisão automatizada, crianças/adolescentes, fonte pública, consentimento/versionamento, contrato/DPA, métricas e próxima revisão.

## Exemplo fictício

`[ROPA-001]` descreve a gestão de conta em `[PRODUTO-A]`, para `[CATEGORIA-DE-USUARIO]`, com `[CATEGORIA-DE-DADO]`, retenção `[CRITERIO-A]`, suporte de `[FORNECEDOR-A]` e base `[A-VALIDAR]`. Nenhum registro pessoal é anexado.

## Cuidados e revisão antes de compartilhar

- [ ] Não inserir titulares, contatos, clientes, contratos, URLs, tabelas, campos reais ou credenciais.
- [ ] Não selecionar base legal por conveniência; registrar responsável e validação jurídica.
- [ ] Conciliar com mapa de dados, avisos, contratos, retenção, fornecedores e produto real.
- [ ] Privacidade, Jurídico, Produto, Engenharia e Segurança revisam seus domínios.
- [ ] Versionar apenas estrutura vazia ou resumo sanitizado aprovado.

## Relação com o repositório

Usar com `templates/data-map-template.md`, `templates/dpia-template.md`, `docs/lgpd-privacy-program.md` e `docs/evidence-and-reporting-policy.md`.
