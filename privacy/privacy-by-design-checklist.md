# Checklist de Privacy by Design

## Objetivo

Verificar, em discovery, arquitetura, implementação e release, se uma mudança de SaaS incorporou minimização, finalidade, segurança, direitos, retenção, terceiros e evidências desde o desenho.

Este checklist não declara conformidade com a LGPD e não substitui `../checklists/lgpd.md`. Ele é um gate operacional por feature ou mudança material.

## Quando usar

- Nova coleta, campo, evento, log ou dado livre.
- Nova finalidade, analytics, IA, decisão automatizada ou marketing.
- Nova integração, fornecedor, suboperador, país ou suporte remoto.
- Mudança em autenticação, autorização, tenant, exportação, exclusão ou retenção.
- Migração, restore, refatoração crítica ou alteração de fluxo com dados pessoais.

## Itens obrigatórios

### Discovery e produto

- [ ] A finalidade está descrita em linguagem específica e vinculada a valor real para o titular ou serviço?
- [ ] Cada dado, evento e atributo possui necessidade demonstrada e owner?
- [ ] Campos opcionais começam desabilitados ou vazios quando não forem necessários ao serviço?
- [ ] Conteúdo livre possui aviso, minimização, moderação ou redaction quando aplicável?
- [ ] Mudança de finalidade, IA, analytics ou marketing foi encaminhada para análise própria?

### Engenharia e segurança

- [ ] Autorização no servidor protege leitura, escrita, exportação, exclusão e administração?
- [ ] Isolamento por tenant foi considerado em banco, API, jobs, cache, busca, arquivos, filas e relatórios?
- [ ] Logs, traces e artifacts excluem corpo, cookie, token, documento, mensagem e dado pessoal desnecessário?
- [ ] Dados sintéticos são usados em desenvolvimento, teste, fixture, demo, CI e prints?
- [ ] Criptografia, gestão de chaves e menor privilégio foram avaliados conforme risco?

### Direitos, retenção e descarte

- [ ] A mudança permite localizar, corrigir, exportar, bloquear ou excluir dados quando aplicável?
- [ ] Retenção possui evento inicial, critério, exceções e descarte definidos para sistemas ativos e fornecedores?
- [ ] Backups, restores e caches possuem reconciliação para evitar retorno indevido de dados excluídos?
- [ ] Exportações expiram, são autorizadas e não incluem dados de terceiros?

### Terceiros e transferências

- [ ] Todo fornecedor ou suboperador novo foi avaliado antes de receber dado ou acesso?
- [ ] Regiões, suporte remoto e transferência internacional foram encaminhados para validação competente?
- [ ] Contrato, DPA, canal de incidente, retorno, exclusão e offboarding foram considerados?

### Evidências e release

- [ ] Mapa de dados, ROPA, bases candidatas, retenção e fornecedores foram atualizados ou marcados como não aplicáveis com justificativa?
- [ ] Necessidade de RIPD/DPIA foi triada e a decisão ficou registrada por ID opaco?
- [ ] Evidências usam dados sintéticos ou resumo sanitizado; material cru fica fora do Git?
- [ ] Achados possuem owner, prazo, critério de aceite e reteste?

## Critérios de bloqueio

Bloquear a mudança quando houver:

- dado pessoal coletado sem finalidade, necessidade ou owner;
- base legal escolhida automaticamente ou sem validação quando exigida;
- logs, artifacts, issues, PRs ou screenshots contendo dado pessoal real;
- falha conhecida de isolamento por tenant ou autorização em fluxo material;
- fornecedor recebendo dados sem avaliação mínima, contrato ou transferência tratada;
- retenção indefinida ou exclusão sabidamente incompleta sem plano e aprovação;
- incidente ativo sem contenção, avaliação e decisão de retorno.

## Evidência segura

Use somente IDs opacos, dados sintéticos, categorias abstratas e resumos revisados. Checklist preenchido de produto real pode revelar arquitetura, lacunas e dados operacionais; trate conforme `../docs/evidence-and-reporting-policy.md`.

## Referências

- `../docs/lgpd-privacy-program.md`
- `../checklists/lgpd.md`
- `data-map.md`
- `ropa.md`
- `legal-bases.md`
- `retention-policy.md`
- `third-party-processors.md`
- `../docs/evidence-and-reporting-policy.md`
