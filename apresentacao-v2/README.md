# bash-toolkit — multi-Java + Maven sem decorar comando

3 scripts, zero magia:

| arquivo | o que faz |
|---|---|
| `bootstrap.sh` | porta de entrada. Só `source` dos outros scripts (usa o próprio caminho, então funciona em qualquer pasta) |
| `java.sh` | `java-set <versão>` e `java-set-from-pom` |
| `maven.sh` | `mvn-build` e `mvn-build-skip-tests` |

## Instalação (4 passos, iguais em Windows, macOS e Linux)

```bash
mkdir -p ~/opt/{java,maven}          # onde os JDKs e o Maven moram
mkdir -p ~/dev/bash                 # casa dos scripts
unzip bash-toolkit.zip -d ~/dev/bash
grep -qxF 'source $HOME/dev/bash/bootstrap.sh' ~/.bashrc 2>/dev/null || echo 'source $HOME/dev/bash/bootstrap.sh' >> ~/.bashrc
```

Repare ou rode `source ~/.bashrc`. Pode repetir o `grep` quantas vezes quiser: é idempotente.

**Notas por sistema**

- **Windows (Git Bash):** idem, `~` = `%USERPROFILE%`.
- **Linux:** funciona como está.
- **macOS:** o Terminal pode abrir bash como *login shell*, que lê `~/.bash_profile` em vez de `~/.bashrc`. Cole a mesma linha nos dois:
  ```bash
  grep -qxF 'source $HOME/dev/bash/bootstrap.sh' ~/.bash_profile 2>/dev/null || echo 'source $HOME/dev/bash/bootstrap.sh' >> ~/.bash_profile
  ```
  (o macOS antigo vem com bash 3.2 — os scripts não usam nada de moderno; zsh é o shell padrão, então rode `bash` explicitamente ou adapte os aliases).

## Como usar

```bash
java-set 25                # ativa ~/opt/java/jdk-25 (JAVA_HOME, PATH, aliases java/keytool)
java-set-from-pom          # lê <java.version> / maven.compiler.release do pom.xml do diretório atual
mvn-build                  # java-set-from-pom + mvn clean package [-s settings.xml] + args extras
mvn-build-skip-tests       # mvn-build -DskipTests
```

Exemplo (JDK 25 no Linux):

```bash
tar -xzf openjdk-25.0.2_linux-x64_bin.tar.gz -C ~/opt/java
mv ~/opt/java/jdk-25.0.2 ~/opt/java/jdk-25
java-set 25
```

## Onde baixar

| Versão | Windows | macOS (M3/M4/M5) | Linux x86_64 |
|---|---|---|---|
| Java 25.0.2 (LTS) | [zip](https://download.java.net/java/GA/jdk25.0.2/b1e0dfa218384cb9959bdcb897162d4e/10/GPL/openjdk-25.0.2_windows-x64_bin.zip) | [tar.gz](https://download.java.net/java/GA/jdk25.0.2/b1e0dfa218384cb9959bdcb897162d4e/10/GPL/openjdk-25.0.2_macos-aarch64_bin.tar.gz) | [tar.gz](https://download.java.net/java/GA/jdk25.0.2/b1e0dfa218384cb9959bdcb897162d4e/10/GPL/openjdk-25.0.2_linux-x64_bin.tar.gz) |
| Java 21.0.1 | [zip](https://download.java.net/java/GA/jdk21.0.1/415e3f918a1f4062a0074a2794853d0d/12/GPL/openjdk-21.0.1_windows-x64_bin.zip) | [tar.gz](https://download.java.net/java/GA/jdk21.0.1/415e3f918a1f4062a0074a2794853d0d/12/GPL/openjdk-21.0.1_macos-aarch64_bin.tar.gz) | [tar.gz](https://download.java.net/java/GA/jdk21.0.1/415e3f918a1f4062a0074a2794853d0d/12/GPL/openjdk-21.0.1_linux-x64_bin.tar.gz) |
| Java 17.0.2 | [zip](https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_windows-x64_bin.zip) | [tar.gz](https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_macos-aarch64_bin.tar.gz) | [tar.gz](https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz) |
| Java 11.0.2 | [zip](https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_windows-x64_bin.zip) | [tar.gz](https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_osx-x64_bin.tar.gz) | [tar.gz](https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz) |
| Maven 3.10.0 | [zip](https://dlcdn.apache.org/maven/maven-3/3.10.0/binaries/apache-maven-3.10.0-bin.zip) | [tar.gz](https://dlcdn.apache.org/maven/maven-3/3.10.0/binaries/apache-maven-3.10.0-bin.tar.gz) | [tar.gz](https://dlcdn.apache.org/maven/maven-3/3.10.0/binaries/apache-maven-3.10.0-bin.tar.gz) |

> Cuidado: o link "java 21 linux" que circula por aí aponta para `jdk22` (HTTP 200, JDK errado). Use o 21.0.1 acima.

## A apresentação

`index.html` — 10 slides, arquivo único, imagens embutidas em base64. Abra direto no navegador e navegue com `←`/`→` (ou `Home`/`End`). Transição entre slides: esmaecer.

Para regenerar depois de mexer em `template.html` ou `art/`:

```bash
python3 build.py   # gera index.html
```
