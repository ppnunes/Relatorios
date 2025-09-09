---
pretitle: Pró-Reitoria Acadêmica
title: "Curso de Tecnologia em Análise e Desenvolvimento de Sistemas
"
subtitle: "Estudo de Caso Apagão Cibernético"
author:
  - name: Example Author
    affiliation: Universidade de Brasília
    location: Brasília, Brazil
    email: user@mail.com
  - name: Another Author
    affiliation: Universidade Católica de Brasília
    location: Brasília, Brazil
    email: user2@mail.com
  - name: And The Last Author
    affiliation: Universidade Católica de Brasília
    location: Brasília, Brazil
    email: user2@mail.com
professor: 
  name: Hélio Guilherme Dias Silva
  title: Professor
disciplina: Qualidade de Software e Governança
pdfsubject: Markdow example for LaTeX
keywords: 
    - Markdown
    - Example
type: SPECIFICATION
status: DRAFT
bibliography: bibliography.bib
csl: abnt-ibid.csl
date: "2024"
mainfont: Arial
fontsize: 12pt
# numbersections: yes
lang: pt
cover: yes
nocite: yes # Includes all entries in bibliography.bib file
titlepage: true
book: true
titlepage-background: assets/cover.pdf
toc: true
lof: true
biblio-style: abntex2-alf
# toc-own-page: true
disable-header-and-footer: true
toc-title: Sumário
biblio-title: Referências Bibliográficas
biblatexoptions:
  - backend=biber
  - style=numeric
---

# Análise Técnica

No site da desenvolvedora, é possível encontrar informações sobre a arquitetura e as estratégias utilizadas no jogo. Na investigação da arquitetura empregada, utilizou-se a extensão Chrome Wappalyzer e acessamos o jogo pelo site da PGgames[@pgsoft_2024_fortune;@pg_nmaga]. Essa ferramenta permitiu observar informações que revelam pontos-chave na arquitetura do jogo. A engine Cocos2d[@cocos_2024_about], uma conhecida engine open-source para desenvolvimento de jogos 2D, foi utilizada para a criação do jogo. Além disso, devido à exportação do jogo como HTML5, ele pode ser facilmente hospedado em uma rede de distribuição de conteúdo (CDN) na Amazon CloudFront (AWS). Observamos também a presença do Google Tag Manager, que é utilizado para a telemetria da aplicação. 

Quanto à interface do usuário (UI) e à experiência do usuário (UX) do jogo, o que se observa é um modelo padrão para jogos do tipo. O jogo apresenta um design colorido, com predominância de tons vermelhos e amarelos, e botões de ação claros, como o botão verde central, que pisca para iniciar a rodada. Um texto chamativo informa os potenciais ganhos da aposta, e o ambiente remete a uma máquina de caça-níqueis.

Sobre o algoritmo, as informações disponíveis na página da PGgames nos permitem identificar alguns aspectos relevantes, especialmente a função utilizada para a geração de números aleatórios. Esta função é composta por duas partes. A primeira, chamada byteGenerator, recebe quatro parâmetros e gera um hash HMAC utilizando o algoritmo SHA-256. Este hash é então utilizado pela função generateFloats para criar um número entre 0 e 1. É importante notar que nenhuma dessas funções é estocástica, de modo que a aleatoriedade é garantida unicamente pelos parâmetros de entrada. Essa abordagem de utilizar funções determinísticas na produção de números aleatórios é comum em jogos de azar e é conhecida como “comprovadamente justa” ("provably fair") tal como apresentado por [@google_2024_tag].

Entretanto, há um ponto importante a ser observado no trecho de código apresentado pela PGgames. Ambas as funções utilizam quatro parâmetros: serverSeed, clientSeed, nonce, cursor e count. Contudo, as variáveis clientSeed e nonce não são devidamente empregadas nas funções, de maneira que a aleatoriedade depende exclusivamente do valor de serverSeed. Assim, é altamente questionável considerar a solução apresentada no site como um caso de "provably fair".

Oberver a figura \ref{lena}.
Oberver a figura \ref{fig:lena}.

![Lena is over here \label{lena}](assets/lena.png)

\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/lena.png}
    \caption{Legenda da figura}
    \label{fig:lena}
\end{figure}
