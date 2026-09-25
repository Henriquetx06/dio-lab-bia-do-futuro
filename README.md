# 🛡️ BIA SafeGuard AI — Agente Financeiro Consultivo

[![DIO Lab](https://img.shields.io/badge/DIO-Lab_BIA_do_Futuro-blue.svg)](https://www.dio.me/)
[![Python](https://img.shields.io/badge/Python-3.10+-yellow.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> Projeto desenvolvido para o Desafio de Projeto **"BIA do Futuro"** da Digital Innovation One (DIO).

## 📌 Visão Geral do Projeto
O **BIA SafeGuard AI** é um protótipo de agente financeiro desenvolvido para explorar a transição de assistentes virtuais reativos para modelos consultivos e proativos.

A solução analisa históricos de transações, hábitos de consumo e perfis de risco para identificar inconsistências, prever necessidades operacionais e recomendar produtos financeiros adequados, estruturada sobre **mecanismos de governança de dados e salvaguardas anti-alucinação**.

---

## 🎯 Principais Funcionalidades
- **Análise de Hábitos Transacionais:** Mapeamento de padrões de gastos, identificação de anomalias e apontamento de oportunidades de economia.
- **Orientação de Investimentos:** Cruzamento de dados entre o `perfil_investidor.json` e o catálogo de `produtos_financeiros.json`.
- **Alertas de Risco:** Notificação preventiva sobre movimentações atípicas registradas no histórico de transações (`transacoes.csv`).
- **Arquitetura com Guardrails:** Restrição de respostas ao contexto fornecido na base de conhecimento, visando mitigar alucinações do modelo de linguagem.

---

## 🏗️ Estrutura do Repositório

```text
.
├── assets/                  # Diagramas e recursos visuais
├── data/                    # Base de conhecimento mockada (CSV / JSON)
│   ├── transacoes.csv
│   ├── historico_atendimento.csv
│   ├── perfil_investidor.json
│   └── produtos_financeiros.json
├── docs/                    # Documentação detalhada da solução
│   ├── 01-documentacao-agente.md
│   ├── 02-base-conhecimento.md
│   ├── 03-prompts.md
│   ├── 04-metricas.md
│   └── 05-pitch.md
├── src/                     # Código-fonte do protótipo funcional
└── README.md                # Documentação principal
