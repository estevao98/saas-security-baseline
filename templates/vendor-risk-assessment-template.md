# Template de Avaliação de Risco de Fornecedor

## Objetivo e quando usar

Avaliar risco de terceiro antes de contratação, integração ou renovação e após incidente, mudança material, novo suboperador, país ou serviço. Não substitui due diligence jurídica, financeira ou contratual.

## Campos obrigatórios

- ID `[VRA-001]`, fornecedor `[FORNECEDOR-A]`, serviço, owner e criticidade;
- uso pretendido, dependência e alternativas/saída;
- categorias de dados e acesso, sem valores reais;
- papéis de privacidade, suboperadores, localizações e transferências a validar;
- identidade/acesso, criptografia, SDLC, vulnerabilidades, logs, incidentes, backup, continuidade e descarte;
- evidências fornecidas, validade, lacunas e limitações;
- riscos inerentes/residuais, tratamento, contrato/DPA/SLA e decisão;
- aprovadores, data, próxima revisão e gatilhos.

## Campos opcionais

Certificações verificadas, pentest resumido, SBOM, seguro, concentração, saúde financeira, acessibilidade, uso de IA, treinamento com dados, portabilidade e direito de auditoria.

## Decisão

| Risco | Controle/evidência | Lacuna | Residual | Ação/condição | Owner |
|---|---|---|---|---|---|
| `[RISCO-001]` | `[EV-SAN-001]` | `[LACUNA]` | `[NIVEL]` | `[CONDICAO]` | `[PAPEL]` |

- **Resultado:** `[APROVAR/APROVAR-COM-CONDICOES/NAO-APROVAR]`
- **Incertezas:** `[CONTRATO/PLANO/REGIAO/RECURSO-ENTERPRISE]`

## Exemplo fictício

`[FORNECEDOR-A]` é avaliado para notificações de `[PRODUTO-A]`. A decisão é condicional à retenção mínima, lista de suboperadores, canal de incidente, exportação e exclusão testáveis; nenhuma resposta de questionário real é versionada.

## Cuidados e revisão antes de compartilhar

- [ ] Não inserir contato, preço, contrato, questionário, credencial, arquitetura, URL, relatório de pentest ou incidente real do fornecedor.
- [ ] Verificar evidência e escopo de certificação; não aceitar logotipo ou autodeclaração como prova suficiente.
- [ ] Confirmar plano contratado, região, suboperadores, responsabilidades, saída e exclusão.
- [ ] Compras, Segurança, Privacidade, Jurídico, Operações e Acessibilidade revisam conforme impacto.
- [ ] Documento real fica em sistema restrito; no Git, somente modelo ou síntese aprovada.

## Relação com o repositório

Usar com `docs/audit-trigger-matrix.md`, `docs/lgpd-privacy-program.md`, `docs/evidence-and-reporting-policy.md`, `risk/severity-and-prioritization.md` e o checklist de terceiros.
