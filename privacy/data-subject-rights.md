# Direitos dos Titulares

## Objetivo

Definir um procedimento mínimo para receber, autenticar, executar, responder e registrar pedidos de titulares sem armazenar dados pessoais reais neste repositório.

Este arquivo apoia operação e engenharia. Prazos, exceções, conteúdo da resposta e estratégia jurídica devem ser validados por Privacidade/Jurídico no caso concreto.

## Escopo de direitos

O procedimento deve preparar capacidades para confirmação, acesso, correção, anonimização, bloqueio, eliminação, portabilidade, informação sobre compartilhamento, informação sobre consentimento, revogação, oposição e revisão de decisão automatizada quando aplicáveis.

## Fluxo operacional

1. Receber solicitação em canal acessível e gerar ID opaco.
2. Identificar papel do SaaS no tratamento: controlador, operador ou apoio a cliente controlador.
3. Autenticar o solicitante de forma proporcional, sem coletar dado excessivo.
4. Preservar dados contra alteração indevida enquanto o pedido é analisado, quando necessário.
5. Consultar mapa, ROPA, fornecedores, logs e sistemas ativos para localizar categorias relevantes.
6. Avaliar exceções, conservação permitida e riscos de expor dados de terceiros.
7. Executar correção, exportação, bloqueio, eliminação, revogação ou encaminhamento conforme decisão validada.
8. Responder por canal seguro e linguagem clara.
9. Registrar decisão, datas, responsáveis e evidências por ID opaco, sem copiar o pedido real para Git.
10. Medir falhas, atrasos, sistemas não cobertos e causas de retrabalho.

## Matriz de capacidade

| Capacidade | Controle mínimo | Evidência segura |
|---|---|---|
| Recebimento | Canal definido e triagem por ID opaco. | Ata ou teste sintético. |
| Autenticação | Verificação proporcional ao risco do pedido. | Critério documentado, sem documento real. |
| Busca | Cobertura por tenant, sistema, arquivo, fornecedor e backup quando aplicável. | Resultado agregado de teste fictício. |
| Resposta | Modelo claro e canal seguro. | Template aprovado ou exemplo fictício. |
| Execução | Correção, exportação, bloqueio ou exclusão testável. | ID de teste com dados sintéticos. |
| Exceções | Conservação, negativa ou limitação com validação competente. | ID de decisão, sem parecer integral. |
| Fornecedores | Solicitação propagada quando aplicável. | ID de ticket ou atestado sanitizado. |
| Métricas | Volume por categoria, tempo e falhas. | Contagem agregada. |

## Cuidados específicos

- Não revelar dados de outro titular, tenant, cliente ou usuário administrativo.
- Não enviar exportação por canal inseguro ou para identidade não verificada.
- Não usar logs crus, dumps, prints ou tickets reais como evidência versionada.
- Não fixar prazo universal neste arquivo; validar prazo e formato conforme direito e contexto.
- Não automatizar negativa, exceção ou decisão jurídica sem revisão apropriada.

## Exercício recomendado

Executar teste com titular fictício, tenant fictício e categorias abstratas. O resultado deve verificar recebimento, autenticação, busca, decisão, resposta, propagação a fornecedor e registro seguro.

## Referências

- `../docs/lgpd-privacy-program.md`
- `../checklists/lgpd.md`
- `data-map.md`
- `ropa.md`
- `retention-policy.md`
- `third-party-processors.md`
- `../docs/evidence-and-reporting-policy.md`
