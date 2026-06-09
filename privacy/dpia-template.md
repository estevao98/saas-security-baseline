# Uso do Template de RIPD/DPIA

## Objetivo

Orientar quando e como usar o template de RIPD/DPIA sem duplicar o modelo completo e sem transformar este repositório em registro real de impacto.

O template preenchível fica em `../templates/dpia-template.md`. Este arquivo define gatilhos, papéis, evidências e limites de validação jurídica.

## Limite jurídico

No contexto da LGPD, a elaboração do RIPD é responsabilidade do controlador quando aplicável. A necessidade, conteúdo, aprovação, publicidade e revisão dependem do caso concreto, da orientação vigente da ANPD e de validação competente.

## Gatilhos de triagem

Use uma triagem de RIPD/DPIA quando a mudança envolver:

- dado pessoal sensível ou titulares vulneráveis;
- larga escala ou monitoramento relevante;
- decisão automatizada que afete interesses do titular;
- IA, analytics, perfilamento ou uso secundário de dados;
- nova transferência internacional ou suporte remoto com acesso a dados;
- nova integração ou fornecedor crítico;
- mudança material de finalidade, retenção, segurança, acesso ou tenant;
- incidente, reclamação recorrente ou finding de privacidade material.

Esses gatilhos não significam, isoladamente, que o RIPD é obrigatório. Eles indicam que a decisão deve ser documentada e revisada por Privacidade/Jurídico.

## Processo mínimo

1. Registrar escopo, finalidade, sistemas, categorias de dados e titulares em `data-map.md`.
2. Confirmar ROPA e bases candidatas em `ropa.md` e `legal-bases.md`.
3. Avaliar necessidade, proporcionalidade, alternativas e minimização.
4. Identificar riscos aos titulares, não apenas riscos para a empresa.
5. Definir medidas, responsáveis, critérios de teste e risco residual.
6. Registrar pareceres, divergências e aprovação em sistema restrito.
7. Definir gatilhos de revisão e monitoramento.

## Evidência segura

| Evidência | Onde manter | Pode ir ao Git? |
|---|---|---|
| RIPD/DPIA real | Sistema restrito | Não, salvo versão pública sanitizada aprovada. |
| Decisão de triagem | Sistema restrito | Somente ID opaco e resumo sem dados reais. |
| Mapa, ROPA e risco | Sistema restrito | Apenas modelo ou síntese sanitizada. |
| Testes e logs | `reports/raw/` local ou cofre | Não. |
| Plano de mitigação | Tracker restrito | Somente resumo sem detalhe sensível. |

## Revisores

- Controlador ou autoridade definida para o tratamento.
- Encarregado/Privacidade.
- Jurídico.
- Segurança e Engenharia.
- Produto ou owner do processo.
- Fornecedores ou cliente controlador quando aplicável e autorizado.

## Referências

- `../templates/dpia-template.md`
- `../docs/lgpd-privacy-program.md`
- `../docs/lgpd-gap-assessment.md`
- `data-map.md`
- `ropa.md`
- `legal-bases.md`
- `../docs/evidence-and-reporting-policy.md`
