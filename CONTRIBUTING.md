# Contribuição

## Objetivo

Definir como propor mudanças pequenas, revisáveis e seguras neste baseline de auditoria, governança e segurança para SaaS.

Este guia complementa `docs/git-security-workflow.md`, `SECURITY.md`, `CODEOWNERS`, `docs/evidence-and-reporting-policy.md` e os checklists aplicáveis. Ele não torna o repositório certificado, livre de vulnerabilidades ou pronto para uso enterprise sem validação contextual.

## Princípios obrigatórios

- Trabalhe em uma mudança pequena por vez, com escopo claro.
- Não inclua segredos, credenciais, cookies, dados pessoais reais, tenants, URLs internas, payloads, PoCs, logs crus, dumps, backups ou evidências sensíveis.
- Não transforme templates, checklists ou políticas centrais em registros preenchidos de produto, cliente ou ambiente real.
- Não declare conformidade formal, certificação, ausência de vulnerabilidades ou aprovação jurídica sem evidência e autoridade externa apropriadas.
- Preserve fontes oficiais em `research/sources/` quando uma mudança introduzir nova referência normativa, técnica ou documental.
- Atualize `research/progress.md` e `research/task-queue.md` somente quando o escopo executado realmente mudar o estado do lote ou chunk.

## Fluxo recomendado

1. Leia `AGENTS.md`, `README.md`, `research/task-queue.md`, `research/progress.md` e o documento canônico do domínio.
2. Confirme se o arquivo pertence ao lote ou issue em execução.
3. Separe mudanças de política, checklist, script, workflow, template e pesquisa em PRs diferentes quando tiverem owners ou riscos distintos.
4. Use branch com nome seguro, sem cliente, tenant, host, segredo, vulnerabilidade explorável ou dado pessoal.
5. Edite somente os arquivos necessários.
6. Revise o diff contra exposição de conteúdo sensível antes de abrir PR.
7. Execute apenas validações autorizadas e registre resultados de forma sanitizada.
8. Peça revisão do owner competente antes de merge.

## Antes de abrir PR

- [ ] O escopo corresponde ao lote ou issue descrito?
- [ ] Arquivos fora do escopo ficaram inalterados?
- [ ] Links locais adicionados apontam para arquivos existentes?
- [ ] Fontes oficiais novas foram registradas em `research/sources/`?
- [ ] O texto diferencia obrigatório, desejável, melhoria futura e certificação formal quando aplicável?
- [ ] Não há promessa de conformidade, certificação, ausência de vulnerabilidades ou prontidão enterprise?
- [ ] Não há segredo, dado pessoal real, evidência crua, URL interna, tenant, payload ou request/response?
- [ ] Checklists e templates continuam genéricos e reutilizáveis?
- [ ] Scripts, workflows ou configurações foram validados somente quando pertenciam ao escopo aprovado?
- [ ] `research/progress.md` e `research/task-queue.md` foram atualizados apenas se o estado real mudou?

## Conteúdo permitido no Git

- políticas genéricas;
- templates vazios ou exemplos claramente fictícios;
- checklists e matrizes;
- documentação de governança;
- resumos sanitizados revisados;
- configurações sem segredos reais.

## Conteúdo proibido no Git

- segredos, tokens, credenciais, cookies e chaves privadas;
- dados pessoais reais ou identificadores correlacionáveis desnecessários;
- logs crus, dumps, backups, estados Terraform e exports;
- arquivos reais `site_config.json`, `common_site_config.json` ou equivalentes;
- relatórios integrais de scanners;
- requests/responses, payloads, PoCs ou detalhe explorável;
- URLs internas, hostnames, IPs, tenants, clientes ou fornecedores sensíveis.

## Evidências e findings

Evidência crua não deve entrar em issue, PR, commit, comentário, release ou artifact amplo. Use `reports/raw/` apenas como área local transitória e mantenha fora do Git.

Quando um finding precisar ser citado em PR:

- use ID opaco, como `FIND-042`;
- descreva impacto em nível seguro;
- referencie teste ou reteste sem colar saída sensível;
- mantenha reprodução, logs e detalhes exploráveis no canal restrito.

## Revisão e ownership

`CODEOWNERS` nesta baseline não inventa usuários ou equipes. O repositório consumidor deve substituir os placeholders comentados por owners reais com permissão de escrita e configurar branch protection ou rulesets quando aplicável.

Mudanças em segurança, privacidade, LGPD, acessibilidade, risco, CI/CD, incidentes, continuidade, Frappe/Python, pagamentos ou IA exigem revisor competente no domínio.

## Validações

Use validações proporcionais ao tipo de mudança. Exemplos:

- documentação: revisão de links locais, busca por placeholders vencidos e `git diff --check`;
- configuração de segredo: parsing da ferramenta quando instalada, scan com `--redact` e revisão de stdout/stderr;
- scripts: validação sintática e teste com fixture fictícia somente no lote próprio;
- workflows: validação de permissões, eventos, logs, artifacts e plano GitHub somente no lote próprio.

Se uma validação não foi executada, registre como não executada. Não trate como aprovação.

## Segurança durante a contribuição

Se encontrar segredo ou evidência sensível durante a contribuição, pare a exposição e siga `SECURITY.md`. Não abra PR para "limpar" o valor antes de revogação/rotação e avaliação de histórico.
