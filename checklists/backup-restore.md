# Checklist de Backup e Restauração

## Objetivo

Verificar se dados, configurações e componentes críticos de um SaaS possuem backup protegido, restauração testada, retenção adequada, segregação, descarte e evidência sanitizada suficientes para reduzir perda de dados e indisponibilidade.

Backup executado não garante continuidade. Continuidade, RPO e RTO só podem ser afirmados para o escopo testado e aprovado por restore real em ambiente autorizado.

## Quando usar

- [ ] Antes do primeiro deploy com dados persistentes.
- [ ] Antes de migração, manutenção destrutiva, mudança de banco, storage, tenant, criptografia, região ou provedor.
- [ ] Após falha de backup, incidente, perda de dados, corrupção, indisponibilidade ou alteração de arquitetura.
- [ ] Em teste mensal amostral e exercício trimestral ou semestral conforme criticidade.
- [ ] Antes de assumir compromisso enterprise de RPO, RTO, retenção ou continuidade.

## Revisor responsável

- [ ] Operações/SRE ou responsável de plataforma revisou jobs, monitoramento, restore e descarte.
- [ ] DBA, responsável de dados ou owner técnico revisou consistência, integridade e dependências.
- [ ] Segurança revisou criptografia, chaves, acesso, segregação, imutabilidade e logs.
- [ ] Privacidade/Jurídico revisaram retenção, exclusão, dados pessoais, legal hold e obrigações quando aplicável.
- [ ] Produto/Negócio aprovou RPO/RTO e impacto operacional esperado.

## Evidências esperadas

- [ ] Inventário sanitizado de classes de dados e sistemas cobertos, usando `[SISTEMA-A]`, `[BANCO-A]` e `[ARMAZENAMENTO-A]`.
- [ ] RPO/RTO aprovados por fluxo ou sistema, com fonte da obrigação e limitações.
- [ ] Registro de execução de backup por ID opaco, sem path real, bucket real, tenant real, banco real ou servidor real.
- [ ] Evidência de criptografia, gestão de chaves, acesso mínimo, segregação e retenção em nível de configuração sanitizada.
- [ ] Resultado de restore testado em ambiente isolado, com integridade, duração, ponto recuperado e falhas agregadas.
- [ ] Evidência de descarte da cópia restaurada e limpeza de dados temporários.
- [ ] Plano de correção para falhas de restore, divergência de RPO/RTO ou cobertura incompleta.

## Itens obrigatórios

- [ ] Escopo de backup cobre banco, arquivos, anexos, configurações necessárias, filas, storage, metadados, chaves dependentes e componentes críticos aplicáveis.
- [ ] Escopo identifica explicitamente o que não é coberto, por quê, risco e aprovador.
- [ ] RPO e RTO estão definidos por sistema ou fluxo crítico e aprovados pelo owner de negócio.
- [ ] Backups são criptografados em repouso e em trânsito quando aplicável, com gestão de chaves protegida e acesso restrito.
- [ ] Acesso a backups e restores segue menor privilégio, autorização nominal e segregação entre operação diária e recuperação sensível.
- [ ] Backups são segregados do ambiente principal para reduzir exclusão acidental, ransomware, erro de operador e comprometimento de credenciais.
- [ ] Retenção considera finalidade, obrigação, contrato, privacidade, legal hold e descarte; não é indefinida por padrão.
- [ ] Jobs de backup geram monitoramento de sucesso, falha, atraso, tamanho anômalo e ausência de execução.
- [ ] Restore test foi executado em ambiente isolado e autorizado, sem conectar a produção real sem decisão formal.
- [ ] Restore validou integridade técnica e funcional, incluindo aplicação, permissões, arquivos, vínculos, índices e consistência entre componentes.
- [ ] Restore validou que dados excluídos ou sujeitos a retenção especial não retornam indevidamente ao uso ativo sem reconciliação aprovada.
- [ ] Cópias restauradas foram descartadas ou protegidas com prazo, owner e evidência de encerramento.
- [ ] Falha de restore, ausência de backup ou RPO/RTO não atendido possui risco, owner, prazo, mitigação e reteste.
- [ ] Procedimentos não dependem de uma única pessoa, credencial, chave, máquina local ou conhecimento não documentado.
- [ ] Mudança destrutiva ou migração só avança com backup restaurável, rollback ou plano de recuperação aprovado.

## Itens desejáveis

- [ ] Testar restore parcial e completo, incluindo arquivos e metadados, em cadências diferentes.
- [ ] Testar recuperação em região, conta ou ambiente alternativo quando arquitetura e risco justificarem.
- [ ] Manter cópia isolada ou imutável quando risco de ransomware, exclusão maliciosa ou erro administrativo justificar.
- [ ] Medir tendência de duração de backup, duração de restore, falhas, atraso e crescimento.
- [ ] Integrar exercício de restore ao plano de incidente e continuidade.
- [ ] Documentar dependências de fornecedor, suporte, limite de quota, custo e prioridade de recuperação.

## Melhorias futuras

- [ ] Automatizar verificação de integridade e alertas sem expor conteúdo do backup.
- [ ] Realizar exercício completo de continuidade com múltiplos sistemas e comunicação interna.
- [ ] Validar recuperação com evidência independente ou auditoria externa quando contrato ou risco justificar.
- [ ] Avaliar controles de resiliência avançada, como imutabilidade, WORM ou recuperação cross-account, conforme arquitetura.

## Critérios de aprovação

- [ ] Escopo, RPO, RTO, retenção, acesso, criptografia e segregação estão definidos e revisados.
- [ ] Restore test aplicável foi concluído com integridade e funcionalidade suficientes para o escopo.
- [ ] RPO/RTO foram atendidos ou a divergência possui risco aceito temporário, owner, controle e nova data de teste.
- [ ] Evidências foram sanitizadas e não incluem backup, dump, path, bucket, tenant, banco, servidor, log cru ou print sensível.
- [ ] Descarte da cópia restaurada foi comprovado em nível seguro.

## Critérios de reprovação/bloqueio

- [ ] Não existe backup para dado ou sistema crítico aplicável.
- [ ] Backup existe, mas restore nunca foi testado no escopo necessário para decisão.
- [ ] Restore falha, restaura dado inconsistente ou não atinge condição mínima de operação aprovada.
- [ ] Migração, alteração destrutiva ou release crítico não tem backup restaurável, rollback ou plano de recuperação validado.
- [ ] Backups, dumps, chaves, paths reais, buckets reais, nomes reais de banco, tenants, servidores, logs ou credenciais aparecem no Git.
- [ ] Acesso a backup é amplo, não auditado ou compartilhado de forma incompatível com a classificação.
- [ ] Retenção indefinida, descarte ausente ou restauração reintroduz dado excluído sem análise e decisão competente.

## Cuidados contra vazamento

- [ ] Não criar dumps, backups, paths reais sensíveis, nomes reais de banco, tenants, buckets, servidores, contas, snapshots ou comandos destrutivos.
- [ ] Não registrar chave, senha, token, arquivo de configuração real, `site_config.json`, `terraform.tfstate` ou credencial de storage.
- [ ] Usar apenas marcadores como `[BACKUP-A]`, `[BANCO-A]`, `[SISTEMA-A]`, `[AMBIENTE-ISOLADO-A]` e `[EV-SAN-001]`.
- [ ] Publicar somente resultado agregado, duração, status e decisão; manter evidência integral em armazenamento restrito.
- [ ] Redigir prints, PDFs, logs, JSONs e relatórios de ferramenta antes de qualquer compartilhamento.
- [ ] Não sugerir nem versionar comandos destrutivos; procedimentos reais de restore e descarte ficam em runbook restrito e revisado.
