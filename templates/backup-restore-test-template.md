# Template de Teste de Backup e Restauração

## Objetivo e quando usar

Demonstrar que um backup selecionado pode ser restaurado com integridade e dentro dos objetivos aprovados. Usar em exercício periódico, antes de mudança crítica, após alteração de backup e após falha/incidente relevante.

## Campos obrigatórios

- ID `[BRT-001]`, data, escopo e aprovador;
- sistema/classe de dado em nível abstrato e ambiente isolado;
- backup selecionado por ID opaco, idade e verificação de integridade;
- RPO/RTO aprovados e fonte da obrigação;
- pré-condições, responsáveis e autorização;
- início/fim, resultado, duração e divergência em relação ao RPO/RTO;
- verificações de integridade, consistência, acesso, criptografia e funcionalidade;
- falhas, ações, owner, prazo e próxima execução;
- descarte seguro do ambiente e da cópia restaurada.

## Campos opcionais

Restore parcial/completo, região alternativa, dependência de fornecedor, custo, capacidade, evidência de imutabilidade, simulação de indisponibilidade e requisitos enterprise.

## Resultado preenchível

| Verificação | Esperado | Obtido | Status | Evidência |
|---|---|---|---|---|
| Integridade | `[CRITERIO]` | `[RESULTADO-AGREGADO]` | `[APROVADO/FALHOU]` | `[EV-SAN-001]` |
| RTO | `[VALOR-APROVADO]` | `[DURACAO]` | `[STATUS]` | `[EV-SAN-002]` |
| RPO | `[VALOR-APROVADO]` | `[PONTO-AGREGADO]` | `[STATUS]` | `[EV-SAN-003]` |

## Exemplo fictício

`[BRT-001]` restaurou um conjunto sintético de `[PRODUTO-A]` em ambiente isolado. Integridade e acesso foram aprovados; o RTO ficou acima do objetivo fictício e gerou `[RISCO-001]` e `[ACAO-01]`.

## Cuidados e revisão antes de compartilhar

- [ ] Nunca versionar backup, dump, chave, credencial, dado pessoal, path, bucket, URL, comando privilegiado ou screenshot sem redaction.
- [ ] Preferir dados sintéticos; uso de cópia real exige autorização, isolamento, acesso nominal e descarte comprovado.
- [ ] Confirmar que sucesso técnico cobre aplicação, dependências, permissões e operação, não só extração de arquivo.
- [ ] Operações e owner do sistema aprovam; Privacidade revisa quando houver dados pessoais.
- [ ] Guardar evidência original fora do Git e publicar apenas resultado agregado.

## Relação com o repositório

Relaciona-se a `docs/audit-types.md`, `docs/audit-trigger-matrix.md`, `docs/evidence-and-reporting-policy.md`, `risk/severity-and-prioritization.md` e ao checklist de backup existente.
