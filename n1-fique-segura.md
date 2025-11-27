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
toc-own-page: true
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

### 7.1 Requisitos funcionais


- RF1: Importar e atualizar conjuntos de dados públicos com informações sobre incidentes de violência.
- RF2: Filtrar e buscar incidentes por local (país/região/estado/município), período e tipo de violência.
- RF3: Gerar visualizações: mapas, gráficos de séries temporais e tabelas.
- RF4: Exibir informações de serviços de apoio por localidade (telefones, endereços, links).
- RF5: Exportar relatórios em CSV/PDF para análise offline.
- RF6: Registrar métricas de uso anônimas para análise.
- RF7: Permitir atualização manual de contatos de serviços por administradores autenticados.

### 7.2 Requisitos não funcionais

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


## 9. Modelagem de Testes

### Abordagem de Testes

A estratégia de testes da aplicação FiqueSegura contempla testes automatizados de unidade, integração, aceitação e carga/estresse, utilizando as ferramentas pytest (Python) e Grafana k6 (performance). O objetivo é garantir a qualidade, segurança, desempenho e conformidade com os requisitos funcionais e não funcionais definidos.

### Ferramentas Utilizadas

- **Pytest:** Testes unitários, integração e aceitação.
- **Grafana k6:** Testes de carga e estresse, monitoramento de desempenho.

### Descrição dos Casos de Teste Implementados

### Testes Automatizados (Pytest)

- **test_dados.py:** Valida importação, atualização e filtragem dos dados públicos (RF1, RF2).
- **test_home.py:** Verifica a renderização correta da página inicial e visualizações (RF3).
- **test_sobre.py:** Testa exibição de informações institucionais e de apoio (RF4).
- **test_utils_.py:** Garante funcionamento de funções utilitárias, incluindo anonimização e exportação (RF5, RNF2).

### Testes de Performance (Grafana k6)

- **k6_fiquesegura_load_test.js:** Simula carga de até 2000 usuários, medindo tempo de resposta e taxa de erro (RNF3, RNF6).
- **k6_fiquesegura_stress_ui.js:** Avalia comportamento sob picos de uso, verificando latência e resiliência (RNF3, RNF6).

### Procedimento de Testes

- **Unitários/Integração:** Executados via pytest, scripts em tests.
- **Performance:** Scripts k6 em tests, resultados em results.
- **Aceitação:** Casos definidos na seção Critérios de Aceitação, validados manualmente e por automação.
- **Risco:** Testes específicos para cenários críticos, executados periodicamente ou em cada release.

### Taxa de Cobertura

- **Cobertura de testes automatizados:** ≥ 60% (meta inicial, conforme RNF5).
- **Cobertura de requisitos:** Todos os requisitos funcionais e não funcionais possuem ao menos um teste de aceitação planejado.

### Matriz de Rastreabilidade — Testes de Aceitação x Requisitos

| Teste de Aceitação                | Teste Implementado           | Requisitos Relacionados |
|-----------------------------------|------------------------------|-------------------------|
| Filtragem e busca corretas        | test_dados.py                | RF2                     |
| Visualizações consistentes        | test_home.py                 | RF3                     |
| Exportação segura de relatórios   | test_utils_.py               | RF5, RNF2               |
| Registro anônimo de métricas      | test_utils_.py               | RF6, RNF2               |
| Resiliência a picos de carga      | k6_fiquesegura_load_test.js, k6_fiquesegura_stress_ui.js | RNF3, RNF6              |
| Gestão de dependências            | CI (workflow .github/)       | RNF5                    |
| Processo de anonimização verificado| test_utils_.py               | RNF2                    |


### Matriz de Rastreabilidade — Testes de Risco x Riscos

| Teste de Risco                  | Teste Implementado           | Risco Mitigado |
|---------------------------------|------------------------------|---------------|
| Ingestão tolerante de dados     | test_dados.py                | R1            |
| Teste de anonimização/exportação| test_utils_.py               | R2            |
| Teste de carga/estresse         | k6_fiquesegura_load_test.js, k6_fiquesegura_stress_ui.js | R3            |
| Teste de CI/compatibilidade     | CI (workflow .github/)       | R4            |
| Teste de segurança (XSS)        | Revisão de código, pytest    | R5            |

## 10. Planejamento de Testes

### 10.1 Estimativa de Esforço

- **Testes unitários/integrados:** 16h
- **Testes de aceitação:** 8h
- **Testes de performance:** 8h
- **Testes de risco:** 8h
- **Revisão e documentação:** 4h
- **Total estimado:** 44h

### 10.2 Cronograma

| Semana | Atividade                        | Esforço (h) |
|--------|----------------------------------|-------------|
| 1      | Testes unitários/integrados      | 8           |
| 2      | Testes unitários/integrados      | 8           |
| 3      | Testes de aceitação/performance  | 8           |
| 4      | Testes de risco, revisão         | 8           |
| 5      | Documentação, ajustes finais     | 4           |
|        | **Total**                        | **36**      |


### 10.3 Monitoramento do Progresso

- **Ferramenta:** Relatórios do CI, cobertura de testes (pytest), dashboards do Grafana k6.
- **Evolução:** O progresso deve ser monitorado semanalmente, comparando esforço realizado vs. estimado.
- **Exemplo de evolução:** Se 18h de tarefas concluídas, progresso = 18/36 = 50%.


## 11. Implementação e execução dos testes

### 11.1 Testes Unitários

- **test_clear_names_renames_columns():**

```python
def test_clear_names_renames_columns():
    df = pd.DataFrame({'A': [1], 'B': [2]})
    renamed = clear_names(df, 'ses_columns')
    assert isinstance(renamed, pd.DataFrame)
```

**Resultado:**

O teste passou sem erros, indicando que a função clear_names() renomeia corretamente as colunas do DataFrame.

- **test_load_feminicidio_not_null():**

```python
def test_load_feminicidio_not_null():
    df = load_feminicidio()
    assert not df.empty
    assert 'municipio_fato' in df.columns
``` 

**Resultado:**

O teste passou sem erros, indicando que a função load_feminicidio() retorna dados corretos e não nulos.


### 11.2 Testes de Integração de Componentes

- **test_salvar_e_carregar_gdf_sqlite(tmp_path):**

```python
def test_salvar_e_carregar_gdf_sqlite(tmp_path):
    db_path = tmp_path / "test.db"
    gdf = gpd.GeoDataFrame({'A': [1]}, geometry=gpd.points_from_xy([0], [0]), crs="EPSG:4674")
    df_to_sqlite(gdf, "geo_tabela", str(db_path))
    gdf_carregado = gdf_from_sqlite("geo_tabela", str(db_path))
    assert isinstance(gdf_carregado, gpd.GeoDataFrame)
    assert 'geometry' in gdf_carregado.columns
```

**Resultado:**

O teste passou, atestando a integração entre df_to_sqlite e gdf_from_sqlite para GeoDataFrame.


-**test_df_to_sqlite_and_df_from_sqlite(tmp_path):**

```python
def test_df_to_sqlite_and_df_from_sqlite(tmp_path):
    db_path = tmp_path / "test.db"
    df = pd.DataFrame({'A': [1, 2], 'B': [3, 4]})
    df_to_sqlite(df, "test_table", str(db_path))
    loaded_df = df_from_sqlite("test_table", str(db_path))
    assert loaded_df is not None
    assert set(loaded_df.columns) == set(df.columns)
    assert len(loaded_df) == 2
```

**Resultado:**

O teste passou, atestando que um DataFrame pode ser salvo e recuperado do banco SQLite corretamente.


### 11.3 Testes de Interface

-**test_buscar_button():**

```python
def test_buscar_button():
    runner = ts_test.AppTest.from_file(Path(__file__).parent.parent / "views/Home.py").run()
    runner.button[0].click().run()
    runner.session_state.municipio = "Belo Horizonte" 

    assert runner.session_state.mostrar_mapa is True
    runner.button[0].click().run()
    assert runner.session_state.mostrar_mapa is False
```

**Resultado:**

O teste passou, mostrando que os botões `Buscar` e `Nova Busca` funcionam corretamente, retornando um mapa (Buscar) e retirando o mapa para uma nova busca ser feita.


- **test_mapa_container():**

```python
def test_mapa_container():
    runner = ts_test.AppTest.from_file(Path(__file__).parent.parent / "views/Home.py")
    runner.session_state.municipio = "Belo Horizonte"  
    runner.session_state.mostrar_mapa = True
    runner.run(timeout=30)

    assert any(
        "Um total de" in m.value and "ocorrências foram registradas" in m.value
        for m in runner.markdown
    )
```

**Resultado:**

O teste passou, atestando que ao buscar um município, um texto como resposta é exibido corretamente com as quantidades de ocorrências daquele local.


**Evidência dos testes unitários, de integração de componentes e de interface:**

```bash
======================== tests coverage ==========================
_______ coverage: platform darwin, python 3.13.7-final-0 _________

Name                   Stmts   Miss  Cover   Missing
------------------------------------------------------------------
main.py                   12     12     0%   1-21
tests/test_dados.py       51      2    96%   77-78
tests/test_home.py        27      0   100%
tests/test_sobre.py       10      0   100%
tests/test_utils_.py      61      0   100%
utils/__init__.py        165     53    68%   11-18, 36-37, 51, 140-165, 173-182, 192-201, 232, 241-242
utils/manager.py          66     49    26%   7-11, 15-27, 31-42, 67-77, 81-104
utils/sidebar.py          11     11     0%   1-43
views/Admin.py            28     28     0%   3-52
views/Dados.py            47      0   100%
views/Home.py             55      7    87%   16-18, 42, 48, 83-84
views/Sobre.py            13      0   100%
views/__init__.py          0      0   100%
------------------------------------------------------------------
TOTAL                    546    162    70%
================== 24 passed, 8 warnings in 5.32s ================
```

### 11.4 Teste de Carga

```javascript
export let options = {
 
  stages: [
    { duration: '10s', target: 10 },   
    { duration: '1m', target: 2000 },   
    { duration: '10m', target: 2000 },   
    { duration: '15s', target: 10 },     
  ],

  thresholds: {
    http_req_duration: ['p(95)<500', 'p(99)<1200'],
    'http_req_failed': ['rate<0.01'],
  },
};
```

Essas configurações garantem que o teste simule até 2000 usuários simultâneos e valide se o sistema mantém desempenho e estabilidade sob carga.

**stages:** Define o perfil de carga, simulando ramp-up, sustentação e ramp-down de usuários virtuais, começando com 10 usuários, aumentando para 2000 e retornando para 10.

**thresholds:** limites de sucesso do teste: 95% das requisições respondidas em até 0.5 segundo e 99% respondidas em até 1.2 segundos.

**Resultado:**

Com até 2000 usuários virtuais, a taxa de resposta das requisições foi de 100%, com um total de 3.5 milhões de requisições e taxa média de 5.12k/s.

**Evidência:**

\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/carga1.png}
    \caption{Resultado teste de carga utilizando k6}
\end{figure}

\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/carga2.png}
\end{figure}


### 11.5 Teste de Estresse

```javascript
export let options = {
  stages: [
    { duration: '1m', target: 100 },     // aquecimento: 100 VUs
    { duration: '5m', target: 5000 },    // carga principal: 5000 VUs
  ],

  thresholds: {
    // 95% das requisições deve estar abaixo de 1500ms
    http_req_duration: ['p(95)<1500', 'p(99)<2000'],
    // taxa de requisições com falha (status >= 400) abaixo de 10%
    'http_req_failed': ['rate<0.1'],
  },
};
```

Configurações para que o teste avalie o desempenho da aplicação sob picos de uso:

**stages:** Simula aumento rápido de usuários virtuais até 5000, para testar o limite do sistema.

**thresholds:** Limites de sucesso do teste: 95% das requisições respondidas em até 1.5 segundos e taxa de falha abaixo de 10%.

**Resultado:**



**Evidência:**

\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/stress1.png}
    \caption{Resultado teste de estresse utilizando k6}
\end{figure}

\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/stress2.png}
\end{figure}


## 12. Gerenciamento de Defeito

A abertura de registro de corrências de bugs e defeitos, acompanhamento e fechamento são registrados em issues no repositório da solução.

### 12.1 Relatório de fechamento de defeito

**Versão de software em que defeito foi detectado:** Commit 6ef641c.

**Descrição:** Falha em teste automatizado observado a partir do commit 6ef641c.

**Teste em que o defeito foi encontrado:** test_sobre_app executado pelo CI.

**Evidência:** Mensagem do CI no pull request:

\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/pr.png}
\end{figure}

**Data de detecção:** 20/11/2025 15:41

**Análise de causa raiz:** Via log do Github Actions, no traceback do pytest, foi possível identificar falha no teste test_sobre_app  e verificar a quebra por falta de dependência (função init_page não definida).

**Ação corretiva:** Adição de dependência em views/Sobre.py.

**Ação preventiva:** Executar testes localmente e garantir que toda mudança significativa tenha cobertura de testes.

**Teste de confirmação:** Testes passam localmente e no CI. Critério: job do CI do pull request de correção passa com status verde.

**Evidência coletada:** Prints do job do CI que comprova passagem dos testes:

\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/pr2.png}
\end{figure}

**Data de correção:** 20/11/2025 15:51


## Oportunidades de Melhorias

Aumentar a cobertura de testes, incluindo testes unitários para todas as funções nos módulos `/utils`, `/views`e `main.py`;

Usar ferramentas do Streamlit para aumentar os testes de interface.

