# Template de Plano de Remediação

## Objetivo e quando usar

Transformar findings e riscos aprovados em ações com owner, prazo, dependências, gate e reteste. Usar após triagem e antes de iniciar correções que envolvam mais de uma ação, equipe ou release.

## Campos obrigatórios

- IDs relacionados: `[FIND-001]`, `[RISCO-001]`, `[INC-001]`.
- objetivo mensurável e escopo sanitizado;
- prioridade, owner, aprovador e prazo;
- ações ordenadas, dependências e critérios de conclusão;
- estratégia de teste, regressão, rollback e reteste;
- riscos de mudança e risco residual;
- status e evidências por ID opaco.

## Campos opcionais

Marcos intermediários, custo estimado, controle temporário, feature flag, janela de mudança, comunicação, exceção com expiração, métricas e requisito contratual/enterprise.

## Plano preenchível

| Ação | Resultado esperado | Owner | Prazo | Dependência | Validação | Status | Evidência |
|---|---|---|---|---|---|---|---|
| `[ACAO-01]` | `[CRITERIO-MENSURAVEL]` | `[PAPEL]` | `[AAAA-MM-DD]` | `[ID/N/A]` | `[TESTE-SEGURO]` | `[STATUS]` | `[EV-SAN-___]` |

- **Gate:** `[MERGE/RELEASE/NAO-BLOQUEANTE]`
- **Rollback:** `[CONDICAO E ACAO SEM COMANDO SENSIVEL]`
- **Risco residual:** `[RISCO E DECISAO]`
- **Incertezas:** `[CONTRATO/FERRAMENTA/AMBIENTE]`

## Exemplo fictício

Para `[FIND-001]`, `[ACAO-01]` centraliza a verificação de autorização em `[PRODUTO-A]`; `[ACAO-02]` adiciona regressão com `[USUARIO-01]` fictício. O release permanece bloqueado até reteste aprovado e referência `[EV-SAN-002]`.

## Cuidados e revisão antes de compartilhar

- [ ] Não inserir branches privadas, endpoints, credenciais, segredos, dados pessoais, logs, patch explorável ou instrução operacional privilegiada.
- [ ] Verificar que ações atacam causa, não apenas sintoma, e não reduzem segurança, privacidade ou acessibilidade.
- [ ] Confirmar owners, capacidade, datas, dependências, rollback e teste negativo.
- [ ] Segurança aprova findings altos/críticos; Privacidade, Acessibilidade, Operações ou Jurídico revisam quando aplicável.
- [ ] Evidência crua continua restrita e fora do Git.

## Relação com o repositório

Deriva de `templates/security-finding-template.md` e `templates/risk-register-template.csv`; segue `risk/severity-and-prioritization.md`, `docs/git-security-workflow.md` e `docs/security-audit-baseline.md`.
