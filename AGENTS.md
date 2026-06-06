# AGENTS.md

Você está trabalhando no repositório privado `saas-security-baseline`.

## Objetivo

Criar um template reutilizável para auditoria, governança, segurança, DevSecOps, LGPD, OWASP, acessibilidade, operação e maturidade técnica para SaaS.

Este repositório deve servir como base para SaaS em Python, Frappe, ERPNext, Frappe LMS, JavaScript, TypeScript, SQL, Docker, CI/CD, APIs, autenticação, pagamentos, integrações externas e cloud.

## Regras obrigatórias

1. Não invente normas, versões, requisitos ou comandos.
2. Priorize fontes oficiais.
3. Não copie trechos longos de normas ISO/ABNT.
4. Faça sínteses, mapeamentos e interpretações práticas.
5. Não crie segredos, tokens, credenciais ou dados pessoais reais.
6. Não crie exemplos que pareçam credenciais reais.
7. Não coloque relatórios sensíveis em arquivos versionados.
8. Relatórios crus devem ir para `reports/raw/` e essa pasta deve ficar no `.gitignore`.
9. Resumos revisados devem ir para `reports/sanitized/`.
10. Sempre registre fontes em `research/sources/`.
11. Sempre atualize `research/progress.md` ao final de cada chunk.
12. Gere documentos pequenos, revisáveis e versionáveis.
13. Não gere tudo em um arquivo gigante.
14. Antes de criar ou editar arquivos, leia `research/task-queue.md` e `research/progress.md`, se existirem.
15. Ao terminar uma tarefa, informe quais arquivos foram criados ou modificados.

## Fontes prioritárias

- OWASP
- OWASP Cheat Sheet Series
- ISO
- ABNT Catálogo
- ANPD
- W3C/WAI
- NIST
- CISA
- CIS
- GitHub Docs
- Documentação oficial das ferramentas
- Documentação oficial do Frappe

## Estilo dos documentos

- Markdown bem organizado.
- Tabelas quando ajudarem.
- Parágrafos curtos.
- Checklists com `- [ ]`.
- Diferenciar:
  - obrigatório;
  - desejável;
  - melhoria futura;
  - certificação formal.
- Explicar incertezas quando não for possível validar versão/edição em fonte oficial.

## Política de evidências

Pode ir para o Git:

- políticas;
- templates;
- checklists;
- matrizes;
- resumos sanitizados;
- documentos de governança;
- exemplos fictícios.

Não deve ir para o Git:

- segredos;
- tokens;
- credenciais;
- cookies;
- logs crus;
- dumps;
- backups;
- relatórios crus de scanners;
- dados pessoais reais;
- URLs internas sensíveis;
- payloads exploráveis;
- arquivos `site_config.json` reais;
- `terraform.tfstate`;
- prints sem redaction.

## Uso de MCP

Use MCP/Context7 apenas para consultar documentação técnica e fontes públicas oficiais.

Não use MCP para enviar segredos, tokens, credenciais, dados pessoais ou conteúdo sensível.
