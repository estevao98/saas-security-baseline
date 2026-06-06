# Auditoria de Segurança para Frappe, ERPNext, Frappe Learning e Python

## Objetivo e limites

Este guia orienta revisão defensiva de aplicações baseadas em Frappe Framework, ERPNext, Frappe Learning (anteriormente Frappe LMS) e Python. Ele combina inspeção de código, configuração, permissões e fluxos de negócio. Não substitui teste autorizado no ambiente, revisão de arquitetura, threat modeling, validação jurídica ou auditoria financeira.

**Obrigatório no baseline interno:** revisar autorização no servidor, exposição pública, isolamento entre sites, segredos, integrações, arquivos, jobs e dependências antes do release.

**Dependência de versão:** a documentação oficial sem versão fixa pode refletir a versão corrente. Confirme a branch/tag instalada de Frappe, ERPNext e Learning antes de concluir um achado. Em especial, a Database API documenta mudanças no Frappe v16; permissões customizadas adicionais aparecem como recurso v16; nomes de papéis, DocTypes e hooks podem mudar entre releases e custom apps.

## Escopo mínimo e inventário

Antes da revisão, registre sem dados sensíveis:

- versões exatas de Frappe, ERPNext, Learning, apps próprios, Python e Node;
- sites/tenants, apps instalados por site e modelo de hospedagem;
- DocTypes críticos, papéis, integrações, gateways, webhooks e jobs;
- endpoints públicos, métodos whitelisted e Server Scripts de API;
- arquivos públicos/privados e provedores de armazenamento;
- lockfiles, imagens e artefato exato candidato ao release.

### Estrutura típica de um app Frappe

Um app é um pacote Python dentro de `apps/`. A estrutura varia por versão e app, mas normalmente inclui:

```text
apps/example_app/
├── pyproject.toml ou setup.py
├── package.json
├── example_app/
│   ├── hooks.py
│   ├── modules.txt
│   ├── patches.txt
│   ├── public/
│   ├── templates/
│   └── example_module/
│       └── doctype/example_record/
│           ├── example_record.json
│           ├── example_record.py
│           ├── example_record.js
│           └── test_example_record.py
└── ...
```

O JSON do DocType define metadados e permissões padrão; o controller Python implementa comportamento no servidor; JavaScript controla a interface, não constitui barreira de autorização; `hooks.py` estende ou substitui comportamentos globais. Customizações por site podem existir no banco como Custom Field, Property Setter, Client Script, Server Script e Custom DocPerm, portanto revisar apenas o Git é insuficiente.

## Modelo de revisão por superfície

| Superfície | Verificação obrigatória | Evidência esperada |
|---|---|---|
| DocTypes | Menor privilégio para `read`, `write`, `create`, `delete`, `submit`, `cancel`, `amend`, `report`, `export`, `import`, `share`, `print`, `email` e níveis de campo aplicáveis. | Export sanitizado da matriz papel x permissão e teste por usuário representativo. |
| Roles e Role Profiles | Perfis não acumulam papéis incompatíveis; papéis administrativos têm dono, justificativa e revisão periódica. | Lista sanitizada de perfis, aprovador e data da revisão. |
| User Permissions | Restrições por Company, Customer, Supplier, Territory ou outro Link funcionam em listas, documentos, relatórios e APIs. | Casos positivos e negativos por usuário e empresa/tenant. |
| Custom DocPerm | Comparar permissões padrão do app com overrides por site; identificar ampliação involuntária após migração. | Diff/export revisado de customizações. |
| `has_permission` | O hook decide acesso ao documento e retorna `True`, `False` ou `None` conscientemente; não confia em dados do cliente. | Testes de leitura e mutação com objeto pertencente e não pertencente ao usuário. |
| `permission_query_conditions` | Condição usa identidade confiável, valores escapados e corresponde à decisão de documento. | Testes de listagem e acesso direto; revisão da cláusula gerada. |
| Whitelist/API | Cada método autentica, autoriza no objeto, valida entrada, limita saída e usa verbo HTTP coerente. | Inventário endpoint x autenticação x papel x objeto x rate limit. |
| Jobs/scheduler | Parâmetros não permitem escolher tenant/objeto sem revalidação; retries são idempotentes; falhas não vazam dados. | Teste de retry, concorrência, tenant e observabilidade sanitizada. |
| Hooks/scripts | Overrides e scripts não removem validações, permissões ou trilha de auditoria. | Inventário de hooks e scripts ativos por site, com revisão. |
| SQL/ORM | Consultas parametrizadas; ORM preferido; APIs que ignoram permissão têm autorização explícita. | Testes de autorização e revisão de cada bypass. |
| Arquivos | Upload valida autorização, tamanho, tipo e destino; conteúdo privado não é salvo em área pública. | Casos de upload/download por papel e registro de storage. |
| Integrações | Credenciais fora do Git; timeout, validação de resposta, idempotência, assinatura/autenticidade e replay tratados. | Diagrama, contrato, testes e amostra redigida de logs. |

## Permissões e acesso a documentos

### DocType, papéis e perfis

- Revise permissões no JSON versionado e no Role Permission Manager do site.
- Teste separadamente usuário de portal/website, usuário interno, operador, gestor e administrador.
- Trate `export`, `report`, `print`, `email`, `share`, `import` e `Set User Permissions` como capacidades de alto impacto, não como conveniência de UI.
- Use níveis de permissão de campo apenas como parte da defesa. Confirme que APIs, relatórios, exports e código customizado não retornam o campo por outro caminho.
- Role Profile é um agrupador de papéis. Revise o conjunto resultante, inclusive combinações que quebram segregação de funções.
- Permissões configuradas no cliente, campos ocultos e botões removidos não substituem autorização no servidor.

### `has_permission` e `permission_query_conditions`

Os dois controles precisam ser coerentes: a listagem não deve revelar registros que o acesso direto bloqueia, e o acesso direto não deve depender apenas de a lista ter filtrado o item.

`permission_query_conditions` acrescenta condição a `frappe.db.get_list`; a documentação oficial alerta que não afeta `frappe.db.get_all`. O hook recebe `user`, que pode ser `None`, e retorna fragmento SQL; use identidade da sessão e escape/parametrização compatível com a versão.

`has_permission` recebe documento, usuário e tipo de permissão. Retornar `None` delega ao comportamento padrão; retornar `True` de modo amplo pode ampliar acesso. Teste `read`, `write`, `create`, `delete`, `submit` e ações customizadas aplicáveis.

### Permissões customizadas

Há dois conceitos diferentes:

1. **Custom DocPerm:** override/adicional por site, gerido pelo Role Permission Manager e armazenado como customização.
2. **Custom Permission Types:** capacidade documentada para Frappe v16 em diante; exige definição do tipo, checagem explícita no código e atribuição a papéis.

Não presuma que um tipo customizado exista em v15 ou anterior. Para versões antigas, valide o mecanismo realmente implementado e não replique nomes da documentação v16 sem suporte local.

### Bypasses perigosos

`ignore_permissions=True` é um bypass deliberado e exige justificativa por chamada. Pode ser aceitável em migração controlada, patch, rotina interna ou registro técnico, mas nunca deve transformar entrada do usuário em leitura ou mutação privilegiada sem autorização anterior.

Revise também operações que contornam partes do ciclo do Document, como SQL direto e `frappe.db.set_value`, que não chama triggers como `validate` e `on_update`. O risco não é somente acesso indevido: regras contábeis, estados, auditoria e integridade podem ser ignorados.

## APIs, autenticação e sessão

### Métodos whitelisted

Todo `@frappe.whitelist()` cria superfície potencial para chamada remota pelo caminho do método. `allow_guest=True` permite acesso sem sessão autenticada e deve ser exceção documentada.

Para cada método:

- exigir autenticação salvo requisito público aprovado;
- autorizar o usuário no DocType e no documento específico;
- validar tipo, tamanho, enumeração e relação entre parâmetros;
- não aceitar do cliente o usuário, site, company, owner, preço, total ou estado como fonte de verdade;
- retornar somente campos necessários;
- usar `POST` para alteração de estado; a REST API documenta `GET` para retorno sem mutação e `POST` para mutação;
- aplicar limite de requisição proporcional, inclusive proteção adicional em login, recuperação, convite, export, upload e webhook;
- evitar stack trace, SQL, paths, configuração e detalhes internos na resposta.

Server Scripts do tipo API também podem expor endpoints em `/api/method`; a documentação corrente permite Guest e rate limit por IP. Eles precisam entrar no mesmo inventário de métodos Python.

### REST de DocTypes

Frappe gera CRUD REST para DocTypes. A segurança depende das permissões efetivas do usuário autenticado e das customizações. Teste listagem, acesso por nome, criação, atualização e exclusão com papéis mínimos. Desabilitar um botão não impede a chamada REST.

Evite `debug=True` fora de diagnóstico controlado: a documentação mostra que a resposta pode incluir consulta executada e tempo, o que amplia exposição técnica.

### Autenticação, sessão, CSRF e rate limiting

- Preserve os controles nativos de sessão e CSRF; qualquer endpoint, proxy, override de handler ou autenticação customizada que os contorne exige revisão específica da versão instalada.
- Não marque método como Guest para resolver erro de CSRF ou integração mal configurada.
- Para clientes sem cookie de sessão, use o mecanismo oficial de autenticação suportado pela versão e uma identidade técnica de menor privilégio; nunca registre o segredo.
- Revise `auth_hooks`: autenticação inválida não pode resultar em usuário privilegiado ou fallback silencioso inadequado. A documentação informa que requisição não verificada segue como Guest.
- Confirme política de senha, bloqueio/tentativas de login, expiração/revogação de sessão, logout e MFA quando disponível e aplicável à versão.
- O rate limiting geral do Frappe é configurável por site, mas sua semântica e chaves variam entre documentação de versões. Valide a versão instalada e complemente por endpoint/edge quando necessário.

## Banco de dados e ORM

| API | Comportamento relevante | Decisão de auditoria |
|---|---|---|
| `frappe.get_list` / `frappe.db.get_list` | Aplica permissões do usuário da sessão e `permission_query_conditions`. | Preferir para listas visíveis ao usuário; ainda validar filtros, campos retornados e contexto. |
| `frappe.get_all` / `frappe.db.get_all` | Busca sem aplicar permissões. | Tratar como bypass; permitir só após autorização explícita e escopo mínimo. |
| `frappe.get_doc` | Carrega/cria um Document; carregar o objeto não prova que o chamador pode lê-lo ou alterá-lo. | Checar permissão antes de expor ou mutar; usar operações do Document sem bypass. |
| `frappe.db.sql` | Executa SQL arbitrário e pode contornar validações e integridade do ORM. | Preferir ORM/query builder; parametrizar valores e revisar autorização da consulta. |
| `frappe.db.set_value` | Atualiza sem chamar triggers como `validate` e `on_update`. | Usar apenas quando a ausência desses hooks for intencional e testada. |

Não concatene, interpole com f-string ou formate valores externos em SQL. Parametrização reduz injeção, mas não resolve autorização, exposição excessiva, escolha dinâmica insegura de tabela/campo ou quebra de regras de negócio.

## Jobs, scheduler e hooks

### Background jobs

- Revise `frappe.enqueue` e `frappe.enqueue_doc`, argumentos serializados, fila, timeout e `enqueue_after_commit` quando o job depende de uma transação confirmada.
- Revalide no worker a existência, tenant/site, estado e permissão do objeto. Não confie que a requisição que enfileirou continuará válida.
- Torne callbacks, webhooks e pagamentos idempotentes; registre identificador técnico não sensível e resultado.
- Evite colocar tokens, documentos completos, dados pessoais ou conteúdo de arquivos nos argumentos e nomes dos jobs.
- Teste duplicação, retry, execução fora de ordem, timeout e falha parcial entre banco e serviço externo.

### Scheduler

A documentação oficial informa que jobs do scheduler executam como `Administrator`. Portanto, cada job agendado é caminho privilegiado: filtre site/company/tenant de forma explícita, limite o lote e não derive o alvo de dados não confiáveis. Após alteração em `scheduler_events`, confirme o procedimento exigido pela versão, como migração do site.

### Hooks

Revise pelo menos `doc_events`, `override_whitelisted_methods`, `override_doctype_class`, `extend_doctype_class`, `auth_hooks`, `permission_query_conditions`, `has_permission`, `scheduler_events`, fixtures, assets injetados e hooks de dados pessoais usados pelo app. Ordem de resolução entre apps pode alterar o comportamento final; valide a lista e ordem de apps instalados no site.

### Server, Client e Custom Scripts

- **Server Script:** inventariar tipo, evento/API, Guest, rate limit, métodos permitidos, dono e histórico. RestrictedPython reduz superfície, mas não prova autorização ou lógica segura.
- **Client Script/Custom Script:** considerar código não confiável para autorização. Revisar XSS, exposição de campos, URLs e chamadas a métodos, mas impor toda decisão no servidor.
- **Customizações por site:** exportar e comparar com baseline aprovado; mudanças via Desk podem não aparecer no app versionado.

## Arquivos, conteúdo e URLs

- Arquivos em `public/files` e assets do app são públicos; não guardar neles invoices, anexos de cliente, material restrito, backups ou conteúdo educacional privado.
- Arquivos em `private/files` exigem autorização, mas a revisão deve comprovar vínculo e acesso correto ao documento, não apenas presença no diretório privado.
- Validar tamanho, extensão, tipo real, nome, autorização de upload, malware conforme risco, armazenamento e resposta de download.
- Não renderizar upload ativo em origem confiável sem controles apropriados. Para SCORM e outros pacotes executáveis/ativos, aplicar confiança forte ao autor, validação e isolamento compatíveis com a arquitetura.
- Campos como `meeting_url`, `external_url`, links de aula, links de pagamento e URLs assinadas podem conceder acesso fora do Frappe. Não expor em lista, log, API Guest, analytics ou mensagem sem destinatário autorizado.
- Não permitir que um usuário escolha caminho local, URL de callback ou destino interno sem allowlist e validação arquitetural.

## Integrações, webhooks e pagamentos

Para integrações externas, WhatsApp/API, webhooks e pagamentos:

- usar segredo armazenado fora do Git e acesso de menor privilégio;
- validar autenticidade conforme o contrato oficial do provedor, além de TLS;
- limitar janela/replay quando o protocolo oferecer timestamp ou identificador de evento;
- manter idempotência por identificador do evento e transição válida de estado;
- não confiar em valor, moeda, customer, invoice ou status recebido sem reconciliar com registro interno;
- responder rapidamente e processar trabalho demorado em fila, sem confirmar sucesso de negócio antes da persistência necessária;
- definir timeout, retry com backoff, tratamento de indisponibilidade e circuit breaker quando aplicável;
- redigir headers, corpo, telefone, e-mail, URL e resposta nos logs;
- testar eventos duplicados, atrasados, fora de ordem, falhos e desconhecidos;
- restringir quem pode criar/alterar Webhook, Integration Request, configurações de gateway e contas financeiras.

`Integration Request` pode conter URL, headers, payload, resposta e erro. Mesmo quando usado legitimamente para auditoria, trate o registro como sensível e aplique retenção e acesso restritos. O uso documentado de `ignore_permissions` para inserir esse registro técnico não autoriza reutilizar o bypass em lógica de negócio.

## Multi-tenant e isolamento entre sites

Frappe define cada tenant como um **site** com banco e `site_config.json` próprios. Isso oferece uma fronteira importante, mas não elimina riscos no bench, workers, cache, filesystem, proxy, backups e apps compartilhados.

- Nunca aceite `site`, host, `X-Frappe-Site-Name`, company ou tenant do corpo da requisição como decisão suficiente de roteamento/autorização.
- Restrinja headers de seleção de site no proxy e valide a resolução de host conforme a arquitetura aprovada.
- Execute comandos administrativos com `--site` explícito e alvo revisado; evite defaults em automação crítica.
- Separe arquivos, backups, filas, caches e credenciais por site conforme suporte da versão e arquitetura.
- Garanta que jobs iterando sites restabeleçam contexto e limpem estado global entre tenants.
- Não use `frappe.get_all`, SQL compartilhado, cache global ou integração técnica para misturar dados de sites/companies.
- Em ERPNext multi-company dentro do mesmo site, **Company não equivale a isolamento físico de tenant**. Teste User Permissions, relatórios, exports, razão contábil, clientes, fornecedores e invoices por empresa.
- Em SaaS com múltiplos clientes no mesmo site por campo `tenant_id`, a aplicação assume isolamento lógico próprio. Exija filtro server-side em toda consulta e mutação, índice/constraint apropriado, testes negativos e threat model; considere site por tenant quando o risco exigir fronteira mais forte.

## Frappe Learning

A documentação corrente lista os papéis LMS Student, Course Creator, Batch Evaluator e Moderator. Nomes e alcance devem ser confirmados na release instalada.

- Testar curso, capítulo, aula, quiz, assignment, batch, matrícula, progresso, avaliação, relatório e discussão com cada papel.
- Confirmar que aluno não lê aula sem matrícula, salvo conteúdo explicitamente marcado para preview.
- Confirmar que preview público não inclui notas de instrutor, respostas, dados de alunos, anexos privados ou links restritos.
- Restringir criação/edição ao curso e batch autorizados; um instrutor não deve administrar conteúdo ou alunos de outro escopo.
- Tratar Moderator como papel administrativo de alto impacto e revisar atribuição periodicamente.
- A documentação alerta que Course Creator pode enviar SCORM, que pode executar código. Conceder somente a autores confiáveis e revisar upload, extração, hospedagem e isolamento na versão adotada.
- Proteger `meeting_url`, gravações, links externos, conteúdo licenciado e dados de matrícula contra API Guest, logs, indexação e acesso direto.

## ERPNext

- Restringir Customer, Supplier, Contact, Address e seus anexos por Company/território/carteira conforme o modelo aprovado.
- Testar Sales Invoice, Purchase Invoice, Payment Entry, Journal Entry, Payment Request, contas bancárias, relatórios e exports com segregação entre criação, aprovação, submissão, cancelamento e pagamento.
- Revisar papéis autorizados a overbilling, períodos/contas congeladas, importação, exportação, compartilhamento e alteração de configurações contábeis.
- Testar User Permissions por Company, Customer, Supplier, Customer Group e Supplier Group em listas, links, relatórios, APIs e acesso direto.
- Separar usuário de portal de usuário interno. Cliente ou fornecedor externo não deve adquirir acesso Desk ou papel financeiro por combinação de perfis.
- Não expor dados fiscais, bancários, contatos, preços, margem, razão, invoices ou anexos em método Guest, log, Integration Request ou relatório amplo.
- Em pagamentos assíncronos, reconciliar o evento com Payment Request/invoice interno, garantir idempotência e impedir transição financeira apenas por parâmetro recebido.

## Logs, dados pessoais e segredos

- Não registrar senha, cookie, sessão, API secret, token, autorização, assinatura de webhook ou corpo integral por padrão.
- Minimizar e redigir e-mail, telefone, endereço, documento fiscal, conteúdo educacional, dados financeiros, URLs de reunião e identificadores externos.
- Revisar Error Log, Integration Request, logs de worker/scheduler/web, snapshots, analytics e observabilidade externa.
- Definir acesso, retenção, descarte, finalidade e base de tratamento com o programa de privacidade; este guia não substitui o Chunk 9.
- Nunca versionar `site_config.json`, `common_site_config.json`, backups, dumps, logs ou configuração real de provider. Use referências abstratas a secret manager/variável de ambiente conforme implantação.
- Ao detectar segredo, interromper exposição, revogar/rotacionar e avaliar histórico e logs. Remover apenas do arquivo atual é insuficiente.

## Dependências e scanners

| Controle | Papel neste guia | Limite principal |
|---|---|---|
| Bandit | SAST Python para padrões como SQL, subprocess, criptografia e desserialização. | Não entende permissões Frappe, tenant, papel ou fluxo financeiro completo. |
| Ruff | Lint rápido; regras `S` podem complementar Bandit quando selecionadas e estabilizadas. | Não substitui Bandit/revisão e pode ter sobreposição ou diferenças de regra. |
| pip-audit | SCA de dependências Python contra advisories conhecidos. | Ausência de advisory não prova segurança; resolução/índice privado exigem cuidado. |
| Semgrep | Regras locais para padrões Frappe e Python revisados. | Achado sintático exige contexto; regra não prova explorabilidade nem ausência do padrão. |
| Secret scanning | Detecta material com aparência de segredo no Git/worktree. | Pode perder formatos próprios e não confirma revogação, escopo ou histórico externo. |
| Dependency scanning | Revisão de mudanças e advisories Python/JavaScript, preferencialmente com lockfiles. | Não valida lógica, configuração runtime, pacote inalcançável ou risco de supply chain desconhecido. |

Use o catálogo e a estratégia de CI já aprovados em `docs/security-tools-catalog.md` e `docs/github-actions-strategy.md`. Este chunk não cria scripts nem workflows completos.

## Busca local com `rg`

Execute na raiz dos apps autorizados. Resultados são pistas para revisão, não vulnerabilidades confirmadas.

```bash
rg -n --glob '*.py' '@frappe\.whitelist|allow_guest\s*=\s*True'
rg -n --glob '*.py' 'ignore_permissions\s*=\s*True|flags\.ignore_permissions'
rg -n --glob '*.py' 'frappe\.(db\.)?(get_all|get_list)|frappe\.get_doc|frappe\.db\.sql'
rg -n --glob '*.py' 'permission_query_conditions|has_permission|frappe\.has_permission'
rg -n --glob 'hooks.py' 'override_whitelisted_methods|override_doctype_class|extend_doctype_class|doc_events|auth_hooks|scheduler_events'
rg -n --glob '*.py' 'frappe\.(enqueue|enqueue_doc)|enqueue_after_commit|queue\s*='
rg -n --glob '*.{py,js,json}' 'meeting_url|external_url|webhook|callback|payment|authorization|session|csrf'
rg -n --glob '*.py' 'requests\.(get|post|put|patch|delete)|httpx\.(get|post|put|patch|delete)'
rg -n --glob '*.{py,js}' 'print\(|console\.log|frappe\.log_error|logger\.'
rg -n --glob '*.{py,js,json}' 'api[_-]?key|api[_-]?secret|access[_-]?token|private[_-]?key|client[_-]?secret'
rg -n --glob '*.json' '"permissions"|"permlevel"|"is_private"|"allow_guest"'
rg -n --glob '*.{py,js}' '/files/|/private/files/|save_file|upload_file'
rg -n --glob '*.{py,js,json}' 'Server Script|Client Script|Custom DocPerm|Role Profile|User Permission'
```

Para SQL construído dinamicamente, amplie a triagem sem afirmar automaticamente que há injeção:

```bash
rg -n -U --glob '*.py' 'frappe\.db\.sql\([\s\S]{0,240}(f["\x27]|\.format\(|%\s*[({])'
```

## Padrões perigosos e falsos positivos

### Exemplos perigosos

```python
@frappe.whitelist(allow_guest=True)
def get_record(record_name):
    return frappe.get_doc("Sensitive Record", record_name).as_dict()
```

Problemas: endpoint público, identificador controlável, ausência de autorização e resposta excessiva.

```python
@frappe.whitelist()
def update_record(record_name, new_status):
    doc = frappe.get_doc("Sensitive Record", record_name)
    doc.status = new_status
    doc.save(ignore_permissions=True)
```

Problemas: autenticação não equivale a autorização; bypass permite mutação sem comprovar acesso ao documento ou transição válida.

```python
rows = frappe.db.sql(
    f"SELECT name, owner FROM `tabSensitive Record` WHERE owner = '{owner}'",
    as_dict=True,
)
```

Problemas: interpolação em SQL, bypass do ORM/permissões e possível exposição excessiva.

```python
records = frappe.get_all("Sensitive Record", fields=["name", "owner", "external_url"])
```

Problema: `get_all` não aplica permissões. Mesmo sem entrada externa, o resultado não pode ser devolvido ao usuário sem autorização e escopo explícitos.

### Falsos positivos comuns

- `allow_guest=True` em endpoint de saúde sem dados, estado mutável ou detalhe interno, protegido na borda e testado.
- `ignore_permissions=True` em patch/migração offline, com alvo fixo, revisão, backup e sem entrada remota.
- `frappe.get_all` em tarefa administrativa interna, limitada ao site correto e sem retorno ao usuário.
- `frappe.db.sql` com valores parametrizados em relatório autorizado cuja lógica não cabe no ORM; ainda requer revisão de permissão.
- palavra `token` em tokenizer, CSRF token tratado pelo framework ou nome de campo sem valor sensível.
- `meeting_url` em modelo de dados, quando resposta, logs e permissões efetivamente o protegem.
- `console.log` em fixture/teste sem dado real; continua inadequado se chegar ao bundle de produção com informação sensível.

## Regras Semgrep simples para triagem

Valide as regras com a versão fixada do Semgrep e testes positivos/negativos antes de usá-las como gate. Elas alertam; não concluem vulnerabilidade.

```yaml
rules:
  - id: frappe-whitelist-allows-guest
    languages: [python]
    severity: WARNING
    message: Revisar endpoint Frappe acessível como Guest.
    pattern: |
      @frappe.whitelist(..., allow_guest=True, ...)
      def $FUNC(...):
        ...

  - id: frappe-document-ignore-permissions
    languages: [python]
    severity: WARNING
    message: Revisar bypass explícito de permissões Frappe.
    patterns:
      - pattern-either:
          - pattern: $DOC.insert(..., ignore_permissions=True, ...)
          - pattern: $DOC.save(..., ignore_permissions=True, ...)

  - id: frappe-db-sql-fstring
    languages: [python]
    severity: ERROR
    message: Não interpolar f-string em frappe.db.sql; parametrizar e revisar autorização.
    pattern-regex: "frappe\\.db\\.sql\\s*\\(\\s*f[\"']"
```

Limitações: o primeiro padrão pode não cobrir aliases/decorators construídos; o segundo não cobre flags atribuídas separadamente; o terceiro não cobre concatenação, `%`, `.format()` ou wrappers. Mantenha os comandos `rg` e revisão manual.

## Checklist manual

### Código e configuração

- [ ] Inventariar versões, apps instalados, sites, módulos e customizações por site.
- [ ] Revisar todos os `@frappe.whitelist()` e justificar cada `allow_guest=True`.
- [ ] Revisar REST CRUD dos DocTypes críticos com papéis mínimos.
- [ ] Revisar cada `ignore_permissions`, `get_all`, SQL direto e `db.set_value`.
- [ ] Comparar `has_permission` e `permission_query_conditions` com testes negativos.
- [ ] Revisar `hooks.py`, ordem de apps, overrides, eventos e assets injetados.
- [ ] Inventariar Server Scripts, Client Scripts, Custom DocPerm e Property Setters ativos.
- [ ] Revisar jobs, scheduler, retries, idempotência, contexto de site e logs.
- [ ] Confirmar que segredo/configuração real não está no Git, artifact ou log.

### Permissões e dados

- [ ] Testar DocType, nível de campo, User Permission, report, export, print, email e share.
- [ ] Revisar Roles e Role Profiles por menor privilégio e segregação de funções.
- [ ] Confirmar que interface cliente não é a única barreira.
- [ ] Testar acesso direto por nome a registro de outro usuário/company/tenant.
- [ ] Testar arquivos públicos, privados, órfãos, compartilhados e anexados.
- [ ] Revisar exposição de `meeting_url`, `external_url`, dados internos e pessoais.
- [ ] Confirmar minimização, redaction, acesso e retenção de logs.

### Integrações e negócio

- [ ] Revisar autenticação, sessão, CSRF, rate limit e auth hooks na versão instalada.
- [ ] Validar autenticidade, replay, idempotência, timeout e retry de webhooks.
- [ ] Reconciliar eventos de pagamento com invoice, valor, moeda e estado interno.
- [ ] Testar falhas, duplicatas e ordem invertida em eventos assíncronos.
- [ ] Revisar identidades técnicas e escopo de WhatsApp/API e demais provedores.
- [ ] Testar isolamento por site e, dentro do ERPNext, por Company quando aplicável.
- [ ] Testar Learning por aluno, autor, avaliador e moderador, inclusive preview e SCORM.
- [ ] Testar ERPNext por cliente, fornecedor, usuário interno e papel financeiro.

### Supply chain e evidência

- [ ] Executar Bandit/Ruff, pip-audit, Semgrep, secret scanning e dependency scanning aplicáveis.
- [ ] Fixar dependências com lockfiles compatíveis e revisar Python e JavaScript.
- [ ] Triar achados com contexto Frappe; registrar falso positivo com dono e expiração.
- [ ] Guardar relatório cru somente em `reports/raw/`, fora do Git.
- [ ] Publicar somente resumo redigido e revisado em `reports/sanitized/`.

## Riscos críticos e bloqueio de release

Bloquear release quando aplicável e confirmado:

- acesso entre sites, tenants, companies, alunos, clientes ou fornecedores sem autorização;
- método Guest ou REST expondo dado pessoal, financeiro, educacional restrito, arquivo privado, URL de reunião ou token;
- mutação privilegiada por `ignore_permissions`, `get_all`, SQL ou job sem checagem equivalente;
- papel/perfil permitindo administração, finanças, exportação ampla ou moderação sem aprovação;
- bypass de autenticação, sessão ou CSRF; auth hook que eleva Guest; segredo confirmado no código/log/artifact;
- upload/download que torna conteúdo privado público ou permite conteúdo ativo sem controle compatível;
- SQL com entrada externa não parametrizada ou consulta que rompe isolamento;
- webhook/pagamento sem autenticidade quando exigida pelo provedor, sem idempotência ou capaz de alterar estado financeiro indevidamente;
- scheduler/job privilegiado atuando no site/tenant errado;
- vulnerabilidade crítica/alta nova e alcançável em dependência, conforme política aprovada;
- scanner obrigatório não executado, teste de autorização crítico ausente/falho ou exceção expirada.

Achado heurístico novo, dependência sem alcance confirmado ou falso positivo ainda não triado deve impedir a declaração de auditoria concluída, mas só vira gate automático depois de regra, severidade e taxa de falso positivo estabilizadas.

## Evidências esperadas e relatórios crus

Guardar fora do Git, com acesso restrito, somente o necessário:

- inventário de endpoints, hooks, scripts, jobs, integrações, sites e versões;
- matriz de papéis/permissões e casos de teste positivos/negativos;
- resultados de scanners ligados ao commit e artefato exatos;
- evidência de testes de isolamento, arquivo, webhook e pagamento sem payload real;
- decisão de risco, responsável, prazo, controle compensatório e expiração;
- registro de revisão de customizações e diferenças entre sites.

Relatórios crus podem conter código, consultas, paths, nomes de DocType, usuários, URLs, headers, respostas, dados pessoais e segredos. Devem ir para `reports/raw/`, que permanece no `.gitignore`, ou para armazenamento restrito aprovado. Não anexar a issue/PR nem publicar artifact automaticamente. Em `reports/sanitized/`, registrar resumo, impacto, condição, correção e evidência mínima sem identificadores, payloads ofensivos ou detalhes exploráveis.

## O que scanners não validam sozinhos

Scanners não demonstram:

- que um papel deveria ter determinada permissão;
- que `has_permission` e listas refletem a regra de negócio;
- que Company ou campo de tenant isola todos os relatórios e integrações;
- que um arquivo, curso, invoice ou URL pertence ao usuário correto;
- que um evento de pagamento é autêntico, idempotente e reconciliado;
- que jobs usam o site certo e resistem a retry/concorrência;
- que logs e retenção atendem finalidade e privacidade;
- que um falso positivo é seguro ao longo do tempo;
- que ausência de achados equivale a ausência de vulnerabilidades.

Revisão humana, testes de autorização com usuários representativos e validação no ambiente candidato continuam obrigatórios.

## Fontes

As fontes oficiais, datas de acesso, decisões e incertezas deste chunk estão registradas em `research/sources/chunk-08.md`.
