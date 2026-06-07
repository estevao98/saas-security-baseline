# Checklist de Seguranca Frappe

> Este checklist e aplicavel a Frappe Framework, ERPNext e Frappe Learning conforme versao, apps instalados, customizacoes e arquitetura. Ele nao declara seguranca, conformidade ou ausencia de vulnerabilidades.

## Objetivo

Verificar riscos praticos de seguranca em SaaS baseado em Frappe, com foco em autorizacao no servidor, DocTypes, roles, permissions, metodos whitelisted, jobs, hooks, arquivos, integracoes, logs e isolamento multi-tenant.

## Quando usar

- [ ] Antes de primeiro deploy, beta, release relevante ou venda empresarial de produto Frappe.
- [ ] Apos mudanca em DocType, role, permission, User Permission, workflow, API, job, hook, Server Script, Client Script, arquivo, integracao ou pagamento.
- [ ] Apos upgrade de Frappe, ERPNext, Frappe Learning, apps proprios ou apps de terceiros.
- [ ] Apos incidente, suspeita de acesso indevido, vazamento, regressao de permissao ou alteracao multi-tenant.
- [ ] Em revisao periodica proporcional ao risco, no minimo antes de releases com mudancas de negocio ou permissao.

## Revisor responsavel

- [ ] Responsavel tecnico Frappe/Python revisa comportamento de framework, apps, hooks, jobs e customizacoes.
- [ ] AppSec ou seguranca revisa autorizacao, exposicao publica, segredos, logs, arquivos e integracoes.
- [ ] Dono de produto ou dominio revisa regras de negocio, papeis, workflows, cursos, relatorios, clientes, fornecedores e operacoes financeiras.
- [ ] Privacidade/Juridico revisa dados pessoais, logs, fornecedores, comunicacoes e incidentes quando aplicavel.
- [ ] Operacoes ou plataforma revisa sites, tenants, bench, proxy, storage, backups, filas, workers e observabilidade.

## Evidencias esperadas

- [ ] Inventario sanitizado de versoes, apps, sites ou tenants, DocTypes criticos, roles, Role Profiles, User Permissions, hooks, jobs, scripts, metodos whitelisted, arquivos e integracoes.
- [ ] Matriz sanitizada de papel x DocType x permissao, incluindo leitura, escrita, criacao, exclusao, submit, cancel, import, export, report, print, email, share e niveis de campo aplicaveis.
- [ ] Casos de teste positivos e negativos por papel, usuario representativo, tenant/site, Company ou escopo de negocio aplicavel.
- [ ] Registro de revisao de cada `@frappe.whitelist`, `allow_guest=True`, `ignore_permissions=True`, `frappe.get_all`, SQL direto, job privilegiado e hook sensivel.
- [ ] Resultado de scanners e buscas aplicaveis com triagem humana, guardando cru fora do Git e somente resumo sanitizado quando aprovado.
- [ ] Evidencia de reteste para achados corrigidos, com ID opaco, escopo, revisor e resultado.

## Itens obrigatorios

- [ ] Confirmar versoes instaladas de Frappe, ERPNext, Frappe Learning, apps proprios, apps de terceiros, Python e Node antes de concluir achados.
- [ ] Confirmar que nenhuma conclusao depende de comportamento nao validado para a versao instalada.
- [ ] Inventariar DocTypes criticos e revisar permissao efetiva no JSON versionado e nas customizacoes do site quando existirem.
- [ ] Revisar Roles e Role Profiles por menor privilegio, segregacao de funcoes e acumulacao indevida de papeis.
- [ ] Revisar User Permissions e filtros por Company, Customer, Supplier, territorio, curso, turma, tenant ou outro Link aplicavel.
- [ ] Testar acesso direto por identificador a documento de outro usuario, tenant, site, Company, aluno, cliente ou fornecedor.
- [ ] Confirmar que controles de UI, campos ocultos, botoes removidos e Client Scripts nao sao a unica barreira de autorizacao.
- [ ] Revisar `has_permission` e `permission_query_conditions` com testes de listagem e acesso direto ao documento.
- [ ] Revisar todos os `@frappe.whitelist()` e justificar cada metodo publico, especialmente `allow_guest=True`.
- [ ] Confirmar que metodo whitelisted autentica, autoriza no objeto, valida entrada, limita saida e usa alteracao de estado apenas quando o fluxo aprovado permitir.
- [ ] Revisar Server Scripts do tipo API, quando habilitados, com os mesmos criterios de metodos whitelisted.
- [ ] Revisar REST CRUD dos DocTypes criticos com papeis minimos e testes negativos.
- [ ] Revisar cada uso de `ignore_permissions=True`, `flags.ignore_permissions`, `frappe.get_all`, `frappe.db.sql` e `frappe.db.set_value`.
- [ ] Confirmar que bypass de permissao possui autorizacao anterior, alvo limitado, justificativa, owner e teste.
- [ ] Confirmar que SQL direto usa parametrizacao e nao substitui autorizacao, escopo de tenant ou regra de negocio.
- [ ] Revisar `hooks.py`, ordem de apps, `doc_events`, overrides, `auth_hooks`, hooks de permissao, scheduler e assets injetados.
- [ ] Revisar jobs, scheduler e workers quanto a site correto, argumentos, retry, idempotencia, concorrencia, timeout, logs e contexto multi-tenant.
- [ ] Revisar arquivos publicos e privados, upload, download, tamanho, tipo, destino, vinculacao ao documento e exposicao de `/files/`.
- [ ] Confirmar que anexos privados, conteudo educacional, invoices, dados financeiros, URLs de reuniao e links externos nao ficam publicos nem sao expostos por API ou log.
- [ ] Revisar webhooks, WhatsApp/API, pagamentos, e-mail, storage, analytics e demais integracoes quanto a autenticidade, escopo, timeout, retry, idempotencia e redaction.
- [ ] Confirmar que segredos de integracoes nao estao em Git, logs, artifacts, fixtures, exemplos, `site_config.json`, `common_site_config.json`, dumps ou backups.
- [ ] Revisar logs de web, worker, scheduler, Error Log, Integration Request e observabilidade para minimizar dados pessoais, tokens, URLs sensiveis e payloads.
- [ ] Testar isolamento multi-tenant conforme arquitetura: site por tenant, multi-company em ERPNext ou tenant logico por campo.
- [ ] Confirmar que roteamento por host, header, site, company ou tenant nao aceita decisao vinda do cliente sem validacao server-side.
- [ ] Revisar ERPNext, quando aplicavel, para Customer, Supplier, Contact, Address, invoices, pagamentos, relatorios, exports e segregacao financeira.
- [ ] Revisar Frappe Learning, quando aplicavel, para cursos, aulas, matriculas, alunos, instrutores, avaliadores, moderadores, relatorios, preview e anexos.
- [ ] Executar revisao manual obrigatoria de DocTypes, roles, permissions, whitelisted methods, jobs, hooks, arquivos, integracoes e isolamento multi-tenant.
- [ ] Registrar achados, falsos positivos, excecoes e aceites de risco por ID opaco, com owner, prazo e criterio de reteste.

## Itens desejaveis

- [ ] Manter matriz versionada e sanitizada de permissoes aprovadas por papel e modulo.
- [ ] Automatizar testes de autorizacao para fluxos criticos, incluindo casos negativos entre tenants, companies, alunos, clientes e fornecedores.
- [ ] Executar Bandit, Ruff com regras de seguranca, pip-audit, Semgrep e secret scanning com versoes fixadas e triagem humana.
- [ ] Criar regras Semgrep internas apenas apos validar falsos positivos e falsos negativos em fixture ficticia.
- [ ] Revisar dependencias Python e JavaScript com lockfiles e SBOM quando o release exigir.
- [ ] Revisar customizacoes por site por export sanitizado e diff contra baseline aprovado.
- [ ] Testar falhas e duplicidade de webhooks, pagamentos, notificacoes e jobs assíncronos em ambiente autorizado com dados ficticios.
- [ ] Exercitar restore e rollback antes de migracoes ou patches com impacto em DocTypes, permissoes ou dados.
- [ ] Definir revisao periodica de papeis administrativos, export, import, report, print, email, share e configuracoes financeiras.
- [ ] Separar evidencias de Frappe em armazenamento restrito quando contiverem nomes de DocTypes, sites, roles, logs, cursos, clientes, fornecedores ou integracoes reais.

## Melhorias futuras

- [ ] Criar fixture Frappe minima e ficticia, sem `sites/`, banco, usuario, configuracao real, logs, backups ou dados reais, para testar buscas e regras.
- [ ] Criar matriz de versoes validadas para Frappe, ERPNext, Frappe Learning, Python, Node e ferramentas de auditoria.
- [ ] Integrar testes de autorizacao e scanners ao CI somente apos validar permissões, logs, artifacts, rede, falsos positivos e politica de falha.
- [ ] Implementar recertificacao periodica de papeis e permissoes por owner de negocio.
- [ ] Avaliar segregacao mais forte, como site por tenant, quando isolamento logico por campo nao for suficiente para o risco.
- [ ] Produzir relatorios sanitizados por release com delta de permissoes, customizacoes, hooks, jobs e integracoes.
- [ ] Buscar revisao independente para fluxos financeiros, multi-tenant, dados pessoais sensiveis ou clientes enterprise quando o risco justificar.

## Criterios de aprovacao

- [ ] Todos os itens obrigatorios aplicaveis foram executados ou possuem justificativa de nao aplicabilidade aprovada.
- [ ] Versoes e arquitetura foram confirmadas sem presumir comportamento de outra release do Frappe.
- [ ] Testes negativos comprovam autorizacao server-side para DocTypes, APIs, arquivos, relatorios e fluxos criticos.
- [ ] Metodos Guest, bypasses de permissao, SQL direto, jobs privilegiados e hooks sensiveis foram revisados e justificados.
- [ ] Isolamento multi-tenant aplicavel foi testado e nao ha acesso cruzado confirmado.
- [ ] Nao ha segredo, configuracao real, log cru, dump, backup, dado pessoal real ou evidencia sensivel versionada.
- [ ] Achados bloqueantes foram corrigidos e retestados ou possuem decisao formal permitida pela politica.
- [ ] O resumo sanitizado declara escopo, limites, versao, evidencias por ID opaco e riscos residuais.

## Criterios de reprovacao ou bloqueio

- [ ] Quebra confirmada ou plausivel de isolamento entre sites, tenants, companies, alunos, clientes ou fornecedores.
- [ ] Metodo Guest, REST, arquivo, relatorio ou job expondo dado restrito sem autorizacao adequada.
- [ ] `ignore_permissions`, `get_all`, SQL direto, hook ou job privilegiado permitindo leitura ou mutacao sem controle equivalente.
- [ ] Papel, Role Profile ou permissao concede administracao, exportacao, finanças, moderacao ou acesso sensivel sem aprovacao e necessidade.
- [ ] Segredo, token, cookie, configuracao real, `site_config.json`, backup, dump, log cru ou dado pessoal real foi encontrado no Git, artifact ou resumo.
- [ ] Upload/download torna conteudo privado publico ou permite conteudo ativo sem controle proporcional.
- [ ] Webhook ou pagamento pode alterar estado financeiro sem autenticidade, idempotencia ou reconciliacao adequada.
- [ ] Job ou scheduler atua no site, tenant, Company ou escopo errado.
- [ ] Scanner, revisao manual ou teste obrigatorio nao executou e nao ha alternativa aprovada.
- [ ] Evidencia essencial esta ausente, crua no Git, sem redaction ou sem revisor competente.

## Cuidados contra vazamento

- [ ] Nao criar, commitar ou anexar `site_config.json`, `common_site_config.json`, backups, dumps, logs reais, exports reais, arquivos privados, banco, fixtures de site real ou dados de tenant real.
- [ ] Nao usar nomes reais de tenants, usuarios, alunos, instrutores, cursos, clientes, fornecedores, empresas, contas, integracoes ou ambientes.
- [ ] Nao colar payloads, requests, responses, headers, cookies, tokens, webhooks reais, URLs internas, URLs assinadas, links de reuniao, links de aula ou detalhes exploraveis.
- [ ] Nao registrar CPF, CNPJ, e-mail, telefone, endereco, documento, invoice, dado financeiro, conteudo educacional restrito ou informacao de cliente.
- [ ] Nao publicar relatorios crus de scanners, Error Log, Integration Request, stack traces, paths internos ou logs de worker/scheduler em Git, issue, PR ou artifact amplo.
- [ ] Usar IDs opacos para evidencias, findings, tenants, sites, usuarios, cursos, clientes, fornecedores, integracoes e releases.
- [ ] Reconstruir resumos por allowlist; nao fazer redaction superficial de JSON, HTML, PDF, imagem ou log.
- [ ] Tratar checklist preenchido como informacao potencialmente confidencial, pois revela arquitetura, lacunas, roles, integracoes e postura de seguranca.
