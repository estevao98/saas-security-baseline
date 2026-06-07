# Fontes do Chunk 14

Data de acesso: **7 de junho de 2026**.

## Critério de pesquisa

Foram priorizados GitHub Docs e os documentos internos já aprovados. As funções do GitHub foram tratadas como capacidades técnicas sujeitas a plano, licença, proprietário e configuração, não como requisitos universais. A política operacional, os nomes de labels e os níveis de aprovação são decisões deste baseline.

## Fontes internas

| Fonte | Uso |
|---|---|
| `AGENTS.md` | Regras de escopo, fontes, evidências, dados sensíveis e atualização do chunk. |
| `research/prompts.md` | Escopo original e exemplos obrigatórios do Chunk 14. |
| `research/task-queue.md` | Critérios de aceite e status anterior. |
| `research/progress.md` | Continuidade e registro da execução. |
| `docs/repository-architecture.md` | Responsabilidade das pastas, artefatos permitidos e material fora do Git. |
| `docs/security-roadmap.md` | Fases MVP seguro, SaaS vendável e SaaS maduro. |
| `docs/audit-types.md` | Revisão de código, findings, falsos positivos e bloqueios. |
| `docs/audit-trigger-matrix.md` | Gatilhos, revisores e decisões Go/No-Go. |
| `docs/security-tools-catalog.md` | Limites de scanners, gates e risco das saídas. |
| `docs/github-actions-strategy.md` | Checks, branch protection por fase, artifacts, logs e permissões. |
| `docs/evidence-and-reporting-policy.md` | Sanitização, issues/PRs, segredos, artifacts e evidências. |
| `docs/security-audit-baseline.md` | IDs e relações de findings, riscos, evidências, remediação e releases. |
| `risk/severity-and-prioritization.md` | Severidade, prioridade, SLA, aceite, reteste e bloqueios de release. |

## Fontes oficiais

| ID | Fonte | URL | Uso |
|---|---|---|---|
| S1 | GitHub Docs - About rulesets | https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets | Sobreposição de rulesets, proteção de branches/tags e disponibilidade por plano. |
| S2 | GitHub Docs - Available rules for rulesets | https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets | PR obrigatória, checks, commits assinados, histórico linear, deployments, bloqueio de force-push e restrições. |
| S3 | GitHub Docs - Managing a branch protection rule | https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule | Reviews, CODEOWNERS, approvals obsoletas, resolução de conversas, merge queue e bypass. |
| S4 | GitHub Docs - Working with push protection from the command line | https://docs.github.com/en/code-security/secret-scanning/working-with-secret-scanning-and-push-protection/working-with-push-protection-from-the-command-line | Bloqueio, remoção do segredo de commits e opções de bypass. |
| S5 | GitHub Docs - Push protection | https://docs.github.com/en/code-security/concepts/secret-security/push-protection | Finalidade preventiva e superfícies cobertas por push protection. |
| S6 | GitHub Docs - Linking a pull request to an issue | https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/linking-a-pull-request-to-an-issue | Vínculo entre branch/PR e issue e efeito dos closing keywords na branch padrão. |
| S7 | GitHub Docs - About milestones | https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/about-milestones | Agrupamento e acompanhamento de issues e PRs por milestone. |
| S8 | GitHub Docs - About releases | https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases | Relação entre release, tag e ponto do histórico; notas e assets. |
| S9 | GitHub Docs - About commit signature verification | https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification | GPG, SSH e S/MIME, status de verificação e limites do rebase and merge. |
| S10 | GitHub Docs - Privately reporting a security vulnerability | https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability | Escopo de private vulnerability reporting e relação com repositórios públicos. |
| S11 | GitHub Docs - Managing privately reported security vulnerabilities | https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/managing-privately-reported-security-vulnerabilities | Triagem privada, draft advisory, colaboração e fechamento. |

## Síntese das validações

- Rulesets podem se sobrepor e controlar branches e tags. Branch protection clássica continua disponível e cobre PRs, reviews, checks, assinaturas, histórico e restrições.
- Rulesets para repositórios privados estão documentados para GitHub Pro, Team e Enterprise Cloud; push rulesets em repositórios privados têm disponibilidade adicional ligada a Team/Enterprise. A configuração real deve ser confirmada.
- Closing keywords vinculam e fecham issues quando a PR mira a branch padrão. Em fluxo com `develop`, o vínculo/fechamento precisa ser deliberado.
- Releases do GitHub são baseadas em tags. Proteger e, conforme maturidade, assinar tags reduz risco de publicação a partir de revisão incorreta.
- Commits e tags podem ser assinados com GPG, SSH ou S/MIME. O método `Rebase and Merge` pode produzir commits modificados que não preservam a verificação original, portanto a política de assinatura deve ser testada com o método de merge adotado.
- Push protection bloqueia segredos suportados antes da entrada no repositório, mas permite fluxos de bypass conforme configuração. Este baseline exige remover/revogar segredos reais e restringe bypass.
- A documentação consultada descreve private vulnerability reporting para repositórios públicos. Este repositório é privado; findings sensíveis devem usar tracker restrito próprio e a capacidade aplicável deve ser confirmada no plano.

## Decisões e incertezas

- Trunk-based com branches curtas e `develop` condicional é decisão arquitetural deste baseline, não exigência do GitHub.
- Uma ou duas aprovações, labels propostas, padrões de branch e critérios de hotfix são controles internos ajustáveis por equipe, risco e segregação.
- Recursos como rulesets, push rulesets, merge queue, environments, required deployments, code scanning, secret scanning, custom roles e bypass lists dependem de plano, licença, proprietário e configuração atuais.
- Tornar commits assinados obrigatórios exige validar bots, merges, automações e método de merge. Assinatura não substitui revisão ou checks.
- Proteção de tags e regras de metadata podem depender do tipo de ruleset e do plano vigente.
- Risco aceito, disclosure, comunicação de incidente, retenção e participação jurídica dependem de contrato, política interna e contexto legal.
- Não foram criados workflows, scripts, templates completos, relatórios crus, secrets, credenciais, payloads ou dados pessoais. Nenhum outro chunk foi executado.
