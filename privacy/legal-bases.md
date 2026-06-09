# Bases Legais

## Objetivo

Definir uma triagem operacional para relacionar finalidades, categorias de dados, papéis e hipóteses legais candidatas sem escolher base legal automaticamente.

Este arquivo não é parecer jurídico. A definição final deve considerar fatos, contrato, titulares, categoria de dado, setor, risco, regulamento vigente e validação por Privacidade/Jurídico.

## Princípios de uso

- Base legal é avaliada por finalidade, não por produto inteiro.
- Dados pessoais sensíveis exigem hipóteses próprias e análise específica.
- Legítimo interesse não é base genérica e não se aplica a dados sensíveis.
- Consentimento não deve ser usado quando não houver escolha livre, informada, inequívoca e revogável.
- Mudança de finalidade, público, dado, fornecedor, país, IA ou decisão automatizada reabre a análise.

## Triagem mínima

| Campo | Pergunta |
|---|---|
| Finalidade | O objetivo é específico, legítimo e compatível com o aviso/contrato? |
| Necessidade | Cada dado é indispensável ou há alternativa menos invasiva? |
| Titular | Qual categoria abstrata de titular está envolvida? |
| Dado | É comum, sensível, de criança/adolescente ou de contexto vulnerável? |
| Papel | O SaaS decide finalidade ou segue instruções de cliente/controlador? |
| Hipótese candidata | Qual hipótese será submetida à validação competente? |
| Direitos | Quais direitos podem ser exercidos e quais exceções podem existir? |
| Retenção | Qual critério de conservação precisa ser validado? |
| Compartilhamento | Quem recebe, em qual papel e em qual país/região? |
| Decisão | Quem validou, quando e com qual escopo? |

## Hipóteses candidatas comuns em SaaS

| Hipótese | Pode aparecer em | Cuidados |
|---|---|---|
| Consentimento | Funcionalidade opcional, cookies não essenciais ou comunicação opcional. | Exigir granularidade, prova, recusa, revogação e não condicionamento indevido. |
| Execução de contrato | Entrega de funcionalidade necessária ao titular ou relação contratual aplicável. | Em B2B, nem todo dado de usuário decorre automaticamente de contrato direto com o SaaS. |
| Obrigação legal ou regulatória | Guarda fiscal, contábil ou setorial quando confirmada. | Identificar norma, escopo e prazo; não ampliar por conveniência. |
| Legítimo interesse | Segurança, prevenção de abuso ou melhoria compatível com dado não sensível. | Exigir teste de finalidade, necessidade, balanceamento, expectativa e salvaguardas. |
| Exercício regular de direitos | Preservação necessária para disputa judicial, administrativa ou arbitral. | Legal hold restrito, acesso limitado e revisão periódica. |
| Outras hipóteses legais | Saúde, pesquisa, crédito, vida, fraude ou administração pública em contextos próprios. | Não presumir aplicabilidade; validar texto legal e requisitos específicos. |

## Saída esperada

Uma decisão segura deve registrar apenas:

- ID da finalidade ou operação;
- hipótese candidata e status de validação;
- escopo, premissas e limitações;
- responsável pela validação;
- data e gatilho de próxima revisão;
- vínculo com ROPA, mapa, retenção, terceiros e direitos.

Não registrar parecer integral, dados pessoais reais, nomes de titulares, clientes, fornecedores reais, contratos, tickets ou comunicações.

## Referências

- `../docs/lgpd-privacy-program.md`
- `../checklists/lgpd.md`
- `ropa.md`
- `data-map.md`
- `data-subject-rights.md`
- `../docs/evidence-and-reporting-policy.md`
