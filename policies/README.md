# Políticas

## Objetivo

Organizar as políticas e guias operacionais aplicáveis ao baseline sem duplicar os arquivos raiz e documentos canônicos.

Esta pasta é um índice de navegação. Políticas centrais permanecem nos arquivos raiz ou em `docs/`.

## Fontes Internas

| Política ou guia | Arquivo |
|---|---|
| Reporte de vulnerabilidades e segredos | `../SECURITY.md` |
| Contribuição segura | `../CONTRIBUTING.md` |
| Ownership comentado | `../CODEOWNERS` |
| Evidências e artifacts | `../docs/evidence-and-reporting-policy.md` |
| Git, branches, issues e PRs | `../docs/git-security-workflow.md` |
| GitHub Actions | `../docs/github-actions-strategy.md` |
| LGPD e privacidade | `../docs/lgpd-privacy-program.md` |
| Acessibilidade | `../docs/accessibility-program.md` |

## Regras

- Não criar política nova quando houver documento canônico aplicável.
- Não preencher owners, contatos, SLAs ou canais reais neste template sem decisão do repositório consumidor.
- Registrar fontes em `../research/sources/` quando uma política introduzir referência oficial nova.

## Pendências

- Owners reais, canal privado, branch protection e regras de organização dependem do consumidor.
