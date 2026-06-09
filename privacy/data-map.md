# Mapa de Dados Pessoais

## Objetivo

Orientar a criação de um mapa de dados pessoais para SaaS sem registrar dados pessoais reais neste repositório.

Use o template completo em `../templates/data-map-template.md`. Este arquivo define como conduzir a coleta, revisar cobertura e proteger evidências.

## Quando usar

- Antes de produção com dados pessoais.
- Antes de nova finalidade, campo, evento, integração, fornecedor, país, analytics, IA ou decisão automatizada.
- Antes de migração, mudança de arquitetura, novo log, novo backup ou novo fluxo de suporte.
- Após incidente, reclamação, falha de direito ou divergência entre produto e aviso de privacidade.

## Escopo mínimo

| Área | Perguntas de mapeamento | Evidência segura |
|---|---|---|
| Coleta | Qual categoria de dado, titular, origem, finalidade e necessidade? | ID de fluxo e categoria, sem valor real. |
| Uso | Qual sistema, operação, papel e tenant abstrato processam o dado? | Diagrama sanitizado ou tabela por categoria. |
| Compartilhamento | Qual destinatário, fornecedor, papel e finalidade recebem acesso? | Registro por `[FORNECEDOR-A]` ou categoria. |
| Armazenamento | Onde ficam banco, arquivo, busca, cache, fila, log e backup? | Sistema abstrato, sem host, URL ou path real. |
| Retenção | Qual evento inicial, critério, exceção e descarte se aplicam? | Referência a `retention-policy.md`. |
| Direitos | Como localizar, corrigir, exportar, bloquear ou excluir? | Resultado de exercício sintético. |
| Incidentes | Como identificar dado exposto e sistemas afetados? | ID de runbook, sem evidência crua. |

## Processo operacional

1. Definir owner de Produto, Engenharia, Segurança, Privacidade e operação de dados.
2. Listar fluxos por finalidade, não por tabela isolada.
3. Cobrir produção, suporte, observabilidade, analytics, IA, integrações, backups e descarte.
4. Registrar categorias abstratas de titulares e dados; nunca valores, nomes, documentos, contatos, mensagens ou tickets reais.
5. Vincular cada fluxo a ROPA, bases legais candidatas, retenção, fornecedores e controles técnicos.
6. Revisar inconsistências com avisos, termos, contratos e comportamento real do produto.
7. Armazenar mapa real em sistema restrito; versionar somente roteiro ou resumo sanitizado aprovado.

## Campos de controle

| Campo | Uso |
|---|---|
| ID do fluxo | Identificador opaco, como `[FLUXO-001]`. |
| Owner | Papel ou equipe, nunca pessoa real neste baseline. |
| Revisores | Privacidade, Jurídico, Produto, Engenharia e Segurança conforme risco. |
| Status | Rascunho, em revisão, aprovado para escopo, pendente ou substituído. |
| Evidência | ID opaco em armazenamento restrito ou resumo em `reports/sanitized/`. |
| Próxima revisão | Data, release ou gatilho material. |

## Limites

- O mapa não escolhe base legal, papel jurídico ou prazo definitivo.
- O mapa não comprova conformidade com a LGPD.
- O mapa real pode revelar arquitetura, fornecedores e dados pessoais; não deve ser commitado.

## Referências

- `../docs/lgpd-privacy-program.md`
- `../templates/data-map-template.md`
- `ropa.md`
- `legal-bases.md`
- `retention-policy.md`
- `../docs/evidence-and-reporting-policy.md`
