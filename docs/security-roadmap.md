# Roadmap de Implantação de Segurança e Governança

## Objetivo e uso

Este roadmap transforma o repositório em um programa incremental de segurança, privacidade, acessibilidade, operação e governança para SaaS. As fases são cumulativas: avançar não elimina controles anteriores.

O roadmap usa a [matriz de normas e frameworks](standards-and-frameworks-matrix.md) como referência. Normas ISO/ABNT orientam a estrutura e a melhoria do programa; sua adoção interna não equivale a certificação. Obrigações legais, contratuais e setoriais aplicáveis prevalecem sobre a fase de maturidade.

## Classificação das prioridades

| Classificação | Significado neste roadmap |
|---|---|
| **Obrigatório** | Baseline interno mínimo ou obrigação legal/contratual aplicável. Deve ter responsável, prazo e evidência. |
| **Desejável** | Reduz risco relevante ou prepara vendas e escala, mas pode ser priorizado conforme contexto. |
| **Melhoria futura** | Aumenta maturidade depois que os controles básicos estiverem operando. |
| **Empresa maior** | Requer escala, equipe, regulação, criticidade ou demanda comercial que justifique o custo. |
| **Certificação formal** | Projeto separado, com escopo, patrocínio, auditoria e manutenção definidos. Não é requisito universal para SaaS. |

## Regras de implantação

- [ ] Definir escopo, responsáveis, ativos, dados, fornecedores e requisitos aplicáveis antes de selecionar controles.
- [ ] Priorizar riscos por impacto e probabilidade; não transformar todo controle de uma norma em obrigação indiscriminada.
- [ ] Associar cada controle a responsável, frequência, evidência e critério de aceite.
- [ ] Guardar saídas cruas apenas em `reports/raw/`, fora do Git.
- [ ] Versionar somente resumos revisados e sanitizados em `reports/sanitized/`.
- [ ] Fixar versões de checklists e ferramentas quando forem implementados nos chunks próprios.
- [ ] Reavaliar o roadmap após incidente relevante, mudança de arquitetura, novo tratamento de dados, entrada em mercado regulado ou contrato material.

## Visão geral das fases

| Fase | Resultado esperado | Referências principais | Gate principal |
|---|---|---|---|
| **1 - MVP seguro** | Produto pode operar com riscos básicos conhecidos, controles mínimos e releases repetíveis. | ISO/IEC 27001, 27002 e 27005; OWASP Top 10, API Top 10 e ASVS; LGPD e ISO/IEC 29100; WCAG 2.2 AA e ABNT aplicável. | Não existem riscos críticos sem tratamento ou aceite formal, e os fluxos essenciais foram testados. |
| **2 - SaaS vendável para empresas** | Produto sustenta due diligence, operação B2B, resposta a incidentes, privacidade cloud e continuidade. | ISO/IEC 27017, 27018, 27701 e 27035; ISO/IEC 20000-1; ISO 22301; OWASP SAMM como apoio. | Compromissos comerciais e operacionais são mensuráveis, testados e suportados por evidências. |
| **3 - SaaS maduro** | Processos de engenharia, qualidade, testes e vulnerabilidades são medidos e melhorados continuamente. | ISO/IEC/IEEE 12207 e 29119; ISO/IEC 25010; ISO/IEC 27034; ISO/IEC 30111 e 29147; ISO/IEC 42001 e 23894 quando IA for material. | Métricas demonstram eficácia, recorrência e melhoria; exceções relevantes possuem governança. |

# Fase 1 - MVP seguro

## Resultado da fase

Estabelecer um baseline proporcional que permita desenvolver e operar o MVP sem depender de controles informais. A ISO/IEC 27001 orienta a gestão; a ISO/IEC 27002 apoia a seleção de controles; a ISO/IEC 27005 orienta o método de riscos. OWASP, LGPD, privacidade e acessibilidade convertem esse sistema em verificações aplicáveis ao produto.

| Item | Implantação prática |
|---|---|
| **Objetivo** | Conhecer ativos, dados, ameaças e dependências; evitar vulnerabilidades básicas; proteger contas e dados; criar release verificável. |
| **Implementar primeiro** | Escopo e responsáveis; inventário mínimo; matriz e registro de riscos; autenticação e autorização; gestão de segredos; backup e restauração; logs essenciais; dependências; privacidade por design; testes dos fluxos críticos; canal de vulnerabilidades. |
| **Documentos a criar** | `risk/risk-matrix.md`, `risk/risk-register.csv`, `docs/threat-model.md`, `checklists/owasp-asvs.md`, `checklists/owasp-api-top-10.md`, `checklists/lgpd.md`, `checklists/accessibility-wcag-22-aa.md`, `checklists/pre-deploy.md`, `docs/api-security-checklist.md`, `privacy/data-map.md`, `privacy/retention-policy.md` e `SECURITY.md`. |
| **Ferramentas a automatizar** | Detecção de segredos; SAST; SCA/dependências; testes unitários e de integração; lint; scan de imagem/container quando aplicável; DAST passivo em ambiente autorizado; verificação automatizada de acessibilidade. Ferramentas e comandos serão definidos nos chunks próprios. |
| **Riscos reduzidos** | Acesso indevido, falha de autorização, exposição de segredos, componentes vulneráveis, perda de dados, tratamento indevido de dados pessoais, APIs sem inventário, regressão básica e barreiras de acessibilidade. |
| **Evidências a guardar** | Aprovações de risco; checklist de release; resultados sanitizados de scans; revisões de código; testes de restauração; inventário de dependências; decisões de arquitetura; mapa de dados; registro de correções. Evidência crua permanece fora do Git. |
| **Não vale a pena ainda** | Buscar certificação apenas para sinalização; implantar GRC ou SIEM complexo sem equipe; produzir dezenas de políticas sem dono; exigir cobertura integral de normas; automatizar testes destrutivos em produção. |
| **Critérios para avançar** | Todos os itens obrigatórios aplicáveis possuem dono; riscos críticos foram corrigidos ou formalmente aceitos; restore foi testado; autenticação, autorização e fluxos de dados foram revisados; CI mínimo está estável; privacidade e acessibilidade foram avaliadas nos fluxos essenciais. |
| **Critérios de não avançar** | Segredos no repositório; backup sem teste; vulnerabilidade crítica explorável; autorização quebrada; ausência de inventário de dados pessoais; dependência crítica sem decisão; logs incapazes de apoiar investigação; fluxo principal inacessível sem plano de correção. |

## Escopo das referências na Fase 1

| Referência | Uso proporcional |
|---|---|
| ISO/IEC 27001 | Estruturar escopo, liderança, riscos, objetivos, controles, avaliação e melhoria, sem presumir certificação. |
| ISO/IEC 27002 | Selecionar controles por risco e registrar aplicabilidade, responsável e evidência. |
| ISO/IEC 27005 | Definir identificação, análise, tratamento, aceite e revisão de riscos. |
| OWASP Top 10 | Taxonomia inicial para conscientização, threat modeling e revisão web; não é checklist completo. |
| OWASP API Security Top 10 | Revisar autorização por objeto e função, consumo de recursos, inventário, configuração e integrações. |
| OWASP ASVS | Selecionar requisitos verificáveis. Adotar nível 1 como mínimo para baixo risco e nível 2 para SaaS com autenticação, dados pessoais, pagamentos, funções administrativas ou uso B2B. A seleção final depende do risco. |
| LGPD e ISO/IEC 29100 | Mapear tratamento, finalidade, necessidade, bases legais, direitos, retenção, terceiros e privacy by design. A ISO não substitui avaliação jurídica. |
| WCAG 2.2 AA e ABNT | Aplicar critérios A e AA pertinentes e as normas brasileiras aplicáveis. Para web, considerar ABNT NBR 17225; para experiência móvel abrangida, reconfirmar a aplicabilidade e vigência da ABNT NBR 17060 no Catálogo ABNT. |

## Exemplo de aplicação

**Cenário fictício:** SaaS B2B de agendamento, desenvolvido em Python e TypeScript, com API, autenticação, cobrança recorrente e dados de contatos profissionais.

1. O time mapeia cadastro, login, agenda, cobrança, painel administrativo, webhooks e exclusão de conta.
2. O registro de riscos prioriza autorização entre contas, sequestro de sessão, segredos em CI, abuso de API, indisponibilidade e retenção excessiva.
3. O ASVS nível 2 é selecionado para autenticação, sessão, autorização, validação e proteção de dados; requisitos não aplicáveis recebem justificativa.
4. O pipeline verifica segredos, dependências, código e testes. Resultados detalhados ficam fora do Git; o resumo sanitizado registra status e remediação.
5. Os fluxos de cadastro, login, agendamento, pagamento e cancelamento passam por testes manuais de teclado e critérios WCAG aplicáveis.

# Fase 2 - SaaS vendável para empresas

## Resultado da fase

Transformar controles básicos em capacidade operacional e comercial demonstrável. A fase cobre responsabilidade compartilhada na nuvem, tratamento de dados pessoais por provedores, gestão de privacidade, incidentes, serviços, SLA e continuidade.

| Item | Implantação prática |
|---|---|
| **Objetivo** | Responder due diligence com evidências, cumprir compromissos B2B e manter operação previsível diante de falhas, incidentes e dependência de fornecedores. |
| **Implementar primeiro** | Matriz de responsabilidade cloud; baseline de configuração; inventário e avaliação de fornecedores; processo de incidentes; observabilidade e suporte; SLI/SLO antes de prometer SLA; BIA; RTO/RPO derivados do negócio; exercício de continuidade; processo de titulares e suboperadores. |
| **Documentos a criar** | `docs/cloud-security-checklist.md`, `docs/incident-response-plan.md`, `docs/business-continuity-plan.md`, `checklists/pre-enterprise-sale.md`, `privacy/ropa.md`, `privacy/dpia-template.md`, `privacy/third-party-processors.md`, `privacy/data-subject-rights.md`, `privacy/incident-personal-data.md`, avaliação de fornecedores, catálogo de serviços e modelo de SLA. |
| **Ferramentas a automatizar** | Monitoramento e alertas; centralização de logs com acesso restrito; verificação de configuração cloud e IaC; inventário/SBOM; backup monitorado; status de serviço; gestão de incidentes e vulnerabilidades; coleta controlada de evidências de CI. |
| **Riscos reduzidos** | Configuração cloud insegura, falha de responsabilidade compartilhada, suboperador desconhecido, resposta tardia, evidência insuficiente, indisponibilidade prolongada, SLA inexequível, mudança sem controle e dependência sem contingência. |
| **Evidências a guardar** | Revisões de acesso e fornecedores; atas de exercícios; testes de restore e failover; linha do tempo e lições de incidentes sanitizadas; métricas de serviço; aprovações de mudança; avaliações de impacto; registros de atendimento a titulares; exceções contratuais aprovadas. |
| **Não vale a pena ainda** | Prometer SLA sem telemetria; adquirir plataforma corporativa sem processo; certificar escopo instável; manter SOC 24x7 sem necessidade; criar plano de continuidade que nunca é exercitado. |
| **Critérios para avançar** | Incidente e continuidade foram exercitados; RTO/RPO são sustentados por testes; SLOs são medidos; fornecedores críticos foram avaliados; processo de privacidade funciona; evidências de due diligence são reproduzíveis; não há compromisso contratual sem controle correspondente. |
| **Critérios de não avançar** | Alertas sem responsável; logs sensíveis sem controle; restore ou failover falha; fornecedor crítico sem avaliação; SLA superior à capacidade observada; incidentes sem canal e papéis; direitos de titulares dependem de improviso; riscos altos recorrentes sem tratamento. |

## Escopo das referências na Fase 2

| Referência | Uso proporcional |
|---|---|
| ISO/IEC 27017 | Organizar controles cloud, papéis do cliente e provedor, administração, isolamento, configuração e monitoramento. |
| ISO/IEC 27018 | Orientar proteção de dados pessoais em nuvem pública, transparência, exclusão e suboperadores. Confirmar a adoção ABNT da edição ISO vigente antes de citação formal. |
| ISO/IEC 27701 | Estruturar o sistema de gestão de privacidade; não substituir LGPD, regulamentos da ANPD nem parecer jurídico. |
| ISO/IEC 27035 | Estruturar preparação, triagem, resposta, comunicação, evidências e melhoria. Selecionar e validar as partes aplicáveis. |
| ISO/IEC 20000-1 | Orientar catálogo de serviços, níveis de serviço, incidentes, mudanças, capacidade e fornecedores. |
| ISO 22301 | Orientar BIA, estratégias, planos, exercícios e recuperação; RTO/RPO não devem ser copiados de modelos genéricos. |
| OWASP SAMM | Medir maturidade de software assurance e priorizar melhorias anuais; é desejável, não uma certificação OWASP. |

## Exemplo de aplicação

No SaaS fictício da Fase 1, a primeira venda empresarial exige questionário de segurança, disponibilidade acordada e regras sobre suboperadores.

1. O time documenta responsabilidades entre SaaS, provedor cloud, processador de pagamento e cliente.
2. SLI e SLO são medidos antes da negociação do SLA; indisponibilidade e suporte possuem critérios verificáveis.
3. Um exercício simula indisponibilidade do banco e outro simula exposição de dados pessoais, sem usar dados reais.
4. O processo de incidentes define severidade, papéis, preservação de evidência, comunicação e retrospectiva.
5. Um pacote sanitizado de due diligence apresenta políticas, escopo dos controles, métricas e resultados de testes, sem logs ou vulnerabilidades exploráveis.

# Fase 3 - SaaS maduro

## Resultado da fase

Integrar segurança e qualidade ao ciclo de vida completo, medir eficácia e manter processos sustentáveis de testes, tratamento de vulnerabilidades e melhoria. Governança de IA entra apenas quando seu uso for material para usuários, decisões, dados ou risco do produto.

| Item | Implantação prática |
|---|---|
| **Objetivo** | Tornar engenharia e operação previsíveis, mensuráveis e auditáveis; reduzir recorrência; suportar escala, regulação e múltiplas equipes. |
| **Implementar primeiro** | Processos do ciclo de vida adaptados ao produto; atributos de qualidade mensuráveis; estratégia de testes baseada em risco; AppSec no design; gestão e divulgação coordenada de vulnerabilidades; métricas de eficácia; governança de IA quando aplicável. |
| **Documentos a criar** | Política de ciclo de vida seguro, catálogo de requisitos de qualidade, estratégia e planos de teste, padrão de threat modeling, processo de tratamento de vulnerabilidades, política de divulgação coordenada em `SECURITY.md`, matriz de métricas e, quando aplicável, inventário e avaliação de riscos de IA. |
| **Ferramentas a automatizar** | Quality gates baseados em risco; cobertura e testes de regressão; testes de desempenho e resiliência; telemetria de qualidade; rastreabilidade entre requisito, mudança, teste e risco; gestão de divulgação; avaliações e monitoramento de IA quando aplicável. |
| **Riscos reduzidos** | Regressão recorrente, variabilidade entre equipes, débito técnico invisível, falhas de desempenho e confiabilidade, vulnerabilidade sem coordenação, divulgação inadequada, modelo de IA sem inventário, viés, drift ou uso indevido não monitorado. |
| **Evidências a guardar** | Tendências de defeitos e vulnerabilidades; critérios e resultados de qualidade; cobertura de requisitos; revisões de arquitetura; tempos de remediação; retrospectivas; decisões de exceção; avaliações e monitoramento de IA sanitizados. |
| **Não vale a pena ainda** | Aplicar todos os processos e documentos das normas sem tailoring; medir dezenas de indicadores sem decisão associada; buscar certificações sobre escopo instável; usar IA para casos sem benefício e controle claros. |
| **Critérios de maturidade** | Processos são repetíveis entre equipes; métricas geram decisões; riscos e exceções possuem prazo e dono; testes cobrem riscos materiais; vulnerabilidades seguem SLA interno por severidade; auditorias mostram melhoria e não apenas presença documental. |
| **Critérios de não consolidação** | Métricas cosméticas; controles contornados rotineiramente; vulnerabilidades recorrentes; releases sem rastreabilidade; testes instáveis ignorados; divulgação sem coordenação; IA material sem inventário, avaliação e monitoramento. |

## Escopo das referências na Fase 3

| Referência | Uso proporcional |
|---|---|
| ISO/IEC/IEEE 12207 | Adaptar processos de aquisição, desenvolvimento, operação, manutenção e descarte. A edição ISO 2026 deve ter equivalência ABNT confirmada antes de citação formal brasileira. |
| ISO/IEC 25010 | Traduzir características de qualidade em requisitos, critérios de aceite e métricas pertinentes ao produto. |
| ISO/IEC/IEEE 29119 | Selecionar conceitos, processos, documentação e técnicas de teste adequados ao risco e ao método ágil; validar as partes aplicáveis. |
| ISO/IEC 27034 | Integrar segurança ao ciclo de vida e ao contexto da aplicação. Como é uma família multipartes, confirmar vigência e escopo de cada parte usada. |
| ISO/IEC 30111 e 29147 | Coordenar recebimento, triagem, correção, release e divulgação de vulnerabilidades, sem versionar payloads exploráveis. |
| ISO/IEC 42001 e 23894 | Aplicar somente quando IA for material; governar inventário, papéis, impactos, dados, risco, monitoramento e melhoria. Não comprovam a correção de cada modelo. |

## Exemplo de aplicação

O SaaS fictício agora atende várias empresas e possui equipes de produto, plataforma e suporte.

1. Requisitos de segurança, confiabilidade, desempenho, acessibilidade e manutenibilidade entram nos critérios de aceite.
2. Mudanças de alto risco exigem threat model, teste correspondente e aprovação do risco residual.
3. Tendências de defeitos, vulnerabilidades recorrentes, tempo de remediação, falhas de restore e cumprimento de SLO orientam o planejamento trimestral.
4. Relatos externos seguem canal, triagem, comunicação e divulgação coordenada.
5. Se um recurso de IA recomendar ações aos clientes, o time registra finalidade, dados, fornecedores, limitações, supervisão humana, testes, riscos e monitoramento. Sem IA material, esse programa permanece fora do escopo.

# Plano de 30, 60, 90 e 180 dias

Os marcos são cumulativos e devem ser ajustados ao tamanho do time e ao risco. Prazo não autoriza avançar com critério de bloqueio aberto.

| Marco | Prioridades | Entregas e evidências | Critério de saída |
|---|---|---|---|
| **30 dias** | Definir escopo, donos, ativos, dados, fornecedores e arquitetura; criar matriz e registro de riscos; revisar segredos, acesso, backup, dependências e fluxos web/API. | Escopo aprovado; inventário mínimo; riscos priorizados; threat model inicial; mapa de dados; checklist de release; plano de remediação. | Riscos críticos possuem contenção, correção ou aceite formal com prazo; nenhum segredo conhecido está versionado. |
| **60 dias** | Estabilizar CI mínimo; selecionar ASVS; testar autenticação, autorização e restauração; revisar LGPD e acessibilidade; definir logs e resposta inicial. | Checks repetíveis; restore testado; requisitos ASVS rastreados; avaliação dos fluxos essenciais; resumo sanitizado de achados. | Release baseline pode ser repetido e evidenciado sem depender exclusivamente de memória individual. |
| **90 dias** | Fechar a Fase 1; formalizar fornecedores críticos, incidentes, observabilidade e operação; iniciar cloud, privacidade e continuidade da Fase 2. | Gate de MVP; matriz de responsabilidade cloud; runbook de incidente; SLI/SLO iniciais; inventário de suboperadores; BIA preliminar. | Itens obrigatórios aplicáveis da Fase 1 estão operantes; bloqueios remanescentes possuem decisão formal. |
| **180 dias** | Exercitar incidente e continuidade; testar RTO/RPO; consolidar suporte, mudanças, privacidade e due diligence; medir lacunas da Fase 3. | Exercícios registrados; pacote B2B sanitizado; métricas de serviço; avaliações de fornecedor; roadmap anual; baseline SAMM opcional. | Fase 2 demonstrável por evidências e compromissos comerciais sustentados por capacidade observada. |

## Backlog por prioridade

| Prioridade | Itens |
|---|---|
| **Obrigatório** | Gestão proporcional baseada em risco; autenticação e autorização; segredos; dependências; backup e restore; logs essenciais; tratamento de vulnerabilidades; LGPD quando aplicável; acessibilidade como requisito de produto; evidências sanitizadas; resposta mínima a incidentes; requisitos contratuais assumidos. |
| **Desejável** | ASVS nível 2 para SaaS autenticado ou B2B; DAST controlado; SBOM; verificação cloud/IaC; SLI/SLO; avaliação de fornecedores; exercícios de incidente e continuidade; OWASP SAMM; ISO/IEC 25010 e 29119 adaptadas. |
| **Melhoria futura** | Programa formal de ciclo de vida, engenharia de resiliência, métricas avançadas, ISO/IEC 27034 multipartes, divulgação coordenada madura, governança de IA material e auditorias independentes de escopo específico. |
| **Empresa maior** | GRC integrado, SOC/SIEM com cobertura ampliada, equipe dedicada de AppSec ou privacidade, gestão corporativa de fornecedores, testes avançados de resiliência, múltiplas regiões, certificações formais e programa completo de IA. |

## Quando considerar certificação formal

Considerar certificação somente quando houver demanda de mercado, contrato, regulação ou benefício estratégico mensurável. Antes de iniciar:

- [ ] Definir entidade, produtos, locais, processos e fornecedores dentro do escopo.
- [ ] Confirmar a edição ISO e a adoção ABNT aplicável no catálogo oficial.
- [ ] Validar se os controles operam por período suficiente para gerar evidência.
- [ ] Estimar auditoria, manutenção, correções e capacidade interna.
- [ ] Escolher organismo e esquema reconhecidos para o objetivo.
- [ ] Comunicar com precisão o que foi certificado, sem estender a alegação a todo o SaaS.

## Fontes oficiais essenciais

- [ISO/IEC 27001](https://www.iso.org/standard/27001.html), [ISO/IEC 27002](https://www.iso.org/standard/75652.html) e [ISO/IEC 27005](https://www.iso.org/standard/80585.html).
- [ISO/IEC 27701](https://www.iso.org/standard/85819.html), [ISO/IEC/IEEE 12207](https://www.iso.org/standard/90219.html), [ISO/IEC 25010](https://www.iso.org/standard/78176.html), [ISO/IEC 20000-1](https://www.iso.org/standard/70636.html) e [ISO 22301](https://www.iso.org/standard/75106.html).
- [LGPD - Lei nº 13.709/2018](https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm) e [ANPD](https://www.gov.br/anpd/pt-br).
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) e [Catálogo ABNT](https://www.abntcatalogo.com.br/).
- [OWASP Top 10](https://owasp.org/www-project-top-ten/), [OWASP API Security Top 10](https://owasp.org/www-project-api-security/), [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/) e [OWASP SAMM](https://owaspsamm.org/guidance/quick-start-guide/).

O registro completo das fontes utilizadas e das incertezas está em `research/sources/chunk-03.md`.

## Limitações

- Este documento é um roadmap técnico e de governança, não parecer jurídico nem declaração de conformidade.
- Eficácia depende de implementação, operação, revisão e evidências; documentos isolados não reduzem risco.
- Edições ISO, adoções ABNT, regulamentos e referências contínuas podem mudar. Confirmar fontes oficiais antes de contratos, auditorias ou certificações.
