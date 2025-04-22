---
pretitle: Pró-Reitoria Acadêmica
title: "Curso de Tecnologia em Análise e Desenvolvimento de Sistemas
"
subtitle: "Fique Segura"
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

# Origem dos dados

A aplicação Fique Segura não faz uso de um banco de dados. As informações apresentadas ao usuário são provenientes de um banco de dados disponibilizado pela plataforma Dados Abertos do Governo Federal.

Os dados utilizados contém registros de violência contra a mulher no estado de Minas Gerais a partir de ocorrências feitas na Polícia Civil do estado. A amostragem utilizada contempla as ocorrências fdos anos 2022 e 2023 e está disponível em [https://dados.gov.br/dados/conjuntos-dados/violencia-contra-mulher](https://dados.gov.br/dados/conjuntos-dados/violencia-contra-mulher).


Os dados da amostragem organizados em um esquema Entidade Relacionamento:


\begin{figure}[h!]
    \centering
    \includegraphics[width=0.5\textwidth]{assets/fique_segura_bd.jpg}
    \label{fig:lena}
\end{figure}

# Utilização dos Dados

No total, 3 arquivos são utilizados para gerar as informaçlões buscadas pelo usuário:

- dois arquivos CSV contendo os dados dos anos de 2022 e 2023
- um arquivo geojson contendo os dados geográficos do Brasil

Os dois arquivos CSV são carregados em um unico dataframe, utilizando a biblioteca `pandas` do Python, para sintetizar as ocorrências de cada município. Um exemplo: O usuário seleciona o município **Belo Horizonte** e uma tabela é apresentada com as informações:
- quantidade de ocorrências
- idade média das vitimas com desvio padrão
- local onde a maioria das ocorrências aconteceram

Todas essas informações são geradas pelo dataframe, sem a necessidade de um pré-processamento, pois o dataframe é pequeno: cada arquivo CSV tem aproximadamente 5MB e um total de 74257 ocorrências após mergidos e limpos. Para gerar o resultado de uma pesquisa, são utilizadas operações de filtragem e chamada de métodos já existentes no dataframe:

```python
# Filtra-se apenas ocorrências de Belo Horizonte
df_bh = df[df['ID_MN_RESI']== "Belo Horizonte"]
```

- quantiade de ocorrências: `len(df_bh)`
- idade média das vitimas com desvio padrão: `df_bh['NU_IDADE_N'].mean()` e `df_bh['NU_IDADE_N'].std()`
- local onde a maioria das ocorrências aconteceram: `df_bh['LOCAL_OCOR'].value_counts().idxmax()`

O arquivo geojson é usado exclusivamente para apresentar o mapa de calor. Ele é semelhante a um dataframe, com as colunas `ID_MN_RESI` com o nome do município e a coluna `geometry` com uma lista de pontos (coordenadas geograficas) que formam o município no mapa. Ao se carregar o geojson, é incluida uma terceira coluna, contendo a quantidade de ocorrência do respectivo municipio. Assim podemos utilizar essa terceira coluna como referência para o espectro de calor do mapa.

