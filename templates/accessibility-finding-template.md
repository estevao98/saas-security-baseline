# Template de Achado de Acessibilidade

## Objetivo e quando usar

Registrar barreira reproduzível, impacto na tarefa e correção verificável. Usar em avaliação manual ou automatizada após validação humana; automação isolada não prova conformidade.

## Campos obrigatórios

- ID `[A11Y-001]`, título centrado na barreira e status;
- produto, fluxo, página/estado em nível seguro e tecnologia avaliada;
- método, navegador, tecnologia assistiva/dispositivo e data;
- grupo/necessidade afetada e impacto funcional;
- critério WCAG aplicável, versão e nível, sem afirmar aplicação legal automática;
- passos seguros com conteúdo fictício, esperado e observado;
- frequência/alcance, severidade/prioridade e justificativa;
- recomendação, critério de aceite, owner, prazo e reteste;
- evidência sanitizada por ID.

## Campos opcionais

Ferramenta/regra, componente de design system, viewport/zoom, alternativa temporária, ABNT aplicável a validar, release e vínculo com issue.

## Exemplo fictício

`[A11Y-001]`: no fluxo fictício de confirmação de `[PRODUTO-A]`, o foco não chega ao controle final usando apenas teclado. Isso bloqueia a tarefa; prioridade P1, owner `[PAPEL-FRONTEND]`, reteste manual e evidência `[EV-SAN-001]`.

## Cuidados e revisão antes de compartilhar

- [ ] Não usar gravação, screenshot, nome, voz, conta, conteúdo ou tecnologia assistiva vinculada a pessoa real sem consentimento e governança.
- [ ] Não incluir URL privada, DOM completo, dado pessoal, sessão, token ou conteúdo de cliente.
- [ ] Confirmar manualmente o resultado de ferramenta e descrever impacto, não apenas regra técnica.
- [ ] Revisor com competência em acessibilidade valida critério, severidade, solução e reteste.
- [ ] Verificar regressão com teclado e tecnologias aplicáveis no fluxo crítico.

## Relação com o repositório

Segue `docs/accessibility-program.md`, `risk/severity-and-prioritization.md`, `docs/evidence-and-reporting-policy.md` e os checklists de acessibilidade e release.
