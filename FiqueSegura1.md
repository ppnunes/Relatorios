---
pretitle: Pró-Reitoria Acadêmica
title: "Curso de Tecnologia em Análise e Desenvolvimento de Sistemas
"
subtitle: "Fique Segura - Requisitos Não Funcionais e Regras de Negócio"
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

# Requisitos Não Funcionais
O Fique Segura é uma aplicação web que reúne dados oficiais de crimes de violência contra a mulher e apresenta essas informações para o usuário de forma clara, utilizando números, mapas e gráficos. Os requisitos não funcionais da aplicação garantem que o sistema seja confiável, seguro, escalável e de fácil uso.

Em termos de **desempenho**, a aplicação precisa ser ágil, respondendo às consultas dos usuários em até três segundos e suportar usuários simultâneos sem comprometer o desempenho. Além disso, o processamento e a atualização dos dados devem ocorrer de forma eficiente, garantindo que as informações sejam atualizadas sem impactar negativamente o desempenho do sistema.

Quanto à **escalabilidade**, a aplicação deve ser capaz de escalar horizontalmente, adicionando mais instâncias de servidor conforme a demanda aumenta. A **disponibilidade** do sistema deve ser 24/7, com um uptime de 99,9%.

Em questão de **segurança**, tdos os dados devem ser criptografados, utilizando HTTPS, tanto em trânsito quanto em repouso. Além disso, é necessário proteger o sistema contra ataques comuns, como SQL Injection e Distributed Denial of Service (DDoS).

A **usabilidade** da aplicação deve ser priorizada, com uma interface intuitiva e de fácil navegação, que funcione bem tanto em dispositivos móveis quanto em desktops. A **acessibilidade** deve seguir as diretrizes WCAG (Web Content Accessibility Guidelines) para garantir que pessoas com deficiências possam utilizar o sistema. A **manutenibilidade** do código e da infraestrutura deve ser facilitada por meio de uma documentação clara e completa, além de uma arquitetura modular que permita a adição de novas funcionalidades sem impactar o sistema existente.

A **testabilidade** da aplicação inclui a implementação de testes unitários, de integração e de carga, além da disponibilidade de ambientes de teste separados para desenvolvimento, homologação e produção.

# Regras de Negócio

A coleta de dados deve ser realizada exclusivamente a partir de fonte oficial e confiável, como órgãos governamentais, polícias federal, civil e militar, e institutos de pesquisa reconhecidos. Os dados devem ser atualizados periodicamente, dependendo da disponibilidade das fontes.

A apresentação dos dados deve ser clara e intuitiva, permitindo que os usuários busquem as informações por estado, cidade, município e tipo de crime.. A aplicação deve gerar um mapa de calor que destaque as áreas com maior incidência, além de fornecer rankings de estados, cidades ou municípios com os maiores índices de violência. Gráficos devem ser disponibilizados para facilitar a compreensão dos dados e a utilização de linguagem simples e acessível, evitando termos técnicos que possam dificultar a compreensão.

A privacidade e a segurança dos dados é crucial, e os mesmos já são obtidos com a anonimização de informações pessoais de vítimas ou envolvidos para garantir a conformidade com a Lei Geral de Proteção de Dados (LGPD) desde a disponibilização pelas fontes oficiais citadas.

A aplicação deve oferecer funcionalidades que atendam às necessidades dos usuários podendo acessar os dados públicos sem necessidade de cadastro, visando a facilidade e rapidez na obtenção de informação. O administrador é o único usuário com a possibilidade de personalizar painéis de visualização de dados e modificar filtros para consultas.

A transparência deve ser priorizada, com informações claras sobre as fontes dos dados, a metodologia de coleta e os critérios de análise.

A aplicação deve assumir uma responsabilidade social e educativa. Informações de apoio, como links ou contatos de organizações que ajudam vítimas de violência, como delegacias da mulher, centros de acolhimento e serviços de assistência psicológica devem ser oferecidos.
