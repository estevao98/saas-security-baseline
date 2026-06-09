# Fixture Ficticia de Acessibilidade

## Objetivo

Disponibilizar uma pagina web estatica e ficticia para calibrar avaliacao combinada de acessibilidade em SaaS: automacao com axe, Lighthouse e Pa11y, revisao manual por teclado, foco visivel, semantica HTML, contraste, formularios, mensagens de erro, conteudo dinamico, leitor de tela e fluxo critico.

Esta fixture nao representa produto real, nao coleta dados, nao abre sessao e nao prova conformidade WCAG 2.2 AA. Ela ajuda a exercitar metodo, triagem e limites das ferramentas antes de avaliar um SaaS autorizado.

## Arquivos

| Arquivo | Uso |
|---|---|
| `fixture-saas-flow.html` | Pagina HTML estatica com casos positivos e barreiras ficticias marcadas. |
| `fixture-styles.css` | Estilos locais para foco, contraste, layout responsivo e exemplos negativos controlados. |

## Como Servir em Loopback

Use servidor local simples a partir desta pasta. Exemplos possiveis, conforme ferramenta disponivel no ambiente:

```bash
python3 -m http.server 3000
```

Depois acesse `http://127.0.0.1:3000/fixture-saas-flow.html`.

Nao use URL externa, producao, cookie, header, token, dados pessoais, conteudo de cliente ou sessao autenticada. Se uma ferramenta gerar relatorio cru, mantenha em `reports/raw/` ou descarte localmente; nao versionar.

## Automacao Esperada

Com a pagina servida em loopback, os comandos documentados no repositorio podem ser usados apos validar instalacao e versao das ferramentas:

```bash
axe http://127.0.0.1:3000/fixture-saas-flow.html
lighthouse http://127.0.0.1:3000/fixture-saas-flow.html --output json --output-path ../../reports/raw/lighthouse-fixture.json
pa11y --reporter json http://127.0.0.1:3000/fixture-saas-flow.html > ../../reports/raw/pa11y-fixture.json
```

Resultado automatizado pode variar por versao, navegador e runner. A ausencia de achados nao deve ser interpretada como conformidade WCAG ou ausencia de barreiras.

## Roteiro Manual Minimo

- [ ] Navegar somente com teclado usando `Tab`, `Shift+Tab`, `Enter`, `Space` e `Escape`.
- [ ] Confirmar que o skip link aparece no foco e leva ao conteudo principal.
- [ ] Verificar foco visivel em links, botoes, inputs, checkbox e modal.
- [ ] Conferir headings, landmarks, labels, nomes acessiveis e associacoes de erro.
- [ ] Testar o botao de erro ficticio e confirmar se a mensagem dinamica e anunciavel.
- [ ] Inspecionar contraste dos controles positivos e identificar os exemplos negativos marcados.
- [ ] Usar leitor de tela em combinacao local aprovada para headings, landmarks, formulario, status e modal.
- [ ] Registrar achados apenas por IDs ficticios como `A11Y-FIXTURE-001`, sem prints reais desnecessarios.

## Casos Incluidos

| Caso | Tipo | Expectativa |
|---|---|---|
| Skip link, landmarks, headings e formulario principal | Positivo | Deve apoiar teclado e leitor de tela. |
| Regiao `aria-live` para erro ficticio | Positivo | Deve permitir anuncio de erro sem mover foco indevidamente. |
| Botao de modal com foco de retorno | Positivo parcial | Exige revisao manual; a fixture nao implementa framework complexo. |
| Link com texto generico | Negativo controlado | Deve ser identificado como barreira de proposito pouco claro. |
| Botao sem nome acessivel | Negativo controlado | Deve ser triado como barreira automatizavel. |
| Campo sem label programatico | Negativo controlado | Deve ser triado como falha de formulario. |
| Texto de baixo contraste | Negativo controlado | Deve ser confirmado por medicao, sem depender apenas do scanner. |
| Area que simula conteudo dinamico | Revisao manual | Exige julgamento sobre anuncio, foco e proxima acao. |

## Limites

- A fixture e pequena e nao cobre todos os criterios WCAG 2.2 A/AA.
- A fixture nao executa checkout real, pagamento, LMS, autenticacao, tenant ou dados reais.
- Os casos negativos existem para calibrar triagem, nao para ensinar exploracao ou representar falha de produto.
- Qualquer CI de acessibilidade deve comecar como `alert-only`, sem publicar DOM, screenshots, videos ou relatorios crus.

## Referencias Internas

- `../../docs/accessibility-program.md`
- `../../docs/accessibility-audit.md`
- `../../checklists/accessibility-wcag-22-aa.md`
- `../../docs/evidence-and-reporting-policy.md`
- `../../templates/accessibility-finding-template.md`
