---
pretitle: Pró-Reitoria Acadêmica
title: "Curso de Tecnologia em Análise e Desenvolvimento de Sistemas"
subtitle: "Pesquisa: Serviços que utilizam o Protocolo TCP"
author:
  - name: Priscila Pereira Nunes - UC24101571
    affiliation: Universidade Católica de Brasília
    location: Brasília, Brazil
  - name: Luis Gustavo Fernandes - UC24101537
    affiliation: Universidade Católica de Brasília
    location: Brasília, Brazil
professor: 
  name: Francisco Javier De Obaldía Díaz
  title: Professor
disciplina: Redes de Computadores
pdfsubject: Serviços que utilizam o Protocolo TCP
keywords: 
    - Markdown
    - TCP
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


# 1. Breve Resumo do Tema

O protocolo TCP (Transmission Control Protocol) é um dos pilares da camada de transporte do modelo TCP/IP, amplamente utilizado para garantir comunicação confiável entre computadores em redes locais e, principalmente, na Internet. Sua principal função é assegurar que os dados transmitidos cheguem ao destino de forma íntegra e ordenada, sendo indispensável para aplicações em que a perda ou desordem das informações não pode ser tolerada. O TCP realiza o controle de conexão, verifica a integridade dos dados e gerencia o fluxo de informações, tornando-se essencial para serviços críticos e aplicações sensíveis.

# 1.1. Breve História do TCP

O protocolo TCP foi desenvolvido na década de 1970 por Vint Cerf e Bob Kahn, como parte do projeto ARPANET, precursor da Internet. A primeira especificação do TCP foi publicada em 1974, e o protocolo passou por diversas revisões até ser padronizado em 1981, junto com o IP, formando o conjunto TCP/IP. Desde então, o TCP tornou-se o principal protocolo de transporte para aplicações que exigem confiabilidade, sendo adotado mundialmente em redes públicas e privadas.

# 2. Características Técnicas

O TCP se destaca por ser um protocolo orientado à conexão, estabelecendo uma comunicação segura entre as partes por meio do famoso "handshake" de três vias. Durante toda a sessão, o protocolo mantém o controle do estado da conexão, permitindo o gerenciamento eficiente do início, manutenção e encerramento da comunicação. A confiabilidade é garantida por mecanismos de retransmissão de pacotes perdidos ou corrompidos, além da verificação de integridade por meio de checksums. O controle de fluxo evita que o receptor seja sobrecarregado, enquanto o controle de congestionamento ajusta dinamicamente a quantidade de dados transmitidos para preservar a estabilidade da rede. Outra característica importante é a entrega ordenada dos dados, que chegam ao destino na mesma sequência em que foram enviados, além da possibilidade de múltiplas conexões simultâneas entre os mesmos hosts, graças à multiplexação por portas.

# 3. Aplicação

A confiabilidade do TCP fazem dele a escolha natural para diversos serviços essenciais. A navegação na web, por exemplo, depende do HTTP e do HTTPS, que utilizam TCP para garantir que as páginas sejam carregadas corretamente e sem erros. Protocolos de transferência de arquivos, como o FTP, também se beneficiam da integridade proporcionada pelo TCP, assim como os serviços de e-mail, que utilizam SMTP, POP3 e IMAP para garantir que as mensagens sejam enviadas e recebidas sem perdas. A administração remota de servidores, realizada por meio do SSH, depende da segurança e estabilidade do TCP, enquanto o Telnet, embora menos utilizado atualmente, também faz uso desse protocolo para acesso remoto. Bancos de dados, como MySQL, PostgreSQL e SQL Server, utilizam TCP para garantir que as transações sejam entregues corretamente, mantendo a consistência das informações.

Outros exemplos de serviços e aplicações que utilizam TCP:

- **DNS**: Utiliza TCP para transferências de zona e consultas que excedem o tamanho do pacote UDP.
- **SCP e SFTP**: Para cópia segura de arquivos.
- **RDP**: Protocolo de acesso remoto a desktops Windows.
- **SMB/CIFS**: Compartilhamento de arquivos em redes Windows.
- **IRC**: Comunicação em tempo real via chat.
- **MSSQL, Oracle, MongoDB**: Bancos de dados que utilizam TCP para garantir integridade nas transações.
- **VPNs (OpenVPN, SSTP)**: Utilizam TCP para tunelamento seguro de dados.
- **Aplicativos de backup e sincronização**: Dropbox, Google Drive, OneDrive, entre outros, utilizam TCP para garantir que os arquivos sejam transferidos sem perdas.
- **Ferramentas de monitoramento**: Nagios, Zabbix e Prometheus usam TCP para comunicação entre agentes e servidores.
- **Serviços de streaming sob demanda**: Netflix, Spotify e YouTube podem utilizar TCP para garantir entrega de dados em situações específicas, como downloads ou buffer.

## 3.1. Vantagens e Desvantagens do TCP

O grande diferencial do TCP está na sua capacidade de garantir a entrega dos dados com alta confiabilidade, ordem e integridade, além de oferecer mecanismos de controle de fluxo e congestionamento que preservam a estabilidade da rede. Essas características tornam o protocolo indispensável para aplicações críticas, como transações bancárias, comunicação corporativa e transferência de arquivos importantes. Por outro lado, o TCP apresenta algumas desvantagens, como o maior overhead devido ao controle de conexão e verificação de integridade, o que pode resultar em menor velocidade quando comparado a protocolos sem conexão, como o UDP. Para aplicações que exigem baixa latência e podem tolerar perdas de dados, como streaming de vídeo em tempo real ou jogos online, o UDP pode ser mais adequado, pois consome menos recursos e oferece maior rapidez.

# 4. Conclusão

Em síntese, o protocolo TCP é fundamental para a segurança, estabilidade e eficiência na comunicação de dados digitais. Sua adoção ampla em serviços críticos da Internet se justifica pelas características técnicas que garantem confiabilidade, ordenação e controle de fluxo. Embora apresente algumas limitações em termos de velocidade e consumo de recursos, o TCP permanece como a melhor opção para aplicações em que a integridade e a ordem dos dados são essenciais, consolidando-se como um dos protocolos mais importantes do universo das redes de computadores.

