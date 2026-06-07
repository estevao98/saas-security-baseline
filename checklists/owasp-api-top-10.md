# Checklist OWASP API Security Top 10:2023

## Objetivo

Revisar riscos prioritários de segurança em APIs de SaaS conforme o OWASP API Security Top 10:2023, com foco em autorização, autenticação, isolamento multi-tenant, abuso de negócio, recursos, inventário e integrações.

Este checklist é uma triagem orientada a risco. Ele não substitui requisitos ASVS, threat modeling, testes de negócio, revisão manual ou avaliação formal e não certifica a API.

## Quando usar

- [ ] No desenho ou alteração de API pública, de parceiro, mobile, interna ou administrativa.
- [ ] Antes de beta, produção ou release que altere objetos, propriedades, papéis, tenants ou fluxos críticos.
- [ ] Ao integrar webhook, callback, API de terceiro, gateway, GraphQL, fila ou serviço interno.
- [ ] Após incidente, abuso, finding de autorização/autenticação ou crescimento relevante de tráfego.
- [ ] Periodicamente, para revisar inventário, versões, exposição e regressões.

Testes ativos devem ocorrer somente em ambiente e escopo autorizados, preferencialmente efêmeros e com dados fictícios. Item não aplicável exige justificativa e aprovação.

## Revisor responsável

- [ ] Segurança/AppSec define escopo, cenários seguros, método e triagem.
- [ ] Owner da API ou tech lead confirma contrato, lógica, autorização e dependências.
- [ ] QA mantém testes positivos, negativos, contrato e regressão.
- [ ] Plataforma/SRE revisa gateway, rede, configuração, limites, telemetria e capacidade.
- [ ] Owner de negócio revisa fluxos sensíveis e abuso plausível.
- [ ] Privacidade ou responsável por dados participa quando houver dados pessoais, exportação ou impacto entre clientes.

## Evidências esperadas

- [ ] Inventário sanitizado de APIs, versões, owners, classificação, consumidores e estado de ciclo de vida.
- [ ] Contrato ou schema versionado sem exemplos reais, segredos, URLs internas ou dados de cliente.
- [ ] Matriz de autenticação e autorização por operação, objeto, propriedade, função e tenant.
- [ ] Resumo de testes de contrato, negativos, limites, erros, integrações e fluxos críticos.
- [ ] Resultados triados de ferramentas aplicáveis, com ambiente, versão, cobertura e limitações.
- [ ] Findings por IDs opacos, com risco, owner, prazo, gate, correção e reteste.

Não armazene HAR, VCR, collections preenchidas, requests/responses ou relatórios integrais no Git.

## Itens obrigatórios

### API1:2023 - Broken Object Level Authorization

- [ ] Toda operação que recebe referência de objeto valida acesso do principal ao objeto no servidor.
- [ ] Identificadores opacos não são tratados como controle de autorização.
- [ ] Testes negativos cobrem leitura, alteração, exclusão, exportação e ações sobre objetos de outro usuário ou tenant.
- [ ] Operações em lote e relacionamentos aplicam autorização a cada objeto afetado.
- [ ] Falhas retornam resposta mínima e não confirmam existência ou ownership indevidos.

### API2:2023 - Broken Authentication

- [ ] Cada interface define mecanismo de autenticação apropriado ao consumidor e ao risco.
- [ ] Credenciais, sessões e tokens possuem escopo, expiração, renovação, revogação e armazenamento seguros.
- [ ] Login, recuperação, MFA quando aplicável e emissão/troca de token têm proteção contra abuso e enumeração.
- [ ] APIs internas, jobs e integrações usam identidades próprias e menor privilégio, não credenciais humanas compartilhadas.
- [ ] Falha de autenticação não degrada para acesso anônimo ou identidade padrão.

### API3:2023 - Broken Object Property Level Authorization

- [ ] Propriedades aceitas e retornadas são definidas por allowlist para cada operação e papel.
- [ ] Campos somente leitura, administrativos, financeiros, de tenant e de ownership não podem ser alterados indevidamente.
- [ ] Serialização não expõe propriedades internas, dados pessoais ou metadados desnecessários.
- [ ] Atualizações parciais, filtros, expansão e seleção de campos preservam as mesmas regras.
- [ ] Testes cobrem leitura excessiva e alteração indevida de propriedades sem registrar payload explorável.

### API4:2023 - Unrestricted Resource Consumption

- [ ] Limites de tamanho, paginação, profundidade, complexidade, frequência, concorrência e duração são definidos onde aplicável.
- [ ] Operações caras, exportações, uploads, relatórios e jobs assíncronos têm quotas e controle de custo.
- [ ] Timeouts, cancelamento, filas, backpressure e circuit breakers evitam consumo sem limite.
- [ ] Limites consideram usuário, credencial, tenant, origem e impacto agregado, sem depender apenas de IP.
- [ ] Alertas e resposta existem para exaustão, abuso, degradação e custo anômalo.

### API5:2023 - Broken Function Level Authorization

- [ ] Cada operação valida função, papel, escopo e contexto no servidor.
- [ ] Rotas administrativas, suporte, exportação, faturamento e configuração não dependem de ocultação ou UI.
- [ ] Mudança de método, versão, alias ou rota não contorna autorização.
- [ ] Testes negativos cobrem elevação horizontal e vertical, inclusive entre tenants.
- [ ] Impersonação e ações privilegiadas têm autorização adicional, finalidade e trilha.

### API6:2023 - Unrestricted Access to Sensitive Business Flows

- [ ] Fluxos sensíveis e seus impactos de automação/abuso estão identificados com owner de negócio.
- [ ] Controles consideram velocidade, volume, repetição, sequência, estoque, benefício e criação de contas quando aplicável.
- [ ] Proteções não dependem apenas de desafio visual ou rate limit genérico.
- [ ] Detecção, resposta, bloqueio gradual e revisão manual são proporcionais ao risco e evitam dano indevido a usuários legítimos.
- [ ] Alterações nesses fluxos passam por análise de abuso e teste de regressão.

### API7:2023 - Server Side Request Forgery

- [ ] Funcionalidades que buscam URL, webhook, importação ou recurso remoto usam destinos e protocolos permitidos.
- [ ] Resolução, redirects, endereços especiais e mudanças de destino são tratados de forma segura.
- [ ] O componente possui acesso de rede mínimo e não alcança metadados, administração ou serviços internos desnecessários.
- [ ] Respostas remotas têm tamanho, tipo, tempo e conteúdo limitados antes do processamento.
- [ ] Falhas e logs não revelam topologia, endereço interno ou conteúdo recuperado.

### API8:2023 - Security Misconfiguration

- [ ] Gateway, framework, servidor, cloud, container e serviço têm baseline segura e menor privilégio.
- [ ] Debug, documentação, introspecção, métodos, versões e endpoints não necessários estão desabilitados ou restritos.
- [ ] CORS, headers, cache, content types e erros são configurados conforme consumidores autorizados.
- [ ] Segredos não ficam em schema, collection, imagem, variável versionada, log ou resposta.
- [ ] Drift e exceções de configuração são detectados, revisados e possuem validade.

### API9:2023 - Improper Inventory Management

- [ ] Existe inventário com owner, versão, exposição, dados, consumidores, autenticação e estado de suporte.
- [ ] Ambientes e hosts publicados correspondem ao inventário aprovado sem revelar essa lista no Git público ou em documentação indevida.
- [ ] APIs antigas, beta, shadow, duplicadas ou sem owner são removidas, isoladas ou tratadas com prazo.
- [ ] Contratos, documentação, gateway e implementação são reconciliados.
- [ ] Descontinuação define comunicação, telemetria, prazo e bloqueio de novas dependências.

### API10:2023 - Unsafe Consumption of APIs

- [ ] Dados e eventos de terceiros são autenticados quando necessário e sempre validados como entrada não confiável.
- [ ] Integrações aplicam TLS, timeouts, limites, retries controlados e falha segura.
- [ ] Respostas externas não determinam consulta, comando, autorização, redirect ou conteúdo sem validação contextual.
- [ ] Credenciais de integração têm escopo mínimo, rotação, revogação e armazenamento autorizado.
- [ ] Dependência crítica possui monitoramento, tratamento de indisponibilidade e revisão de risco do fornecedor.

### Controles transversais SaaS

- [ ] O tenant é derivado de contexto autenticado/confiável e validado em todas as camadas relevantes.
- [ ] Cache, fila, busca, arquivo, analytics e jobs preservam o isolamento entre tenants.
- [ ] Logs de API minimizam dados e não registram tokens, cookies, headers sensíveis ou corpos por padrão.
- [ ] Erros usam correlação opaca e não expõem stack, schema interno, IDs sensíveis ou decisão de autorização.
- [ ] Webhooks verificam autenticidade, integridade, repetição e associação ao tenant/objeto esperado.
- [ ] Mudanças incompatíveis, rollback e migração de versão possuem plano e teste.

## Itens desejáveis

- [ ] Requisitos de API estão mapeados ao ASVS 5.0.0 com IDs versionados.
- [ ] Testes de contrato/property-based usam ambiente efêmero, dados fictícios e limites para evitar efeitos destrutivos.
- [ ] Threat model inclui gateway, serviços, consumidores, integrações e fronteiras entre tenants.
- [ ] Métricas acompanham negações, abuso, limites, versões obsoletas, falhas de integração e regressões.
- [ ] Revisão independente cobre operações administrativas, financeiras, exportação e autorização multi-tenant.

## Melhorias futuras

- [ ] Automatizar inventário e detecção de versões/endpoints divergentes sem publicar topologia.
- [ ] Adotar políticas consistentes de autorização e validação entre gateway e serviços.
- [ ] Executar testes controlados de resiliência e abuso para fluxos prioritários.
- [ ] Ampliar análise de terceiros, proveniência de schemas e governança de identidades não humanas.

## Critérios de aprovação

- [ ] Todos os riscos aplicáveis e controles transversais foram avaliados com escopo e limitações registrados.
- [ ] Operações críticas possuem testes negativos de autenticação, objeto, propriedade, função e tenant.
- [ ] Inventário, contrato, implementação e configuração estão coerentes para a revisão candidata.
- [ ] Não há bloqueador aberto; findings e riscos residuais possuem tratamento e aprovação válidos.
- [ ] Segurança/AppSec, owner técnico e owner de negócio dos fluxos críticos registraram aprovação.

## Critérios de reprovação ou bloqueio

- [ ] Existe acesso indevido por objeto, propriedade, função ou entre tenants.
- [ ] Autenticação pode ser contornada ou token/credencial real foi exposto.
- [ ] Fluxo sensível permite abuso material sem controle ou monitoramento suficiente.
- [ ] API alcança rede/recurso interno indevido ou consome integração sem validação essencial.
- [ ] API desconhecida, versão obsoleta ou configuração exposta permanece sem owner e tratamento.
- [ ] Gate obrigatório não executou, falhou tecnicamente ou usou ambiente/revisão diferente do escopo aprovado.
- [ ] Há finding crítico, alto risco bloqueante, incidente ativo ou exceção expirada.

Qualquer condição marcada nesta seção exige No-Go até correção e reteste ou decisão formal expressamente permitida pela política aplicável.

## Cuidados contra vazamento

- [ ] Não registrar URLs, hosts, rotas internas, schemas proprietários, contas cloud ou nomes de clientes/tenants.
- [ ] Não incluir chaves de API, tokens, cookies, credenciais, assinaturas, certificados ou exemplos semelhantes a valores reais.
- [ ] Não versionar collections preenchidas, environments, HAR/VCR, traces, dumps, logs ou relatórios crus.
- [ ] Não copiar requests/responses, headers, corpos, query strings, payloads, PoCs ou passos ofensivos.
- [ ] Usar contratos sanitizados e dados sintéticos; exemplos usam apenas IDs opacos e campos abstratos.
- [ ] Manter evidência integral em `reports/raw/` local ou armazenamento restrito, fora do Git e de artifacts comuns.
- [ ] Publicar somente resumo necessário em `reports/sanitized/`, reconstruído por allowlist e revisado.
- [ ] Tratar inventário e checklist preenchido como informação potencialmente confidencial sobre superfície, clientes e lacunas.
