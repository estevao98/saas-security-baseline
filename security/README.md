# Segurança

## Objetivo

Organizar a navegação de segurança para aplicação, plataforma, segredos, incidentes, evidências, riscos e auditorias.

Esta pasta não deve receber findings exploráveis, segredos, logs crus, relatórios integrais, payloads, PoCs, URLs internas, requests/responses ou dados pessoais.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Política de segurança | `../SECURITY.md` |
| Roadmap | `../docs/security-roadmap.md` |
| Tipos e gatilhos de auditoria | `../docs/audit-types.md`, `../docs/audit-trigger-matrix.md` |
| Ferramentas | `../docs/security-tools-catalog.md` |
| Evidências | `../docs/evidence-and-reporting-policy.md` |
| Relatório final | `../docs/security-audit-baseline.md` |
| Risco e severidade | `../risk/severity-and-prioritization.md` |
| Checklists | `../checklists/README.md` |

## Fluxo Seguro

1. Defina escopo, risco, dados e revisores.
2. Use checklist e ferramenta adequados ao gatilho.
3. Guarde cru fora do Git.
4. Registre findings por ID opaco e sem detalhe explorável.
5. Encerrar somente após correção, reteste, falso positivo aprovado ou aceite formal.

## Pendências

- Secret scanning completo, branch protection, owners reais e scanners especializados dependem dos lotes posteriores ou do repositório consumidor.
