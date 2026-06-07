# Template de Avaliação de Risco de IA

## Objetivo e quando usar

Avaliar riscos para pessoas, organização e sociedade ao projetar, adquirir, implantar ou alterar funcionalidade de IA. Usar antes de PoC com dados, contratação, produção e mudança de modelo, finalidade, fornecedor, autonomia ou população afetada.

> Este template é de governança técnica. Obrigações legais, classificação regulatória, direitos autorais, relações de trabalho e decisões automatizadas exigem validação especializada no caso concreto.

## Campos obrigatórios

- ID `[AI-RA-001]`, owner, finalidade, usuários e decisão de uso/não uso;
- sistema/modelo/fornecedor em nível abstrato, versão rastreável no sistema restrito;
- entradas, saídas, dados pessoais/sensíveis, proveniência e retenção;
- papel da IA: assistivo, recomendação, geração ou decisão; nível de autonomia e revisão humana;
- pessoas/grupos afetados, uso indevido razoável e contextos proibidos;
- qualidade, validade, robustez, segurança, privacidade, viés/equidade, transparência, explicabilidade, acessibilidade e contestação;
- riscos, controles, métricas, testes, monitoramento, incidentes e rollback/desativação;
- fornecedor, suboperadores, treinamento secundário, localização e termos a validar;
- risco residual, aprovação, prazo e gatilhos de reavaliação.

## Campos opcionais

Red teaming autorizado, avaliação de conteúdo, impacto ambiental/custo, propriedade intelectual, benchmark, model card, prompt template sanitizado, fallback humano e requisitos enterprise.

## Registro de riscos

| ID | Impactado | Cenário | Métrica/evidência | Controle | Residual | Decisão |
|---|---|---|---|---|---|---|
| `[RISCO-001]` | `[GRUPO/PROCESSO]` | `[CENARIO-SANITIZADO]` | `[METRICA]/[EV-SAN-001]` | `[CONTROLE]` | `[NIVEL]` | `[TRATAR/NAO-USAR/ACEITAR]` |

## Exemplo fictício

`[AI-RA-001]` avalia um assistente de rascunho em `[PRODUTO-A]`. Só recebe dados sintéticos na PoC, não decide sozinho, exige confirmação humana e bloqueia produção até contrato, retenção, avaliação de qualidade e isolamento serem aprovados.

## Cuidados e revisão antes de compartilhar

- [ ] Não inserir prompts, respostas, arquivos, datasets, perfis, decisões ou dados de pessoas/clientes reais.
- [ ] Não registrar chave, endpoint privado, configuração, jailbreak, prompt de sistema ou teste ofensivo reproduzível.
- [ ] Confirmar população e contexto de uso; média de qualidade não substitui análise de dano desigual.
- [ ] Produto, IA/Dados, Segurança, Privacidade, Jurídico e Acessibilidade revisam conforme impacto.
- [ ] Reavaliar após deriva, incidente, troca de modelo/fornecedor, nova finalidade ou mudança normativa/contratual.

## Relação com o repositório

Usar com `templates/dpia-template.md`, `templates/vendor-risk-assessment-template.md`, `templates/threat-model-template.md`, `templates/risk-register-template.csv`, `docs/lgpd-privacy-program.md` e `docs/standards-and-frameworks-matrix.md`.
