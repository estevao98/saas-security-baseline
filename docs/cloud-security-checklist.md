# Checklist de Segurança em Cloud

## Objetivo

Servir como guia auxiliar para revisão de segurança cloud, responsabilidade compartilhada e evidências, sem substituir o checklist canônico `checklists/cloud-security.md`.

Este arquivo não define configuração universal para AWS, Azure, Google Cloud ou outro provedor. Controles concretos dependem da arquitetura, conta, região, contrato, serviço, dados e modelo de operação.

## Fonte Canônica

| Tema | Fonte interna |
|---|---|
| Checklist executável | `checklists/cloud-security.md` |
| Normas e cloud | [Matriz de normas](standards-and-frameworks-matrix.md) |
| Roadmap e fase enterprise | [Roadmap de segurança](security-roadmap.md) |
| IaC, container e cloud audit | [Tipos de auditoria](audit-types.md), [Catálogo de ferramentas](security-tools-catalog.md) |
| Evidências e artifacts | [Política de evidências](evidence-and-reporting-policy.md) |
| Terceiros e suboperadores | `checklists/third-party-risk.md`, [Programa LGPD](lgpd-privacy-program.md) |

## Escopo de Revisão

- contas, projetos, organizações, billing e segregação de ambientes;
- IAM, MFA, chaves, contas de serviço e acesso administrativo;
- rede, exposição pública, DNS, WAF, balanceadores e portas;
- storage, banco, filas, cache, logs, backups e criptografia;
- imagens, registries, containers, Kubernetes e serverless quando aplicável;
- IaC, drift, change management e revisão de planos;
- monitoramento, alertas, incidentes e retenção;
- regiões, transferência internacional e suboperadores quando houver dado pessoal.

## Evidência Segura

- matriz de responsabilidade compartilhada em termos genéricos;
- resumo sanitizado de controles por domínio;
- IDs opacos de exceções e riscos aceitos;
- status agregado de backups, logs, criptografia e acessos;
- referência a evidência restrita sem caminho sensível.

## Não Registrar Aqui

- nomes reais de contas, buckets, projetos, VPCs, subnets, clusters ou contas de serviço;
- IPs, hostnames, topologia detalhada, chaves, policies integrais ou `terraform.tfstate`;
- plano Terraform real, relatório CSPM cru ou export de console;
- prints sem redaction.

## Pendências Contextuais

- Scans IaC/cloud e fixtures de scripts pertencem ao Lote 5 ou ao repositório consumidor.
- Gates CI/CD cloud dependem de stack, conta, plano, permissões, logs e artifacts validados.
