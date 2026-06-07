# Checklist OWASP ASVS 5.0.0

## Objetivo

Orientar a seleção, rastreabilidade e verificação de requisitos técnicos do OWASP Application Security Verification Standard (ASVS) 5.0.0 para aplicações SaaS.

Este arquivo é um checklist de adoção e governança. A avaliação formal deve usar a lista oficial completa de requisitos aplicáveis, preservar IDs como `v5.0.0-x.y.z` e registrar resultado requisito a requisito. Marcar este checklist não autoriza declarar conformidade com o ASVS nem uso de selo ou certificação OWASP.

## Quando usar

- [ ] Ao definir requisitos de segurança de uma aplicação nova ou mudança material.
- [ ] Antes de beta, produção, release de alto risco ou contratação que exija verificação técnica.
- [ ] Na revisão de autenticação, sessão, autorização, dados, criptografia, APIs, arquivos, integrações e configuração.
- [ ] Após incidente, finding material ou alteração de arquitetura/fronteira de confiança.
- [ ] Periodicamente, para revalidar requisitos, exceções e cobertura da versão implantada.

## Revisor responsável

- [ ] Segurança/AppSec seleciona versão, nível, requisitos adicionais e método de verificação.
- [ ] Owner técnico confirma arquitetura, implementação, componentes e não aplicabilidades.
- [ ] QA ou responsável por testes mantém casos verificáveis e regressões.
- [ ] Plataforma/DevSecOps revisa configuração, comunicações, supply chain, deploy e observabilidade aplicáveis.
- [ ] Privacidade, Operações, Arquitetura ou owner de negócio revisa requisitos ligados a dados e fluxos de maior impacto.
- [ ] Avaliador independente participa quando contrato, risco ou objetivo formal exigir independência.

## Evidências esperadas

- [ ] Versão ASVS fixada, nível-alvo, escopo, arquitetura, componentes, ambientes e revisão candidata.
- [ ] Matriz requisito a requisito com ID `v5.0.0-x.y.z`, aplicabilidade, método, resultado, evidência opaca e revisor.
- [ ] Justificativa e aprovador para cada requisito não aplicável, parcial, compensado ou adiado.
- [ ] Casos de teste positivos e negativos, revisão manual e resultados de ferramentas com limitações declaradas.
- [ ] Registro de findings, severidade, owner, prazo, gate, correção e reteste.
- [ ] Relatório final que diferencie verificado, não verificado, falhou, não aplicável e inconclusivo.

O relatório deve declarar amostragem, limitações e data. “Não encontrado” por ferramenta não equivale a requisito verificado.

## Itens obrigatórios

### Governança da avaliação

- [ ] A versão usada é ASVS 5.0.0 e todos os IDs citados incluem a versão.
- [ ] O nível-alvo foi selecionado por risco e contexto, não por conveniência ou promessa comercial.
- [ ] Nível 1 é tratado como base mínima apenas quando compatível com o risco; SaaS autenticado, B2B, com dados pessoais, pagamentos ou funções administrativas avalia nível 2 como referência interna.
- [ ] Requisitos de nível superior ou controles adicionais são incluídos quando ativos, ameaças, contrato ou criticidade exigirem.
- [ ] Escopo e exclusões identificam componentes, fluxos, interfaces, ambientes e dependências avaliados.
- [ ] Nenhum requisito é marcado como atendido sem método e evidência suficientes.
- [ ] Não aplicabilidade é específica, justificada, revisada e reaberta quando o escopo muda.

### V1 - Encoding and Sanitization

- [ ] Entradas e dados de integrações são normalizados e validados conforme tipo, formato, tamanho e contexto.
- [ ] Consultas, comandos e interpretadores usam APIs parametrizadas ou mecanismos seguros equivalentes.
- [ ] Saída é codificada no contexto correto; sanitização não substitui autorização nem validação.
- [ ] Templates, expressões, serialização e conteúdo rico possuem controles adequados à stack.

### V2 - Validation and Business Logic

- [ ] Regras e invariantes de negócio são aplicadas no servidor em todas as interfaces relevantes.
- [ ] Fluxos críticos resistem a repetição, corrida, alteração indevida de sequência e automação abusiva.
- [ ] Limites, estados, transições e decisões financeiras/administrativas possuem testes negativos.
- [ ] Operações sensíveis são idempotentes ou têm proteção equivalente quando necessário.

### V3 - Web Frontend Security

- [ ] Controles do navegador, cookies, cache, origem e conteúdo são configurados conforme o contexto.
- [ ] Dados sensíveis não dependem apenas de proteção no cliente nem permanecem em armazenamento inadequado.
- [ ] Componentes frontend e recursos de terceiros têm origem, integridade e necessidade revisadas.
- [ ] Erros e conteúdo renderizado não revelam dados, segredos ou detalhes internos.

### V4 - API and Web Service

- [ ] APIs possuem inventário, contrato/versionamento, owner e ciclo de vida definidos.
- [ ] Autenticação e autorização são aplicadas por objeto, propriedade, função, tenant e operação.
- [ ] Validação, limites de recursos, paginação e erros seguros são consistentes entre interfaces.
- [ ] APIs administrativas, internas e de parceiros não são presumidas seguras apenas por sua localização.

### V5 - File Handling

- [ ] Upload, download, importação, exportação e processamento de arquivos possuem tipo, tamanho e autorização controlados.
- [ ] Nomes, caminhos, metadados e conteúdo de arquivo não controlam acesso ou destino sem validação.
- [ ] Arquivos não confiáveis são isolados e não executados ou servidos em contexto perigoso.
- [ ] Exportações respeitam autorização, tenant, minimização e proteção contra exposição em cache/log.

### V6 - Authentication

- [ ] Cadastro, autenticação, MFA quando aplicável, recuperação e alteração de credencial foram verificados.
- [ ] Credenciais e verificadores são protegidos com mecanismos aprovados e parâmetros mantidos.
- [ ] Tentativas abusivas, enumeração e automação são mitigadas proporcionalmente ao risco.
- [ ] Identidades de serviço e integrações possuem autenticação forte, escopo mínimo e ciclo de vida.

### V7 - Session Management

- [ ] Sessões/tokens são gerados com segurança, vinculados ao contexto necessário e protegidos no cliente.
- [ ] Expiração, renovação, revogação, logout e invalidação após eventos sensíveis foram testados.
- [ ] Fixação, reutilização indevida e sessões concorrentes são tratadas conforme o risco.
- [ ] Valores de sessão não aparecem em URL, log, erro, analytics ou artifact.

### V8 - Authorization

- [ ] A autorização é centralizada ou aplicada de forma consistente no servidor.
- [ ] Testes cobrem acesso horizontal, vertical, por objeto, propriedade e função.
- [ ] Isolamento entre tenants/sites/clientes é explicitamente verificado.
- [ ] Funções privilegiadas, impersonação, suporte e administração têm controles e trilha adicionais.
- [ ] Falha em determinar identidade, papel, tenant ou política resulta em negação segura.

### V9 - Self-contained Tokens

- [ ] Tokens autocontidos usam algoritmos, chaves, claims, audiência, emissor e validade aprovados.
- [ ] O consumidor valida integridade, contexto, expiração e finalidade antes de confiar no token.
- [ ] Revogação ou redução de janela de exposição é tratada conforme o risco.
- [ ] Tokens não carregam dados sensíveis desnecessários nem são registrados em logs.

### V10 - OAuth and OIDC

- [ ] Fluxo, cliente, redirect, escopos e consentimento são apropriados ao tipo de aplicação.
- [ ] Validações de estado, nonce, emissor, audiência e associação da resposta são aplicadas quando pertinentes.
- [ ] Clientes públicos e confidenciais têm tratamento coerente com sua capacidade de proteger credenciais.
- [ ] Integração não concede escopos ou privilégios além do necessário.

### V11 - Cryptography

- [ ] Criptografia usa bibliotecas, protocolos, algoritmos e parâmetros aprovados.
- [ ] Chaves possuem geração, armazenamento, acesso, rotação, expiração, backup e revogação definidos.
- [ ] Dados protegidos, metadados e dependências de chave estão inventariados no nível necessário.
- [ ] Falhas criptográficas interrompem a operação de forma segura.

### V12 - Secure Communication

- [ ] Comunicação externa e interna relevante protege confidencialidade, integridade e identidade do peer conforme o risco.
- [ ] Certificados, trust stores, redirects e downgrade são geridos de forma segura.
- [ ] Serviços não expõem protocolos ou portas desnecessários.
- [ ] Falha de validação de transporte não é ignorada silenciosamente.

### V13 - Configuration

- [ ] Ambientes têm baseline segura, menor privilégio e separação adequada.
- [ ] Debug, interfaces padrão, listagem e recursos desnecessários estão desativados.
- [ ] Segredos são obtidos por mecanismo autorizado e não ficam no código, configuração versionada, imagem ou logs.
- [ ] Configuração de framework, servidor, container, cloud e serviços gerenciados foi revisada quando aplicável.

### V14 - Data Protection

- [ ] Dados são classificados e minimizados em coleta, uso, retorno, log, cache, exportação e retenção.
- [ ] Autorização e isolamento protegem dados de usuário e tenant em todas as interfaces.
- [ ] Dados temporários, backups, filas, analytics e suporte recebem proteção proporcional.
- [ ] Exclusão, retenção e descarte são executáveis conforme política e obrigação aplicável.

### V15 - Secure Coding and Architecture

- [ ] Arquitetura registra ativos, fronteiras de confiança, superfícies e controles de maior risco.
- [ ] Dependências e abstrações de segurança são reutilizadas de forma consistente e revisável.
- [ ] Código privilegiado, integrações, jobs e tarefas assíncronas aplicam autenticação/autorização necessárias.
- [ ] Revisão independente cobre mudanças críticas e exceções arquiteturais.

### V16 - Security Logging and Error Handling

- [ ] Eventos relevantes geram logs e alertas úteis, correlacionáveis e com owner.
- [ ] Logs e erros não contêm segredos, tokens, cookies, corpos, dados pessoais ou identificadores excessivos.
- [ ] Exceções, timeouts e falhas de dependência falham de modo seguro e preservam consistência.
- [ ] Retenção, acesso, integridade, monitoramento e descarte dos logs estão definidos.

### V17 - WebRTC

- [ ] Requisitos WebRTC foram avaliados quando a aplicação usa mídia ou comunicação peer-to-peer.
- [ ] Sinalização, identidade, autorização, privacidade, transporte e exposição de rede foram revisados.
- [ ] Se WebRTC não é usado, a não aplicabilidade está registrada sem marcar requisitos individuais como verificados.

## Itens desejáveis

- [ ] Requisitos ASVS estão vinculados a histórias, critérios de aceite e testes de regressão.
- [ ] A matriz informa método manual, automatizado ou combinado e a limitação de cada evidência.
- [ ] Requisitos de maior risco recebem revisão independente e amostragem mais ampla.
- [ ] Mudanças de versão do ASVS passam por análise de delta antes de atualizar IDs ou alegações.
- [ ] Métricas acompanham requisitos não verificados, falhas, exceções, regressões e tempo de correção.

## Melhorias futuras

- [ ] Ampliar do nível adotado para requisitos adicionais conforme maturidade e risco.
- [ ] Automatizar validação estrutural da matriz sem automatizar a decisão de conformidade.
- [ ] Integrar requisitos a threat modeling, padrões de código, testes e gates de release.
- [ ] Contratar avaliação independente quando houver exigência formal, contratual ou de alto risco.

## Critérios de aprovação

- [ ] Versão, nível, escopo, exclusões e método foram aprovados antes da conclusão.
- [ ] Todos os requisitos aplicáveis do conjunto oficial selecionado possuem resultado e evidência revisada.
- [ ] Não há requisito obrigatório falho ou não verificado que produza condição de bloqueio.
- [ ] Não aplicabilidades, compensações e riscos residuais possuem justificativa, owner, aprovador e validade.
- [ ] Findings têm tratamento e reteste; o relatório declara limitações e não faz alegação maior que o escopo.

## Critérios de reprovação ou bloqueio

- [ ] Há requisito aplicável de autenticação, autorização, tenant, segredo, criptografia ou dados marcado como atendido sem teste suficiente.
- [ ] Existe vulnerabilidade crítica, alto risco bloqueante ou quebra de isolamento entre tenants.
- [ ] O nível foi reduzido, o escopo excluído ou a amostragem limitada sem justificativa e aprovação.
- [ ] Gate obrigatório falhou, não executou ou avaliou versão diferente da revisão candidata.
- [ ] Exceção, aceite ou não aplicabilidade está expirado ou fora do escopo aprovado.
- [ ] O relatório pretende declarar conformidade formal com base apenas neste checklist, scanner ou cobertura parcial.

Qualquer condição marcada nesta seção exige No-Go ou correção do relatório até revisão competente.

## Cuidados contra vazamento

- [ ] A matriz versionada usa IDs opacos de evidência e não contém nomes de clientes, tenants, usuários ou ambientes.
- [ ] Não incluir segredos, tokens, cookies, credenciais, chaves, certificados privados ou strings de conexão.
- [ ] Não copiar logs, dumps, relatórios crus, requests/responses, headers, corpos ou URLs internas.
- [ ] Não registrar payloads, PoCs, passos de exploração ou detalhes que ensinem a reproduzir findings.
- [ ] Evidência integral permanece em `reports/raw/` local ou armazenamento restrito; não é anexada ao checklist.
- [ ] Resumos em `reports/sanitized/` são reconstruídos por allowlist, minimizados e revisados por segunda pessoa.
- [ ] Checklist e matriz preenchidos são classificados conforme revelarem arquitetura, lacunas, clientes ou decisões de risco.
- [ ] Compartilhamento externo exige audiência, escopo, confidencialidade e aprovação definidos.
