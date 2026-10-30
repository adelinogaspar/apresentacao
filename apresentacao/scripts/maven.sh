#!/usr/bin/env bash
# maven.sh — wrappers de Maven que já acertam a versão do Java.

# mvn-build [parâmetros extras...]
mvn-build() {
  java-set-from-pom   # garante o Java certo antes de buildar

  if [ -f settings.xml ]; then
    mvn clean package -s settings.xml "$@"
  else
    mvn clean package "$@"
  fi
}

# mvn-build-skip-tests [parâmetros extras...]
mvn-build-skip-tests() {
  mvn-build -DskipTests "$@"
}
