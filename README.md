# 🛡️ BIA SafeGuard AI — Agente Financeiro Consultivo

[![DIO Lab](https://img.shields.io/badge/DIO-Lab_BIA_do_Futuro-blue.svg)](https://www.dio.me/)
[![Python](https://img.shields.io/badge/Python-3.10+-yellow.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> Projeto desenvolvido para o Desafio de Projeto **"BIA do Futuro"** da Digital Innovation One (DIO).

## 📌 Visão Geral do Projeto
O **BIA SafeGuard AI** é um protótipo de agente financeiro desenvolvido para explorar a transição de assistentes virtuais reativos para modelos consultivos e proativos.

A solução analisa históricos de transações, hábitos de consumo e perfis de risco para identificar inconsistências, prever necessidades operacionais e recomendar produtos financeiros adequados, operando sob rigorosos **mecanismos de governança de dados e salvaguardas anti-alucinação**.

---

## 🎯 Principais Funcionalidades
- **Análise de Hábitos Transacionais:** Mapeamento de padrões de gastos, identificação de anomalias e apontamento de oportunidades de economia.
- **Orientação de Investimentos:** Cruzamento de dados entre o perfil do cliente e o catálogo oficial de produtos financeiros.
- **Alertas de Risco:** Notificação preventiva sobre movimentações atípicas registradas no histórico.
- **Arquitetura com Guardrails:** Restrição de respostas ao contexto fornecido na base de conhecimento, mitigando riscos de inferências incorretas.

---

## 📚 Documentação do Projeto
A documentação foi estruturada em módulos para facilitar a auditoria e o entendimento da arquitetura. Acesse os links abaixo para navegar pelos detalhes técnicos:

1. [**Documentação do Agente (Caso de Uso e Arquitetura)**](docs/01-documentacao-agente.md) 
2. [Base de Conhecimento](docs/02-base-conhecimento.md) *(Pendente)*
3. [Prompts do Agente](docs/03-prompts.md) *(Pendente)*
4. [Métricas de Avaliação](docs/04-metricas.md) *(Pendente)*
5. [Pitch de Apresentação](docs/05-pitch.md) *(Pendente)*

---

## 🏗️ Estrutura do Repositório

```text
.
├── assets/                  # Diagramas e recursos visuais
├── data/                    # Base de conhecimento mockada (CSV / JSON)
├── docs/                    # Artefatos de documentação detalhada
│   └── 01-documentacao-agente.md
├── src/                     # Código-fonte do protótipo funcional
└── README.md                # Documentação principal 
```

---

## 🔒 Diretrizes de Segurança e Confiabilidade
Para assegurar a integridade das respostas no domínio financeiro:

Ancoragem em Contexto (Prompt Anchoring): Respostas geradas estritamente a partir das bases de dados locais (data/).

Tratamento de Indisponibilidade (Fallback): Quando uma informação não consta na base, o agente declara a limitação explicitamente em vez de gerar dados sintéticos.

Privacidade por Design: Tratamento de dados operacionais sem exposição indevida, simulando o mascaramento necessário para adequação às normativas de proteção de dados.

👤 Autor
Desenvolvido por Henrique Pereira Teixeira como parte do bootcamp DIO.
