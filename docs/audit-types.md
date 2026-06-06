# Tipos de auditoria para SaaS

## Objetivo e regras de uso

Este documento define um catálogo prático de auditorias para SaaS. As frequências são um **baseline interno recomendado**, ajustável por risco, arquitetura, contrato, incidente e mudança relevante; não são apresentadas como exigências universais de OWASP, NIST, LGPD ou PCI DSS.

Uma ferramenta produz indícios, não uma decisão final. Achados que possam bloquear release devem ter escopo, versão afetada, caminho de exploração, impacto e mitigação revisados por pessoa responsável. Exceções exigem dono, justificativa, prazo e risco residual aprovado.

### Evidências e relatórios

- Relatórios crus, logs detalhados, payloads, URLs internas, dumps e capturas não sanitizadas ficam em `reports/raw/`, fora do Git.
- Resumos revisados podem ir para `reports/sanitized/`, sem segredos, dados pessoais reais ou instruções exploráveis.
- A evidência mínima registra escopo, data, ambiente, revisão testada, ferramenta e configuração relevantes, resultado, triagem, decisão e responsável.
- Evidência de ausência de achados não prova ausência de vulnerabilidades; registra apenas o que foi testado no escopo declarado.

## 1. Revisão manual de código

| Campo | Orientação prática |
|---|---|
| **O que é** | Inspeção humana de mudanças, fluxos e controles para encontrar falhas de lógica e uso inseguro de APIs que automação pode não compreender. A OWASP mantém um guia específico para revisão segura de código [S2]. |
| **Quando fazer** | Em pull requests de risco; antes de lançar autenticação, autorização, pagamentos, administração, criptografia ou tratamento sensível; após incidente. |
| **Frequência recomendada** | Em toda mudança de alto risco; amostragem semanal ou por sprint nas demais; revisão ampliada antes de release maior. |
| **Ferramentas que podem ser usadas** | Diff e revisão do provedor Git; checklist OWASP; IDE; busca estrutural; SAST como apoio, não substituto. |
| **Arquivos/relatórios gerados** | Comentários de revisão, checklist do PR, decisão de risco e resumo sanitizado de achados. |
| **Riscos que detecta** | Bypass de autorização, regra de negócio insegura, mass assignment, validação insuficiente, corrida, tratamento incorreto de segredo e logging excessivo. |
| **Limitações** | Depende de experiência, contexto e tempo; pode não observar configuração ou comportamento em execução; cobertura total é cara. |
| **Falsos positivos comuns** | Código aparentemente perigoso protegido em outra camada; caminho inalcançável; controle aplicado por framework ou middleware não visível no trecho. |
| **Evidências recomendadas** | Revisão/commit, arquivos e fluxos avaliados, checklist, participantes, achados confirmados e correções vinculadas. |
| **Exemplo em SaaS** | Revisar a alteração que permite a um administrador exportar dados e confirmar escopo por tenant, autorização, minimização e trilha de auditoria. |

## 2. SAST

| Campo | Orientação prática |
|---|---|
| **O que é** | Análise estática do código ou de artefatos sem executar a aplicação, procurando padrões e fluxos associados a vulnerabilidades. Integra-se às práticas de verificação do SDLC [S1][S6]. |
| **Quando fazer** | No PR, na branch principal, antes de release e ao adotar novas linguagens, frameworks ou regras. |
| **Frequência recomendada** | Incremental em cada PR; varredura completa diária ou semanal conforme custo; antes de release maior. |
| **Ferramentas que podem ser usadas** | CodeQL, Semgrep, Bandit e analisadores nativos do ecossistema; confirmar suporte e regras no catálogo do Chunk 6. |
| **Arquivos/relatórios gerados** | Alertas no provedor Git, SARIF quando suportado e resumo sanitizado de triagem. |
| **Riscos que detecta** | Injeção, uso inseguro de funções, desserialização, falhas criptográficas, fluxo de dados sensíveis e padrões de código perigosos. |
| **Limitações** | Visibilidade limitada de runtime, configuração e regras de negócio; cobertura varia por linguagem e conjunto de regras. |
| **Falsos positivos comuns** | Entrada já validada; sink não alcançável; sanitização customizada desconhecida; código de teste ou exemplo fora do produto. |
| **Evidências recomendadas** | Revisão analisada, regras habilitadas, resultado, triagem por severidade, justificativa de supressões e issue de correção. |
| **Exemplo em SaaS** | Detectar uma consulta SQL construída com entrada do usuário e validar manualmente se parametrização ocorre antes da execução. |

## 3. DAST

| Campo | Orientação prática |
|---|---|
| **O que é** | Teste da aplicação em execução por suas interfaces expostas. O OWASP WSTG organiza técnicas manuais e automatizadas; o ZAP oferece automação de scans passivos e ativos [S1][S10]. |
| **Quando fazer** | Em ambiente autorizado e representativo, após deploy de teste, antes de release relevante e após mudança de superfície web. |
| **Frequência recomendada** | Scan passivo por release; baseline semanal; teste ativo antes de releases maiores ou após mudança crítica, nunca sem autorização. |
| **Ferramentas que podem ser usadas** | OWASP ZAP, proxies de teste e testes HTTP próprios. Scans ativos exigem escopo e proteção contra efeitos destrutivos. |
| **Arquivos/relatórios gerados** | Relatório HTML/JSON/SARIF quando suportado, lista de URLs testadas e resumo sanitizado. |
| **Riscos que detecta** | Headers e cookies inseguros, injeções observáveis, XSS, exposição de informação, configuração web e alguns erros de sessão. |
| **Limitações** | Cobertura depende de crawling, autenticação e dados; não enxerga código; pode alterar dados ou degradar o ambiente. |
| **Falsos positivos comuns** | Resposta genérica interpretada como falha; proteção compensatória não observada; endpoint de teste; header ausente mas controle equivalente. |
| **Evidências recomendadas** | Alvo e autorização, perfil do scan, autenticação usada sem registrar segredo, cobertura, alertas validados e impactos no ambiente. |
| **Exemplo em SaaS** | Executar baseline autenticado no staging sobre cadastro, painel e API, com dados fictícios e exclusão posterior da massa de teste. |

## 4. SCA

| Campo | Orientação prática |
|---|---|
| **O que é** | Software Composition Analysis inventaria componentes de terceiros e pode correlacionar vulnerabilidades, licenças, proveniência e componentes transitivos. É mais amplo que procurar apenas versões vulneráveis. |
| **Quando fazer** | Em PR que altera manifestos/locks, build, release, aquisição de componente e resposta a vulnerabilidade divulgada. |
| **Frequência recomendada** | Em cada PR e build; reavaliação diária da base de vulnerabilidades; inventário/SBOM por release quando aplicável. |
| **Ferramentas que podem ser usadas** | Dependency graph/review do GitHub [S8], OWASP Dependency-Check, Trivy e ferramentas oficiais do ecossistema. |
| **Arquivos/relatórios gerados** | Inventário/SBOM, alertas, relatório de licenças e resumo de componentes afetados. |
| **Riscos que detecta** | Componente vulnerável, transitivo desconhecido, licença incompatível, pacote abandonado ou proveniência insuficiente. |
| **Limitações** | CVE não demonstra exploração; inventário pode omitir componente dinâmico ou vendorizado; qualidade depende de metadados. |
| **Falsos positivos comuns** | Componente não carregado, função vulnerável não usada, dependência somente de desenvolvimento ou correspondência incorreta de pacote. |
| **Evidências recomendadas** | Manifestos/locks, inventário por release, base consultada, análise de alcance, decisão de atualização ou exceção. |
| **Exemplo em SaaS** | Identificar biblioteca transitiva vulnerável na API, verificar se o caminho afetado é executado e atualizar lockfile com teste de regressão. |

## 5. Secret scanning

| Campo | Orientação prática |
|---|---|
| **O que é** | Detecção de credenciais, chaves, tokens e outros segredos em conteúdo e histórico. O GitHub documenta padrões, alertas, validação e proteção no push [S7]. |
| **Quando fazer** | Antes do commit/push, em PR, em todo o histórico ao habilitar a prática e após ampliar padrões. |
| **Frequência recomendada** | Contínua; varredura completa periódica e após incidente ou inclusão de novo tipo de segredo. |
| **Ferramentas que podem ser usadas** | GitHub secret scanning, Gitleaks, detect-secrets e Trivy [S7][S9]. |
| **Arquivos/relatórios gerados** | Alertas restritos, baseline sem valor secreto e registro de revogação/rotação. Não versionar o achado bruto. |
| **Riscos que detecta** | Credencial versionada, segredo em histórico, chave privada, token em issue/PR ou configuração insegura. |
| **Limitações** | Não encontra todo segredo customizado ou cifrado; remover do Git não revoga a credencial; validação pode consultar o emissor. |
| **Falsos positivos comuns** | Placeholder, hash, fixture, chave pública, identificador com formato semelhante ou credencial fictícia claramente inválida. |
| **Evidências recomendadas** | Tipo e local redigidos, confirmação de validade sem expor valor, revogação, rotação, impacto e prevenção de recorrência. |
| **Exemplo em SaaS** | Um token de sandbox é detectado no PR; o merge é bloqueado, o token é revogado e o código passa a ler referência segura do ambiente. |

## 6. IaC scanning

| Campo | Orientação prática |
|---|---|
| **O que é** | Análise de Terraform, CloudFormation, Kubernetes, Dockerfile e outros artefatos declarativos para detectar configurações inseguras antes do provisionamento [S9]. |
| **Quando fazer** | Em PR de infraestrutura, antes de aplicar plano, após atualizar módulos e ao mudar política cloud. |
| **Frequência recomendada** | Em cada PR e plano; scan completo semanal; reavaliação quando regras ou baseline mudarem. |
| **Ferramentas que podem ser usadas** | Trivy, Checkov, scanner oficial do provedor e policy as code; validar formatos suportados no Chunk 6. |
| **Arquivos/relatórios gerados** | SARIF/JSON quando suportado, diff de plano sanitizado, exceções e resumo de configuração. Nunca versionar `terraform.tfstate`. |
| **Riscos que detecta** | Recurso público, criptografia ausente, regra de rede ampla, identidade excessiva, logging desabilitado e container privilegiado. |
| **Limitações** | Código analisado pode diferir do estado implantado; variáveis e módulos remotos reduzem contexto; não detecta drift sozinho. |
| **Falsos positivos comuns** | Recurso intencionalmente público, controle aplicado por organização, valor resolvido em runtime ou regra incompatível com o provedor usado. |
| **Evidências recomendadas** | Commit, plano redigido, regras/políticas, triagem, exceção aprovada e comparação posterior com o estado cloud. |
| **Exemplo em SaaS** | Bloquear um PR que tornaria público o bucket de anexos de clientes e exigir acesso privado por identidade da aplicação. |

## 7. Container scanning

| Campo | Orientação prática |
|---|---|
| **O que é** | Avaliação de imagem, pacotes do sistema, bibliotecas, configuração e, quando suportado, segredos. O NIST descreve riscos próprios de containers [S11]. |
| **Quando fazer** | No build, antes de publicar imagem, antes do deploy e quando novas vulnerabilidades afetarem imagens já publicadas. |
| **Frequência recomendada** | Em cada build/release; re-scan diário das imagens em uso; revisão periódica do runtime. |
| **Ferramentas que podem ser usadas** | Trivy [S9], scanner do registry/provedor e ferramentas de assinatura/SBOM. |
| **Arquivos/relatórios gerados** | Relatório de vulnerabilidades, SBOM, digest da imagem, atestado de build e resumo sanitizado. |
| **Riscos que detecta** | Pacote vulnerável, base obsoleta, execução como root, segredo em camada, configuração insegura e software inesperado. |
| **Limitações** | Scan da imagem não prova segurança do runtime, host ou orquestrador; base de CVEs e identificação de pacote podem divergir. |
| **Falsos positivos comuns** | Pacote presente mas não executado, backport do fornecedor sem versão aparente, CVE sem caminho alcançável ou camada não usada. |
| **Evidências recomendadas** | Digest imutável, origem da base, SBOM, data da base de vulnerabilidades, triagem e imagem corrigida. |
| **Exemplo em SaaS** | Recusar promoção de imagem com pacote crítico explorável no serviço exposto e reconstruir a partir de base corrigida. |

## 8. Dependency scanning

| Campo | Orientação prática |
|---|---|
| **O que é** | Verificação focada em manifestos, lockfiles e alterações de pacotes para encontrar versões com vulnerabilidades conhecidas. No GitHub, dependency review compara mudanças do PR [S8]. |
| **Quando fazer** | Em PR que adiciona ou atualiza pacote, no build e após novo advisory. |
| **Frequência recomendada** | Em cada PR; monitoramento contínuo; atualização planejada ao menos mensal para dependências mantidas. |
| **Ferramentas que podem ser usadas** | Dependency review/Dependabot, `pip-audit`, `npm audit` e equivalentes oficiais; comandos ficam para o Chunk 6. |
| **Arquivos/relatórios gerados** | Alertas, diff de dependências, PR de atualização e resumo de vulnerabilidades. |
| **Riscos que detecta** | Introdução ou permanência de versão vulnerável direta ou transitiva. |
| **Limitações** | Escopo menor que SCA; pode não cobrir licença, proveniência, pacote vendorizado, componente de sistema ou alcance real. |
| **Falsos positivos comuns** | Dependência de desenvolvimento, pacote não distribuído, função afetada não usada, advisory para plataforma diferente. |
| **Evidências recomendadas** | Lockfile, advisory oficial, árvore de dependências, análise de alcance, atualização e testes. |
| **Exemplo em SaaS** | O PR adiciona um pacote com advisory de severidade alta; a revisão impede a introdução até substituir ou justificar formalmente. |

## 9. API security testing

| Campo | Orientação prática |
|---|---|
| **O que é** | Teste de endpoints, objetos, funções, autenticação, autorização, consumo de recursos, inventário e integrações. A OWASP mantém referência específica para riscos de API [S4]. |
| **Quando fazer** | Ao criar ou alterar endpoint, modelo de autorização, webhook, integração ou versão pública da API. |
| **Frequência recomendada** | Testes automatizados em cada PR; revisão manual por release; teste ampliado trimestral ou após mudança relevante. |
| **Ferramentas que podem ser usadas** | Testes de integração/contrato, ZAP com OpenAPI/GraphQL [S10], proxy de teste e clientes HTTP. |
| **Arquivos/relatórios gerados** | Casos de teste, matriz endpoint-papel, cobertura do contrato e resumo sanitizado. |
| **Riscos que detecta** | BOLA/IDOR, autorização de função quebrada, exposição excessiva, mass assignment, abuso de recursos, inventário incompleto e SSRF. |
| **Limitações** | Scanner não entende toda regra de negócio; especificação pode estar incompleta; testes agressivos podem afetar dados. |
| **Falsos positivos comuns** | Endpoint público por desenho, objeto fictício inexistente, rate limit diferente por ambiente ou autorização aplicada em gateway. |
| **Evidências recomendadas** | Contrato testado, identidades fictícias por papel/tenant, matriz de acesso, resultados negativos e correções. |
| **Exemplo em SaaS** | Tentar acessar a fatura do tenant B usando sessão do tenant A e exigir resposta sem dados e evento de segurança apropriado. |

## 10. Threat modeling

| Campo | Orientação prática |
|---|---|
| **O que é** | Processo estruturado para definir sistema, ativos, fronteiras, ameaças, mitigação e validação. A OWASP recomenda aplicação contínua no ciclo de vida [S3]. |
| **Quando fazer** | Antes de implementar arquitetura ou recurso de alto risco; ao mudar fluxo de dados, trust boundary, fornecedor ou controle central; após incidente. |
| **Frequência recomendada** | Por mudança arquitetural relevante; revisão trimestral do modelo ativo e anual do sistema completo. |
| **Ferramentas que podem ser usadas** | Diagramas de fluxo de dados, STRIDE quando adequado, abuse cases, OWASP Threat Dragon ou ferramenta de diagramas. |
| **Arquivos/relatórios gerados** | `docs/threat-model.md`, diagramas sanitizados, backlog de ameaças, decisões e riscos aceitos. |
| **Riscos que detecta** | Ameaças de desenho, fronteiras de confiança frágeis, dependências externas, abuso de negócio e controles ausentes. |
| **Limitações** | Qualidade depende dos participantes e do modelo atualizado; não demonstra que mitigação foi implementada. |
| **Falsos positivos comuns** | Ameaça teoricamente possível mas fora do escopo, sem precondição real ou já coberta por controle não documentado. |
| **Evidências recomendadas** | Escopo, participantes, versão do diagrama, premissas, ameaças priorizadas, mitigação, dono e teste de validação. |
| **Exemplo em SaaS** | Modelar webhooks de pagamento e identificar falsificação, replay, indisponibilidade do provedor e vazamento em logs antes da implementação. |

## 11. Privacy impact assessment

| Campo | Orientação prática |
|---|---|
| **O que é** | Avaliação de finalidade, necessidade, fluxo de dados, impacto sobre titulares e medidas de privacidade. Quando caracterizado como RIPD, observar LGPD e orientação da ANPD [S12][S13]. |
| **Quando fazer** | Antes de tratamento novo ou materialmente alterado, especialmente alto risco; quando solicitado pela ANPD; após mudança de finalidade ou tecnologia. |
| **Frequência recomendada** | Por tratamento relevante; revisão anual e quando mudarem dados, finalidade, base, compartilhamento, retenção ou risco. |
| **Ferramentas que podem ser usadas** | Template de PIA/RIPD, mapa de dados, entrevistas, registro de riscos e inventário de fornecedores. |
| **Arquivos/relatórios gerados** | RIPD/PIA com acesso restrito, decisão de necessidade, plano de mitigação e versão pública somente se aprovada e sanitizada. |
| **Riscos que detecta** | Coleta excessiva, finalidade incompatível, retenção indevida, falta de transparência, alto impacto e compartilhamento sem salvaguarda. |
| **Limitações** | Não substitui validação jurídica; depende de inventário correto e pode ficar obsoleta; nem todo tratamento exige o mesmo nível documental. |
| **Falsos positivos comuns** | Risco baseado em premissa incorreta sobre dados, escala ou decisão automatizada; duplicidade de tratamento já coberto. |
| **Evidências recomendadas** | Finalidade, categorias de dados/titulares, fluxo, necessidade, riscos, medidas, responsáveis, aprovação e gatilho de revisão. |
| **Exemplo em SaaS** | Antes de analisar comportamento de alunos para recomendações, avaliar necessidade, transparência, retenção, fornecedor e impacto de decisões automatizadas. |

## 12. LGPD gap assessment

| Campo | Orientação prática |
|---|---|
| **O que é** | Diagnóstico entre práticas reais e obrigações aplicáveis da LGPD, regulamentos/orientações da ANPD e compromissos assumidos [S12][S13]. |
| **Quando fazer** | No baseline do produto, antes de venda empresarial ou novo mercado, após mudança regulatória, incidente ou alteração relevante de tratamento. |
| **Frequência recomendada** | Semestral no início e anual quando estabilizado; revisão dirigida sempre que houver gatilho material. |
| **Ferramentas que podem ser usadas** | Checklist jurídico-técnico, ROPA/mapa de dados, revisão de contratos, testes de direitos e registro de fornecedores. |
| **Arquivos/relatórios gerados** | `docs/lgpd-gap-assessment.md`, backlog, matriz de responsabilidade e resumo executivo sanitizado. |
| **Riscos que detecta** | Ausência de base/registro, transparência insuficiente, direitos inoperantes, retenção excessiva, contrato ou fornecedor inadequado e governança frágil. |
| **Limitações** | Não é parecer jurídico nem prova de conformidade; interpretação depende do contexto e de normas vigentes. |
| **Falsos positivos comuns** | Item inaplicável ao papel do agente; obrigação já atendida por processo externo; documento existe com outro nome. |
| **Evidências recomendadas** | Requisito/fonte, aplicabilidade, controle, evidência, lacuna, risco, dono, prazo e validação jurídica quando necessária. |
| **Exemplo em SaaS** | Testar pedido fictício de acesso e exclusão de ponta a ponta, incluindo backups, suboperadores e exceções legais documentadas. |

## 13. Acessibilidade

| Campo | Orientação prática |
|---|---|
| **O que é** | Avaliação automatizada e manual dos critérios aplicáveis de acessibilidade. WCAG 2.2 é Recomendação W3C; ferramentas automáticas não cobrem todos os critérios [S14][S15]. |
| **Quando fazer** | No design, componente, PR de interface, antes de release e ao corrigir fluxo crítico. |
| **Frequência recomendada** | Automação por PR nas telas afetadas; teste manual por release; auditoria ampla semestral ou anual. |
| **Ferramentas que podem ser usadas** | axe-core, Lighthouse, Pa11y, validadores, leitor de tela e testes de teclado; confirmar uso no Chunk 10. |
| **Arquivos/relatórios gerados** | Relatório por fluxo/critério, issues, evidência manual e `docs/accessibility-audit.md`. |
| **Riscos que detecta** | Falta de nome acessível, contraste, foco, teclado, semântica, mensagens de erro e barreiras em autenticação ou pagamento. |
| **Limitações** | Automação cobre apenas parte dos problemas; conformidade técnica não garante boa experiência; contexto e tecnologia assistiva importam. |
| **Falsos positivos comuns** | Componente oculto, contraste calculado sem estado real, nome fornecido por mecanismo alternativo ou regra inaplicável ao elemento. |
| **Evidências recomendadas** | URL/fluxo, critério WCAG, método, tecnologia assistiva, resultado, impacto, correção e reteste. |
| **Exemplo em SaaS** | Testar cadastro, login, recuperação de conta e checkout apenas por teclado, com foco visível e erros anunciados. |

## 14. Testes de autenticação e autorização

| Campo | Orientação prática |
|---|---|
| **O que é** | Verificação de identidade, sessão, recuperação, MFA quando aplicável e decisões de acesso. OWASP ASVS e WSTG fornecem requisitos e cenários de teste [S1][S5]. |
| **Quando fazer** | Em toda mudança de login, sessão, identidade, papel, endpoint protegido ou recuperação de conta. |
| **Frequência recomendada** | Testes automatizados em cada PR; regressão completa por release; revisão manual trimestral e após incidente. |
| **Ferramentas que podem ser usadas** | Testes unitários/integrados, clientes HTTP, proxy de teste, matriz de papéis e provedor de identidade em sandbox. |
| **Arquivos/relatórios gerados** | Casos positivos/negativos, matriz de acesso, relatório de sessão e resumo sanitizado. |
| **Riscos que detecta** | Bypass de login, sessão previsível ou não invalidada, recuperação insegura, CSRF, acesso horizontal/vertical e MFA contornável. |
| **Limitações** | Deve cobrir múltiplos papéis, tenants e estados; automação pode não reproduzir federação ou risco adaptativo. |
| **Falsos positivos comuns** | Cache de teste, identidade com papel residual, rota pública intencional, mock diferente do provedor real. |
| **Evidências recomendadas** | Matriz sujeito-recurso-ação, sessões fictícias, resultados negativos, invalidação, revisão testada e reteste. |
| **Exemplo em SaaS** | Confirmar que trocar o identificador de uma ordem não permite leitura entre tenants e que logout invalida a sessão no servidor. |

## 15. Testes de permissões e controle de acesso

| Campo | Orientação prática |
|---|---|
| **O que é** | Avaliação detalhada de RBAC/ABAC, permissões de objeto, campo, função administrativa, tenant e serviço, incluindo menor privilégio. |
| **Quando fazer** | Ao criar papel, permissão, endpoint, job, função administrativa ou migração; antes de delegar administração a clientes. |
| **Frequência recomendada** | Em cada mudança de permissão; revisão trimestral da matriz e semestral dos acessos concedidos. |
| **Ferramentas que podem ser usadas** | Testes de autorização, policy engine, matriz de acesso, consulta de IAM e revisão manual. |
| **Arquivos/relatórios gerados** | Matriz papel-recurso-ação, testes de negação, relatório de acessos e exceções. |
| **Riscos que detecta** | Privilégio excessivo, acesso entre tenants, função órfã, permissão implícita, segregação inadequada e conta de serviço ampla. |
| **Limitações** | Estado real pode divergir da documentação; permissões indiretas e herdadas são difíceis de visualizar. |
| **Falsos positivos comuns** | Permissão necessária a job interno, herança intencional, recurso público ou controle compensatório em camada superior. |
| **Evidências recomendadas** | Export/consulta redigida, matriz aprovada, amostra por papel, teste de negação, dono da permissão e remoções. |
| **Exemplo em SaaS** | Verificar que suporte pode visualizar metadados necessários, mas não conteúdo do cliente nem alterar cobrança sem elevação auditada. |

## 16. Auditoria de logs

| Campo | Orientação prática |
|---|---|
| **O que é** | Revisão de geração, transmissão, acesso, retenção, integridade, correlação e descarte de logs. O NIST SP 800-92 final permanece referência; a Rev. 1 localizada está em draft [S16]. |
| **Quando fazer** | Ao criar evento crítico, mudar observabilidade, investigar incidente, alterar retenção ou integrar SIEM. |
| **Frequência recomendada** | Monitoramento contínuo; revisão mensal de cobertura/alertas; teste trimestral de eventos críticos; auditoria anual. |
| **Ferramentas que podem ser usadas** | Plataforma de logs/SIEM, consultas controladas, alertas e testes sintéticos. Ferramenta não deve receber dado desnecessário. |
| **Arquivos/relatórios gerados** | Catálogo de eventos, matriz de retenção, testes de alerta e resumo sanitizado. Logs crus não vão para o Git. |
| **Riscos que detecta** | Evento crítico ausente, dado pessoal/segredo em log, acesso indevido, retenção inadequada, relógio inconsistente e alerta inoperante. |
| **Limitações** | Log não prova sozinho a ação; excesso gera ruído e custo; ausência pode decorrer de falha de coleta. |
| **Falsos positivos comuns** | Evento legítimo classificado como ataque, duplicação por retry, scanner autorizado ou relógio/fuso interpretado incorretamente. |
| **Evidências recomendadas** | Evento sintético sem dado real, regra acionada, acesso e retenção, cadeia temporal e decisão de ajuste. |
| **Exemplo em SaaS** | Simular falhas repetidas de login em conta fictícia e confirmar evento, alerta, contexto mínimo e ausência de senha/token. |

## 17. Auditoria de backups

| Campo | Orientação prática |
|---|---|
| **O que é** | Verificação de escopo, execução, criptografia, acesso, retenção, integridade, isolamento e restauração. Planejamento de contingência exige testes e manutenção [S17]. |
| **Quando fazer** | Ao implantar armazenamento, mudar banco/arquitetura, alterar RPO/RTO, antes de migração e após falha ou incidente. |
| **Frequência recomendada** | Monitorar jobs diariamente; restauração amostral mensal; exercício completo trimestral ou semestral conforme criticidade. |
| **Ferramentas que podem ser usadas** | Serviço de backup do provedor, checksum, ambiente isolado de restore, monitoramento e cofre de chaves. |
| **Arquivos/relatórios gerados** | Registro de job, teste de restore, duração, ponto recuperado e exceções. Não versionar backup, dump ou configuração sensível. |
| **Riscos que detecta** | Backup inexistente/corrompido, RPO/RTO inexequível, chave indisponível, acesso amplo, cópia não isolada e exclusão não propagada. |
| **Limitações** | Job bem-sucedido não garante restauração; teste parcial não cobre dependências; dados restaurados exigem proteção. |
| **Falsos positivos comuns** | Alerta por janela atrasada mas concluída, cópia intencionalmente expirada ou falha de teste causada pelo ambiente isolado. |
| **Evidências recomendadas** | ID redigido do backup, escopo, restore em ambiente isolado, integridade, tempo, responsáveis e descarte seguro da cópia de teste. |
| **Exemplo em SaaS** | Restaurar banco e anexos fictícios, validar consistência entre ambos e comprovar que a aplicação inicia dentro do objetivo aprovado. |

## 18. Auditoria de incident response

| Campo | Orientação prática |
|---|---|
| **O que é** | Avaliação de preparação, detecção, papéis, comunicação, contenção, recuperação, evidência e melhoria. NIST SP 800-61 Rev. 3 é a publicação final vigente localizada [S18]. |
| **Quando fazer** | Ao criar ou alterar o plano, após incidente, mudança de equipe/fornecedor e antes de compromisso empresarial relevante. |
| **Frequência recomendada** | Tabletop semestral; teste técnico anual; revisão após cada incidente e contato trimestral dos papéis críticos. |
| **Ferramentas que podem ser usadas** | Runbooks, sistema de incidentes, comunicação fora de banda, tabletop e ambiente de simulação. |
| **Arquivos/relatórios gerados** | Plano, lista de contatos protegida, ata sanitizada do exercício, timeline restrita e plano de ação. |
| **Riscos que detecta** | Papel indefinido, canal indisponível, contenção improvisada, evidência perdida, comunicação tardia e recuperação não coordenada. |
| **Limitações** | Exercício não reproduz pressão total; documentação não prova capacidade; detalhes reais podem ser sensíveis. |
| **Falsos positivos comuns** | Lacuna simulada que não existe no ambiente real ou atraso causado artificialmente pelo roteiro. |
| **Evidências recomendadas** | Cenário fictício, participantes, tempos, decisões, lacunas, ações, donos, prazos e reteste. |
| **Exemplo em SaaS** | Simular token de integração exposto, com revogação, busca de uso indevido, avaliação LGPD, comunicação e lições aprendidas. |

## 19. Auditoria de CI/CD

| Campo | Orientação prática |
|---|---|
| **O que é** | Revisão de workflows, runners, permissões, dependências de ações, segredos, artifacts, aprovações e proveniência do build. O SSDF inclui proteção do ambiente de desenvolvimento e integridade do software [S6]. |
| **Quando fazer** | Ao criar/alterar pipeline, runner, permissão, ambiente ou ação externa; após incidente de supply chain. |
| **Frequência recomendada** | Revisão em cada PR de workflow; inventário mensal; auditoria trimestral; revisão anual de arquitetura. |
| **Ferramentas que podem ser usadas** | Revisão de YAML, scanners de workflow, logs do provedor, regras de branch/environment e attestations suportadas. |
| **Arquivos/relatórios gerados** | Inventário de workflows/actions, matriz de permissões, achados e decisão de hardening. Logs crus e segredos ficam fora do Git. |
| **Riscos que detecta** | Token excessivo, action não fixada, PR não confiável com segredo, runner persistente comprometido, artifact adulterado e bypass de aprovação. |
| **Limitações** | Configuração organizacional pode estar fora do repositório; logs podem omitir ataque; scanner não entende intenção. |
| **Falsos positivos comuns** | Permissão necessária para publicação, action interna confiável ou runner isolado interpretado como compartilhado. |
| **Evidências recomendadas** | Workflow/revisão, permissões efetivas, origem das actions, teste sem segredo real, proteção do ambiente e correções. |
| **Exemplo em SaaS** | Impedir workflow de PR externo de acessar credencial de deploy e exigir aprovação protegida para produção. |

## 20. Auditoria de cloud

| Campo | Orientação prática |
|---|---|
| **O que é** | Avaliação do estado implantado, IAM, rede, dados, chaves, logs, exposição, resiliência e responsabilidade compartilhada. O NIST descreve desafios de segurança e privacidade em cloud pública [S19]. |
| **Quando fazer** | Antes de produção, ao criar conta/projeto, após mudança arquitetural, aquisição, incidente ou novo serviço gerenciado. |
| **Frequência recomendada** | Monitoramento contínuo de drift/exposição; revisão mensal de achados; acesso trimestral; auditoria ampla semestral. |
| **Ferramentas que podem ser usadas** | Serviços nativos de postura e IAM, CSPM, consultas de configuração, IaC scanner e CIS Benchmarks quando aplicáveis. |
| **Arquivos/relatórios gerados** | Inventário, diagrama sanitizado, matriz de responsabilidade, relatório de postura e exceções. Não versionar estados ou IDs sensíveis desnecessários. |
| **Riscos que detecta** | Recurso público, IAM excessivo, chave sem rotação, logging ausente, rede ampla, região/replicação inadequada e drift. |
| **Limitações** | Snapshot envelhece rápido; ferramentas variam por provedor; responsabilidade compartilhada não transfere risco automaticamente. |
| **Falsos positivos comuns** | Exposição intencional protegida por camada superior, serviço sem dado sensível ou controle organizacional não visível. |
| **Evidências recomendadas** | Conta/escopo redigidos, consulta ou export seguro, data, regra, contexto, correção e verificação de drift. |
| **Exemplo em SaaS** | Encontrar função serverless com permissão de leitura em todos os buckets e restringi-la ao prefixo e operação necessários. |

## 21. Auditoria de pagamentos

| Campo | Orientação prática |
|---|---|
| **O que é** | Revisão do fluxo de checkout, provedor, webhooks, idempotência, reconciliação, autorização, fraude, logs e escopo de dados de cartão. PCI DSS aplica-se a entidades que armazenam, processam ou transmitem dados de cartão [S20]. |
| **Quando fazer** | Antes de aceitar pagamentos, ao trocar provedor/integração, alterar checkout/webhook, mudar escopo PCI ou após fraude/incidente. |
| **Frequência recomendada** | Testes por mudança e release; reconciliação contínua; revisão trimestral do fluxo e avaliação PCI conforme escopo validado. |
| **Ferramentas que podem ser usadas** | Sandbox oficial do provedor, testes de contrato, simulador de webhook, reconciliação e ferramentas exigidas pelo programa aplicável. |
| **Arquivos/relatórios gerados** | Diagrama de fluxo, matriz de responsabilidades, casos de teste, reconciliação e evidência de escopo. Não registrar dados reais de cartão. |
| **Riscos que detecta** | Cobrança duplicada, webhook forjado/repetido, valor adulterado, status inconsistente, dado de cartão indevido e privilégio excessivo. |
| **Limitações** | Sandbox difere de produção; terceirizar reduz mas não elimina responsabilidade; requisitos PCI dependem do fluxo e escopo reais. |
| **Falsos positivos comuns** | Retry legítimo do provedor, evento fora de ordem tratado por desenho ou transação fictícia marcada como anômala. |
| **Evidências recomendadas** | IDs fictícios/redigidos, cenários de sucesso/falha/replay, verificação de assinatura, idempotência, reconciliação e responsabilidades. |
| **Exemplo em SaaS** | Reenviar o mesmo webhook de pagamento no sandbox e confirmar uma única ativação de assinatura e trilha auditável. |

## 22. Auditoria de integrações externas

| Campo | Orientação prática |
|---|---|
| **O que é** | Avaliação de API/webhook de terceiros, autenticação, escopos, dados, disponibilidade, validação, retry, revogação, contrato e suboperadores. |
| **Quando fazer** | Antes de integrar ou renovar fornecedor; ao mudar escopo/dados/API; após incidente, indisponibilidade ou mudança contratual. |
| **Frequência recomendada** | Por mudança; revisão trimestral de credenciais/escopos; avaliação anual do fornecedor e monitoramento contínuo de falhas. |
| **Ferramentas que podem ser usadas** | Sandbox oficial, testes de contrato, mock controlado, monitoramento, inventário de fornecedores e secret manager. |
| **Arquivos/relatórios gerados** | Ficha do fornecedor, fluxo de dados, matriz de escopos, testes de contrato e plano de contingência. |
| **Riscos que detecta** | Escopo excessivo, webhook sem autenticidade, SSRF, indisponibilidade em cascata, dado excessivo, retenção desconhecida e vendor lock-in. |
| **Limitações** | Visibilidade sobre o terceiro é parcial; certificação do fornecedor não prova segurança da integração; sandbox pode divergir. |
| **Falsos positivos comuns** | Retry legítimo, resposta fora de ordem prevista, escopo amplo exigido pelo fornecedor ou endpoint de sandbox instável. |
| **Evidências recomendadas** | Contrato/termos aplicáveis, dados e finalidades, escopos, testes sem credencial real, SLA observado, incidentes e decisão de risco. |
| **Exemplo em SaaS** | Integrar mensageria usando escopo mínimo, validar assinatura de callback, limitar payload, testar indisponibilidade e documentar exclusão. |

## 23. Auditoria de IA, quando aplicável

| Campo | Orientação prática |
|---|---|
| **O que é** | Avaliação de finalidade, dados, fornecedor/modelo, segurança, privacidade, qualidade, viés danoso, supervisão, transparência, monitoramento e uso indevido. O NIST AI RMF é voluntário e está em revisão; o perfil de IA generativa complementa a versão 1.0 [S21][S22]. |
| **Quando fazer** | Antes de liberar recurso material de IA; ao trocar modelo, prompt sistêmico, dados, fornecedor ou decisão automatizada; após incidente ou drift. |
| **Frequência recomendada** | Por mudança material; monitoramento contínuo; reavaliação trimestral e auditoria anual conforme impacto. Se IA não for material, registrar não aplicabilidade. |
| **Ferramentas que podem ser usadas** | Conjunto de avaliações versionado, red teaming autorizado, métricas do caso de uso, monitoramento, filtros e inventário de IA. |
| **Arquivos/relatórios gerados** | Inventário/model card interno, avaliação de impacto, dataset de teste fictício/sanitizado, limitações, incidentes e aprovação. |
| **Riscos que detecta** | Vazamento de dados, prompt injection, saída insegura, alucinação de alto impacto, viés danoso, automação sem supervisão, drift e dependência do fornecedor. |
| **Limitações** | Resultados são probabilísticos e mudam; benchmark não cobre todo uso; framework não certifica o modelo; risco jurídico depende do contexto. |
| **Falsos positivos comuns** | Saída aceitável classificada por regra rígida, teste fora do domínio, variação esperada ou dado sintético não representativo. |
| **Evidências recomendadas** | Versão/configuração do sistema, finalidade, casos de teste, critérios, resultados agregados, revisão humana, riscos, mitigação e monitoramento. |
| **Exemplo em SaaS** | Avaliar assistente que resume chamados usando dados fictícios, tentando extração de instruções, vazamento entre tenants e recomendações sem fonte. |

# Quais auditorias bloqueiam release?

## Princípio de decisão

O nome da auditoria, isoladamente, não determina bloqueio. O gate considera: aplicabilidade ao release, execução do check obrigatório, validade do achado, explorabilidade, impacto, exposição, existência de correção e risco residual aprovado. Um scanner indisponível também pode bloquear quando o check foi definido como obrigatório e não há procedimento alternativo autorizado.

| Classificação padrão | Auditorias e condição |
|---|---|
| **Bloqueia sempre** | **Secret scanning:** segredo real ou potencialmente ativo no conteúdo/histórico do release até revogação e rotação. **Autenticação e autorização:** bypass confirmado em fluxo protegido. **Permissões e controle de acesso:** acesso horizontal/vertical confirmado, inclusive entre tenants. **Pagamentos:** possibilidade confirmada de adulterar valor, falsificar/repetir evento com efeito financeiro, expor dado de cartão ou gerar cobrança indevida no fluxo alterado. **Backups:** para migração ou mudança destrutiva, ausência de backup restaurável e plano de reversão exigidos pelo change. |
| **Bloqueia dependendo da severidade** | Revisão manual, SAST, DAST, SCA, IaC, container, dependency scanning, API testing, acessibilidade, logs, CI/CD, cloud, integrações externas e IA. Bloquear achado crítico/alto validado e aplicável, ou falha em fluxo essencial, conforme matriz de risco. Acessibilidade bloqueia quando a mudança cria barreira grave no fluxo crítico definido pelo produto; avaliação jurídica pode impor critério mais estrito. |
| **Apenas alerta** | Achado baixo/informativo; falso positivo ainda em triagem sem evidência de exploração; melhoria de defesa em profundidade; risco aceito formalmente com prazo. Threat modeling, PIA/RIPD e LGPD gap assessment alertam durante o PR quando não são gatilho obrigatório do recurso. |
| **Apenas revisão periódica** | Auditoria ampla de logs, restore, incident response, cloud, LGPD, privacidade, fornecedores e IA fora de mudança material. Seus achados podem virar bloqueio de release futuro ou operacional se revelarem risco alto/crítico; “periódica” não significa opcional. |

## Gates mínimos recomendados

- [ ] O release identifica quais auditorias são aplicáveis e quais foram executadas.
- [ ] Segredos confirmados foram revogados e rotacionados; apagar o texto não basta.
- [ ] Autenticação, autorização e isolamento entre tenants possuem testes negativos aprovados quando afetados.
- [ ] Vulnerabilidades críticas/altas possuem validação de alcance e decisão registrada.
- [ ] Mudanças de dados, pagamentos, cloud, CI/CD, integrações ou IA acionaram revisão especializada correspondente.
- [ ] Exceções têm dono, justificativa, prazo, compensação e aprovação compatível com o risco.
- [ ] Evidências publicáveis foram sanitizadas; material cru permanece fora do Git.

## Limitações e incertezas

- Frequências e gates deste documento são recomendações internas baseadas em risco. Contratos, setor, cliente, jurisdição e escopo técnico podem exigir controles adicionais.
- A aplicabilidade de LGPD, RIPD e obrigações de comunicação exige avaliação contextual e, quando necessário, jurídica.
- O escopo PCI depende de como o SaaS armazena, processa ou transmite dados de cartão e da arquitetura com o provedor; deve ser validado com fonte e assessor qualificado aplicáveis.
- O NIST SP 800-92 Rev. 1 encontrado permanece como draft; por isso este documento cita o SP 800-92 final e registra a incerteza de atualização.
- O NIST informa que o AI RMF 1.0 está em revisão. Reconfirmar a versão antes de auditoria formal e não tratar o framework voluntário como certificação.
- Ferramentas listadas são exemplos, não endosso nem catálogo fechado. Versões, comandos, formatos e integrações serão validados no Chunk 6.

## Fontes oficiais

O registro detalhado, com data de acesso e uso de cada fonte, está em `research/sources/chunk-04.md`.

- **[S1]** [OWASP Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)
- **[S2]** [OWASP Code Review Guide](https://owasp.org/www-project-code-review-guide/)
- **[S3]** [OWASP Threat Modeling](https://owasp.org/www-community/Threat_Modeling)
- **[S4]** [OWASP API Security Project](https://owasp.org/www-project-api-security/)
- **[S5]** [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)
- **[S6]** [NIST SP 800-218 - SSDF](https://csrc.nist.gov/pubs/sp/800/218/final)
- **[S7]** [GitHub Docs - Secret scanning](https://docs.github.com/code-security/secret-scanning/introduction/about-secret-scanning)
- **[S8]** [GitHub Docs - Dependency review](https://docs.github.com/code-security/concepts/supply-chain-security/about-dependency-review)
- **[S9]** [Trivy - documentação oficial](https://trivy.dev/docs/latest/)
- **[S10]** [OWASP ZAP - Automation Framework](https://www.zaproxy.org/docs/automate/automation-framework/)
- **[S11]** [NIST SP 800-190 - Application Container Security Guide](https://csrc.nist.gov/pubs/sp/800/190/final)
- **[S12]** [Lei nº 13.709/2018 - LGPD](https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm)
- **[S13]** [ANPD - Relatório de Impacto à Proteção de Dados Pessoais](https://www.gov.br/anpd/pt-br/canais_atendimento/agente-de-tratamento/relatorio-de-impacto-a-protecao-de-dados-pessoais-ripd)
- **[S14]** [W3C - WCAG 2.2](https://www.w3.org/TR/WCAG22/)
- **[S15]** [W3C WAI - Evaluating Web Accessibility Overview](https://www.w3.org/WAI/test-evaluate/)
- **[S16]** [NIST SP 800-92 - Guide to Computer Security Log Management](https://csrc.nist.gov/pubs/sp/800/92/final)
- **[S17]** [NIST SP 800-34 Rev. 1 - Contingency Planning](https://csrc.nist.gov/pubs/sp/800/34/r1/upd1/final)
- **[S18]** [NIST SP 800-61 Rev. 3 - Incident Response](https://csrc.nist.gov/pubs/sp/800/61/r3/final)
- **[S19]** [NIST SP 800-144 - Public Cloud Security and Privacy](https://csrc.nist.gov/pubs/sp/800/144/final)
- **[S20]** [PCI Security Standards Council - PCI DSS](https://www.pcisecuritystandards.org/standards/pci-dss/)
- **[S21]** [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework)
- **[S22]** [NIST AI 600-1 - Generative AI Profile](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence)
