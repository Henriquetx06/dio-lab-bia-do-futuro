# 📚 Base de Conhecimento: Estrutura e Governança de Dados

## 1. Visão Geral
Esta documentação detalha a estrutura dos dados utilizados para fundamentar as respostas do **BIA SafeGuard AI**. Os dados estão mockados na pasta `data/` e representam a **única fonte de verdade** para o agente, garantindo que as análises sejam precisas, rastreáveis e restritas ao escopo financeiro do cliente.

---

## 2. Dicionário de Dados

A arquitetura de dados foi dividida em quatro artefatos principais, separando informações transacionais, de relacionamento e catálogos de produtos.

### 2.1. Dados Transacionais (`data/transacoes.csv`)
- **Descrição:** Registros de entradas e saídas financeiras. O agente consome esses dados para detectar anomalias, emitir alertas preventivos e analisar padrões de consumo.
- **Campos Principais:** `id_transacao`, `data`, `categoria`, `valor`, `tipo` (credito/debito), `status`.

### 2.2. Histórico de Relacionamento (`data/historico_atendimento.csv`)
- **Descrição:** Base de chamados e interações anteriores do cliente com a instituição. Permite ao agente manter o contexto de solicitações passadas, garantindo um atendimento contínuo e sem redundâncias.
- **Campos Principais:** `id_ticket`, `data`, `assunto`, `status`, `resolucao`.

### 2.3. Perfil do Cliente (`data/perfil_investidor.json`)
- **Descrição:** Mapeamento do apetite a risco, patrimônio atual e objetivos financeiros do cliente. O agente utiliza este artefato como **validador de conformidade** antes de qualquer recomendação.
- **Estrutura Base:** `cliente_id`, `perfil_risco` (ex: Conservador, Moderado, Arrojado), `horizonte_investimento`, `objetivos`.

### 2.4. Catálogo Oficial (`data/produtos_financeiros.json`)
- **Descrição:** Portfólio de produtos e serviços de investimento autorizados pela instituição. 
- **Estrutura Base:** `id_produto`, `nome`, `tipo_ativo`, `perfil_recomendado`, `nivel_risco`, `liquidez`.

---

## 3. Fluxo de Utilização Segura (Data Ingestion & Guardrails)
Para manter a conformidade com as diretrizes de segurança, o acesso e cruzamento desses dados seguem regras estritas:

1. **Validação de Escopo (Match de Perfil):** O agente é programado para cruzar obrigatoriamente o `perfil_investidor.json` com os `produtos_financeiros.json`. Produtos com `perfil_recomendado` incompatível com o risco do cliente são automaticamente ocultados da resposta gerada.
2. **Isolamento de Contexto:** Cada sessão de atendimento analisa estritamente os dados do cliente em questão. Não há compartilhamento de parâmetros ou histórico entre sessões distintas, simulando diretrizes reais de privacidade.
