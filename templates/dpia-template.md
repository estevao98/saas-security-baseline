# Template de RIPD/DPIA

## Objetivo e quando usar

Avaliar tratamento que possa gerar alto risco a direitos e liberdades, documentando contexto, necessidade, proporcionalidade, riscos e medidas. Usar antes do tratamento e reabrir após mudança material ou incidente.

> A ANPD atribui ao controlador a elaboração do RIPD. A necessidade, forma, publicidade e aprovação dependem do caso concreto e de validação jurídica.

## Campos obrigatórios

1. **Identificação:** `[DPIA-001]`, projeto `[PRODUTO-A]`, owner, controlador e revisores.
2. **Escopo:** finalidade, tipos de dados, titulares, operações, sistemas, fontes, destinatários e ciclo de vida.
3. **Metodologia:** método de tratamento e de segurança da informação.
4. **Necessidade/proporcionalidade:** minimização, compatibilidade, base a validar, alternativas e direitos.
5. **Riscos aos titulares:** cenário, grupos afetados, impacto, probabilidade, fatores combinados e risco inerente.
6. **Medidas:** salvaguardas, controles, owner, prazo, teste e risco residual.
7. **Consultas e decisão:** Encarregado, Segurança, Jurídico, titulares quando adequado, aprovação e gatilhos de revisão.

## Campos opcionais

LIA, decisão automatizada, IA, crianças/adolescentes, larga escala, transferência internacional, parecer independente, versão pública sanitizada e plano de monitoramento.

## Tabela de riscos

| Risco | Consequência ao titular | Probabilidade/impacto | Medidas | Residual | Owner | Evidência |
|---|---|---|---|---|---|---|
| `[RISCO-001]` | `[CONSEQUENCIA]` | `[NIVEL/NIVEL]` | `[SALVAGUARDAS]` | `[NIVEL]` | `[PAPEL]` | `[EV-SAN-001]` |

## Exemplo fictício

`[DPIA-001]` avalia recurso assistido por IA em `[PRODUTO-A]`. Entradas são limitadas a conteúdo fictício, o fornecedor é `[FORNECEDOR-A]`, e o lançamento fica condicionado à minimização, retenção validada, revisão humana e teste de isolamento.

## Cuidados e revisão antes de compartilhar

- [ ] Não anexar dados, prompts, perfis, contratos, arquitetura, incidentes, logs ou avaliações individuais reais.
- [ ] Avaliar dano ao titular, não somente risco para a empresa.
- [ ] Confirmar consistência com mapa, ROPA, bases, avisos, contratos, direitos e fornecedores.
- [ ] Controlador, Encarregado, Segurança e Jurídico aprovam conforme governança aplicável.
- [ ] Separar documento real restrito de eventual versão pública sanitizada.

## Relação com o repositório

Baseado em `docs/lgpd-privacy-program.md`; usa `templates/data-map-template.md`, `templates/ropa-template.md`, `templates/risk-register-template.csv` e `docs/evidence-and-reporting-policy.md`.
