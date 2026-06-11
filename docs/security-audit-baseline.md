# Modelo de Relatorio Final de Auditoria de Seguranca

<!--
INSTRUCOES DE USO
- Copie este modelo para a area controlada da auditoria antes de preencher.
- Substitua todos os campos entre colchetes. Use "Nao aplicavel" com justificativa quando necessario.
- Nao insira segredos, tokens, credenciais, cookies, chaves, dados pessoais reais ou documentos reais.
- Nao insira URLs privadas, IPs internos, nomes reais de clientes, e-mails reais ou identificadores de tenants.
- Nao cole payloads exploraveis, PoC ofensiva, requests/responses integrais, logs crus ou saidas integrais de scanners.
- Referencie evidencias por ID opaco. Originais ficam em armazenamento restrito e, quando locais, em reports/raw/ fora do Git.
- Somente resumos sanitizados, revisados e aprovados podem ser referenciados em reports/sanitized/.
- Registre excecoes, falsos positivos e aceites de risco com owner, aprovador, justificativa e expiracao.
-->

> **Aviso de seguranca:** este arquivo e um template. Uma copia preenchida pode ser confidencial ou restrita. O repositorio-base nao deve receber dados reais nem evidencias sensiveis.

## 1. Capa do relatorio

<!-- Use nomes ficticios ou codigos opacos na versao sanitizada. -->

| Campo | Preenchimento |
|---|---|
| Produto | `[PRODUTO-FICTICIO]` |
| Versao ou release | `[VERSAO-OU-RELEASE]` |
| Commit analisado | `[IDENTIFICADOR-NAO-SENSIVEL]` |
| Branch analisada | `[BRANCH-NAO-SENSIVEL]` |
| Data ou periodo da auditoria | `[AAAA-MM-DD a AAAA-MM-DD]` |
| Escopo | `[RESUMO-DO-ESCOPO]` |
| Classificacao | `[Publico / Interno / Confidencial / Restrito]` |
| Responsavel pela auditoria | `[PAPEL-OU-ID]` |
| Responsavel pelo produto | `[PAPEL-OU-ID]` |
| Audiencia | `[PAPEIS-AUTORIZADOS]` |
| Status | `[Rascunho / Em revisao / Aprovado / Substituido]` |
| Decisao | `[Go / Go com ressalvas / No-Go / Pendente]` |

## 2. Sumario executivo

<!-- Escreva para a audiencia decisora. Nao inclua detalhes de reproducao ou ativos identificaveis. -->

### Objetivo

`[OBJETIVO-DA-AUDITORIA]`

### Escopo resumido

`[SISTEMAS-FLUXOS-E-PERIODO-EM-NIVEL-SEGURO]`

### Conclusao geral

`[CONCLUSAO-BASEADA-NAS-EVIDENCIAS-E-LIMITACOES]`

### Principais riscos

| Prioridade | Risco resumido | Impacto de negocio | Tratamento ou decisao |
|---|---|---|---|
| `[1]` | `[RISCO-SEM-DETALHE-EXPLORAVEL]` | `[IMPACTO]` | `[TRATAR / ACEITAR / EVITAR / TRANSFERIR]` |

### Decisao Go/No-Go

- **Decisao:** `[Go / Go com ressalvas / No-Go / Pendente]`
- **Justificativa:** `[FUNDAMENTACAO]`
- **Condicoes:** `[PENDENCIAS-E-PRAZOS]`
- **Aprovador competente:** `[PAPEL-OU-ID]`

### Limitacoes executivas

`[LIMITACOES-QUE-AFETAM-A-CONFIANCA-DA-CONCLUSAO]`

## 3. Controle de versao e aprovacoes

| Versao | Data | Autor | Revisores | Aprovadores | Mudancas | Status da aprovacao |
|---|---|---|---|---|---|---|
| `[0.1]` | `[AAAA-MM-DD]` | `[PAPEL-OU-ID]` | `[PAPEIS-OU-IDS]` | `[PAPEIS-OU-IDS]` | `[RESUMO]` | `[Pendente / Aprovado / Rejeitado]` |

<!-- Registre a aprovacao no sistema autorizado. Nao cole assinatura digital, certificado ou dado pessoal neste template. -->

| Aprovacao | Responsavel | Data | Referencia controlada | Observacao |
|---|---|---|---|---|
| `[TECNICA / SEGURANCA / PRIVACIDADE / NEGOCIO]` | `[PAPEL-OU-ID]` | `[AAAA-MM-DD]` | `[ID-DO-REGISTRO]` | `[OBSERVACAO]` |

## 4. Classificacao e protecao do relatorio

| Classe | Uso esperado | Armazenamento permitido | Acesso | Anexos e evidencias |
|---|---|---|---|---|
| Publico | Conteudo aprovado para divulgacao | Canal publico aprovado | Qualquer pessoa | Somente material explicitamente liberado |
| Interno | Informacao operacional de baixo risco | Repositorio ou sistema interno autorizado | Pessoas da organizacao com necessidade | Apenas resumos sanitizados |
| Confidencial | Riscos, decisoes ou arquitetura com impacto | Sistema restrito, com controles de acesso e protecao adequada | Grupo nominal autorizado | Evidencias separadas e classificadas |
| Restrito | Segredos, dados pessoais, forense ou detalhe exploravel | Cofre ou repositorio de evidencias aprovado | Menor grupo necessario, acesso registrado | Nunca anexar ao Git; aplicar cadeia de custodia quando cabivel |

- **Classificacao escolhida:** `[CLASSE]`
- **Justificativa:** `[MOTIVO]`
- **Local autorizado:** `[TIPO-DE-SISTEMA, SEM URL PRIVADA]`
- **Regra de compartilhamento:** `[REGRA]`
- **Retencao e descarte:** `[PRAZO-E-CRITERIO, SUJEITOS A CONTRATO/LEI]`

## 5. Escopo

<!-- Registre categorias e IDs opacos. Nao revele topologia, hostname, endpoint ou tenant real. -->

| Dimensao | Incluido | Identificacao segura | Observacoes |
|---|---|---|---|
| Sistemas e produtos | `[SIM/NAO]` | `[SISTEMA-A]` | `[OBSERVACAO]` |
| Modulos | `[SIM/NAO]` | `[MODULO-A]` | `[OBSERVACAO]` |
| APIs | `[SIM/NAO]` | `[API-A]` | `[OBSERVACAO]` |
| Ambientes | `[SIM/NAO]` | `[DESENVOLVIMENTO / HOMOLOGACAO / OUTRO AUTORIZADO]` | `[OBSERVACAO]` |
| Tenants ou sites | `[SIM/NAO]` | `[TENANT-FICTICIO-A]` | `[OBSERVACAO]` |
| Integracoes | `[SIM/NAO]` | `[INTEGRACAO-A]` | `[OBSERVACAO]` |
| Categorias de dados | `[SIM/NAO]` | `[CATEGORIA, SEM DADO REAL]` | `[OBSERVACAO]` |
| Fornecedores | `[SIM/NAO]` | `[FORNECEDOR-A]` | `[OBSERVACAO]` |
| Fluxos criticos | `[SIM/NAO]` | `[FLUXO-A]` | `[OBSERVACAO]` |

### Fora de escopo e exclusoes

| Item | Motivo | Risco da exclusao | Aprovador | Revisao futura |
|---|---|---|---|---|
| `[ITEM]` | `[MOTIVO]` | `[RISCO]` | `[PAPEL-OU-ID]` | `[DATA/GATILHO]` |

### Premissas e limitacoes de escopo

- `[PREMISSA-OU-LIMITACAO]`
- `[DEPENDENCIA-DE-CONTRATO, AMBIENTE, FERRAMENTA OU VERSAO]`

## 6. Metodologia

| Metodo | Aplicavel | Escopo e abordagem | Criterio ou referencia | Evidencia esperada | Limitacao principal |
|---|---|---|---|---|---|
| Auditoria manual | `[SIM/NAO]` | `[ABORDAGEM]` | `[BASELINE-INTERNO]` | `[ID-DE-EVIDENCIA]` | `[LIMITACAO]` |
| SAST | `[SIM/NAO]` | `[ESCOPO]` | `[REGRAS/POLITICA]` | `[ID]` | `[NAO PROVA AUSENCIA DE FALHAS]` |
| DAST | `[SIM/NAO]` | `[AMBIENTE AUTORIZADO]` | `[PERFIL]` | `[ID]` | `[COBERTURA E ESTADO DO AMBIENTE]` |
| SCA/dependencias | `[SIM/NAO]` | `[ECOSSISTEMAS]` | `[POLITICA]` | `[ID]` | `[BASE E IDENTIFICACAO DE VERSOES]` |
| Secret scanning | `[SIM/NAO]` | `[HISTORICO/DIRETORIO]` | `[POLITICA]` | `[ID]` | `[FALSOS POSITIVOS E FORMATOS]` |
| Container scanning | `[SIM/NAO]` | `[IMAGENS/DIGESTS]` | `[POLITICA]` | `[ID]` | `[BASE IMAGE E RUNTIME]` |
| IaC scanning | `[SIM/NAO]` | `[FORMATOS]` | `[POLITICA]` | `[ID]` | `[NAO VALIDA TODO O ESTADO REAL]` |
| SBOM | `[SIM/NAO]` | `[RELEASE/ARTEFATO]` | `[CYCLONEDX/SPDX, SE APLICAVEL]` | `[ID]` | `[INVENTARIO NAO E ATESTADO]` |
| Acessibilidade | `[SIM/NAO]` | `[FLUXOS E METODOS]` | `[WCAG 2.2 AA/BASELINE APLICAVEL]` | `[ID]` | `[AUTOMACAO NAO SUBSTITUI TESTE MANUAL]` |
| LGPD/privacidade | `[SIM/NAO]` | `[FLUXOS DE DADOS]` | `[PROGRAMA INTERNO E VALIDACAO JURIDICA]` | `[ID]` | `[DEPENDENCIA DE CONTEXTO LEGAL]` |
| Backend Python | `[SIM/NAO]` | `[APPS/MODULOS]` | `[GUIA INTERNO E VERSAO INSTALADA]` | `[ID]` | `[CUSTOMIZACOES E VERSAO]` |
| GitHub Actions/CI/CD | `[SIM/NAO]` | `[WORKFLOWS/PERMISSOES]` | `[ESTRATEGIA INTERNA]` | `[ID]` | `[PLANO E CONFIGURACAO]` |
| Revisao de evidencias | `[SIM/NAO]` | `[TRIAGEM/REDACAO]` | `[POLITICA DE EVIDENCIAS]` | `[ID]` | `[QUALIDADE DA COLETA]` |

## 7. Ferramentas e versoes

<!-- Nao invente versoes ou comandos. Copie somente dados confirmados na execucao autorizada. Remova argumentos sensiveis. -->

| Ferramenta | Versao confirmada | Comando ou modo sanitizado | Escopo | Saida | Relatorio bruto | Resumo sanitizado | Limitacoes |
|---|---|---|---|---|---|---|---|
| `[FERRAMENTA]` | `[VERSAO]` | `[MODO SEM SEGREDOS/ALVOS]` | `[ESCOPO]` | `[FORMATO]` | `reports/raw/[ARQUIVO-LOCAL]` | `reports/sanitized/[ARQUIVO-APROVADO]` | `[LIMITACOES]` |

## 8. Resumo de execucao

| Atividade | Status | Data/periodo | Responsavel | Evidencia | Limitacao ou motivo de nao execucao |
|---|---|---|---|---|---|
| `[ATIVIDADE]` | `[Realizada / Parcial / Nao realizada / Nao aplicavel]` | `[DATA]` | `[PAPEL-OU-ID]` | `[EV-ID OU N/A]` | `[LIMITACAO/MOTIVO]` |

### Contagem de achados

| Criticidade | Aberto | Em correcao | Corrigido | Aceito | Falso positivo | Total |
|---|---:|---:|---:|---:|---:|---:|
| Critico | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` |
| Alto | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` |
| Medio | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` |
| Baixo | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` | `[0]` |

## 9. Matriz de achados

<!-- Severidade deve seguir o metodo vigente do projeto. Nao antecipe ou substitua a matriz do Chunk 13. -->

| ID | Titulo seguro | Categoria | Severidade | Status | Ativo/modulo | Impacto | Probabilidade | Evidencia sanitizada | Recomendacao | Owner | Prazo | Reteste |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `[FIND-001]` | `[TITULO-SEM-VETOR]` | `[CATEGORIA]` | `[Critico/Alto/Medio/Baixo]` | `[Aberto/Em correcao/Corrigido/Aceito/Falso positivo]` | `[ID-OPACO]` | `[IMPACTO]` | `[PROBABILIDADE]` | `[EV-SAN-001]` | `[ACAO]` | `[PAPEL-OU-ID]` | `[AAAA-MM-DD]` | `[Pendente/Aprovado/Falhou/N/A]` |

### Falsos positivos

| ID | Ferramenta/regra | Justificativa tecnica | Escopo validado | Aprovador | Expiracao/revisao | Condicao de reabertura |
|---|---|---|---|---|---|---|
| `[FP-001]` | `[REGRA]` | `[JUSTIFICATIVA SEM DADO SENSIVEL]` | `[ESCOPO]` | `[PAPEL-OU-ID]` | `[DATA]` | `[CONDICAO]` |

## 10. Detalhamento de achados

<!-- Repita esta secao para cada finding. Nao inclua passos ofensivos, payloads ou resposta real do sistema. -->

### `[FIND-001] - [Titulo seguro]`

| Campo | Preenchimento |
|---|---|
| Categoria | `[CATEGORIA]` |
| Severidade e metodo | `[NIVEL E REFERENCIA AO METODO]` |
| Status | `[STATUS]` |
| Descricao | `[O QUE FOI IDENTIFICADO, EM NIVEL SEGURO]` |
| Condicao observada | `[CONDICAO SANITIZADA]` |
| Impacto | `[IMPACTO TECNICO, OPERACIONAL, LEGAL OU DE NEGOCIO]` |
| Probabilidade | `[JUSTIFICATIVA]` |
| Evidencia sanitizada | `[EV-SAN-001]` |
| Causa provavel | `[CAUSA, SEM ATRIBUICAO INDEVIDA]` |
| Recomendacao | `[CONTROLE OU RESULTADO ESPERADO]` |
| Criterio de aceite | `[CONDICAO TESTAVEL]` |
| Plano de correcao | `[ACOES E DEPENDENCIAS]` |
| Owner e prazo | `[PAPEL-OU-ID / DATA]` |
| Reteste | `[METODO, DATA E RESULTADO]` |
| Decisao | `[CORRIGIR / ACEITAR / EVITAR / TRANSFERIR / RECLASSIFICAR]` |

## 11. Matriz de riscos

| ID | Risco | Ativo | Ameaca | Vulnerabilidade | Impacto | Probabilidade | Severidade | Controles existentes | Controles recomendados | Risco residual | Decisao |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `[RISK-001]` | `[CENARIO DE RISCO]` | `[ID-OPACO]` | `[AMEACA]` | `[CONDICAO]` | `[IMPACTO]` | `[PROBABILIDADE]` | `[NIVEL]` | `[CONTROLES]` | `[CONTROLES]` | `[NIVEL E JUSTIFICATIVA]` | `[TRATAR/ACEITAR/EVITAR/TRANSFERIR]` |

### Riscos aceitos e pendentes

| ID | Estado | Justificativa | Controles compensatorios | Owner | Aprovador competente | Expiracao | Proxima revisao |
|---|---|---|---|---|---|---|---|
| `[RISK-001]` | `[Aceito/Pendente]` | `[JUSTIFICATIVA]` | `[CONTROLES]` | `[PAPEL-OU-ID]` | `[PAPEL-OU-ID]` | `[DATA]` | `[DATA/GATILHO]` |

## 12. Plano de remediacao

| Prioridade | Finding/risco | Acao | Owner | Prazo | Dependencias | Validacao | Status | Evidencia de correcao |
|---|---|---|---|---|---|---|---|---|
| `[P1]` | `[FIND-001]` | `[ACAO]` | `[PAPEL-OU-ID]` | `[AAAA-MM-DD]` | `[DEPENDENCIAS]` | `[TESTE/REVISAO]` | `[Planejado/Em curso/Bloqueado/Concluido]` | `[EV-FIX-001]` |

## 13. Criterios de decisao

### Aprovado

- Todos os controles e testes obrigatorios aplicaveis foram executados ou possuem justificativa aprovada.
- Nao ha condicao de bloqueio de release aberta.
- Evidencias suficientes sustentam a conclusao e foram protegidas conforme a classificacao.
- Riscos residuais estao dentro do apetite aprovado para o escopo.

### Aprovado com ressalvas

- Nao ha bloqueio imediato, mas existem pendencias com owner, prazo, validacao e monitoramento.
- As limitacoes e o risco residual foram comunicados e aprovados pela autoridade competente.
- O reteste obrigatorio e a condicao de revogacao da aprovacao estao registrados.

### Reprovado

- Existe bloqueio de release nao corrigido ou evidencias insuficientes para uma decisao segura.
- Ha risco fora do apetite sem aceite formal valido.
- O escopo, ambiente ou execucao divergiu materialmente do autorizado.
- Evidencia foi comprometida, omitida ou tratada de forma incompatível com sua classificacao.

### Bloqueio de release

| Condicao | Resultado esperado | Autoridade para liberar |
|---|---|---|
| `[CONDICAO DE BLOQUEIO DEFINIDA PELO BASELINE APLICAVEL]` | `[CORRECAO E RETESTE]` | `[PAPEL]` |

### Aceite formal de risco, excecoes e reteste

- Aceite deve conter risco, contexto, justificativa, controles compensatorios, owner, aprovador, prazo e expiracao.
- Excecao deve ser temporaria, ter escopo delimitado, criterio de encerramento e condicao de reabertura.
- Finding sujeito a bloqueio somente pode ser liberado conforme autoridade e politica aplicaveis.
- Reteste e obrigatorio quando a decisao depender da efetividade da correcao ou controle compensatorio.

## 14. Avaliacao por dominio

| Dominio | Aplicavel | Resultado | Achados relacionados | Evidencias | Pendencias e decisao |
|---|---|---|---|---|---|
| Seguranca de aplicacao | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |
| Dependencias e supply chain | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |
| Segredos | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |
| Containers | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |
| IaC e cloud | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |
| GitHub Actions/CI/CD | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |
| Backend Python | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |
| LGPD/privacidade | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[VALIDACAO JURIDICA, SE APLICAVEL]` |
| Acessibilidade | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |
| Incidentes e resposta | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |
| Fornecedores | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[VALIDACAO CONTRATUAL]` |
| Documentacao e governanca | `[SIM/NAO]` | `[RESULTADO]` | `[IDS]` | `[EV-IDS]` | `[RESUMO]` |

## 15. Mapeamentos de referencia

<!-- Mapeamento indica relacao, nao certificacao nem conformidade integral. Confirme versao/edicao aplicavel. -->

| Finding/controle | OWASP ASVS | OWASP Top 10 | OWASP API Security Top 10 | LGPD | ISO/ABNT ou outra referencia | Observacao |
|---|---|---|---|---|---|---|
| `[FIND-001]` | `[ID/SECAO CONFIRMADA]` | `[CATEGORIA CONFIRMADA]` | `[CATEGORIA OU N/A]` | `[TEMA/ARTIGO VALIDADO OU N/A]` | `[REFERENCIA E EDICAO CONFIRMADA]` | `[RELACAO E LIMITACAO]` |

## 16. Evidencias e anexos

### Registro de evidencias

| ID | Descricao sanitizada | Classe | Origem | Local controlado | Integridade/custodia | Retencao | Acesso |
|---|---|---|---|---|---|---|---|
| `[EV-001]` | `[DESCRICAO MINIMA]` | `[CLASSE]` | `[METODO/FERRAMENTA]` | `[reports/raw/ LOCAL OU SISTEMA RESTRITO]` | `[HASH/CUSTODIA SE APLICAVEL]` | `[PRAZO]` | `[PAPEIS]` |

### Pode ser anexado

- resumo sanitizado aprovado;
- tabela agregada sem dado pessoal ou identificador sensivel;
- captura irreversivelmente redigida, quando indispensavel;
- referencia opaca a evidencia restrita;
- SBOM ou outro artifact somente quando escopo, audiencia e compartilhamento forem aprovados.

### Nao pode ser anexado

- segredos, tokens, cookies, credenciais, chaves ou strings de conexao;
- dados pessoais reais, documentos, contatos, tenants ou clientes identificaveis;
- logs crus, dumps, backups, configuracoes reais ou `terraform.tfstate`;
- request/response integral, payload exploravel, PoC ofensiva ou passo de ataque;
- URL privada, IP interno, hostname, path absoluto ou topologia sensivel;
- relatorio bruto de scanner, screenshot sem redaction ou arquivo com metadados ocultos.

### Regras de armazenamento e redaction

- `reports/raw/` e somente local/restrito e permanece fora do Git.
- `reports/sanitized/` recebe apenas resumo reconstruido por allowlist, revisado e aprovado.
- Redaction deve remover o conteudo, inclusive metadados e camadas ocultas; ocultacao visual reversivel nao e suficiente.
- Cadeia de custodia, hash, origem, coletor, horario e transferencias devem ser registrados quando o valor probatorio ou investigativo exigir.

## 17. Limitacoes e ressalvas

| Tipo | Descricao | Efeito na conclusao | Tratamento ou proxima acao |
|---|---|---|---|
| Escopo parcial | `[DESCRICAO]` | `[EFEITO]` | `[ACAO]` |
| Limitacao de ferramenta | `[DESCRICAO]` | `[EFEITO]` | `[ACAO]` |
| Falsos positivos | `[DESCRICAO]` | `[EFEITO]` | `[ACAO]` |
| Falsos negativos | `[DESCRICAO]` | `[EFEITO]` | `[ACAO]` |
| Ausencia de evidencia | `[DESCRICAO]` | `[EFEITO]` | `[ACAO]` |
| Dependencia de ambiente | `[DESCRICAO]` | `[EFEITO]` | `[ACAO]` |
| Dependencia de versao | `[DESCRICAO]` | `[EFEITO]` | `[ACAO]` |
| Contrato ou legislacao | `[DESCRICAO]` | `[EFEITO]` | `[VALIDACAO JURIDICA/CONTRATUAL]` |

## 18. Proximas auditorias

| Auditoria | Gatilho ou periodicidade | Escopo previsto | Responsavel | Data-alvo | Dependencias |
|---|---|---|---|---|---|
| `[TIPO]` | `[GATILHO/FREQUENCIA]` | `[ESCOPO]` | `[PAPEL-OU-ID]` | `[AAAA-MM-DD]` | `[DEPENDENCIAS]` |

## 19. Declaracao final

- **Conclusao:** `[CONCLUSAO]`
- **Decisao:** `[Go / Go com ressalvas / No-Go / Pendente]`
- **Pendencias:** `[IDS E RESUMO]`
- **Proximos passos:** `[ACOES, RETESTES E AUDITORIAS]`
- **Responsaveis:** `[PAPEIS-OU-IDS]`
- **Validade da decisao:** `[DATA/GATILHO/RELEASE]`

<!-- Registre divergencias e excecoes abaixo sem apagar o historico de aprovacao. -->

## Criterios de aprovacao da auditoria

- [ ] Escopo, fora de escopo, commit, branch, release e ambiente foram identificados de forma segura.
- [ ] Atividades obrigatorias aplicaveis foram realizadas ou possuem excecao formal valida.
- [ ] Achados foram triados, classificados, atribuídos e vinculados a plano de remediacao.
- [ ] Nao existe bloqueio de release aberto, salvo liberacao formal permitida pela politica.
- [ ] Riscos aceitos possuem aprovador competente, controles, prazo, expiracao e revisao.
- [ ] Correcoes que exigem reteste foram validadas por pessoa autorizada.
- [ ] Evidencias sao suficientes, rastreaveis e protegidas conforme classificacao.
- [ ] Resumos sanitizados passaram por redaction e segunda revisao.
- [ ] Limitacoes, falsos positivos e risco de falsos negativos foram declarados.
- [ ] Decisao Go, Go com ressalvas ou equivalente foi registrada e aprovada.

## Criterios de reprovacao da auditoria

- [ ] Existe achado ou condicao definida como bloqueio de release sem correcao e reteste aprovado.
- [ ] Existe risco fora do apetite sem aceite formal valido.
- [ ] Segredo ativo, exposicao indevida ou dado pessoal real foi identificado no relatorio ou anexos.
- [ ] Evidencia essencial esta ausente, inconsistente, adulterada ou sem origem verificavel.
- [ ] Auditoria obrigatoria aplicavel nao foi executada e nao possui excecao aprovada.
- [ ] Escopo, ambiente, commit, branch ou release auditados nao correspondem ao objeto da decisao.
- [ ] Limitacao material impede concluir com confianca aceitavel.
- [ ] Excecao ou aceite expirou, perdeu controles compensatorios ou excedeu a autoridade do aprovador.
- [ ] Reteste obrigatorio falhou ou nao foi concluido.
- [ ] Decisao No-Go ou equivalente foi registrada pela autoridade competente.
