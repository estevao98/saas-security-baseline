# Template de Postmortem

## Objetivo e quando usar

Registrar aprendizado após incidente, degradação, falha de controle ou restauração relevante. Elaborar depois da estabilização, com abordagem sem culpabilização individual e foco em condições sistêmicas.

## Campos obrigatórios

- ID relacionado, período, duração e classificação;
- resumo sanitizado e impacto agregado;
- detecção, resposta, recuperação e o que funcionou/não funcionou;
- linha do tempo resumida;
- causas técnicas e organizacionais sustentadas por evidência;
- fatores contribuintes e lacunas de detecção;
- ações corretivas/preventivas com owner, prazo e validação;
- risco residual, gatilhos de reabertura e aprovadores.

## Campos opcionais

Métricas MTTD/MTTR com definição, custo agregado, dependência de fornecedor, comunicação, comparação com incidentes anteriores e mudanças em runbook/SLO.

## Ações

| Ação | Tipo | Owner | Prazo | Critério de aceite | Status | Evidência |
|---|---|---|---|---|---|---|
| `[ACAO-01]` | `[CORRETIVA/PREVENTIVA]` | `[PAPEL]` | `[AAAA-MM-DD]` | `[RESULTADO-TESTAVEL]` | `[STATUS]` | `[EV-SAN-001]` |

## Exemplo fictício

O postmortem de `[INC-001]` conclui que uma dependência de capacidade e um alerta incompleto prolongaram a recuperação de `[PRODUTO-A]`. As ações são testar failover, ajustar detecção e revisar o runbook, sem identificar pessoas ou infraestrutura.

## Cuidados e revisão antes de compartilhar

- [ ] Remover nomes de pessoas, clientes, tenants, fornecedores reais, topologia, URLs, IPs, logs e detalhes exploráveis.
- [ ] Não substituir investigação restrita nem comunicação regulatória.
- [ ] Separar causa comprovada de hipótese e evitar atribuição individual de culpa.
- [ ] Validar todas as ações, owners, prazos, evidências e vínculos com risco/release.
- [ ] Segurança, Operações, Produto e domínios afetados revisam antes de versionar.

## Relação com o repositório

Deriva de `templates/incident-report-template.md`; alimenta `templates/remediation-plan-template.md`, `templates/risk-register-template.csv`, `docs/security-roadmap.md` e auditorias recorrentes.
