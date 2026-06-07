# Índice de Templates

## Objetivo

Centralizar modelos reutilizáveis para auditoria, governança, segurança, privacidade, incidentes, continuidade, fornecedores, acessibilidade, threat modeling e IA em SaaS.

> Os arquivos desta pasta são modelos vazios ou exemplos fictícios. Uma cópia preenchida pode se tornar **confidencial** ou **restrita** e não deve ser versionada sem revisão conforme `docs/evidence-and-reporting-policy.md`.

## Como usar

1. Copie somente o template necessário para o sistema autorizado de trabalho.
2. Mantenha marcadores como `[PRODUTO-A]`, `[TENANT-A]`, `[FORNECEDOR-A]`, `[RISCO-001]` e `[EV-SAN-001]` em exemplos versionados.
3. Guarde evidência crua, logs, dumps, backups e anexos em armazenamento restrito; `reports/raw/` é local e ignorado pelo Git.
4. Leve ao Git apenas estrutura genérica ou resumo sanitizado revisado.
5. Registre incertezas de contrato, legislação, ferramenta, edição normativa ou exigência enterprise.

## Catálogo

| Template | Uso principal | Relação interna |
|---|---|---|
| `risk-register-template.csv` | Inventário e tratamento de riscos | `risk/severity-and-prioritization.md` |
| `security-finding-template.md` | Registrar achado técnico validado | `docs/security-audit-baseline.md` |
| `remediation-plan-template.md` | Planejar correção e reteste | `docs/git-security-workflow.md` |
| `executive-summary-template.md` | Comunicar postura e decisões | `docs/security-roadmap.md` |
| `data-map-template.md` | Mapear dados e fluxos | `docs/lgpd-privacy-program.md` |
| `ropa-template.md` | Registrar operações de tratamento | `docs/lgpd-privacy-program.md` |
| `dpia-template.md` | Estruturar RIPD/DPIA | `docs/lgpd-privacy-program.md` |
| `incident-report-template.md` | Conduzir e registrar incidente | `docs/evidence-and-reporting-policy.md` |
| `postmortem-template.md` | Aprender após incidente ou falha | `docs/security-roadmap.md` |
| `backup-restore-test-template.md` | Evidenciar teste de recuperação | `docs/audit-types.md` |
| `vendor-risk-assessment-template.md` | Avaliar terceiro antes e durante uso | `docs/audit-trigger-matrix.md` |
| `accessibility-finding-template.md` | Registrar barreira de acessibilidade | `docs/accessibility-program.md` |
| `threat-model-template.md` | Modelar ativos, fluxos, ameaças e controles | `docs/security-audit-baseline.md` |
| `ai-risk-assessment-template.md` | Avaliar uso, fornecedor e impactos de IA | `docs/standards-and-frameworks-matrix.md` |

## Classificação e revisão mínima

- [ ] O arquivo contém somente o necessário e usa IDs opacos.
- [ ] Não há segredo, token, cookie, credencial, dado pessoal real, cliente, tenant, fornecedor real, URL privada, IP interno, log cru ou vetor explorável.
- [ ] Evidências aparecem apenas por referência sanitizada, como `[EV-SAN-001]`.
- [ ] Owner, revisor, status, data e incertezas foram preenchidos.
- [ ] Privacidade, Jurídico, Acessibilidade, Segurança, Operações ou Compras revisaram quando aplicável.
- [ ] O nome do arquivo e o histórico Git não revelam conteúdo sensível.

## Limites

Templates não provam conformidade, não substituem validação jurídica, contratual ou técnica e não tornam certificação formal obrigatória. Campos adicionais podem ser exigidos por cliente enterprise, contrato, setor regulado, ferramenta ou norma aplicável.
