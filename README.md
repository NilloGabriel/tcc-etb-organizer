# Trabalho de Conclusão de Curso - Escola Técnica de Brasília

Este projeto é um sistema de gerenciamento de consultas em clínica odontológica desenvolvido com o objetivo de facilitar a marcação e pagamento de consultas pelos clientes. O sistema inclui um CRUD de clientes, funcionários, menus e consultas, permitindo o agendamento e gerenciamento de consultas de forma eficiente e organizada.

## Tecnologias utilizadas
  - Java JDK 8 ou superior
  - Spring Framework
  - MySQL 5.6 ou superior
  - HTML, CSS e JavaScript
  - GlassFish Server

## Requisitos
  - JDK 8 ou superior
  - MySQL 5.6 ou superior
  - GlassFish Server

## Instalação
  1. Clone este repositório em sua máquina:

  ```bash
  https://github.com/NilloGabriel/tcc-etb-organizer.git
  ```

  2. Configure o banco de dados MySQL:
  
  - Crie um banco de dados com o script disponível no arquivo [database/odonto.sql](https://github.com/NilloGabriel/tcc-etb-organizer/tree/main/database).
    
  - Configure a conexão com o banco de dados MySQL, substituindo os valores das propriedades `url`, `user` e `pass` no arquivo [src/java/modelo/DataBaseDAO](https://github.com/NilloGabriel/tcc-etb-organizer/blob/main/src/java/modelo/DataBaseDAO.java).

  3. Baixe as dependências necessárias em formato JAR:
  - Baixe o arquivo JAR correspondente à versão do MySQL Connector/J que você está usando.
  - Baixe o arquivo JAR correspondente à versão do GlassFish Server que você está usando.

  4. Crie uma pasta chamada "lib" na raíz do projeto e adicione as dependências na pasta.

  5. Compile e empacote a aplicação:
  
  - Compile a aplicação executando o comando:
    
    ```bash
    javac -cp "src/java:lib/*" -d target/classes src/java/*.java
    ```
      
  - Crie um arquivo `clinica_odonto.war` executando o comando:
    
    ```bash
    jar -cvf clinica-odonto.war -C target/classes/ .
    ```
  6. Copie o arquivo `clinica-odonto.war`gerado para a pasta `autodeploy`do diretório do GlassFish Server.

  7. Inicie o GlassFish Server.
  
  - Na pasta `bin` do diretório do GlassFish Server, execute o comando:
    
    ```bash
    asadmin start-domain
    ```
    
  8. Acesse a aplicação:
  - Abra o navegador e acesse `http://localhost:8080/clinica-odonto`.

## Integrantes:
  Gabriel D'Nillo <br />
  Adriel Oliveira <br />
  Luiz Filipe <br />
  Mateus Vieira <br />
  Samuel Oliveira <br />
