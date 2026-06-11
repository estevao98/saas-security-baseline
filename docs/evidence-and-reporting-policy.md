# Política de evidências, relatórios e artifacts

## Objetivo e escopo

Esta política define como coletar, classificar, armazenar, revisar, compartilhar e descartar evidências de auditorias de SaaS. Aplica-se a pessoas, scanners, CI/CD, suporte, privacidade, acessibilidade, fornecedores, aplicações web/backend, incidentes e relatórios para clientes.

O princípio central é: **Git não é repositório de evidência sensível**. O Git recebe políticas, matrizes, exemplos fictícios e resumos mínimos já sanitizados. Evidência integral permanece em armazenamento restrito; quando produzida localmente neste repositório, usa `reports/raw/`, que deve continuar ignorado pelo Git.

Esta política é baseline interno. Contrato, obrigação legal, investigação, litígio, seguro, setor regulado ou política corporativa podem exigir retenção e aprovação diferentes. A decisão deve ser registrada sem expor o conteúdo protegido.

## Termos e classificação

| Classificação | Conteúdo | Local padrão | Acesso mínimo |
|---|---|---|---|
| **Público** | Política ou informação aprovada para divulgação. | Git ou canal público aprovado. | Sem restrição após aprovação. |
| **Interno** | Processo, resumo e metadados sem detalhe explorável ou pessoal. | Git privado; `reports/sanitized/` quando for relatório. | Equipe com necessidade operacional. |
| **Confidencial** | Arquitetura, inventário, finding, fornecedor, contrato ou evidência que facilita ataque ou expõe obrigação comercial. | Armazenamento restrito e criptografado; cópia de trabalho em `reports/raw/`. | Owner, Segurança e revisores designados. |
| **Restrito** | Segredo, cookie, dado pessoal, incidente, forense, dump, backup ou vulnerabilidade explorável. | Cofre ou repositório de evidências aprovado, criptografado e auditável; nunca Git. | Grupo nominal sob menor privilégio. |

**Redaction** é a remoção irreversível de conteúdo que não é necessário ao objetivo do relatório. Mascarar apenas a aparência, ocultar camada, trocar cor da fonte, recortar visualmente sem remover metadados ou manter o valor em histórico não é redaction segura.

## Regras obrigatórias

- `reports/raw/` permanece sempre fora do Git e protegido por `.gitignore`.
- Relatório cru, log, dump, backup, export, gravação e print sem redaction nunca são commitados.
- `reports/sanitized/` pode ser versionado somente após revisão humana e aprovação do owner do domínio.
- Segredos não são preservados como evidência. Registra-se tipo, local, estado de revogação e referência restrita, nunca o valor.
- Dados pessoais reais são minimizados; quando não forem indispensáveis, usar dados sintéticos, anonimização efetiva ou resumo agregado.
- Detalhe explorável, URL interna, caminho sensível, identificador de tenant, query string, header, cookie e payload ficam fora de Git, issues, PRs e artifacts amplos.
- Acesso, transmissão, retenção, descarte e cadeia de custódia devem ser proporcionais à classificação.
- Criptografia não torna conteúdo adequado para Git. Arquivo criptografado versionado exige processo formal excepcional, gestão externa de chaves e aprovação de Segurança; não é o padrão deste repositório.

## Política de `reports/raw/`

`reports/raw/` é uma área local transitória para saídas originais. Ela não é arquivo permanente nem mecanismo de compartilhamento.

- Manter fora do Git em todos os branches e clones.
- Restringir permissões ao executor e aos revisores necessários.
- Preferir filesystem ou volume criptografado e dispositivo gerenciado.
- Não sincronizar automaticamente com drive pessoal, chat ou serviço sem contrato e controle de acesso.
- Tratar logs, tokens, cookies, paths, URLs internas, dados pessoais, código, headers e payloads como potencialmente presentes até revisão.
- Não publicar como artifact público nem anexar integralmente a issue ou PR.
- Definir expiração curta; padrão interno: **até 30 dias após triagem**, salvo incidente, auditoria formal, contrato ou `legal hold`.
- Excluir com método compatível com a mídia e registrar apenas data, categoria, owner e resultado do descarte.
- Se o conteúdo precisar sobreviver à triagem, movê-lo para armazenamento restrito aprovado, não para Git.

## Política de `reports/sanitized/`

Um arquivo em `reports/sanitized/` deve ser uma nova síntese, e não uma cópia do relatório cru com poucos campos apagados.

Pode ir para Git privado somente quando:

- foi revisado por quem produziu e por segunda pessoa autorizada;
- não contém dado pessoal real, segredo, cookie, credencial ou identificador correlacionável desnecessário;
- não contém payload explorável, prova de conceito ofensiva ou instrução operacional de abuso;
- não contém URL, hostname, IP, path, query string ou topologia interna sensível;
- não contém print sem tarja irreversível e remoção de metadados;
- não incorpora relatório cru, DOM, request/response integral, dump ou log integral;
- contém escopo, data, método, limitações, resumo, impacto, severidade, decisão, owner funcional, prazo e plano;
- referencia evidência restrita por ID opaco, sem revelar sua localização física ou chave de acesso.

## Ciclo de vida e cadeia de custódia

1. **Planejar:** finalidade, escopo, ambiente autorizado, categorias esperadas, owner, acesso e retenção.
2. **Coletar:** mínimo necessário, com relógio confiável, versão da ferramenta e identificador opaco da execução.
3. **Classificar:** assumir `Confidencial` ou `Restrito` até triagem.
4. **Preservar:** impedir alteração não autorizada; para incidente ou disputa, registrar hash, origem, coletor, data e transferências em sistema restrito.
5. **Triar:** validar finding, remover duplicatas e separar fato, inferência e falso positivo.
6. **Sanitizar:** produzir resumo novo com dados fictícios ou agregados.
7. **Aprovar:** owner do domínio e Segurança; Privacidade/Jurídico quando houver dado pessoal, contrato ou comunicação externa.
8. **Compartilhar:** canal, destinatário e prazo compatíveis com a classificação.
9. **Reter e descartar:** aplicar tabela aprovada, exceções e `legal hold`; documentar descarte sem reter conteúdo.

## Catálogo dos tipos de evidência

Retenções abaixo são recomendações iniciais. `D+N` significa N dias após triagem ou encerramento. “Git” significa apenas repositório privado e nunca substitui a análise de exposição.

| Tipo | Git | `sanitized/` | `raw/` / fora do Git | Risco | Redaction | Retenção inicial | Acesso | Evidência mínima segura |
|---|---|---|---|---|---|---|---|---|
| Logs | Não | Sim, só extrato reescrito | Sim | Restrito: sessão, PII, paths, lógica | Obrigatória | Cru D+30; segurança 90–365 dias conforme risco | Operações e Segurança | Evento, janela, correlação opaca e conclusão |
| Screenshots / prints | Não, sem revisão | Sim | Sim | Alto: tela, abas, notificações, metadata | Obrigatória e irreversível | Cru D+30; resumo 1 ano | Auditor e owner | Recorte mínimo com dados fictícios e finding |
| Vídeos | Não | Excepcionalmente, trecho sanitizado | Sim | Muito alto: voz, comportamento, tela e PII | Obrigatória; preferir transcrição | D+30 ou consentimento/contrato | Pesquisa/QA designados | Resumo textual, tarefa e barreira |
| Relatórios de scanners | Não | Sim, resumo | Sim | Alto: código, paths, CVEs e ataque | Obrigatória | Cru D+30; resumo 1–2 anos | Segurança e owner técnico | Ferramenta/versão, escopo, contagens e decisão |
| SARIF | Não como arquivo | Sim, resumo humano | Sim ou code scanning restrito | Alto: snippets, paths, regras e fingerprints | Obrigatória antes de exportar | D+90 ou política do code scanning | Segurança e maintainers | Regra, severidade, arquivo generalizado e status |
| SBOM | Condicional | Sim | Sim quando detalhada | Médio/alto: inventário, versões, serviços internos | Revisão obrigatória | Por vida da release + 1 ano | Engenharia, Segurança; cliente autorizado | Formato/versão, release, componentes necessários e integridade |
| Relatório de vulnerabilidade | Não enquanto explorável | Sim | Sim | Muito alto: vetor, impacto e ativo | Obrigatória | Vida do finding + 2 anos | Segurança e owner | ID, impacto, severidade, estado e reteste |
| Finding SAST | Não cru | Sim | Sim | Alto: source/sink e código | Obrigatória | D+90; decisão 2 anos | Desenvolvimento e Segurança | Regra, localização generalizada, decisão e correção |
| Finding DAST | Não cru | Sim | Sim | Muito alto: URL, request, sessão e payload | Obrigatória | D+30; decisão 2 anos | AppSec e owner do ambiente | Endpoint abstrato, impacto e resultado do reteste |
| Finding SCA | Não cru | Sim | Sim | Médio/alto: stack e versão vulnerável | Obrigatória | Vida do finding + 2 anos | Engenharia e Segurança | Componente, advisory, alcance, decisão e versão corrigida |
| Finding de secrets | Nunca | Sim, sem valor | Sim apenas durante resposta controlada | Crítico: credencial utilizável | Remover o valor; mascarar não basta | Apagar valor após revogação; registro 2 anos | Resposta a incidente e owner | Tipo, origem, revogado em, impacto e revisão de uso |
| Finding de container | Não cru | Sim | Sim | Alto: pacotes, imagem, registry e config | Obrigatória | D+90; decisão 2 anos | Plataforma e Segurança | Digest abreviado/opaco, classe, severidade e correção |
| Finding de IaC | Não cru | Sim | Sim | Alto: topologia, contas, nomes e controles | Obrigatória | D+90; decisão 2 anos | Plataforma, Cloud e Segurança | Regra, recurso abstrato, impacto e status |
| Evidência de acessibilidade | Não cru | Sim | Sim | Alto: tela, voz, deficiência, AT e usuário | Obrigatória | Cru D+30; resumo 1–2 anos | Acessibilidade, Produto, QA | Critério, tarefa, ambiente generalizado, barreira e reteste |
| Evidência de LGPD | Não com caso real | Sim | Sim | Muito alto: titular, base, pedido e tratamento | Obrigatória | Pela finalidade/política; validar legalmente | Privacidade/Jurídico e owner | Tipo de controle, amostra sintética, decisão e data |
| Evidência de incidente | Nunca cru | Sim, postmortem | Sim em cofre forense | Crítico: ataque, pessoas, clientes e resposta | Obrigatória | Incidente com dado pessoal: mínimo 5 anos; demais por política | Equipe de incidente nominal | ID, período, impacto agregado, medidas e lições |
| Relatório manual | Condicional | Sim | Sim se anotações integrais | Variável; pode conter inferência e PII | Revisão obrigatória | 1–2 anos após encerramento | Auditor, owner e aprovador | Escopo, método, fatos, limitações, decisão e reteste |
| Exports | Não | Só resumo | Sim | Restrito: massa de dados e metadados | Obrigatória | Menor prazo operacional, normalmente D+7 a D+30 | Solicitante autorizado e custodiante | Contagem, filtros, finalidade e prova de descarte |
| Dumps | Nunca | Não; somente registro | Sim, armazenamento restrito | Crítico: base integral, segredos e PII | Não confiar em redaction parcial | Apenas necessidade técnica/forense | DBA/IR nominal | Hash, sistema, janela, finalidade e descarte |
| Backups | Nunca | Não; somente teste resumido | Fora do Git e fora de `raw/` permanente | Crítico: recuperação integral | Não se aplica como publicação | Política de backup/RPO e obrigação aplicável | Operações autorizadas | Job, data, integridade, restore testado e expiração |
| Tickets | Não com conteúdo real | Sim, resumo | Sistema restrito | Alto: suporte, PII e detalhes internos | Obrigatória | SLA + defesa/contrato validado | Suporte e equipes atribuídas | ID opaco, categoria, decisão e fechamento |
| Issues | Sim, apenas sanitizada | Sim | Detalhes restritos fora do Git | Alto para segurança/cliente | Obrigatória | Histórico do projeto; revisar encerradas | Colaboradores necessários | Título neutro, impacto, owner, prazo e referência restrita |
| PRs | Sim, código e descrição sanitizados | Sim | Evidência sensível fora do Git | Alto: diff pode revelar correção/vetor | Obrigatória | Histórico do projeto | Reviewers necessários | Motivo abstrato, testes, risco residual e referência privada |
| Documentos contratuais | Não por padrão | Só metadados/resumo aprovado | Sistema jurídico | Alto: preço, partes, obrigações e assinatura | Obrigatória | Prazo contratual/legal validado | Jurídico, Comercial e owners | Tipo, versão, vigência, owner e controles derivados |
| Dados de fornecedores | Não com conteúdo real | Sim, cadastro mínimo | Sistema de terceiros/risco | Alto: contatos, arquitetura, termos e avaliação | Obrigatória | Relação + prazo contratual/legal | Compras, Segurança, Privacidade, Jurídico | Fornecedor, serviço, classificação, decisão e revisão |
| Testes com usuários | Nunca cru | Sim, resultado agregado | Repositório de pesquisa restrito | Muito alto: imagem, voz, opinião, deficiência | Obrigatória; consentimento não elimina minimização | Conforme protocolo/consentimento, mínimo possível | Pesquisa e revisores designados | Tarefas, perfil agregado, barreiras e limitações |

## Matriz dos relatórios nomeados

| Artifact | Origem e conteúdo típico | Exposição | Git / local | Criptografia e redaction | CI artifact | Retenção | Caminho recomendado e política |
|---|---|---|---|---|---|---|---|
| `environment.txt` | Inventário de SO, runtime e ferramentas | Hostname, usuário, paths, rede, versões | Git: não; local: sim | Volume criptografado; redigir identificadores | Não por padrão | D+30 | `reports/raw/environment.txt`; publicar só versões necessárias no resumo |
| `bandit.json` | Bandit; findings Python, paths e trechos | Código e localização vulnerável | Git: não; local: sim | Redaction obrigatória | Restrito e excepcional | D+90 | `reports/raw/bandit.json`; síntese por severidade |
| `pip-audit.json` | pip-audit; pacotes, versões e advisories | Stack e componentes vulneráveis | Git: não; local: sim | Redaction/revisão | Preferir alertas; artifact restrito | D+90 | `reports/raw/pip-audit.json`; registrar componente e decisão sem ambiente interno |
| `semgrep.json` | Semgrep; regras, paths, código e traces | Código e fluxo vulnerável | Git: não; local: sim | Redaction obrigatória | Restrito e excepcional | D+90 | `reports/raw/semgrep.json`; resumo validado, incluindo falso positivo |
| `gitleaks.json` | Gitleaks; possíveis segredos e locais | Pode conter o próprio segredo | Git: nunca; local temporário | Criptografar; remover valores imediatamente | Não | Até concluir revogação e investigação | `reports/raw/gitleaks.json`; manter somente registro sanitizado da resposta |
| `detect-secrets.json` | detect-secrets; fingerprints e possíveis segredos | Pode identificar local e padrão sensível | Baseline revisado pode ir; relatório cru não | Revisar cada campo; nunca valor real | Não como relatório | Baseline enquanto aplicável; cru até triagem | `reports/raw/detect-secrets.json`; `.secrets.baseline` só após revisão |
| `zap-report.html` | ZAP; URLs, requests, responses, cookies e findings | Altíssimo, inclusive sessão e payload | Git: não; local: sim | Criptografia e redaction obrigatórias | Não por padrão | D+30 | `reports/raw/zap-report.html`; resumo sem request/response integral |
| `trivy-report.json` | Trivy; container, dependências, IaC e secrets conforme modo | Imagem, packages, config e possíveis segredos | Git: não; local: sim | Criptografia; redaction obrigatória | Restrito e curto, se necessário | D+90 | `reports/raw/trivy-report.json`; separar classes no resumo |
| `sbom.json` | CycloneDX/SPDX; componentes, versões, relações e serviços | Inventário útil a atacantes e terceiros | Condicional; detalhada fica fora | Assinar/verificar integridade quando exigido; revisar escopo | Sim, restrito, para release/cliente aprovado | Vida da release + 1 ano | `reports/raw/sbom.json`; cópia sanitizada somente após análise comercial/técnica |
| `risk-register.csv` | Gestão de risco; cenários, owners, decisões e prazos | Arquitetura, fraquezas e estratégia | Estrutura/exemplo fictício: sim; preenchido: não por padrão | Redaction e controle de acesso | Não | Risco + 2 anos | `risk/risk-register.csv` apenas fictício; registro real em sistema restrito |
| `audit-summary.md` | Auditoria; escopo, contagens, decisões e plano | Médio, se realmente sanitizado | Sim em `sanitized/` | Segunda revisão obrigatória | Pode ser artifact restrito | 2 anos | `reports/sanitized/audit-summary.md`; sem anexos crus |
| `executive-summary.md` | Auditoria; impacto de negócio e risco residual | Comercial e reputacional | Condicional e aprovado | Redaction; revisão executiva/Jurídica se externo | Sim, apenas destinatários aprovados | 2–5 anos conforme contrato | `reports/sanitized/executive-summary.md`; versão por audiência |
| `remediation-plan.md` | Owners, prioridades, prazos, dependências e reteste | Expõe backlog e janela de risco | Condicional; preferir tracker restrito | Redaction obrigatória | Não por padrão | Findings + 2 anos | `reports/sanitized/remediation-plan.md`; sem vetor explorável |

## Política de redaction antes de commit

### O que remover

- segredos, senhas, tokens, cookies, chaves, certificados privados e strings de conexão;
- nomes, e-mails, documentos, voz, imagem, IP vinculado, IDs de usuário/tenant e conteúdo de suporte;
- hostnames, IPs internos, URLs, query strings, paths absolutos, nomes de buckets, contas e topologia;
- requests/responses integrais, headers, corpos, payloads, exploitabilidade e passos ofensivos;
- snippets desnecessários de código proprietário, dados de contrato, preço e contato de fornecedor;
- metadados de arquivo, autor, GPS, histórico, comentários, anexos e camadas ocultas.

### Como mascarar

Use marcadores consistentes e não correlacionáveis, como `[USUARIO-01]`, `[TENANT-A]`, `[HOST-INTERNO]`, `[VALOR-REMOVIDO]` e datas generalizadas quando a precisão não for necessária. Não preserve prefixo/sufixo de segredo. Para correlação legítima, use identificador aleatório ou hash com chave protegida; hash simples de dado previsível pode ser revertido por enumeração.

### Redaction reversível

- Não cubra texto em PDF ou imagem mantendo a camada original.
- Não use célula oculta, coluna escondida, cor branca, comentário ou filtro como redaction.
- Não publique JSON/SARIF/HTML que ainda contenha o valor em campo não renderizado.
- Não confie em blur leve ou pixelização de texto; substitua a região e exporte um arquivo achatado.
- Gere um novo arquivo, remova metadados e valide com extração de texto, busca e inspeção visual.

### Por formato

| Formato | Tratamento mínimo |
|---|---|
| Screenshot/imagem | Recortar ao mínimo; substituir pixels; remover EXIF/metadados; revisar abas, notificações e fundo; exportar arquivo novo. |
| PDF | Remover conteúdo com ferramenta de redaction real; achatar quando apropriado; limpar anexos, comentários, formulários, camadas, histórico e propriedades; testar seleção e extração de texto. |
| Log/texto | Gerar extrato novo; eliminar linhas adjacentes desnecessárias; neutralizar quebra/injeção de log; remover sessão, corpo e identificadores. |
| JSON | Parsear e reconstruir com allowlist de campos; não usar substituição textual ampla; validar chaves e valores recursivamente. |
| HTML | Não compartilhar relatório interativo cru; remover scripts, DOM, links, requests e conteúdo embutido; preferir resumo Markdown/PDF sanitizado. |
| CSV | Criar export com allowlist de colunas; remover fórmulas e campos ocultos; generalizar datas/valores; verificar reidentificação por combinação. |
| SARIF | Remover snippets, flows, URIs absolutos, mensagens e propriedades sensíveis; preferir upload direto ao code scanning autorizado e resumo separado. |
| SBOM | Excluir serviços internos, endpoints, propriedades proprietárias e componentes não necessários à audiência; preservar formato, release e integridade declarada. |
| Acessibilidade | Remover identidade, voz e informação de deficiência/AT vinculada; usar relato agregado e tarefa; manter limitações do estudo. |
| Privacidade | Substituir caso real por categoria e fluxo; não incluir pedido, documento, contato ou base exportada; avaliar risco de reidentificação. |
| Incidente | Separar timeline forense da comunicação; remover indicadores ainda ativos, vetor explorável, clientes/pessoas e controles internos; manter fatos, impacto agregado e medidas. |

## Vulnerabilidades, issues, PRs e advisories

- **Issue comum:** somente para finding já sanitizado, sem segredo, dado pessoal, cliente, ativo sensível ou reprodução explorável. Em repositório público, publicar apenas depois de correção e decisão de divulgação.
- **Tracker privado:** padrão para vulnerabilidade interna em produto SaaS privado. Restringir participantes e anexos.
- **Security advisory:** usar para discutir e corrigir privadamente vulnerabilidade de projeto público quando o recurso do GitHub for aplicável. A documentação atual do GitHub limita repository security advisories e private vulnerability reporting a repositórios públicos; para este repositório privado, usar canal restrito próprio e confirmar capacidades do plano.
- **Não publicar detalhe explorável:** enquanto houver versão vulnerável suportada, cliente sem correção, segredo ativo, janela de ataque ou risco de abuso.
- **Falso positivo:** registrar ID, ferramenta/regra, versão, evidência de análise, motivo técnico, escopo, aprovador, data de expiração e condição de reabertura. Não usar `ignore` sem justificativa.
- **Aceite de risco:** registrar cenário, ativo, impacto, probabilidade, controles compensatórios, prazo, owner, aprovador competente e data de revisão/expiração.
- **Correção e reteste:** registrar commit/release sem expor vetor, ambiente, método, resultado, regressão e quem confirmou. Reabrir quando reteste falhar.
- **PR:** descrição neutra; detalhes ficam no tracker restrito. Revisores recebem acesso por necessidade e não copiam evidência crua para comentários.

## Segredos encontrados em relatórios

1. Interromper publicação, upload e compartilhamento do arquivo.
2. Tratar o segredo como comprometido; revogar ou rotacionar antes de discutir limpeza cosmética.
3. Identificar escopo, permissões, ambientes, proprietário, período e sinais de uso indevido sem reproduzir o valor.
4. Verificar Git history, branches, forks, caches, logs, artifacts, issues, PRs, chats e cópias autorizadas.
5. Remover o valor das fontes expostas preservando integridade investigativa quando necessária.
6. Avaliar se reescrever histórico é necessário; revogação continua obrigatória e reescrita tem impactos operacionais.
7. Registrar incidente sanitizado com tipo, impacto, contenção, rotação, revisão e prevenção.
8. Ajustar logging, filtros, ferramenta e pipeline para impedir recorrência.

## Dados pessoais e LGPD

- Coletar somente o necessário para finalidade documentada.
- Preferir dados sintéticos. Pseudonimização reduz associação direta, mas o dado continua pessoal quando a reversão é possível.
- Anonimização exige considerar meios razoáveis de reidentificação e combinação com outras fontes; remover nome isolado não basta.
- Pedidos de titulares, suporte e exports ficam em sistemas restritos, com autenticação, trilha e retenção próprias.
- Logs e analytics não devem capturar corpo, mensagem, documento, sessão ou identificador completo por padrão.
- Prints usam contas e tenants fictícios; exceções reais exigem redaction e aprovação.
- Evidência de acessibilidade pode revelar deficiência, voz, comportamento ou tecnologia assistiva; limitar equipe e finalidade.
- Incidentes e comunicações seguem `docs/lgpd-privacy-program.md`; registros de incidentes com dados pessoais têm retenção mínima de cinco anos pela Resolução CD/ANPD nº 15/2024, salvo prazo adicional aplicável.
- Base legal, atendimento de direitos, transferência internacional e prazo definitivo exigem validação de Privacidade/Jurídico no contexto do produto.

## SBOM e supply chain

SBOM é inventário, não atestado de ausência de vulnerabilidade. CycloneDX e SPDX suportam representação de componentes, versões, relações, proveniência e informações de supply chain.

- Pode ir para Git quando descreve somente componentes públicos de uma release pública, foi revisada e a estratégia de transparência foi aprovada.
- Deve ser `Confidencial` quando revela serviços internos, componentes proprietários, versões em produção, topologia, branches, registries, fornecedores ou componentes de clientes.
- Gerar por release relevante, preservar associação com digest/versão e verificar integridade/proveniência quando exigido.
- Não misturar VEX, vulnerabilidades internas ou exploração com SBOM destinada a cliente sem decisão específica.
- Para cliente enterprise, definir em contrato: formato, campos, frequência, canal, confidencialidade, prazo, atualização e tratamento de vulnerabilidades.
- Compartilhar por portal/canal restrito; evitar link público e artifact de Actions acessível a todos com leitura do repositório.

## Acessibilidade e testes com usuários

- Prints e vídeos usam dados fictícios e mostram apenas a tarefa necessária.
- Relato de participante é dado pessoal quando identificável; não publicar transcrição, voz ou diagnóstico.
- Tecnologia assistiva e deficiência podem aumentar o risco de inferência sensível. Registrar combinação técnica apenas no nível necessário e sem vincular à pessoa.
- Consentimento e contrato de pesquisa não eliminam minimização, segurança, direito aplicável ou prazo de descarte.
- Relatório informa escopo, método, características agregadas e limitações; não generaliza resultado de poucos participantes.
- Evidência crua fica com equipe de pesquisa/acessibilidade; Produto recebe finding e síntese sanitizada.

## Incidentes

- Evidência forense, logs, memória, disco, timeline detalhada, indicadores, lista de afetados e comunicações ficam em armazenamento restrito.
- Preservar origem, horário, hash, coletor e transferências quando cadeia de custódia for relevante.
- Separar fatos confirmados, hipóteses e decisões; sincronizar relógios e registrar fuso.
- Comunicação interna, cliente, titular, regulador e pública têm audiências diferentes e aprovação própria.
- Publicar no Git somente postmortem sanitizado: contexto mínimo, impacto agregado, causa em nível seguro, detecção, resposta, controles e lições aprendidas.
- Não colocar no postmortem detalhe que reabra o vetor, identifique pessoa/cliente ou exponha defesa interna.
- A retenção forense depende de tipo, obrigação, investigação e `legal hold`; incidente com dado pessoal observa o mínimo regulatório citado acima.

## GitHub Actions sem vazamento

- Executar scanners com permissões mínimas e sem imprimir contexto, headers ou secrets.
- Usar ambientes efêmeros e dados fictícios; nunca apontar DAST a produção sem autorização formal.
- Não aceitar URL arbitrária de input não confiável.
- Não usar `set -x`, debug amplo ou dump de variáveis em job com segredo.
- Preferir alertas nativos de code scanning ao upload de SARIF como artifact genérico, quando plano e recurso permitirem.
- Antes de `upload-artifact`, criar pacote por allowlist, inspecionar conteúdo e definir `retention-days` mínimo.
- Não publicar artifact em workflow de fork/PR não confiável e não executar código não confiável com segredos disponíveis.
- Considerar que pessoas com leitura do repositório privado podem baixar artifacts conforme permissões; privado não significa acesso nominal à evidência.
- Logs e artifacts do GitHub têm retenção configurável. O padrão documentado é 90 dias; repositórios privados permitem configuração de 1 a 400 dias, sujeita ao limite da organização/enterprise. Definir prazo menor por artifact sensível.
- Excluir artifact imediatamente quando houver segredo ou dado indevido e iniciar resposta; expiração futura não contém exposição atual.

## Checklist antes de commitar evidências

- [ ] O arquivo é necessário no Git e não pode ser substituído por resumo?
- [ ] Está em `reports/sanitized/`, quando for relatório?
- [ ] Foi criado como novo resumo, sem incorporar relatório cru?
- [ ] Não contém segredo, token, cookie, credencial, chave ou string de conexão?
- [ ] Não contém dado pessoal real nem combinação reidentificável?
- [ ] Não contém URL, hostname, IP, path, tenant, conta ou fornecedor sensível?
- [ ] Não contém payload, request/response, exploitabilidade ou código proprietário desnecessário?
- [ ] Imagens/PDFs tiveram conteúdo e metadados removidos de forma irreversível?
- [ ] JSON, CSV, HTML, SARIF e SBOM foram reconstruídos por allowlist?
- [ ] Nome do arquivo não revela cliente, pessoa, ativo, incidente ou vulnerabilidade?
- [ ] Escopo, impacto, severidade, decisão, plano, owner e reteste estão claros?
- [ ] A retenção e a referência restrita foram registradas sem revelar localização sensível?
- [ ] Uma segunda pessoa autorizada revisou o diff e o arquivo renderizado?
- [ ] Busca por padrões sensíveis e secret scanning não encontraram conteúdo indevido?
- [ ] O aprovador do domínio autorizou o commit?

## Checklist antes de anexar artifacts em CI/CD

- [ ] O artifact é indispensável ou um alert/resumo atende?
- [ ] O job usa ambiente autorizado, dados fictícios e permissões mínimas?
- [ ] Inputs não permitem alvo arbitrário ou exfiltração?
- [ ] O pacote foi montado por allowlist e inspecionado após geração?
- [ ] Não há logs, dumps, cookies, secrets, dados pessoais ou configuração interna?
- [ ] A audiência real de download foi verificada?
- [ ] O artifact não será público nem acessível a fork/PR não confiável?
- [ ] `retention-days` é o menor prazo operacional?
- [ ] Nome, metadata e manifest não revelam cliente ou ambiente?
- [ ] Existe procedimento de exclusão e resposta a exposição?

## Checklist antes de abrir issue ou PR com finding

- [ ] A visibilidade escolhida é adequada ao risco e ao estado da correção?
- [ ] Finding explorável está em tracker/advisory privado, não em issue comum?
- [ ] Título e descrição não revelam vetor, ativo, cliente ou segredo?
- [ ] Reprodução usa dados fictícios e informação mínima?
- [ ] Evidência crua está fora de comentários e anexos?
- [ ] Severidade, impacto, owner, prazo e gate estão registrados?
- [ ] Falso positivo ou aceite de risco tem justificativa, aprovação e expiração?
- [ ] A PR referencia ID restrito e descreve testes sem ensinar exploração?
- [ ] Correção e reteste foram registrados por pessoa autorizada?
- [ ] Divulgação externa foi aprovada por Segurança e, quando aplicável, Jurídico/Privacidade/Comunicação?

## Exemplos de nomes seguros

- `audit-summary-2026-q2.md`
- `accessibility-checkout-release-2026-06.md`
- `dependency-review-service-a.md`
- `incident-postmortem-IR-2026-004-sanitized.md`
- `sbom-product-a-release-2026-06.cdx.json`
- `risk-decision-RISK-042.md`

Esses nomes só são seguros se o conteúdo também for sanitizado.

## Exemplos de nomes proibidos

- `cliente-nome-real-vazamento-dados.zip`
- `producao-host-interno-dump.sql`
- `usuarios-com-documentos.csv`
- `token-encontrado-valor-completo.txt`
- `backup-site-config-real.tar.gz`
- `exploit-endpoint-interno.html`
- `gravacao-participante-nome-real.mp4`

## Revisão de evidência antes do commit

1. Trabalhar sobre cópia; manter o original apenas no local restrito.
2. Definir a audiência e escrever uma allowlist de fatos necessários.
3. Reconstruir o documento com dados sintéticos, agregados e IDs opacos.
4. Inspecionar texto, propriedades, anexos, camadas e metadados.
5. Buscar categorias sensíveis e executar detector de segredos sobre o arquivo candidato.
6. Renderizar e revisar visualmente, inclusive links, tabelas cortadas e conteúdo oculto.
7. Revisar `git diff --cached` e a lista exata de arquivos staged.
8. Obter segunda revisão proporcional à classificação.
9. Committar somente o resumo aprovado; descartar cópias intermediárias conforme política.

## Aprovações mínimas

| Conteúdo | Aprovação mínima |
|---|---|
| Resumo técnico interno | Owner técnico e segunda pessoa revisora |
| Vulnerabilidade alta/crítica | Segurança e owner do sistema |
| Segredo exposto | Segurança/IR e owner do segredo |
| Dado pessoal ou titular | Privacidade; Jurídico quando aplicável |
| Incidente | Incident commander, Segurança, Privacidade/Jurídico conforme escopo |
| Cliente enterprise | Segurança, owner comercial/contratual e Jurídico quando necessário |
| SBOM externo | Engenharia/Supply Chain, Segurança e owner contratual |
| Evidência de usuário/acessibilidade | Pesquisa/Acessibilidade e Privacidade quando identificável |

## Relações com o baseline

- **LGPD:** minimização, finalidade, segurança, retenção, direitos e prestação de contas seguem `docs/lgpd-privacy-program.md`.
- **Acessibilidade:** testes, prints, vídeos, relatos e tecnologias assistivas seguem `docs/accessibility-program.md`.
- **Aplicações web/backend:** não exportar arquivos de configuração reais, banco, arquivos privados, modelos internos, logs de worker, conteúdo restrito ou dados de tenant.
- **GitHub Actions:** gates, permissões e workflows permanecem em `docs/github-actions-strategy.md`; esta política governa suas saídas.
- **Scanners:** comandos e formatos permanecem em `docs/security-tools-catalog.md`; saída automatizada é hipótese até triagem humana.
- **Auditorias:** tipo, gatilho, reviewer e Go/No-Go seguem `docs/audit-types.md` e `docs/audit-trigger-matrix.md`.
- **Incidentes:** evidência restrita sustenta investigação; apenas postmortem sanitizado pode alimentar governança e melhoria.
- **Relatórios finais:** devem usar evidência mínima, declarar limitações e separar anexos por classificação e audiência.

## Incertezas e decisões contextuais

- Não existe uma retenção universal para todos os artifacts. Os prazos desta política são baseline e precisam ser reconciliados com contrato, finalidade, obrigação legal, defesa de direitos e `legal hold`.
- Criptografia, assinatura, WORM, hash e cadeia de custódia dependem do risco e do valor probatório; não são automaticamente necessários para todo resumo.
- Acesso a recursos GitHub de code scanning, secret scanning e advisories depende de visibilidade, plano, licenciamento e configuração atuais.
- Entregar SBOM a cliente não implica publicar o inventário; escopo e confidencialidade devem ser contratados.
- Pseudonimização não equivale a anonimização. A avaliação de reidentificação e a base jurídica exigem contexto.
- Esta política não substitui validação jurídica, forense ou contratual especializada.
