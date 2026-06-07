# Checklist de Governança de IA

## Objetivo

Avaliar se uma funcionalidade, integração ou processo com IA em SaaS possui finalidade legítima, governança, segurança, privacidade, avaliação humana, gestão de fornecedor, controle de dados, mitigação de alucinação, prompt injection e uso aceitável antes de PoC, produção ou mudança material.

Este checklist não declara que a IA é segura, imparcial, conforme, livre de vazamento ou adequada para decisão automatizada. Validação técnica, jurídica, de privacidade, acessibilidade, direitos autorais, contrato e risco deve ocorrer no contexto real.

## Quando usar

- [ ] Antes de iniciar PoC de IA com dados do produto, cliente, usuário ou operação.
- [ ] Antes de lançar assistente, resumo, classificação, recomendação, busca semântica, automação ou decisão assistida por IA.
- [ ] Antes de trocar modelo, fornecedor, prompt sistêmico, embeddings, dados de contexto, retenção, região ou nível de autonomia.
- [ ] Após incidente, saída danosa, vazamento, alucinação material, bypass de política, abuso, drift ou reclamação.
- [ ] Em revisão trimestral ou anual de IA material, conforme impacto e criticidade.

## Revisor responsável

- [ ] Owner de Produto/IA aprovou finalidade, valor, limites e decisão de uso ou não uso.
- [ ] Engenharia/Dados revisou arquitetura, avaliação, monitoramento, fallback e versionamento.
- [ ] Segurança/AppSec revisou prompt injection, isolamento, exfiltração, abuso, fornecedores, logs e secrets.
- [ ] Privacidade/Encarregado e Jurídico revisaram dados, papéis, base, direitos, decisão automatizada, contrato, retenção e transferência quando aplicável.
- [ ] Acessibilidade, Suporte ou domínio de negócio revisaram impacto em usuários, linguagem, contestação e canais humanos quando aplicável.

## Evidências esperadas

- [ ] Inventário de `[SISTEMA-IA-A]` com finalidade, usuários, owner, modelo/fornecedor abstrato, dados de entrada, saída e decisão.
- [ ] Avaliação de risco de IA por ID opaco, usando cenário sanitizado e sem prompts reais de clientes.
- [ ] Registro de datasets de teste sintéticos ou sanitizados, critérios de avaliação, resultados agregados, limitações e revisores.
- [ ] Registro de revisão de fornecedor `[FORNECEDOR-IA-A]`, contrato, suboperadores, retenção, treinamento secundário, localização e suporte, sem anexos reais.
- [ ] Evidência de controles de privacidade, segurança, logging, retenção, isolamento por tenant e revisão humana.
- [ ] Registro de incidentes, feedback, alucinação material, bloqueios, falso positivo e ações corretivas em nível sanitizado.
- [ ] Decisão Go/No-Go, risco residual, owner, prazo, monitoramento e gatilhos de reavaliação.

## Itens obrigatórios

- [ ] Finalidade, público, contexto, benefício esperado, riscos e limites de uso estão documentados antes da implementação.
- [ ] Usos proibidos e usos que exigem revisão humana estão definidos e comunicados para equipe e usuários aplicáveis.
- [ ] Dados de entrada foram minimizados; dados pessoais, sensíveis, segredos, conteúdo de cliente e dados de terceiros não entram no modelo sem avaliação e aprovação.
- [ ] Prompts, arquivos, conversas, outputs e logs reais de clientes não são versionados nem usados como exemplo neste repositório.
- [ ] Retenção de prompts, contexto, embeddings, logs e outputs foi definida, validada e configurada conforme contrato e privacidade.
- [ ] Fornecedor de IA tem avaliação de risco, papel, suboperadores, região, treinamento secundário, exclusão, incidentes, suporte e saída revisados.
- [ ] Segredos, chaves de API, tokens, endpoints privados e configurações de modelo ficam fora do Git e dos logs.
- [ ] Isolamento por tenant foi projetado e testado para entrada, contexto recuperado, memória, cache, embeddings, logs e saída.
- [ ] Controles contra prompt injection e exfiltração de contexto foram avaliados sem registrar instruções ofensivas, bypass ou exemplo explorável.
- [ ] A IA não executa ação sensível, altera dado, envia comunicação externa ou toma decisão de alto impacto sem autorização, guardrails e revisão humana compatíveis.
- [ ] Saídas com potencial de dano exigem avisos, revisão humana, fonte/contexto quando aplicável, contestação e fallback.
- [ ] Alucinação, informação incorreta, viés danoso, conteúdo inadequado e resposta fora de escopo possuem critérios de avaliação e tratamento.
- [ ] Logs e telemetria de IA removem ou minimizam dados pessoais, segredos, conteúdo de cliente, prompts sensíveis e outputs confidenciais.
- [ ] Monitoramento detecta falhas materiais, abuso, drift, custo anômalo, latência, indisponibilidade, vazamento e reclamações.
- [ ] Existe rollback, desativação, degradação segura ou fallback humano para falha de fornecedor, modelo ou política.
- [ ] Mudanças de modelo, prompt sistêmico, dados de contexto, fornecedor, finalidade ou autonomia acionam nova avaliação.

## Itens desejáveis

- [ ] Manter model card ou registro interno com versão, escopo, limitações, dados, métricas e decisões.
- [ ] Criar conjunto de avaliação versionado com dados sintéticos representativos e casos de abuso seguros.
- [ ] Medir qualidade por tarefa, taxa de revisão humana, correções, reclamações, bloqueios e impacto por grupo ou contexto quando aplicável.
- [ ] Integrar IA ao threat model, DPIA/RIPD quando aplicável, gestão de terceiros, incidentes e release gates.
- [ ] Implementar revisão de acessibilidade e linguagem simples para fluxos com output apresentado ao usuário.
- [ ] Manter canal de feedback e contestação quando a IA afeta interesse, acesso, recomendação, suporte ou decisão relevante.

## Melhorias futuras

- [ ] Avaliar red teaming autorizado e seguro para IA material, sem publicar prompts, técnicas de bypass ou conteúdo ofensivo.
- [ ] Implementar monitoramento contínuo de drift, regressão, dados proibidos, toxicidade, custo e risco de vazamento.
- [ ] Formalizar governança de IA com comitê, inventário, métricas, exceções, revisão independente e auditoria periódica.
- [ ] Avaliar normas, leis, requisitos setoriais e certificações apenas quando escopo, obrigação e versão aplicável forem confirmados.

## Critérios de aprovação

- [ ] Finalidade, dados, fornecedor, retenção, segurança, privacidade, avaliação humana, limites e monitoramento foram revisados.
- [ ] Testes com dados fictícios ou sanitizados demonstram qualidade suficiente para o escopo, com limitações declaradas.
- [ ] Não há vazamento entre tenants, uso de dados não aprovado, segredo em log, ação sensível sem controle ou decisão automatizada sem revisão aplicável.
- [ ] Riscos residuais possuem owner, aprovador, prazo, controle, monitoramento e gatilho de reavaliação.
- [ ] Evidências são agregadas, sanitizadas e não incluem prompt real de cliente, output sensível, conversa privada ou conteúdo de usuário real.

## Critérios de reprovação/bloqueio

- [ ] IA recebe ou expõe dado pessoal real, segredo, conteúdo de cliente, prompt privado, output sensível ou informação de tenant sem aprovação e controle.
- [ ] Não há finalidade, owner, avaliação de risco, revisão de fornecedor ou política de retenção para IA material.
- [ ] Ação sensível, recomendação de alto impacto ou decisão automatizada ocorre sem revisão humana, contestação ou fallback compatível.
- [ ] Isolamento por tenant, contexto, embeddings, cache ou logs é desconhecido ou falha.
- [ ] Prompt injection, exfiltração, abuso ou alucinação material tem risco alto sem mitigação, monitoramento e decisão competente.
- [ ] Fornecedor usa dados para treinamento secundário, retenção ou compartilhamento incompatível com contrato, privacidade ou expectativa aprovada.
- [ ] Documento versionado contém instrução ofensiva, bypass, prompt injection explorável, prompt real, conversa privada, credencial, endpoint privado ou conteúdo perigoso.

## Cuidados contra vazamento

- [ ] Não criar dados pessoais reais, prompts reais de clientes, outputs sensíveis, conversas privadas, conteúdo de usuário real ou datasets reais.
- [ ] Não incluir instruções ofensivas, bypass, prompt injection explorável, jailbreak, prompt sistêmico real, cadeia de raciocínio interna ou exemplos perigosos.
- [ ] Usar marcadores como `[SISTEMA-IA-A]`, `[MODELO-A]`, `[FORNECEDOR-IA-A]`, `[DATASET-SINTETICO-A]`, `[TENANT-A]` e `[EV-SAN-001]`.
- [ ] Não registrar chave, token, endpoint privado, configuração real, região sensível, ID de conta, log cru, conversa ou arquivo de usuário.
- [ ] Guardar avaliações detalhadas, prompts, outputs e relatórios crus em armazenamento restrito; versionar somente conclusões agregadas e revisadas.
- [ ] Revisar metadados de planilhas, PDFs, prints, gravações e exportações antes de compartilhar evidência de IA.
