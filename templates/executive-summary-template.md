# Template de Resumo Executivo

## Objetivo e quando usar

Comunicar postura, impacto de negócio, decisões e prioridades sem expor detalhes técnicos sensíveis. Usar após auditoria, incidente, avaliação de fornecedor, revisão trimestral ou antes de decisão Go/No-Go.

## Campos obrigatórios

- período, produto e escopo em nível seguro;
- objetivo, metodologia resumida e limitações;
- conclusão e nível de confiança;
- contagem agregada por severidade/status;
- riscos materiais, impacto de negócio e tendências;
- bloqueios, decisões requeridas e plano de alto nível;
- owners, prazos e próxima revisão;
- classificação e aprovadores.

## Campos opcionais

Comparação com período anterior, cobertura por domínio, métricas, dependências enterprise, investimento, risco aceito, certificação formal em avaliação e observações jurídicas.

## Resumo preenchível

### Visão geral

`[PRODUTO-A]` foi avaliado entre `[DATA-INICIO]` e `[DATA-FIM]` para `[OBJETIVO]`. A conclusão é `[APROVADO/CONDICIONAL/NAO-APROVADO]`, com confiança `[NIVEL]` e limitações `[LIMITACOES]`.

### Resultados agregados

| Crítico | Alto | Médio | Baixo | Informativo | Corrigidos | Aceitos vigentes |
|---:|---:|---:|---:|---:|---:|---:|
| `[0]` | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` |

### Decisões

| Decisão | Motivo | Owner | Prazo | Estado |
|---|---|---|---|---|
| `[DECISAO-01]` | `[JUSTIFICATIVA-SANITIZADA]` | `[PAPEL]` | `[AAAA-MM-DD]` | `[STATUS]` |

## Exemplo fictício

`[PRODUTO-A]` recebeu decisão condicional: nenhum finding crítico, um risco alto `[RISCO-001]` em remediação e duas limitações de cobertura. O lançamento depende do reteste `[EV-SAN-001]`; não são apresentados componente, cliente ou vetor.

## Cuidados e revisão antes de compartilhar

- [ ] Não listar vulnerabilidades exploráveis, arquitetura interna, URLs, clientes, fornecedores reais, incidentes individualizáveis ou evidências cruas.
- [ ] Não afirmar conformidade, ausência de falhas ou certificação além das evidências.
- [ ] Reconciliar números com registros aprovados e explicitar scans não executados.
- [ ] Obter revisão técnica e executiva; Jurídico/Privacidade revisam afirmações regulatórias ou externas.
- [ ] Confirmar público, classificação e canal antes do envio.

## Relação com o repositório

Resume `docs/security-audit-baseline.md`, `docs/security-roadmap.md`, `risk/severity-and-prioritization.md` e `docs/evidence-and-reporting-policy.md`; não substitui relatórios detalhados.
