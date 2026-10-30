# objetivo principal
sou um desenvolvedor senior e quero criar uma apresentação para ajudar outros desenvolvedores a entenderem mais sobre:
- bash
- preparação de um ambiente local
- java 25 e threads virtuais

# instruções
crie uma subpasta `apresentacao-v2`
monte uma apresentação curta (no máximo 10 slides) com os seguintes assuntos:
* bash e suas variantes: git bash, bash no linux e bash no MacOS
    - falar da importância do arquivo `~/.bashrc` dentro do bash e como ele funciona da mesma maneira no git bash, no mac e no linux
* como instalar múltiplas versões de java:
    - utilizar o zip que será compartilhado com os arquivos de bash:
        -- bootstrap.sh: arquivo principal onde todos os outros scripts são carregados. dentro dele só existem chamadas do tipo `source $BASH_HOME/java.sh`
        -- java.sh: scripts úteis de bash para ajudar nos comandos com java
            --- `java-set <version>`: seta a versão do java a partir de `~/opt/java/jdk-<version>`. define todas as variáveis de ambiente e seta aliases `java` e `keytool` com base no novo $JAVA_HOME
            --- `java-set-from-pom`: procura um arquivo `pom.xml` dentro do diretório atual e identifica qual a versão do java deve ser usava para fazer o build da aplicação e chama `java-set` para setar o java correto.
        -- maven.sh: scripts úteis para ajudar nos comandos de maven
            --- `mvn-build`: se existir um arquivo `settings.xml` no mesmo diretório que o `pom.xml` ele faz o build do maven com `mvn clean package -s settings.xml` de forma que aceite parâmetros extras, para ser usado como base para outros comandos de maven. antes de executar o maven, ele chama `java-set-from-pom` para garantir que a versão de java sempre estará correta
            --- `mvn-build-skip-tests`: chama `mvn-build` com um parâmetro de pular os testes
    - usar a mesma estrutura de diretórios no windows, MacOs e linux
        -- criar o diretório base das versões de java com `mkdir -p ~/opt/{java,maven}`
        -- criar o diretório onde os scripts serão armazenados com `mkdir -p ~/dev/bash`
        -- descompactar o conteúdo dos scripts dentro de `~/dev/bash`
        -- executar o comando `grep -qxF 'source $HOME/bootstrap.sh' ~/.bashrc 2>/dev/null || echo 'source $HOME/bootstrap.sh' >> ~/.bashrc` para incluir o bootstrap dentro de todos os terminais abertos
* java 25 e threads virtuais
    - crie um infográfico no modelo de camadas para ilustrar uma thread de plataforma e uma thread virtual, lado a lado
    - siga o guia de estilo

# guia de código
* kiss, keep it simple. faça o código mais simples possível e legível

# guia de estilo
* a apresentação deverá ter um formato mais extrovertido, e escrito em português do brasil
* ela deverá ser no formato de slides como um powerpoint
* adicione efeitos de transição esmaecer entre os slides
* o tema dos slides deverá ser de halloween, com um fundo escuro, preto, com letras ou outros elementos na cor laranja, e algumas imagens de morcegos, gatos pretos e abóboras
* crie toda a apresentação em um único arquivo html. se alguma imagem do tipo SVG ou jpg for criada para enriquecer a apresentação, inclua ela como um elemento embeded binário do html

# java 25 links
https://jdk.java.net/archive/

- windows: https://download.java.net/java/GA/jdk25.0.2/b1e0dfa218384cb9959bdcb897162d4e/10/GPL/openjdk-25.0.2_windows-x64_bin.zip
- mac M3/M4/M5: https://download.java.net/java/GA/jdk25.0.2/b1e0dfa218384cb9959bdcb897162d4e/10/GPL/openjdk-25.0.2_macos-aarch64_bin.tar.gz
- linux x86: https://download.java.net/java/GA/jdk25.0.2/b1e0dfa218384cb9959bdcb897162d4e/10/GPL/openjdk-25.0.2_linux-x64_bin.tar.gz

java 21:
- windows: https://download.java.net/java/GA/jdk21.0.1/415e3f918a1f4062a0074a2794853d0d/12/GPL/openjdk-21.0.1_windows-x64_bin.zip
- mac M3/M4/M5: https://download.java.net/java/GA/jdk21.0.1/415e3f918a1f4062a0074a2794853d0d/12/GPL/openjdk-21.0.1_macos-aarch64_bin.tar.gz
- linux x86: https://download.java.net/java/GA/jdk22/830ec9fcccef480bb3e73fb7ecafe059/36/GPL/openjdk-22_linux-x64_bin.tar.gz

java 17:
- windows: https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_windows-x64_bin.zip
- mac M3/M4/M5: https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_macos-aarch64_bin.tar.gz
- linux x86: https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz

java 11:
- windows: https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_windows-x64_bin.zip
- mac M3/M4/M5: https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_osx-x64_bin.tar.gz
- linux x86: https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz

# maven links
- windows: https://dlcdn.apache.org/maven/maven-3/3.10.0/binaries/apache-maven-3.10.0-bin.zip
- mac M3/M4/M5: https://dlcdn.apache.org/maven/maven-3/3.10.0/binaries/apache-maven-3.10.0-bin.tar.gz
- linux x86: https://dlcdn.apache.org/maven/maven-3/3.10.0/binaries/apache-maven-3.10.0-bin.tar.gz
