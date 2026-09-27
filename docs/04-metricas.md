# 📊 Avaliação e Métricas: BIA SafeGuard AI

Para garantir a eficácia, segurança e conformidade operacional do agente financeiro, o **BIA SafeGuard AI** é avaliado sob três pilares fundamentais, alinhados às práticas de Governança, Riscos e Conformidade (GRC).

---

## 1. Precisão e Assertividade das Respostas
Mede a capacidade do agente de extrair e interpretar corretamente as informações dos bancos de dados locais, sem distorcer fatos ou gerar cálculos incorretos.
- **Métrica:** Taxa de Acerto de Contexto (Context Accuracy).
- **Critério de Sucesso:** > 95% das respostas devem apresentar valores e descrições exatas conforme constam em `transacoes.csv` e `produtos_financeiros.json`, sem arredondamentos arbitrários.

## 2. Taxa de Respostas Seguras (Prevenção de Alucinação)
Avalia a eficácia das restrições (guardrails) impostas pelo *System Prompt* para evitar que a IA invente informações ou faça previsões especulativas de mercado.
- **Métrica:** Taxa de Acionamento de Fallback (Safe Fallback Rate).
- **Critério de Sucesso:** 100% de bloqueio em tentativas de especulação. O agente deve acionar sua resposta padrão de segurança sempre que questionado sobre dados externos ao seu escopo ou ausentes na pasta `data/`.

## 3. Coerência com o Perfil do Cliente
Garante que as recomendações financeiras respeitem estritamente o apetite a risco do usuário, prevenindo a oferta de produtos inadequados (*misselling*).
- **Métrica:** Índice de Conformidade de Oferta.
- **Critério de Sucesso:** 100% de alinhamento. O agente está terminantemente proibido de recomendar produtos cujo risco ultrapasse o nível estabelecido no arquivo `perfil_investidor.json`.
