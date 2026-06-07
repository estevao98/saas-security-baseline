# Template de Modelo de Ameaças

## Objetivo e quando usar

Identificar o que está sendo construído, o que pode dar errado, controles e validação. Usar cedo no design e revisar em mudança de arquitetura, autenticação, autorização, tenant, API, pagamento, integração, cloud, IA ou dado sensível.

## Campos obrigatórios

1. **Metadados:** `[TM-001]`, `[PRODUTO-A]`, versão/escopo, owner, participantes, revisor e data.
2. **Objetivos e suposições:** requisitos de segurança/privacidade, fora de escopo e hipóteses verificáveis.
3. **Arquitetura sanitizada:** entidades, processos, armazenamentos, fluxos e trust boundaries por IDs.
4. **Ativos:** dado, função, identidade, disponibilidade e reputação a proteger.
5. **Entradas/saídas e dependências:** interfaces e terceiros em nível abstrato.
6. **Ameaças:** ID, cenário não operacionalizável, método usado, ativo/fluxo, controles existentes e risco.
7. **Tratamento:** mitigar, eliminar, transferir ou aceitar com autoridade e expiração.
8. **Validação:** testes, findings/riscos, evidência e gatilhos de revisão.

## Campos opcionais

STRIDE, abuse cases seguros, attack trees sanitizadas, requisitos ASVS, privacidade, acessibilidade, diagrama em ferramenta aprovada e decisões arquiteturais.

## Registro de ameaças

| ID | Alvo/fluxo | Cenário sanitizado | Controles | Risco | Tratamento | Owner | Evidência |
|---|---|---|---|---|---|---|---|
| `[THR-001]` | `[FLUXO-01]` | `[EVENTO-ADVERSO SEM PASSOS]` | `[CONTROLE-A]` | `[RISCO-001]` | `[ACAO]` | `[PAPEL]` | `[EV-SAN-001]` |

## Exemplo fictício

`[THR-001]` considera acesso entre tenants em `[PRODUTO-A]`. Controles incluem autorização central, isolamento e testes negativos; o cenário gera `[RISCO-001]` sem documentar endpoint, payload ou topologia real.

## Cuidados e revisão antes de compartilhar

- [ ] Não versionar diagrama real com hostnames, IPs, regiões detalhadas, secrets, rotas, regras de firewall ou pontos de ataque.
- [ ] Não escrever PoC, payload, sequência de exploração ou bypass.
- [ ] Confirmar escopo, suposições, trust boundaries, ativos, ameaças sem controle e risco residual.
- [ ] Arquitetura, Segurança, Produto, Privacidade e Operações revisam conforme escopo.
- [ ] Manter modelo real restrito e publicar apenas abstração sanitizada quando necessário.

## Relação com o repositório

Alimenta `templates/risk-register-template.csv`, `templates/security-finding-template.md` e `templates/remediation-plan-template.md`; relaciona-se a `docs/audit-types.md`, `docs/audit-trigger-matrix.md` e `docs/frappe-python-security-audit.md`.
