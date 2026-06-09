# Privacidade

## Objetivo

Organizar artefatos operacionais de privacidade e LGPD sem transformar este repositório em registro real de tratamento.

Esta pasta contém guias pequenos para executar triagem, governança e revisão de privacidade. A fonte canônica continua sendo `../docs/lgpd-privacy-program.md`; registros reais, pareceres, contratos, pedidos de titulares e incidentes ficam fora do Git.

## Fontes Internas

| Uso | Arquivo |
|---|---|
| Programa canônico | `../docs/lgpd-privacy-program.md` |
| Gap assessment | `../docs/lgpd-gap-assessment.md` |
| Checklist executável | `../checklists/lgpd.md` |
| Mapa de dados | `../templates/data-map-template.md` |
| ROPA | `../templates/ropa-template.md` |
| RIPD/DPIA | `../templates/dpia-template.md` |
| Fornecedores | `../templates/vendor-risk-assessment-template.md`, `../checklists/third-party-risk.md` |
| Evidências | `../docs/evidence-and-reporting-policy.md` |

## Artefatos

| Arquivo | Papel operacional |
|---|---|
| `data-map.md` | Roteiro para mapear fluxos, sistemas, logs, backups, fornecedores e descarte. |
| `ropa.md` | Roteiro para registro de operações de tratamento, sem substituir o template completo. |
| `legal-bases.md` | Triagem de hipóteses legais candidatas por finalidade, sem escolha automática. |
| `data-subject-rights.md` | Procedimento mínimo para receber, autenticar, executar e registrar direitos. |
| `retention-policy.md` | Roteiro para retenção, descarte, exceções e legal hold por categoria. |
| `third-party-processors.md` | Registro sanitizado de operadores, suboperadores, terceiros e transferências. |
| `incident-personal-data.md` | Playbook mínimo para suspeita ou incidente com dado pessoal. |
| `dpia-template.md` | Guia de uso do template RIPD/DPIA e gatilhos de revisão. |
| `privacy-by-design-checklist.md` | Checklist operacional para discovery, arquitetura, release e mudança material. |

## Regras

- Não decidir base legal automaticamente.
- Não registrar dados pessoais reais, pedidos de titulares, contratos, comunicações à ANPD/titulares ou incidentes reais.
- Usar categorias, IDs opacos e exemplos fictícios quando algo for versionado.
- Levar registros reais para sistema restrito do SaaS consumidor.
- Registrar evidências somente por IDs opacos e seguir `../docs/evidence-and-reporting-policy.md`.
- Submeter papéis, bases legais, RIPD, retenção, transferência internacional, contratos e comunicação de incidentes a Privacidade/Jurídico quando aplicável.

## Limites

- Estes arquivos não são parecer jurídico, certificação, declaração de conformidade ou prova de ausência de risco.
- Templates completos permanecem em `../templates/`; esta pasta orienta uso e governança sem duplicar integralmente os modelos.
- Cópias preenchidas podem ser confidenciais ou restritas e devem ser armazenadas em sistema autorizado.
