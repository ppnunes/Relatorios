---
pretitle: Pró-Reitoria Acadêmica
title: "Curso de Tecnologia em Análise e Desenvolvimento de Sistemas
"
subtitle: "Fique Segura - Arquitetura Lógica e Física"
author:
  - name: Priscila Pereira Nunes
    affiliation: Universidade Católica de Brasília
    location: Brasília, Brazil
professor: 
  name: Ranyelson Neres Carvalho
  title: Professor
disciplina: Soluções Computacionais

type: SPECIFICATION
status: DRAFT
bibliography: bibliography.bib
csl: abnt-ibid.csl
date: "2025"
mainfont: Arial
fontsize: 12pt
# numbersections: yes
lang: pt
cover: yes
# nocite: yes # Includes all entries in bibliography.bib file
titlepage: true
book: true
titlepage-background: assets/cover.pdf
# toc: true
# lof: true
biblio-style: abntex2-alf
# toc-own-page: true
disable-header-and-footer: true
toc-title: Sumário
biblio-title: Referências Bibliográficas
biblatexoptions:
  - backend=biber
  - style=numeric
---

# Arquitetura Lógica

## Componentes Principais
### Interface do Usuário (UI):

Desenvolvida com **Streamlit** para criar uma interface web interativa. Componentes como tabelas, gráficos, sliders e caixas de seleção são usados para visualização e interação com os dados. A interface é projetada para ser responsiva e intuitiva, permitindo que os usuários naveguem facilmente pelas funcionalidades do sistema.


### Camada de Dados:

Os dados são carregados a partir de uma função `load_data`, que pode buscar informações de arquivos locais (como CSV ou Excel) ou de APIs externas. A manipulação e agregação dos dados são realizadas utilizando a biblioteca **Pandas**, que oferece ferramentas poderosas para análise de dados.

## Fluxo de Dados:
  1. Carregamento inicial dos dados.
  2. Limpeza e transformação para adequação ao formato necessário.
  3. Armazenamento temporário em cache para melhorar o desempenho.

### Camada de Lógica de Negócio:

Responsável pelo processamento dos dados e pela aplicação das regras de negócio. Nesta camada, são realizados cálculos como agrupamentos, proporções e outras métricas relevantes. O controle de estado é gerenciado utilizando o `st.session_state` do Streamlit, permitindo que as interações do usuário sejam persistidas durante a sessão.

### Camada de Visualização:

Os gráficos e tabelas são gerados para apresentar os dados de forma clara e compreensível. Utiliza-se o `st.line_chart` para exibir tendências e tabelas interativas para detalhamento de informações. Para gráficos simples e rápidos deverá ser mantido o uso do `Streamlit Charts`, podendo incluir o uso da biblioteca `Matplotlib` para gráficos mais complexos e `Folium` para mapas.

## Diagrama de Classes

O diagrama de classes na figura \ref{fig:classes} ilustra a estrutura do sistema, destacando as relações entre os principais componentes. Ele serve como uma referência para o desenvolvimento e manutenção do sistema.

\begin{figure}[!h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/classes.png}
    \caption{Diagrama de Classes}
    \label{fig:classes}
\end{figure}

<!-- 
---
config:
  theme: mc
  look: handDrawn
  layout: elk
---
classDiagram
    class HomePage {
        - dados: DataFrame
        - session_state
        + init_page()
        + load_data()
        + render_map()
    }
    class DadosPage {
        - dados: DataFrame
        - session_state
        + init_page()
        + load_data()
        + render_table()
        + render_chart()
    }
    class SobrePage {
        - session_state
        + init_page()
        + render_text()
    }
    class Utils {
        - assets_path
        + init_page()
        + load_data()
    }
    class DataFrame {
        - DT_NOTIFIC
        - DT_NASC
        - NU_IDADE_N
        - OUT_VEZES
        - LES_AUTOP
        - VIOL_FISIC
        - VIOL_PSICO
        - VIOL_SEXU
        - NUM_ENVOLV
        - AUTOR_SEXO
        - ORIENT_SEX
        - IDENT_GEN
        - LOCAL_OCOR
        - ID_MN_RESI
        - CS_RACA
        - CS_SEXO
    }
    HomePage -> Utils : Usa
    DadosPage -> Utils : Usa
    SobrePage -> Utils : Usa
    HomePage -> DataFrame : Manipula
    DadosPage -> DataFrame : Manipula
 -->

### Estilo Arquitetural e Tecnologias Utilizadas

O sistema segue um estilo arquitetural baseado em **Camadas**, onde cada camada é responsável por uma parte específica da aplicação, garantindo modularidade, escalabilidade e facilidade de manutenção. Essa abordagem permite separar as responsabilidades de forma clara, facilitando o desenvolvimento e a evolução do sistema.

Embora a arquitetura em camadas utilizada no sistema compartilhe semelhanças com o padrão **MVC (Model-View-Controller)**, há diferenças importantes. No MVC, a camada de **Model** é responsável pela lógica de dados e regras de negócio, enquanto a **View** lida com a interface do usuário e o **Controller** atua como intermediário, gerenciando as interações entre as outras duas camadas. Já na arquitetura em camadas adotada aqui, as responsabilidades são distribuídas de forma mais granular: a camada de dados (equivalente ao Model) é separada da lógica de negócio, enquanto a camada de visualização (similar à View) é complementada por uma camada de interface do usuário (UI), que foca na interação direta com o usuário. Essa abordagem modular proporciona maior flexibilidade e facilita a manutenção e evolução do sistema.

#### Tecnologias Definidas:
- **Streamlit:** Utilizado para a construção da interface do usuário (UI). Essa tecnologia permite o desenvolvimento rápido de aplicações web interativas, com suporte nativo para gráficos, tabelas e widgets como sliders e caixas de seleção.
- **Pandas:** Biblioteca essencial para manipulação e análise de dados. É utilizada para realizar a leitura de arquivos CSV, transformação de dados e cálculos necessários para a lógica de negócio.
- **Python:** Linguagem principal do sistema, escolhida por sua simplicidade, vasta comunidade e integração com as bibliotecas mencionadas.

#### Especificações:
- **Leitura de Arquivos CSV:** A biblioteca `pandas` é utilizada para carregar e processar os dados de arquivos CSV. Isso permite que o sistema manipule grandes volumes de dados de forma eficiente.
- **Estrutura Modular:** Cada camada (UI, Dados, Lógica de Negócio e Visualização) é implementada como um módulo separado, promovendo a reutilização de código e a independência entre os componentes.
- **Persistência de Estado:** O controle de estado é gerenciado pelo `st.session_state` do Streamlit, garantindo que as interações do usuário sejam mantidas durante a sessão.

#### Exemplo de Integração:
Abaixo está um exemplo de como as tecnologias podem ser integradas para realizar a leitura de um arquivo CSV armazenado localmente e exibir os dados na interface:

```python
import pandas as pd
import streamlit as st

# Função para carregar os dados
@st.cache
def load_data():
    # Caminho do arquivo CSV armazenado localmente
    file_path = "dados/dataset.csv"
    data = pd.read_csv(file_path)
    return data

# Interface do usuário
st.title("Análise de Dados")
st.write("Carregando os dados para análise...")

# Carregar os dados
data = load_data()

# Exibir os dados na interface
st.write("Prévia dos Dados:")
st.dataframe(data.head())

st.selectbox('Município:', ['Opção 1', 'Opção 2', 'Opção 3'], key='municipio', on_change=disable_map, placeholder='Selecione uma opção')

mapa_container = st.container()
if st.session_state.mostrar_mapa:
    with mapa_container:
        st.map()

```

Nesse cenário, o arquivo CSV está armazenado localmente no diretório `dados/` e é carregado automaticamente pelo sistema. Essa abordagem elimina a necessidade de upload manual, garantindo que os dados estejam sempre disponíveis para análise. Além disso, o uso do decorador `@st.cache` otimiza o desempenho, evitando recarregamentos desnecessários durante a execução da aplicação. O `st.session_state` é usado como exemplo para controlar a exibição do mapa, garantindo que a exibição do mapa seja consistente durante a sessão (`st.session_state.mostrar_mapa`) e também para armazenar o muunicípio selecionado pelo usuário (`st.session_state.municipio`).

Com essa configuração, o sistema mantém uma arquitetura robusta e eficiente, pronta para consumir e analisar os dados de forma automatizada.


# Infraestrutura Física (Streamlit Cloud - Opção Gratuita)

## Servidores

#### Tipo e especificação
A infraestrutura física do sistema é baseada no uso do Streamlit Cloud, uma solução de computação em nuvem que oferece uma plataforma robusta e escalável para hospedar aplicações web. Essa escolha elimina a necessidade de configuração manual de servidores e manutenção direta, permitindo que o foco principal seja o desenvolvimento e a melhoria contínua do sistema.

#### Gerenciamento e escalabilidade
Os servidores utilizados são gerenciados pelo próprio Streamlit Cloud, que opera em infraestruturas de ponta, como AWS, Google Cloud Platform (GCP) e Microsoft Azure. Essa abordagem garante alta disponibilidade, desempenho consistente e escalabilidade automática, ajustando-se à demanda de usuários e à carga de trabalho. Além disso, a conectividade é assegurada por redes de alta velocidade, com baixa latência e confiabilidade, otimizadas por balanceamento de carga e gerenciamento de tráfego.

## Redes

A segurança é um aspecto central dessa infraestrutura. Todo o tráfego entre o cliente e o servidor é criptografado por meio do protocolo HTTPS, garantindo a proteção dos dados em trânsito. As configurações de rede são gerenciadas pelo Streamlit Cloud, incluindo balanceamento de carga e otimização de tráfego para garantir desempenho consistente. Além disso, o Streamlit Cloud oferece recursos de segurança avançados, como firewalls e autenticação de usuários, garantindo a proteção dos dados e acesso autorizado.

## Dispositivos e Outros Recursos Físicos

#### Armazenamento:

O armazenamento de dados é realizado em nuvem, oferecendo escalabilidade e segurança. Essa solução suporta diversos formatos de arquivos, como CSV e Excel, além de permitir integração com bancos de dados externos via APIs. 

#### Fonte de Alimentação e Resfriamento:
  
Os data centers que hospedam essa infraestrutura contam com sistemas de redundância para evitar falhas, além de sistemas de resfriamento eficientes para manter a temperatura ideal dos servidores.

#### Segurança Física:

A segurança física desses locais é garantida por medidas como controle de acesso biométrico, vigilância 24/7 e equipes de segurança dedicadas.

## Considerações de Segurança e Manutenção

#### Atualizações e Patches:
A manutenção e a atualização do ambiente são gerenciadas automaticamente pelo Streamlit Cloud, garantindo que o sistema esteja sempre atualizado com as últimas correções de segurança. O monitoramento contínuo da infraestrutura permite identificar e resolver problemas de desempenho ou segurança de forma proativa. Além disso, logs de auditoria estão disponíveis para rastrear atividades e garantir conformidade com padrões de segurança.

#### Suporte
O suporte técnico é oferecido por meio de fóruns e comunidades para a versão gratuita, enquanto opções premium estão disponíveis para usuários que necessitam de acordos de nível de serviço (SLA) mais rigorosos.

Essa infraestrutura física, combinando escalabilidade, segurança e facilidade de gerenciamento, é essencial para garantir a confiabilidade e o desempenho do sistema, atendendo às necessidades dos usuários de forma eficiente e segura.
