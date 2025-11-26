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
Democratizar o acesso a informações sobre crimes de violência contra a mulher no Brasil, reunindo, processando e apresentando dados oficiais de forma clara, acessível e visual, apoiando a informação, a prevenção e a tomada de decisão.

### Objetivos Específicos

- Centralizar dados oficiais sobre violência de gênero, especialmente em Minas Gerais.
- Oferecer ferramentas interativas para consulta de estatísticas segmentadas por município, estado, tipo de crime e faixa etária.
- Facilitar a identificação de padrões e tendências regionais por meio de mapas, gráficos e tabelas.
- Oferecer exportação de dados e relatórios (CSV/PDF).
- Promover a transparência e a atualização dos dados, respeitando princípios de privacidade e anonimização.


## 2. Regras de Negócio

### Premissas

- RN1: Todas as informações exibidas devem ser provenientes de fontes oficiais previamente definidas (ex.: bases governamentais) e ser identificadas na interface.
- RN2: Dados pessoais identificáveis NÃO devem ser exibidos ou exportados; somente dados agregados por região/período.
- RN3: Os filtros (tempo/região/tipo de crime) aplicam-se aos indicadores e ao mapa de forma consistente.
- RN4: A exportação de dados respeita o nível de agregação aplicado pelos filtros (o arquivo exportado reflete exatamente a visualização atual).
- RN5: O sistema deverá exibir uma nota de rodapé ou disclaimer caso houver limitações dos dados (atrasos de atualização, diferenças de fontes).

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


## 5. Análise de qualidade (ISO 25010)

- Adequação Funcional
  - Avaliação: O sistema deve fornecer dados corretos, completos e atuais.
  - Métricas: % de consultas com resultados corretos; cobertura geográfica.

- Desempenho
  - Avaliação: Testes de carga e estresse.
  - Metas: 95% < 500ms até 2000 usuários; 95% < 1500ms sob stress; taxa de erro < 1% em carga, < 10% em stress.

- Compatibilidade
  - Avaliação: Deve suportar principais navegadores e dispositivos móveis.
  - Métricas: Funcionamento em Chrome, Firefox, Safari, Edge, e responsividade em resoluções comuns.

- Confiabilidade
  - Avaliação: A aplicação deve funcionar sem falhas, 24/7.
  - Métricas: Uptime >= 99%; recuperação em caso de falha < 1h.

- Segurança
  - Avaliação: Crítica — proteção de dados, segurança de acesso e anonimização.
  - Métricas: Ausência de vulnerabilidades críticas.

- Manutenibilidade
  - Avaliação: cobertura de testes unitários/integrados, modularidade do código (views/ e main.py), qualidade do CI.
  - Métricas: cobertura de testes (%).


## 6. Análise de risco

- R1: Fonte de dados oficial muda formato / torna-se indisponível
  - Probabilidade: média
  - Impacto: alto (quebra das visualizações)
  - Mitigação: implementar pipeline de ingestão tolerante a mudanças, versionamento das fontes, alertas de falha; cache local; fallback com dados históricos.

- R2: Exposição acidental de dados pessoais
  - Probabilidade: baixa
  - Impacto: muito alto
  - Mitigação: previsão de exports, testes de segurança, anonimização/agregação obrigatória.

- R3: Problemas de performance em picos de uso
  - Probabilidade: média
  - Impacto: médio
  - Mitigação: usar testes, otimizar consultas, caching no front-end.

- R4: Dependências desatualizadas / incompatibilidades Python/Streamlit
  - Probabilidade: média
  - Impacto: médio
  - Mitigação: manter pyproject.toml atualizado, CI com checks de compatibilidade, política de atualizações regulares.

- R5: Problemas de segurança (XSS).
  - Probabilidade: Média
  - Impacto: Alto
  - Mitigação: Revisão de código, testes de segurança, uso de frameworks seguros.


  ## 7. Levantamento de requisitos

7.1 Requisitos funcionais

- RF1: Importar e atualizar conjuntos de dados públicos com informações sobre incidentes de violência.
- RF2: Filtrar e buscar incidentes por local (país/região/estado/município), período e tipo de violência.
- RF3: Gerar visualizações: mapas, gráficos de séries temporais e tabelas.
- RF4: Exibir informações de serviços de apoio por localidade (telefones, endereços, links).
- RF5: Exportar relatórios em CSV/PDF para análise offline.
- RF6: Registrar métricas de uso anônimas para análise.
- RF7: Permitir atualização manual de contatos de serviços por administradores autenticados.

7.2 Requisitos não funcionais

- RNF1: Segurança — todo tráfego via HTTPS; proteção contra vulnerabilidades.
- RNF2: Privacidade — dados com identificação pessoal não devem ser exibidos.
- RNF3: Performance — tempo de resposta médio < 2s para consultas comuns.
- RNF4: Disponibilidade — serviço com uptime >= 99%.
- RNF5: Manutenibilidade — cobertura de testes automatizados >= 60% inicialmente.
- RNF6: Escalabilidade — capaz de escalar horizontalmente conforme aumento de uso.

## 8. Critérios de aceitação

- AC1 — Filtragem e busca corretas
  - Descrição: Filtros por local de ocorrência, período e tipo de violência retornam resultados corretos e consistentes com os dados fonte.
  - Requisitos associados: RF2
  - Métrica de aceitação: 95% das consultas de aceitação retornam resultados esperados; tempo de resposta < 2s em cenário normal.

- AC2 — Visualizações consistentes e responsivas
  - Descrição: Mapas, gráficos de séries e tabelas exibem dados corretos, com agregação consistente e interação responsiva em desktop e mobile.
  - Requisitos associados: RF3
  - Métrica de aceitação: Visualizações acionam sem erros e refletem os filtros aplicados; tempo de renderização aceitável (mapas < 3s).

- AC3 — Exportação segura de relatórios
  - Descrição: Exportações CSV/PDF correspondem aos filtros aplicados e não contêm dados pessoais identificáveis.
  - Requisitos associados: RF5, RNF2
  - Métrica de aceitação: Amostra de 100 exports contém 0 PII; arquivos correspondem aos filtros.

- AC4 — Registro anônimo de métricas
  - Descrição: Métricas de uso são coletadas anonimamente sem capturar PII e estão disponíveis para análise.
  - Requisitos associados: RF6, RNF2
  - Métrica de aceitação: Logs de métricas não contêm campos com PII; dashboard analítico mostra eventos esperados.

- AC5 — Resiliência a picos de carga
  - Descrição: Sob cenário de pico definido, a aplicação mantém respostas aceitáveis provenientes de caching e otimizações.
  - Requisitos associados: RNF3, RNF6
  - Métrica de aceitação: Em teste de carga definido (por exemplo, X req/s), 95% das requisições têm latência < 2s; cache reduz carga nas fontes em ≥ Y%.

- AC6 — Gestão de dependências e compatibilidade
  - Descrição: Dependências (Python/Streamlit etc.) estão testadas na CI e incompatibilidades são detectadas antes do deploy.
  - Requisitos associados: RNF5
  - Métrica de aceitação: CI falha quando incompatibilidades são detectadas; testes de compatibilidade automatizados executados em PRs.

- AC7 — Processo de anonimização verificado
  - Descrição: Antes de exibir ou exportar, dados passam por processo de anonimização/agregação comprovado por testes automatizados.
  - Requisitos associados: RNF2
  - Métrica de aceitação: Auditoria de amostra (automática) retorna 0 registros com PII; processo de anonimização documentado e testado.

## Matriz de Rastreabilidade

| Critério (AC) | Requisitos associados | Riscos mitigados |
|---|---|---|
| AC1 — Filtragem e busca corretas | RF2 | R3 |
| AC2 — Visualizações consistentes e responsivas | RF3 | R3 |
| AC3 — Exportação segura de relatórios | RF5, RNF2 | R2 |
| AC4 — Registro anônimo de métricas | RF6, RNF2 | R2 |
| AC5 — Resiliência a picos de carga | RNF3, RNF6 | R3 |
| AC6 — Gestão de dependências e compatibilidade | RNF5 | R4 |
| AC7 — Processo de anonimização verificado | RNF2 | R2 |
