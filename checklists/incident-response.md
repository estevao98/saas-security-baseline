# Checklist de Resposta a Incidentes

## Objetivo

Verificar se a organização consegue triar, conter, preservar evidências, comunicar, recuperar, aprender e corrigir diante de suspeita ou confirmação de incidente em SaaS, sem expor vítimas, clientes, dados pessoais, segredos ou detalhes exploráveis.

Decisões jurídicas, regulatórias, contratuais, de comunicação externa e de notificação à ANPD, titulares, clientes, autoridades ou público exigem revisão humana competente no caso concreto.

## Quando usar

- [ ] Na preparação do plano, runbooks, contatos e canais de incidente.
- [ ] Em tabletop, simulado, exercício técnico ou revisão periódica.
- [ ] Ao receber alerta, suspeita, vulnerabilidade explorada, segredo exposto, indisponibilidade relevante ou possível vazamento.
- [ ] Antes de venda enterprise ou compromisso contratual que exija capacidade de resposta.
- [ ] Após qualquer incidente para validar encerramento, postmortem e ações corretivas.

## Revisor responsável

- [ ] Incident commander ou responsável de resposta a incidentes coordenou a revisão.
- [ ] Segurança/IR revisou triagem, contenção, evidência, erradicação, recuperação e monitoramento.
- [ ] Donos técnicos dos sistemas afetados revisaram impacto, correção e reteste.
- [ ] Privacidade/Encarregado e Jurídico revisaram dados pessoais, papéis, risco/dano e comunicação quando aplicável.
- [ ] Comunicação, Suporte, Comercial ou liderança revisaram mensagens externas somente quando autorizadas e necessárias.

## Evidências esperadas

- [ ] Registro restrito do incidente ou exercício com ID opaco, status, severidade, owners e canal autorizado.
- [ ] Linha do tempo sanitizada separando fato, hipótese e decisão, sem IP, domínio, URL, tenant, conta, vítima ou atacante real.
- [ ] Evidência de triagem de severidade, escopo, impacto, sistemas, dados, tenants em categorias agregadas e risco residual.
- [ ] Registro de preservação de evidência, cadeia de custódia e acesso nominal no sistema restrito.
- [ ] Registro de contenção, erradicação, recuperação, validação, monitoramento e critérios de retorno.
- [ ] Decisão documentada sobre notificação, comunicação e escalonamento, com aprovadores competentes.
- [ ] Postmortem sanitizado e plano de ações corretivas com owner, prazo, critério de aceite e reteste.

## Itens obrigatórios

- [ ] Existe canal restrito de acionamento e coordenação que não depende do sistema possivelmente comprometido.
- [ ] Papéis mínimos estão definidos: incident commander, segurança, owner técnico, operações, privacidade, jurídico e comunicação conforme severidade.
- [ ] Lista de contatos críticos é mantida fora do Git, protegida, revisada e testada periodicamente.
- [ ] Triagem inicial classifica evento, suspeita, incidente confirmado, severidade, escopo, impacto e necessidade de escalonamento.
- [ ] Critérios de severidade consideram dados pessoais, segredo, tenant, autenticação, pagamento, disponibilidade, supply chain e exploração ativa.
- [ ] A contenção preserva evidência relevante e evita ações improvisadas que destruam trilha sem aprovação.
- [ ] Evidência crua, logs, memória, dumps, alertas, indicadores e artefatos forenses ficam em armazenamento restrito, nunca no Git.
- [ ] Decisões e ações registram horário, fonte, responsável, aprovação e resultado, com fuso e relógio consistentes.
- [ ] Quando há segredo exposto, o fluxo inclui revogação/rotação, investigação de uso e prevenção de recorrência, sem preservar o valor do segredo no relatório.
- [ ] Quando há possível dado pessoal, o fluxo aciona Privacidade/Jurídico para avaliar risco ou dano relevante, papéis de controlador/operador e comunicações aplicáveis.
- [ ] Comunicação interna e externa usa mensagens aprovadas, minimizadas e coerentes com fatos confirmados.
- [ ] Recuperação valida acesso, integridade, isolamento entre tenants, correção aplicada, regressão e monitoramento antes de retorno normal.
- [ ] Encerramento exige critério objetivo, riscos residuais, ações pendentes, owners e decisão formal.
- [ ] Postmortem é produzido em versão sanitizada quando apropriado, sem vetor explorável, pessoa, cliente, tenant ou infraestrutura real.
- [ ] Ações corretivas e preventivas entram no backlog com prioridade, SLA, owner, reteste e gatilho de reabertura.

## Itens desejáveis

- [ ] Executar tabletop semestral com cenário fictício e ata sanitizada.
- [ ] Executar teste técnico anual de detecção, contenção e recuperação em ambiente autorizado e sintético.
- [ ] Validar canais fora de banda, alternância de incident commander e disponibilidade de contatos críticos.
- [ ] Medir MTTD, MTTR, tempo de escalonamento e eficácia de ações sem incentivar ocultação de incidentes.
- [ ] Manter runbooks por domínio: segredo, autenticação, tenant, pagamento, cloud, fornecedor, backup, CI/CD e IA.
- [ ] Revisar lições aprendidas de incidentes externos relevantes sem copiar indicadores sensíveis ou PoCs.

## Melhorias futuras

- [ ] Integrar exercícios a continuidade de negócio, restore, fornecedores críticos e comunicação com clientes enterprise.
- [ ] Formalizar armazenamento forense com controles de integridade, retenção e legal hold conforme necessidade.
- [ ] Criar métricas de reincidência, eficácia de controle, cobertura de logs e exceções vencidas.
- [ ] Avaliar revisão independente ou simulado avançado quando maturidade, contrato ou risco justificarem.

## Critérios de aprovação

- [ ] Runbook, papéis, canais, evidência, comunicação, recuperação e postmortem estão definidos e testados no escopo avaliado.
- [ ] A equipe demonstrou triagem, contenção e decisão de escalonamento com cenário fictício ou incidente sanitizado.
- [ ] Não há incidente ativo sem contenção, owner, plano e autoridade de decisão.
- [ ] Evidências estão protegidas, minimizadas e referenciadas por IDs opacos.
- [ ] Ações corretivas possuem owner, prazo, critério de aceite e reteste.

## Critérios de reprovação/bloqueio

- [ ] Incidente ativo relacionado ao release ou operação continua sem contenção, avaliação de impacto ou decisão competente.
- [ ] Segredo, dado pessoal, log cru, dump, request/response, payload, URL interna, IP, tenant, vítima, atacante ou cliente aparece em Git, issue, PR, artifact ou relatório sanitizado.
- [ ] A equipe não consegue acionar papéis críticos, canal restrito ou owner técnico.
- [ ] Contenção destrói evidência essencial sem decisão justificada ou impede avaliação de impacto.
- [ ] Comunicação externa ou notificação regulatória foi feita, omitida ou prometida sem revisão competente.
- [ ] Recuperação não valida integridade, acesso, correção ou monitoramento antes do retorno.
- [ ] Postmortem omite ações corretivas, owner, prazo ou reteste para causa confirmada material.

## Cuidados contra vazamento

- [ ] Não criar narrativa com dados reais de vítima, cliente, atacante, IP, domínio, URL, tenant, conta, fornecedor ou evidência sensível.
- [ ] Não incluir payloads, PoCs ofensivas, requests/responses, logs crus, indicadores ativos, prints não redigidos ou detalhes exploráveis.
- [ ] Usar marcadores como `[INC-001]`, `[SISTEMA-A]`, `[TENANT-A]`, `[EV-RES-001]` e `[ACAO-01]`.
- [ ] Separar relatório operacional restrito, timeline forense e postmortem sanitizado.
- [ ] Validar redaction de imagens, PDFs, CSVs, JSON, SARIF, logs e anexos antes de qualquer compartilhamento.
- [ ] Não usar branch, commit, issue, PR ou arquivo para revelar incidente, cliente, ativo, vetor ou dado afetado.
