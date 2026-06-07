# Template de Mapa de Dados

## Objetivo e quando usar

Mapear categorias de dados, origens, fluxos, sistemas, destinatários, retenção e descarte. Usar no discovery, antes de produção e sempre que mudar coleta, finalidade, integração, país, IA, analytics, suporte, log ou backup.

## Campos obrigatórios

| ID | Finalidade | Titular | Categoria de dado | Origem | Sistema/etapa | Destino/destinatário | País/região | Retenção/descarte | Owner | Evidência |
|---|---|---|---|---|---|---|---|---|---|---|
| `[FLUXO-___]` | `[FINALIDADE]` | `[CATEGORIA]` | `[CATEGORIA, SEM VALOR REAL]` | `[ORIGEM]` | `[SISTEMA-ABSTRATO]` | `[DESTINO]` | `[LOCALIZACAO]` | `[CRITERIO]` | `[PAPEL]` | `[EV-SAN-___]` |

Também são obrigatórios classificação pessoal/sensível, papel controlador/operador a validar, base legal a validar, acessos, criptografia/segregação, logs, backups, suboperadores e transferência internacional quando aplicável.

## Campos opcionais

Volume/faixa, frequência, formato, API/evento, decisão automatizada, anonimização/pseudonimização, direito do titular, legal hold, diagrama sanitizado e vínculo com ROPA/RIPD.

## Exemplo fictício

`[FLUXO-001]`: `[USUARIO-01]` informa categoria de contato a `[PRODUTO-A]` para criação de conta. O dado segue para `[SERVICO-A]`, com acesso por papel, retenção `[CRITERIO-A-VALIDAR]` e fornecedor identificado apenas como `[FORNECEDOR-A]`.

## Cuidados e revisão antes de compartilhar

- [ ] Registrar categorias, nunca valores, nomes, e-mails, documentos, mensagens, prompts ou identificadores reais.
- [ ] Não incluir hostname, URL privada, IP, chave, schema detalhado, query, log, dump ou arquitetura explorável.
- [ ] Confirmar cobertura de produção, homologação, suporte, observabilidade, analytics, backups, IA e terceiros.
- [ ] Engenharia valida o fluxo; Privacidade/Jurídico validam papéis, bases, retenção e transferências.
- [ ] A cópia real deve ficar em sistema restrito; versionar somente modelo ou visão sanitizada.

## Relação com o repositório

Alimenta `templates/ropa-template.md`, `templates/dpia-template.md` e `templates/vendor-risk-assessment-template.md`; segue `docs/lgpd-privacy-program.md` e `docs/evidence-and-reporting-policy.md`.
