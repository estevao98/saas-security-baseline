# Política de Retenção e Descarte

## Objetivo

Orientar a definição de retenção, descarte, exceções e evidências para dados pessoais em SaaS sem fixar prazos universais e sem registrar dados reais.

Prazos definitivos dependem de finalidade, contrato, obrigação legal, defesa de direitos, incidente, setor, arquitetura e validação por Privacidade/Jurídico.

## Escopo

Cobrir sistemas ativos, banco, arquivos, busca, cache, filas, logs, analytics, suporte, integrações, fornecedores, backups, restores, exports, evidências e ambientes não produtivos autorizados.

## Tabela mínima de decisão

| Campo | Conteúdo esperado |
|---|---|
| ID | `[RET-001]` ou vínculo com `[ROPA-001]`. |
| Categoria | Categoria abstrata de dado e titular, sem valor real. |
| Finalidade | Finalidade específica e owner. |
| Evento inicial | Criação, encerramento, solicitação, expiração, contrato ou outro gatilho validado. |
| Critério de retenção | Prazo ou regra a validar juridicamente. |
| Fundamento | Base operacional, legal, contratual ou defesa de direitos a confirmar. |
| Sistemas | Sistemas abstratos, fornecedores e backups afetados. |
| Descarte | Exclusão, anonimização validada, bloqueio, retorno ou descarte seguro. |
| Exceções | Legal hold, incidente, disputa, obrigação ou retenção técnica temporária. |
| Evidência | ID opaco de execução, amostra agregada ou atestado. |

## Processo operacional

1. Vincular cada regra a uma finalidade em `legal-bases.md` e uma operação em `ropa.md`.
2. Definir owner técnico e owner de privacidade para cada categoria.
3. Diferenciar sistemas ativos, logs, backups, relatórios, exports e fornecedores.
4. Documentar atrasos técnicos e reconciliação pós-restore.
5. Testar expiração, exclusão, bloqueio ou anonimização com dados sintéticos.
6. Registrar exceções com aprovador, prazo e revisão.
7. Produzir evidência agregada, sem conteúdo pessoal.

## Regras de segurança

- Não usar retenção indefinida como padrão.
- Não restaurar dado excluído para uso ativo sem reconciliação pós-restore.
- Não tratar pseudonimização como descarte ou anonimização efetiva.
- Não copiar produção para teste para validar descarte.
- Não versionar logs, exports, tickets, dumps, backups ou listas de titulares.

## Pendências contextuais

- Prazos legais, fiscais, contratuais e de defesa de direitos precisam de validação jurídica.
- Incidentes com dados pessoais têm regra própria de registro e retenção conforme regulamento vigente; validar o texto consolidado no caso real.
- Fornecedores devem comprovar retorno, exclusão ou retenção conforme contrato e risco.

## Referências

- `../docs/lgpd-privacy-program.md`
- `../docs/evidence-and-reporting-policy.md`
- `data-map.md`
- `ropa.md`
- `legal-bases.md`
- `third-party-processors.md`
