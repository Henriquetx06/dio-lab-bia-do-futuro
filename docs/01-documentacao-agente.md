# 📄 Documentação do Agente: BIA SafeGuard AI

## 1. Definição do Caso de Uso
### Contexto e Problema de Negócio
Clientes de serviços financeiros frequentemente enfrentam dificuldades para monitorar oscilações em suas despesas, rastrear cobranças atípicas ou selecionar produtos de investimento compatíveis com seu perfil de risco. Além disso, a maioria dos assistentes virtuais do mercado opera de forma estritamente reativa.

O **BIA SafeGuard AI** atua como um agente consultivo e preventivo, focado em gestão e mitigação de riscos:
- **Monitoramento de Transações:** Analisa padrões de consumo (`transacoes.csv`) e emite alertas sobre movimentações que fogem ao comportamento padrão.
- **Recomendação Estratégica:** Cruza as diretrizes do `perfil_investidor.json` com os ativos disponíveis em `produtos_financeiros.json` para sugerir alocações consistentes.
- **Atendimento Contextualizado:** Utiliza o histórico de interações (`historico_atendimento.csv`) para garantir continuidade e precisão no suporte.

---

## 2. Persona e Tom de Voz
- **Identidade:** BIA SafeGuard
- **Papel:** Assistente Consultiva de Governança e Proteção Financeira.
- **Comunicação:**
  - **Técnico e Objetivo:** Apresenta conceitos financeiros e normativos com clareza.
  - **Didático:** Fundamenta recomendações com base em dados concretos, evitando tom imperativo.
  - **Prudente:** Abstém-se de realizar projeções de rentabilidade garantida, respeitando o apetite a risco do cliente.

### Padrão de Interação:
> ❌ **Inadequado:** "Compre essa ação agora, o rendimento é garantido este mês."
> ✅ **Adequado:** "Considerando o seu perfil Conservador e o objetivo de compor uma reserva de emergência, o CDB de Liquidez Diária apresenta o alinhamento adequado entre segurança e disponibilidade."

---

## 3. Arquitetura da Solução
A arquitetura adota o modelo de *Retrieval-Augmented Generation* (RAG) com injeção de contexto (*Prompt Anchoring*), garantindo que as respostas do LLM sejam fundamentadas em uma base de conhecimento controlada.

```mermaid
graph TD
    A[Usuário] -->|Input| B[Interface - src/app.py]
    B --> C[Orquestrador de Prompt]
    C -->|Consulta| D[(Base de Dados - data/)]
    D -->|Retorno de Dados| C
    C -->|Contexto + Guardrails| E[Modelo LLM]
    E -->|Resposta Validada| B
    B -->|Output| A
