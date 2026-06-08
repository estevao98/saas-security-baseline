# DevSecOps

## Objetivo

Organizar referências para integrar segurança ao ciclo de desenvolvimento, CI/CD, releases, scripts locais e evidências.

Não use esta pasta para logs de pipeline, artifacts crus, tokens, secrets, relatórios integrais ou outputs de scanners.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Estratégia GitHub Actions | `../docs/github-actions-strategy.md` |
| Workflow ativo mínimo | `../.github/workflows/security.yml` |
| Exemplos não ativos | `../examples/github-workflows/` |
| Scripts locais | `../scripts/README.md` |
| Ferramentas | `../docs/security-tools-catalog.md` |
| Git seguro | `../docs/git-security-workflow.md` |
| Checklist CI/CD | `../checklists/ci-cd-security.md` |
| Evidências | `../docs/evidence-and-reporting-policy.md` |

## Estado Atual

- Somente `.github/workflows/security.yml` está ativo por padrão.
- O workflow ativo faz controles mínimos de política e higiene documental.
- Secret scanning completo, SAST, SCA, DAST, SBOM, acessibilidade e gates especializados permanecem pendentes de validação contextual.

## Pendências

- Lote 5 para validar scripts com fixtures fictícias.
- Lote 10 para reforçar controles de evidências e risco auxiliar.
- Repositório consumidor para branch protection, owners reais, secrets, plano GitHub e gates obrigatórios.
