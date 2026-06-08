# Fixture Frappe/Python do Lote 7

## Objetivo

Fornecer uma fixture ficticia, pequena e versionavel para revisar documentacao, comandos `rg` e padroes de triagem Frappe/Python sem criar site real, banco real, usuario real, tenant real, credencial real ou ambiente de producao.

Esta fixture nao e uma aplicacao Frappe executavel e nao valida comportamento de runtime.

## Estrutura

```text
testing/frappe-python/
├── README.md
└── fixture-app/
    ├── pyproject.toml
    └── synthetic_learning/
        ├── hooks.py
        ├── permissions.py
        ├── tasks.py
        └── synthetic_learning/
            └── doctype/
                └── synthetic_audit_note/
                    ├── synthetic_audit_note.json
                    ├── synthetic_audit_note.py
                    ├── safe_methods.py
                    └── needs_review_markers.py
```

## Regras de seguranca da fixture

- Nao ha pasta `sites/`.
- Nao ha `site_config.json`, `common_site_config.json`, `.env`, dump, backup, log, cookie, token, secret ou chave.
- Nao ha e-mail real, usuario real, tenant real, cliente real, fornecedor real, URL interna, request/response real ou payload ofensivo.
- Os nomes `Synthetic`, `Fixture`, `[PAPEL]` e similares sao intencionalmente ficticios.
- Os marcadores negativos sao padroes que exigem revisao, nao PoCs e nao instrucao de exploracao.

## Casos positivos

| Arquivo | Padrao | Resultado esperado |
|---|---|---|
| `safe_methods.py` | Metodo whitelisted autenticado com validacao simples e checagem de permissao antes de ler documento. | Deve aparecer no inventario de whitelisted methods e ser classificado como exemplo seguro apos revisao humana. |
| `safe_methods.py` | SQL parametrizado com escopo minimo. | Deve aparecer na triagem de SQL e ser classificado como exemplo positivo, sem declarar seguranca universal. |
| `permissions.py` | `has_permission` e `permission_query_conditions` sinteticos. | Deve lembrar que listagem e acesso direto precisam ser coerentes. |
| `hooks.py` e `tasks.py` | Eventos e scheduler ficticios. | Deve entrar no inventario de hooks/jobs sem executar worker real. |

## Casos que exigem revisao

| Arquivo | Marcador | Por que existe |
|---|---|---|
| `needs_review_markers.py` | `@frappe.whitelist(allow_guest=True)` | Verificar se a triagem local identifica metodo Guest. |
| `needs_review_markers.py` | `ignore_permissions=True` | Verificar se bypass deliberado entra no inventario para justificativa humana. |
| `needs_review_markers.py` | `frappe.get_all` | Verificar se leitura sem permissao aplicada vira item de revisao. |
| `needs_review_markers.py` | `frappe.db.set_value` | Verificar se atualizacao que contorna parte do ciclo do Document vira item de revisao. |

## Validacoes locais seguras

Use apenas busca local. Nao execute servidor, migracao, scheduler, banco, scanner agressivo ou rede externa.

Pre-requisito: `rg` precisa estar instalado. Se nao estiver, registre a validacao como nao executada ou use busca equivalente aprovada, sem tratar isso como aprovacao do script.

```bash
rg -n --glob '*.py' '@frappe\.whitelist|allow_guest\s*=\s*True' testing/frappe-python/fixture-app
rg -n --glob '*.py' 'ignore_permissions\s*=\s*True|flags\.ignore_permissions|frappe\.get_all\(' testing/frappe-python/fixture-app
rg -n --glob '*.py' 'frappe\.db\.sql|frappe\.db\.set_value' testing/frappe-python/fixture-app
rg -n --glob 'hooks.py' 'scheduler_events|doc_events|permission_query_conditions|has_permission' testing/frappe-python/fixture-app
```

Resultado esperado: as buscas retornam apenas arquivos da fixture e servem para validar documentacao e triagem. Elas nao comprovam explorabilidade, ausencia de vulnerabilidade ou cobertura completa.

## Relacao com documentos

- Guia canonico: `../../docs/frappe-python-security-audit.md`.
- Matriz de compatibilidade: `../../docs/frappe-python-version-compatibility.md`.
- Evidencias e relatorios: `../../docs/evidence-and-reporting-policy.md`.
- Scripts locais: `../../scripts/run-frappe-audit.sh` e `../../scripts/run-python-audit.sh`, que devem ser validados funcionalmente no Lote 5 antes de virar gate confiavel.

## Pendencias

- Testar wrappers de scripts, criacao de `reports/raw/`, resumos em `reports/sanitized/`, ferramentas ausentes e exit codes no Lote 5.
- Validar Semgrep, Bandit, Ruff, pip-audit e secret scanning somente com versoes aprovadas, sem rede externa por padrao.
- Confirmar no SaaS consumidor as versoes reais de Frappe, ERPNext, Frappe Learning, Python, Node e apps instalados.
