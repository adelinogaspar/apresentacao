#!/usr/bin/env bash
# java.sh — helpers para trocar de versão de Java sem dor.

# java-set <version>  →  ativa ~/opt/java/jdk-<version>
java-set() {
  version="$1"
  java_dir="$HOME/opt/java/jdk-$version"

  if [ ! -d "$java_dir" ]; then
    echo "Java $version não encontrado em $java_dir" >&2
    return 1
  fi

  export JAVA_HOME="$java_dir"
  export PATH="$JAVA_HOME/bin:$PATH"

  alias java="$JAVA_HOME/bin/java"
  alias keytool="$JAVA_HOME/bin/keytool"

  echo "Java $version ativado ✔"
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
