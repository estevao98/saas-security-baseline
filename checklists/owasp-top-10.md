# Checklist OWASP Top 10:2025

## Objetivo

Usar o OWASP Top 10:2025 como taxonomia de triagem para revisar riscos recorrentes em aplicações web SaaS, relacionar lacunas a testes e encaminhar requisitos verificáveis para o OWASP ASVS.

Este checklist não é uma certificação, não cobre sozinho toda a segurança da aplicação e não prova ausência de vulnerabilidades.

## Quando usar

- [ ] No desenho ou revisão de arquitetura de aplicação web.
- [ ] Antes de beta, release relevante ou entrada em produção.
- [ ] Em mudanças de autenticação, autorização, administração, integrações, dados, dependências, logging ou tratamento de erros.
- [ ] Após incidente, finding material ou mudança significativa de exposição.
- [ ] Periodicamente, conforme risco, para identificar regressões e atualizar o plano de verificação.

Itens não aplicáveis exigem justificativa, escopo e aprovação. Categoria revisada não equivale a controle aprovado sem evidência suficiente.

## Revisor responsável

- [ ] Segurança/AppSec define escopo, método, profundidade e triagem dos achados.
- [ ] Tech lead ou owner da aplicação confirma arquitetura, fluxos, código e controles implementados.
- [ ] QA ou responsável por testes confirma casos positivos, negativos e regressões.
- [ ] Plataforma/DevSecOps revisa supply chain, configuração, deploy, observabilidade e gates aplicáveis.
- [ ] Privacidade, Operações ou owner de negócio participa quando houver dados pessoais, fluxo crítico, incidente ou impacto relevante.

## Evidências esperadas

- [ ] Escopo da revisão, revisão candidata, componentes, fluxos críticos e limitações conhecidos.
- [ ] Mapeamento sanitizado entre categorias OWASP, controles, testes e findings por IDs opacos.
- [ ] Resumo de revisão manual e de ferramentas aplicáveis, com versão/configuração, cobertura, triagem e falsos positivos.
- [ ] Evidência de testes negativos de autenticação, autorização, isolamento entre tenants, validação, erros e logs.
- [ ] Registro de risco, owner, prazo, gate, correção e reteste para lacunas confirmadas.

Evidência automatizada é insumo para revisão humana. Relatório de scanner, ausência de alerta ou marcação deste checklist não demonstra conformidade.

## Itens obrigatórios

### A01:2025 - Broken Access Control

- [ ] Toda operação sensível aplica autorização no servidor, independentemente de controles de interface.
- [ ] O modelo de papéis, permissões, ownership e escopo de tenant está documentado no nível necessário para teste.
- [ ] Testes negativos cobrem acesso horizontal, vertical, por referência de objeto e entre tenants.
- [ ] Funções administrativas, exportação, alteração em massa e impersonação possuem controles adicionais e trilha adequada.
- [ ] A negação é o comportamento padrão quando identidade, papel, tenant ou política não podem ser determinados.

### A02:2025 - Security Misconfiguration

- [ ] Configurações por ambiente possuem baseline revisada, menor privilégio e exposição mínima.
- [ ] Debug, páginas padrão, listagem, métodos desnecessários e interfaces administrativas não ficam expostos indevidamente.
- [ ] Headers, CORS, cookies, cache e mensagens de erro são definidos conforme o contexto da aplicação.
- [ ] Configuração cloud, container, framework, servidor e serviços gerenciados é verificada quando aplicável.
- [ ] Drift e exceções de configuração possuem owner, justificativa e validade.

### A03:2025 - Software Supply Chain Failures

- [ ] Dependências diretas e transitivas, plugins, imagens, actions e ferramentas de build possuem inventário e origem controlada.
- [ ] Versões e lockfiles são revisados; componentes sem manutenção ou vulneráveis recebem triagem contextual.
- [ ] Build, registry, runners e publicação usam permissões mínimas e separam código não confiável de segredos.
- [ ] Atualizações relevantes passam por revisão, testes e verificação de integridade/proveniência quando adotada.
- [ ] Vulnerabilidade aplicável, componente alcançável e exploração conhecida influenciam gate e prazo, sem decisão automática pelo score.

### A04:2025 - Cryptographic Failures

- [ ] Dados sensíveis são classificados e protegidos em trânsito e em repouso conforme risco e obrigação aplicável.
- [ ] Algoritmos, protocolos, bibliotecas e parâmetros são aprovados e não são implementados de forma caseira.
- [ ] Chaves e certificados têm geração, armazenamento, acesso, rotação, expiração e revogação definidos.
- [ ] Senhas usam função de derivação apropriada e parâmetros mantidos conforme orientação vigente da plataforma.
- [ ] Falha criptográfica ou indisponibilidade de chave falha de modo seguro e não expõe conteúdo ou segredo.

### A05:2025 - Injection

- [ ] Entradas externas, dados importados e respostas de integrações são tratados como não confiáveis.
- [ ] Consultas e comandos usam APIs parametrizadas ou abstrações seguras; concatenação dinâmica é evitada.
- [ ] Validação por allowlist, normalização e codificação de saída são aplicadas no contexto correto.
- [ ] Templates, filtros, expressões, busca, serialização e processamento de arquivos são revisados conforme a stack.
- [ ] Testes cobrem entradas inválidas sem registrar payload ofensivo ou detalhe explorável no Git.

### A06:2025 - Insecure Design

- [ ] Fluxos críticos, ativos, fronteiras de confiança, abuso plausível e controles são avaliados antes da implementação ou mudança material.
- [ ] Regras de negócio e invariantes são aplicadas no servidor e resistem a repetição, corrida e mudança indevida de estado.
- [ ] Isolamento multi-tenant, segregação de funções e limites de impacto fazem parte do desenho.
- [ ] Controles compensatórios possuem hipótese, evidência, monitoramento e expiração.
- [ ] Ameaças altas sem tratamento impedem avanço do design ou release conforme a matriz de risco.

### A07:2025 - Authentication Failures

- [ ] Cadastro, login, MFA quando aplicável, recuperação, troca de credencial e encerramento de conta foram revisados.
- [ ] Sessões e tokens possuem escopo, expiração, renovação, revogação e armazenamento adequados.
- [ ] Mensagens e tempos não facilitam enumeração indevida; tentativas abusivas são detectadas e limitadas proporcionalmente.
- [ ] Mudanças sensíveis exigem autenticação recente ou confirmação adicional conforme o risco.
- [ ] Identidades humanas, de serviço e integrações possuem ciclo de vida e privilégios mínimos.

### A08:2025 - Software or Data Integrity Failures

- [ ] Código, pacotes, atualizações, artefatos e dados de configuração vêm de origens autorizadas e têm integridade verificável quando necessário.
- [ ] Desserialização, importação, jobs, mensagens e dados assinados não são confiados sem validação de origem, estrutura e autorização.
- [ ] Pipeline impede alteração ou promoção não autorizada do artefato aprovado.
- [ ] Webhooks e eventos relevantes verificam autenticidade, integridade, repetição e vínculo com o contexto esperado.
- [ ] Falha de verificação interrompe a operação de forma segura e gera sinal adequado.

### A09:2025 - Security Logging and Alerting Failures

- [ ] Eventos de autenticação, autorização, administração, alteração sensível e falha de controle geram sinais úteis.
- [ ] Logs possuem horário, correlação e contexto mínimo, sem senhas, tokens, cookies, corpos ou dados pessoais desnecessários.
- [ ] Alertas críticos têm owner, canal, limiar, runbook e teste periódico.
- [ ] Acesso, integridade, retenção e descarte de logs são definidos conforme risco e obrigação aplicável.
- [ ] Falhas de logging/alerta são monitoradas e não passam silenciosamente como sucesso.

### A10:2025 - Mishandling of Exceptional Conditions

- [ ] Exceções, timeouts, indisponibilidade de dependência e estados parciais falham de modo seguro.
- [ ] Erros externos são mínimos e não revelam stack, configuração, identificadores, dados ou caminhos internos.
- [ ] Transações, filas, retries e operações idempotentes evitam duplicidade, corrupção e estado inconsistente.
- [ ] Limites, circuit breakers, rollback/compensação e recuperação são definidos para falhas relevantes.
- [ ] Testes cobrem condições de erro e degradação, não apenas o caminho de sucesso.

## Itens desejáveis

- [ ] Cada categoria aplicável está mapeada a requisitos ASVS 5.0.0 com IDs versionados.
- [ ] Threat model e casos de abuso são atualizados para mudanças de maior risco.
- [ ] SAST, SCA, DAST e testes de segurança são combinados sem depender de uma ferramenta isolada.
- [ ] Métricas acompanham recorrência, tempo de correção, regressão e eficácia dos controles.
- [ ] Revisão independente cobre autenticação, autorização, multi-tenant e fluxos de negócio críticos.

## Melhorias futuras

- [ ] Automatizar testes negativos estáveis para controles de maior risco.
- [ ] Adotar políticas de supply chain, proveniência e promoção de artefatos proporcionais à maturidade.
- [ ] Executar exercícios de falha, abuso e resposta para cenários prioritários.
- [ ] Avaliar programa de maturidade AppSec e verificação independente quando houver objetivo formal.

## Critérios de aprovação

- [ ] Todas as categorias aplicáveis foram avaliadas com método, escopo e limitações registrados.
- [ ] Itens obrigatórios aplicáveis possuem evidência revisada ou requisito ASVS/teste rastreável equivalente.
- [ ] Não há bloqueador aberto; riscos residuais e não aplicabilidades possuem justificativa e aprovação válidas.
- [ ] Findings confirmados têm owner, prioridade, prazo, gate e reteste definidos.
- [ ] Segurança/AppSec e owner técnico registraram aprovação para o escopo revisado.

## Critérios de reprovação ou bloqueio

- [ ] Há vulnerabilidade crítica aberta ou alto risco bloqueante em fluxo crítico.
- [ ] Existe quebra confirmada ou plausível de autenticação, autorização ou isolamento entre tenants.
- [ ] Segredo real, integridade de build ou origem de artefato está comprometida ou sem contenção.
- [ ] Um controle obrigatório não foi testado, o gate falhou tecnicamente ou a evidência é insuficiente.
- [ ] Há incidente ativo, ameaça alta sem tratamento ou exceção/aceite expirado.
- [ ] A aprovação depende apenas de scanner, score, categoria OWASP ou ausência de finding automatizado.

Qualquer condição marcada nesta seção exige No-Go até correção e reteste ou decisão formal expressamente permitida pela política aplicável.

## Cuidados contra vazamento

- [ ] Não registrar nomes de clientes, tenants, usuários, hosts, ambientes, buckets, contas ou URLs internas.
- [ ] Não incluir segredos, credenciais, tokens, cookies, chaves, certificados privados ou fragmentos desses valores.
- [ ] Não copiar logs, dumps, backups, relatórios crus, requests/responses, headers, corpos ou stack traces.
- [ ] Não incluir payloads, PoCs, passos ofensivos, detalhes exploráveis ou código proprietário desnecessário.
- [ ] Manter evidência integral em `reports/raw/` local ou armazenamento restrito, fora do Git.
- [ ] Versionar somente resumo sanitizado e revisado em `reports/sanitized/`, quando necessário.
- [ ] Usar IDs opacos para findings, testes e evidências, sem codificar cliente, tenant, ambiente ou vetor.
- [ ] Tratar checklist preenchido como informação potencialmente confidencial sobre arquitetura e lacunas.
