# Template de Achado de Segurança

## Objetivo e quando usar

Registrar um achado técnico ou de controle já triado, com impacto, prioridade, correção e reteste. Usar após revisão manual ou resultado de scanner validado; não usar para colar relatório cru.

## Campos obrigatórios

| Campo | Preenchimento |
|---|---|
| ID e título seguro | `[FIND-001]` e descrição sem endpoint ou vetor explorável |
| Produto, versão e escopo | `[PRODUTO-A]`, artefato e ambiente abstratos |
| Fonte e data | Revisão, ferramenta/versão ou auditoria; `[AAAA-MM-DD]` |
| Condição e impacto | Fato sanitizado, ativo afetado e consequência |
| Severidade e prioridade | Método de `risk/severity-and-prioritization.md`, P0-P3 e justificativa |
| Status, owner e prazo | Aberto, em correção, reteste, corrigido, aceito ou falso positivo |
| Correção e critério de aceite | Resultado esperado e teste seguro |
| Evidência | Apenas ID opaco, como `[EV-SAN-001]` |

## Campos opcionais

CWE/CVE/CVSS com versão e limites; OWASP/ASVS; tenants afetados em faixa agregada; risco residual; controle compensatório; exceção e expiração; release afetada/corrigida; dependências e incertezas.

## Registro preenchível

- **ID/título:** `[FIND-___]` - `[TITULO-SANITIZADO]`
- **Escopo:** `[PRODUTO/COMPONENTE/ARTEFATO]`
- **Condição:** `[DESCRICAO-MINIMA]`
- **Impacto/probabilidade:** `[IMPACTO]` / `[PROBABILIDADE]`
- **Severidade/prioridade:** `[NIVEL]` / `[P0-P3]`
- **Owner/prazo/status:** `[PAPEL]` / `[AAAA-MM-DD]` / `[STATUS]`
- **Remediação:** `[RESULTADO-DE-SEGURANCA-ESPERADO]`
- **Reteste:** `[METODO-SEGURO E CRITERIO]`
- **Evidência:** `[EV-SAN-___]`
- **Incertezas:** `[DEPENDENCIA-DE-CONTEXTO]`

## Exemplo fictício

`[FIND-001]` registra que uma operação administrativa de `[PRODUTO-A]` não aplicou o controle de autorização esperado. Impacto **alto**, prioridade **P1**, owner `[PAPEL-ENGENHARIA]`, evidência `[EV-SAN-001]` e reteste com contas fictícias de papéis distintos.

## Cuidados e revisão antes de compartilhar

- [ ] Não incluir payload, PoC, request/response, código sensível, URL, path, tenant, cliente, conta, token, cookie ou log.
- [ ] Manter cru fora do Git; mascaramento parcial não autoriza versionamento.
- [ ] Confirmar aplicabilidade, duplicidade, severidade, owner, prazo e gate de release.
- [ ] Obter revisão de Segurança e dos domínios afetados; aceite de risco exige autoridade, justificativa e expiração.
- [ ] Verificar que o texto permite corrigir e retestar sem ensinar exploração.

## Relação com o repositório

Usar com `docs/security-audit-baseline.md`, `risk/severity-and-prioritization.md`, `docs/evidence-and-reporting-policy.md`, `docs/git-security-workflow.md` e os checklists aplicáveis.
