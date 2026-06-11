# Limpeza de termos proibidos — 2026-06-11

## Escopo

- Continuidade do commit WIP existente, sem reexecutar a criação do baseline.
- Verificação de ausência de termos proibidos no conteúdo rastreado.
- Verificação de ausência de termos proibidos em caminhos rastreados.
- Validação externa simples de links Markdown internos, sem versionar script novo.
- Validação de sintaxe Bash e smoke tests locais dos scripts restantes.

## Fontes consultadas

- Fontes internas do repositório: `AGENTS.md`, `research/task-queue.md`, `research/progress.md`, `.github/workflows/security.yml`, `scripts/*.sh` e `tests/scripts/run-script-smoke-tests.sh`.
- Não foram consultadas fontes externas nesta limpeza.

## Validações executadas

- `git grep -niE <padrao-de-termos-proibidos>` retornou vazio.
- `git ls-files | grep -Ei <padrao-de-caminhos-proibidos>` retornou vazio.
- Validação externa de links Markdown internos confirmou que os alvos relativos existem.
- `bash -n scripts/*.sh tests/scripts/run-script-smoke-tests.sh` passou.
- `./tests/scripts/run-script-smoke-tests.sh` passou com stubs locais, sem rede externa real.

## Decisões

- O workflow ativo permanece sem validador Python inline de links Markdown.
- A checagem de links internos foi mantida como validação terminal externa nesta rodada, evitando o erro anterior de string literal mal escapada.
- Nenhum commit foi criado.

## Limites

- Esta limpeza não reescreve histórico Git já existente.
- A validação de links externos não foi executada.
- Scanners reais, rede externa e alvos reais não foram executados.
