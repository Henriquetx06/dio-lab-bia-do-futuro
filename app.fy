import streamlit as st
import json
import pandas as pd
import os

# ---------------------------------------------------------
# CONFIGURAÇÃO DA PÁGINA
# ---------------------------------------------------------
st.set_page_config(
    page_title="BIA SafeGuard AI",
    page_icon="🛡️",
    layout="centered"
)

st.title("🛡️ BIA SafeGuard AI")
st.subheader("Assistente Financeira e de Proteção Orçamentária")
st.markdown("---")

# ---------------------------------------------------------
# CARREGAMENTO DA BASE DE CONHECIMENTO (data/)
# ---------------------------------------------------------
DATA_DIR = os.path.join(os.path.dirname(__file__), "..", "data")

@st.cache_data
def carregar_base_conhecimento():
    dados = {}
    
    # Carregar Transações
    transacoes_path = os.path.join(DATA_DIR, "transacoes.csv")
    if os.path.exists(transacoes_path):
        dados["transacoes"] = pd.read_csv(transacoes_path).to_dict(orient="records")
    else:
        dados["transacoes"] = []

    # Carregar Perfil do Investidor
    perfil_path = os.path.join(DATA_DIR, "perfil_investidor.json")
    if os.path.exists(perfil_path):
        with open(perfil_path, "r", encoding="utf-8") as f:
            dados["perfil"] = json.load(f)
    else:
        dados["perfil"] = {}

    # Carregar Produtos Financeiros
    produtos_path = os.path.join(DATA_DIR, "produtos_financeiros.json")
    if os.path.exists(produtos_path):
        with open(produtos_path, "r", encoding="utf-8") as f:
            dados["produtos"] = json.load(f)
    else:
        dados["produtos"] = []

    return dados

base_dados = carregar_base_conhecimento()

# ---------------------------------------------------------
# LÓGICA DO AGENTE E GUARDRAILS DE SEGURANÇA
# ---------------------------------------------------------
def processar_resposta_agente(mensagem_usuario):
    mensagem_lc = mensagem_usuario.lower()
    
    # Guardrail 1: Prevenção de Especulação de Mercado
    termos_especulativos = ["cotação", "previsão", "ações", "subir", "cair", "futuro", "bolsa"]
    if any(termo in mensagem_lc for termo in termos_especulativos) and "recomend" not in mensagem_lc:
        return (
            "⚠️ **Aviso de Segurança:** Por diretrizes de governança e regulamentação, não realizo "
            "previsões de mercado ou especulações sobre cotações futuras. Posso ajudar analisando o seu "
            "perfil atual e listando as opções oficiais de investimento disponíveis no nosso catálogo."
        )

    # Consulta 1: Perfil de Investidor e Recomendações
    if "investir" in mensagem_lc or "recomendação" in mensagem_lc or "perfil" in mensagem_lc:
        perfil_info = base_dados.get("perfil", {})
        produtos_info = base_dados.get("produtos", [])
        
        perfil_risco = perfil_info.get("perfil_risco", "Conservador")
        produtos_compativeis = [
            p["nome"] for p in produtos_info 
            if p.get("perfil_recomendado", "").lower() == perfil_risco.lower()
        ]
        
        produtos_str = ", ".join(produtos_compativeis) if produtos_compativeis else "CDB Liquidez Diária"
        
        return (
            f"Analisando o seu cadastro, identifiquei que o seu perfil de risco atual é **{perfil_risco}**.\n\n"
            f"Com base nas diretrizes de segurança da instituição, os produtos recomendados para o seu perfil são:\n"
            f"- **{produtos_str}**\n\n"
            f"Gostaria de detalhar os prazos e rentabilidades destas opções?"
        )

    # Consulta 2: Extrato e Transações
    if "transação" in mensagem_lc or "extrato" in mensagem_lc or "gasto" in mensagem_lc or "fatura" in mensagem_lc:
        transacoes = base_dados.get("transacoes", [])
        if transacoes:
            resumo = "\n".join([f"- **{t.get('data', 'N/A')}**: {t.get('categoria', 'Geral')} - R$ {t.get('valor', 0)} ({t.get('tipo', 'débito')})" for t in transacoes[:3]])
            return f"Aqui estão as suas últimas movimentações registradas na base:\n\n{resumo}"
        return "Não foram encontradas movimentações recentes no seu histórico registrado."

    # Guardrail 2: Operações Ativas Não Permitidas (Read-Only)
    if any(palavra in mensagem_lc for palavra in ["transferir", "pagar", "pix", "enviar dinheiro"]):
        return (
            "🛑 **Operação Não Permitida:** Como assistente consultiva de proteção e análise, "
            "opero em modo estritamente de leitura (Read-Only). Para realizar movimentações financeiras, "
            "utilize o menu de transações da sua conta."
        )

    # Fallback Padrão
    return (
        "Sou a **BIA SafeGuard AI**, sua assistente de governança e proteção financeira. "
        "Posso ajudar com a análise do seu perfil de investidor, consulta ao catálogo de produtos oficiais "
        "e verificação do seu histórico transacional."
    )

# ---------------------------------------------------------
# INTERFACE DE CHAT (STREAMLIT SESSION STATE)
# ---------------------------------------------------------
if "mensagens" not in st.session_state:
    st.session_state.mensagens = [
        {"role": "assistant", "content": "Olá! Sou a **BIA SafeGuard AI**. Como posso ajudar na gestão e proteção das suas finanças hoje?"}
    ]

for msg in st.session_state.mensagens:
    with st.chat_message(msg["role"]):
        st.markdown(msg["content"])

if prompt := st.chat_input("Digite sua mensagem..."):
    st.session_state.mensagens.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)

    resposta = processar_resposta_agente(prompt)
    
    st.session_state.mensagens.append({"role": "assistant", "content": resposta})
    with st.chat_message("assistant"):
        st.markdown(resposta)
