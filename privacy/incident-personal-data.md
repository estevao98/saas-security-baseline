# Incidentes com Dados Pessoais

## Objetivo

Definir um playbook mínimo para suspeita ou confirmação de incidente com dados pessoais, preservando evidência restrita e evitando comunicação ou decisão jurídica automática.

Use `../templates/incident-report-template.md` para estrutura operacional. O registro real do incidente, comunicações, listas de titulares, logs e forense ficam fora do Git.

## Acionamento

Acionar este playbook quando houver suspeita ou confirmação de:

- acesso indevido a dado pessoal;
- vazamento, perda, alteração, destruição ou indisponibilidade relevante;
- exposição de log, backup, export, ticket, relatório ou artifact com dado pessoal;
- falha de isolamento entre tenants;
- fornecedor ou suboperador envolvido em evento que possa afetar dados;
- segredo exposto que permita acesso a dados pessoais.

## Fluxo mínimo

1. Registrar ID opaco e canal restrito de coordenação.
2. Classificar evento como suspeita, incidente confirmado, falso positivo ou vulnerabilidade sem evidência de dado.
3. Conter exposição sem destruir evidência necessária.
4. Preservar logs, artefatos e timeline em armazenamento restrito, com acesso nominal.
5. Identificar categorias de dados, titulares, sistemas, tenants abstratos e fornecedores em nível agregado.
6. Avaliar papel controlador/operador e responsabilidades contratuais.
7. Acionar Privacidade, Encarregado, Jurídico, Segurança, owner técnico e Comunicação quando aplicável.
8. Avaliar risco ou dano relevante aos titulares e necessidade de comunicação conforme procedimento vigente.
9. Recuperar operação após validar acesso, integridade, isolamento e correção.
10. Produzir postmortem sanitizado somente quando aprovado, sem vetor explorável ou dado pessoal.

## Matriz de decisão segura

| Tema | Pergunta | Evidência permitida no Git |
|---|---|---|
| Confirmação | O evento envolve dado pessoal ou apenas alerta inconclusivo? | Status agregado e ID opaco. |
| Escopo | Quais categorias de dados e titulares podem ter sido afetadas? | Categorias e faixas, sem lista real. |
| Papel | O SaaS atua como controlador, operador ou ambos conforme tratamento? | Decisão por ID, sem parecer integral. |
| Risco | Há risco ou dano relevante ao titular? | Conclusão sanitizada, sem detalhes pessoais. |
| Comunicação | Quem decide ANPD, titulares, cliente ou público? | Registro de decisão por ID. |
| Retenção | Qual registro deve ser preservado e por quanto tempo? | Referência à política, sem evidência crua. |

## Evidência e retenção

- Logs, dumps, backups, requests, responses, indicadores, lista de afetados e comunicações reais são `Restrito` e ficam fora do Git.
- Incidentes com dados pessoais possuem regra regulatória própria de registro e retenção; validar texto consolidado e obrigações adicionais no caso real.
- `reports/sanitized/` pode receber somente postmortem aprovado, minimizado e revisado por Segurança, Privacidade/Jurídico e owner competente.

## O agente ou checklist não deve

- Comunicar ANPD, titulares, clientes ou fornecedores por conta própria.
- Definir prazo regulatório contextual sem validação.
- Declarar ausência de impacto ou ausência de titulares afetados sem investigação competente.
- Versionar payload, PoC, URL interna, log cru, print, dado pessoal ou detalhe de contenção explorável.

## Referências

- `../templates/incident-report-template.md`
- `../checklists/incident-response.md`
- `../docs/lgpd-privacy-program.md`
- `../docs/evidence-and-reporting-policy.md`
- `data-map.md`
- `third-party-processors.md`
