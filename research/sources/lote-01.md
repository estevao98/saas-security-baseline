# Fontes do Lote 1 - Estrutura inicial

Data de acesso: **7 de junho de 2026**.

## Escopo

Este registro documenta as fontes internas, decisões e incertezas usadas na reconciliação do Lote 1 - Estrutura inicial.

Não foram consultadas novas fontes externas. Não houve revalidação de normas, versões de ferramentas, licenças, plano GitHub, actions, imagens, comandos ou requisitos jurídicos.

## Fontes internas consultadas

| Fonte | Uso na reconciliação |
|---|---|
| `AGENTS.md` | Regras obrigatórias de escopo, fontes, evidências, dados sensíveis e atualização de progresso. |
| `README.md` | Navegação pública, estado declarado e referências a próximos passos. |
| `docs/repository-architecture.md` | Árvore, classificação de artefatos e inconsistências entre estado-alvo e estado real. |
| `research/codex-execution-plan.md` | Escopo permitido do Lote 1, arquivos afetados, critérios de aceite e próximos lotes. |
| `research/coverage-audit.md` | Lacunas históricas e divergências que exigiam reconciliação. |
| `research/prompts.md` | Origem dos chunks, do Lote 1 e dos artefatos esperados. |
| `research/progress.md` | Histórico de execução e estado declarado após o Lote 3. |
| `research/task-queue.md` | Fila corretiva pós-auditoria e dependência do Lote 3. |
| `research/sources/chunk-15.md` | Evidência do fechamento corretivo dos checklists e limites pendentes. |
| `checklists/README.md` e `checklists/index.md` | Confirmação de navegação e estado dos checklists após o Lote 3. |
| `git ls-files` | Inventário de arquivos versionados sem incluir conteúdo ignorado ou relatórios crus. |
| Busca textual por placeholders | Identificação de placeholders reais, usos intencionais da palavra e documentos fora do escopo do Lote 1. |

## Decisões

- O Lote 1 foi tratado como reconciliação de navegação, inventário, arquitetura e estado declarado, não como correção de conteúdo dos próximos lotes.
- Foi criado `research/repository-inventory.md` porque o plano do Lote 1 exige inventário `esperado x existente x substantivo x placeholder x planejado`.
- `research/sources/chunk-01.md` não foi criado nem alterado para este lote, pois já representa o Chunk 1 - Matriz de normas, frameworks e referências. O arquivo apropriado para esta reconciliação é `research/sources/lote-01.md`.
- `research/coverage-audit.md` permaneceu sem alteração por ser um registro histórico do estado anterior aos fechamentos corretivos.
- Checklists individuais do Lote 3 não foram alterados, pois não foi necessário corrigir link quebrado, referência objetivamente incorreta ou informação sensível.
- Scripts, workflows, templates completos, documentos auxiliares, políticas raiz, privacidade e risco auxiliar foram apenas inventariados quando relevantes; a correção pertence aos lotes seguintes.

## Incertezas e pendências

- A classificação de alguns documentos auxiliares como placeholder permanece baseada em conteúdo mínimo e no plano corretivo; a decisão entre preencher, redirecionar ou remover fica para o Lote 2 ou lote de domínio.
- Workflows de exemplo continuam dependentes de validação de plano GitHub, permissões, referências imutáveis, logs, artifacts, rede e stack.
- Scripts locais continuam dependentes de testes com fixtures fictícias, versões aprovadas e validação de saída segura.
- Políticas raiz, CODEOWNERS e configuração de secret scanning ainda dependem de owners reais, canal privado, regras revisadas e decisão do mantenedor.
- LGPD, acessibilidade, backend/Python, pagamentos, continuidade, IA e requisitos enterprise continuam contextuais e exigem revisão competente quando aplicável.

## Limites de segurança

- Não foram criados dados pessoais, dados de cliente, tenants, URLs internas, logs crus, dumps, backups, payloads, PoCs, requests/responses, tokens, cookies, credenciais ou exemplos semelhantes a credenciais.
- Não foram lidos nem inventariados conteúdos de `reports/raw/` ou outros caminhos ignorados.
- Não foram executados scanners, workflows, scripts de auditoria, chamadas externas, testes ofensivos ou coleta de evidências reais.
- Não há declaração de certificação, conformidade formal, prontidão enterprise, acessibilidade integral ou ausência de vulnerabilidades.
