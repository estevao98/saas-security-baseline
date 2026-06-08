# Política de Segurança

## Objetivo

Definir como relatar, triar e tratar vulnerabilidades, segredos expostos e incidentes de segurança relacionados a este baseline ou a um SaaS que o reutilize.

Este arquivo é uma política operacional de referência. Ele não declara conformidade formal, certificação, ausência de vulnerabilidades, prontidão enterprise ou aprovação jurídica/contratual.

## Escopo

| Item | Status nesta baseline | Observação |
|---|---|---|
| Documentos, checklists, templates e políticas versionados | Suportados como baseline genérica | Use apenas dados fictícios ou conteúdo sanitizado. |
| Scripts locais | Disponíveis com ressalvas | Não executar contra produção, terceiros ou alvos sem autorização explícita. |
| Workflows | Parcial | Somente `.github/workflows/security.yml` está ativo por padrão; secret scanning completo fica para lote próprio. |
| Relatórios e evidências reais | Fora do Git | Material cru deve permanecer em `reports/raw/` local ou armazenamento restrito. |
| SaaS consumidor | Contextual | Canal privado, owners, SLAs, plano GitHub e obrigações legais devem ser definidos pelo projeto real. |

## Como relatar problema de segurança

Não abra issue pública ou PR com detalhes de vulnerabilidade, segredo, dado pessoal, URL interna, request/response, payload, log cru, print sem redaction ou evidência sensível.

Use o canal privado aprovado pelo mantenedor do repositório consumidor. Se esse canal ainda não existir, interrompa a exposição, preserve apenas a evidência mínima em local restrito e peça ao mantenedor para definir o canal antes de compartilhar detalhes.

Inclua somente o mínimo necessário:

- tipo do problema em nível abstrato;
- impacto suspeito ou confirmado;
- componente ou área em termos genéricos;
- versão, commit ou data aproximada quando seguro;
- se há segredo, dado pessoal, tenant, cliente, produção ou terceiro envolvido;
- contato operacional já autorizado pelo projeto, quando aplicável.

Não inclua:

- segredo, token, cookie, chave, certificado privado ou string de conexão;
- dado pessoal real ou identificador de titular, cliente, tenant ou fornecedor;
- payload ofensivo, PoC explorável, request/response integral ou passo a passo de abuso;
- URL interna, hostname, IP, bucket, path absoluto, log cru, dump, backup ou screenshot sem redaction;
- relatório integral de scanner.

## Triagem e resposta

1. Classificar a entrada como vulnerabilidade, segredo exposto, incidente, falso positivo, erro de configuração ou melhoria de hardening.
2. Confirmar escopo e sensibilidade sem copiar evidência crua para Git, issue comum ou comentário de PR.
3. Priorizar por `risk/severity-and-prioritization.md` e pelos gates de `docs/audit-trigger-matrix.md`.
4. Registrar finding, risco ou incidente por ID opaco em canal adequado.
5. Definir owner, prazo, critério de aceite, plano de correção e reteste.
6. Bloquear merge, release ou compartilhamento quando houver segredo ativo, crítico confirmado, quebra multi-tenant, dado pessoal exposto, incidente em curso ou gate obrigatório não executado.
7. Encerrar somente após correção, mitigação validada, falso positivo aprovado ou aceite de risco formal e temporário.

Scanner que não executou, falhou tecnicamente ou não produziu evidência não equivale a resultado limpo.

## Segredos expostos

Se um segredo real ou potencialmente ativo for encontrado:

1. Pare push, merge, release, upload e compartilhamento.
2. Trate o valor como comprometido.
3. Revogue ou rotacione por canal externo apropriado; remover a linha não encerra o incidente.
4. Avalie exposição em histórico Git, branches, forks, logs, artifacts, caches, issues, PRs e cópias locais.
5. Preserve evidência mínima em armazenamento restrito, sem registrar o valor no Git.
6. Registre resumo sanitizado com tipo, impacto, contenção, rotação, revisão de uso e prevenção.

`.gitleaks.toml` e `.secrets.baseline` apoiam prevenção, mas não substituem GitHub secret scanning, revisão humana, proteção de push, rotação, gestão de chaves ou resposta a incidentes.

## Divulgação

Este repositório é privado e não define divulgação pública por padrão. Qualquer comunicação externa, advisory, aviso a cliente, titular, regulador ou terceiro depende de Segurança, Privacidade, Jurídico, Comunicação, contrato e lei aplicável.

Não publique detalhe explorável enquanto houver versão vulnerável suportada, segredo ativo, risco de abuso, cliente sem correção ou investigação em andamento.

## Evidências e retenção

Siga `docs/evidence-and-reporting-policy.md`:

- `reports/raw/` fica fora do Git e deve ser tratado como área local transitória;
- `reports/sanitized/` recebe apenas resumo minimizado, redigido e revisado;
- issues, PRs e commits usam IDs opacos e linguagem segura;
- retenção, descarte e cadeia de custódia dependem da classificação e do contexto.

## Fora de escopo

- autorização para testar terceiros, produção ou clientes;
- pentest ofensivo, exploração ativa ou criação de PoCs;
- decisão jurídica, base legal, comunicação regulatória ou certificação;
- promessa de conformidade, segurança integral, acessibilidade integral ou prontidão enterprise.

## Referências internas

- `docs/git-security-workflow.md`
- `docs/evidence-and-reporting-policy.md`
- `docs/github-actions-strategy.md`
- `docs/security-tools-catalog.md`
- `risk/severity-and-prioritization.md`
- `checklists/ci-cd-security.md`
- `checklists/incident-response.md`
