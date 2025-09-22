---
pretitle: Pró-Reitoria Acadêmica
title: "Curso de Tecnologia em Análise e Desenvolvimento de Sistemas
"
subtitle: "AT1 N1"
author:
  - name: Priscila Pereira Nunes
    affiliation: Universidade Católica de Brasília
    location: Brasília, Brazil
professor: 
  name: Zoe Roberto Magalhaes Junior
  title: Professor
disciplina: Teste de Software
pdfsubject: Markdow example for LaTeX
keywords: 
    - Markdown
    - Example
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
toc: true
lof: false
biblio-style: abntex2-alf
# toc-own-page: true
disable-header-and-footer: true
toc-title: Sumário
biblio-title: Referências Bibliográficas
biblatexoptions:
  - backend=biber
  - style=numeric
---


# Documentação do Projeto Fique Segura

## 1. Escopo do Projeto

### Objetivo Geral
Democratizar o acesso a informações sobre crimes de violência contra a mulher no Brasil, reunindo, processando e apresentando dados oficiais de forma clara, acessível e visual, promovendo a conscientização, o empoderamento e apoiando a tomada de decisões por gestoras, pesquisadoras e toda a sociedade.

### Objetivos Específicos

- Centralizar dados oficiais sobre violência de gênero, especialmente em Minas Gerais.
- Oferecer ferramentas interativas para consulta de estatísticas segmentadas por município, estado, tipo de crime e faixa etária.
- Facilitar a identificação de padrões e tendências regionais por meio de mapas, gráficos e tabelas.
- Promover a transparência e a atualização dos dados, respeitando princípios de privacidade e anonimização.
- Apoiar o desenvolvimento de políticas públicas, pesquisas acadêmicas e ações de prevenção e combate à violência.


## 2. Regras de Negócio

### Premissas

- Todos os dados utilizados são públicos, oficiais e respeitam a privacidade e anonimização das vítimas.
- A aplicação se destina inicialmente ao estado de Minas Gerais, podendo ser expandida conforme disponibilidade de dados de outros estados.
- Os dados são atualizados conforme a liberação de novos conjuntos pelas fontes oficiais.
- O sistema deve garantir praticidade, transparência e acessibilidade na apresentação das informações.
- O acesso à aplicação é público, sem necessidade de autenticação.

### Restrições

- Apenas dados disponíveis em fontes confiáveis e públicas (ex: SES, Dados Abertos) são utilizados.
- A aplicação não permite edição, inclusão ou exclusão direta de dados pelos usuários finais.
- Não são apresentados dados que possam identificar direta ou indiretamente vítimas ou agressores.


## 3. Regras de Negócio como Histórias de Usuário

- Como cidadã/cidadão, quero acessar informações sobre violência contra a mulher em minha cidade ou estado para me conscientizar e atuar na prevenção.
- Como pesquisadora, quero extrair estatísticas detalhadas para apoiar estudos acadêmicos sobre violência de gênero.
- Como gestora pública, quero visualizar dados agregados para embasar políticas públicas de combate à violência contra a mulher.
- Como usuária comum, quero entender os tipos de violência, sua distribuição geográfica e temporal.
- Como jornalista, quero consultar rapidamente dados atualizados e confiáveis para reportagens.

## 4. Perfis de Usuário do Sistema

- **Usuário Comum:** Pessoa interessada em informações sobre violência contra a mulher, seja por curiosidade, conscientização ou necessidade pessoal.
- **Pesquisadora/Acadêmica:** Usuária que busca dados detalhados para análises, pesquisas ou estudos acadêmicos.
- **Gestora Pública:** Profissional responsável por políticas públicas, tomada de decisão ou implementação de ações de prevenção e combate à violência.
- **Jornalista:** Profissional de imprensa que busca dados para reportagens e comunicação social.


## 5. Histórias de Usuário como Expectativas dos Perfis

### Usuário Comum
- Espera visualizar mapas e gráficos interativos de forma simples e intuitiva.
- Deseja filtrar e consultar informações por município, tipo de crime e faixa etária.
- Espera que os dados sejam atualizados e confiáveis.

### Pesquisadora/Acadêmica
- Espera acesso a dados segmentados e detalhados para análise.
- Deseja exportar tabelas ou visualizar métricas específicas por períodos ou categorias.

### Gestora Pública
- Espera visualizar tendências regionais para embasar decisões.
- Deseja relatórios visuais claros e exportáveis.

### Jornalista
- Espera acesso rápido a dados verídicos e atualizados.
- Deseja consultar estatísticas de forma visual para uso em matérias.


## 6. Critérios de Aceitação (Gherkin)

### História 1: Visualizar dados agregados por município

```gherkin
Cenário: Usuário visualiza estatísticas de violência por município
  Dado que estou na página principal da aplicação
  Quando seleciono um município no filtro
  Então devo ver mapas, gráficos e tabelas atualizados com os dados daquele município
  E os dados exibidos devem ser provenientes de fontes oficiais
  E nenhuma informação deve identificar individualmente vítimas ou agressores
```

### História 2: Filtrar dados por tipo de crime e faixa etária

```gherkin
Cenário: Usuário filtra por tipo de crime e faixa etária
  Dado que acesso a interface de filtros
  Quando seleciono um tipo de crime e uma faixa etária
  Então devo ver os gráficos e tabelas refletindo apenas os dados filtrados
  E a filtragem deve ser aplicada instantaneamente
```

### História 3: Garantir atualização dos dados

```gherkin
Cenário: Usuário acessa dados atualizados
  Dado que um novo conjunto de dados oficiais foi disponibilizado
  Quando acesso a aplicação web
  Então devo visualizar os dados mais recentes disponíveis
  E a origem e data da última atualização devem estar visíveis
```

### História 4: Exportar dados para análise

```gherkin
Cenário: Pesquisadora exporta dados para análise externa
  Dado que estou visualizando uma tabela de dados filtrada
  Quando clico na opção de exportar
  Então devo receber um arquivo em formato CSV ou similar apenas com os dados filtrados
```

### História 5: Garantia de anonimização

```gherkin
Cenário: Garantir privacidade das vítimas
  Dado que estou visualizando qualquer dashboard ou tabela
  Então não devo encontrar informações que permitam identificar diretamente vítimas ou agressores
  E todos os dados pessoais devem estar anonimizados
```

### História 6: Interação dinâmica com mapas e gráficos

```gherkin
Cenário: Usuário interage com filtros para refinar visualização
  Dado que estou na página principal da aplicação
  Quando seleciono filtros como município, tipo de crime ou faixa etária
  Então os mapas e gráficos devem ser atualizados dinamicamente conforme minha seleção
```

### História 7: Visualização inicial sem filtros obrigatórios

```gherkin
Cenário: Usuário acessa a página sem selecionar filtros
  Dado que acesso a página inicial da aplicação
  Então devo visualizar uma visão geral das informações disponíveis
  E os filtros devem ser opcionais, não obrigatórios para exibir dados gerais
```

### História 8: Visualização detalhada ao selecionar município

```gherkin
Cenário: Usuário seleciona um município para visualizar detalhes
  Dado que estou na página principal
  Quando seleciono um município específico no filtro
  Então devo visualizar mapas, gráficos e tabelas com dados detalhados desse município
```

### História 9: Garantia de atualização automática dos dados

```gherkin
Cenário: Dados são atualizados automaticamente conforme novas fontes oficiais
  Dado que uma nova versão dos dados é disponibilizada pela fonte oficial
  Quando um usuário acessa a aplicação
  Então os dados mais recentes devem ser carregados e exibidos automaticamente
```


### História 10: Garantia de privacidade e anonimização

```gherkin
Cenário: Nenhuma informação pessoal identificável é exibida
  Dado que visualizo qualquer dashboard, gráfico ou tabela
  Então nenhuma informação que permita identificar vítimas ou agressores deve ser exibida
  E todos os dados sensíveis devem estar anonimizados
```

### História 11: Facilidade para desenvolvedores e contribuidores

```gherkin
Cenário: Desenvolvedora deseja instalar, rodar ou testar a aplicação
  Dado que sou uma nova desenvolvedora ou colaboradora
  Quando acesso o README.md do projeto
  Então devo encontrar instruções claras para instalação, execução, testes e contribuição
```

### História 12: Deploy automático no Streamlit Cloud após commit na branch padrão

```gherkin
Cenário: Deploy automático após commit na branch padrão
  Dado que sou desenvolvedora e faço um commit na branch padrão do repositório
  Quando o commit é realizado com sucesso
  Então a aplicação deve ser automaticamente atualizada/deployada em fiquesegura.streamlit.app
  E a versão mais recente deve estar disponível para todos os usuários
```

### História 13: Execução automática dos testes no CI

```gherkin
Cenário: Execução dos testes automatizados no workflow de integração contínua
  Dado que um commit ou pull request é aberto no repositório
  Quando o workflow de CI é iniciado
  Então todos os testes automatizados devem ser executados
  E o resultado dos testes deve estar disponível para análise no GitHub Actions
  E o deploy só deve ocorrer se todos os testes passarem
```

### História 14: Feedback rápido de falha nos testes

```gherkin
Cenário: Falha nos testes bloqueia deploy e notifica a equipe
  Dado que um commit contém código que faz algum teste falhar
  Quando o workflow de CI é executado
  Então o deploy automático deve ser bloqueado
  E uma notificação de falha deve ser apresentada ao desenvolvedor responsável
```

### História 15: Facilidade para adicionar novos testes

```gherkin
Cenário: Desenvolvedora adiciona novos testes ao projeto
  Dado que o projeto possui uma estrutura clara para testes automatizados
  Quando adiciono um novo arquivo de teste no diretório apropriado
  Então o CI deve detectar e executar automaticamente este novo teste nos próximos commits ou pull requests
  E o resultado do teste deve ser apresentado juntamente com os demais testes existentes
```