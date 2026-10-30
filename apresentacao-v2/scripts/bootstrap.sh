#!/usr/bin/env bash
# bootstrap.sh — porta de entrada: só carrega os outros scripts.
BASH_HOME="${BASH_SOURCE[0]%/*}"

source "$BASH_HOME/java.sh"
source "$BASH_HOME/maven.sh"
