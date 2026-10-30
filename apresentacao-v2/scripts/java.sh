#!/usr/bin/env bash
# java.sh — helpers para trocar de versão do Java sem dor.

# java-set <versão>  →  ativa ~/opt/java/jdk-<versão>
java-set() {
  java_home="$HOME/opt/java/jdk-$1"

  if [ ! -d "$java_home" ]; then
    echo "Java $1 não existe em $java_home" >&2
    return 1
  fi

  export JAVA_HOME="$java_home"
  export PATH="$JAVA_HOME/bin:$PATH"
  alias java="$JAVA_HOME/bin/java"
  alias keytool="$JAVA_HOME/bin/keytool"

  echo "Java $1 ativado ✔"
}

# java-set-from-pom  →  descobre a versão do Java no pom.xml do diretório atual
java-set-from-pom() {
  if [ ! -f pom.xml ]; then
    echo "Nenhum pom.xml aqui." >&2
    return 1
  fi

  version=$(grep -oE '<(java\.version|maven\.compiler\.release|maven\.compiler\.source)>[0-9]+' pom.xml \
    | head -n 1 | grep -oE '[0-9]+')

  if [ -z "$version" ]; then
    echo "Não achei a versão do Java no pom.xml." >&2
    return 1
  fi

  java-set "$version"
}
