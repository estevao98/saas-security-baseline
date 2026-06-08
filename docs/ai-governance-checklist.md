# Checklist de Governança de IA

## Objetivo

Servir como guia auxiliar para avaliar uso material de IA em SaaS, sem substituir `checklists/ai-governance.md` nem o template `templates/ai-risk-assessment-template.md`.

Use este arquivo quando IA impactar funcionalidade, decisão, conteúdo, suporte, segurança, privacidade, experiência do usuário ou operação. Se o SaaS não usa IA de forma material, registre como não aplicável no checklist pertinente.

## Fonte Canônica

| Tema | Fonte interna |
|---|---|
| Normas e referências de IA | [Matriz de normas](standards-and-frameworks-matrix.md) |
| Roadmap de maturidade | [Roadmap de segurança](security-roadmap.md) |
| Checklist executável | `checklists/ai-governance.md` |
| Privacidade e dados pessoais | [Programa LGPD](lgpd-privacy-program.md) |
| Risco e aceite | `risk/severity-and-prioritization.md` |
| Template | `templates/ai-risk-assessment-template.md` |

## Escopo de Revisão

- finalidade, público, benefício esperado e alternativa não automatizada;
- dados de entrada, saída, retenção, treinamento e compartilhamento;
- fornecedor, contrato, suboperadores, região e telemetria;
- decisão automatizada, revisão humana e contestação quando aplicável;
- prompt injection, vazamento, isolamento entre tenants e abuso;
- qualidade, viés, alucinação, segurança de conteúdo e monitoramento;
- incidentes, fallback, desligamento e comunicação a usuários.

## Perguntas Mínimas

- [ ] A finalidade está documentada e aprovada?
- [ ] Dados pessoais, sensíveis, de cliente ou conteúdo confidencial são minimizados?
- [ ] O fornecedor não usa entradas/saídas para treinamento secundário sem base, contrato e transparência aprovados?
- [ ] Há revisão humana proporcional ao impacto?
- [ ] Prompt, resposta, logs e telemetria não expõem segredo, tenant ou dado pessoal desnecessário?
- [ ] Há critério para suspender ou reverter o recurso?

## Evidência Segura

- descrição abstrata do caso de uso;
- categorias de dados e controles, sem exemplos reais;
- decisão de risco, owner, revisão e prazo;
- testes agregados de qualidade e segurança;
- ID opaco para avaliação restrita.

## Pendências Contextuais

- Interpretação legal, setorial, contratual e regulatória deve ser feita pelo SaaS consumidor.
- Testes especializados, red teaming e monitoramento contínuo são melhorias ou tarefas de domínio, não concluídas por este guia.
