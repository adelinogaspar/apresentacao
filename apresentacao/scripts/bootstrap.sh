#!/usr/bin/env bash
# bootstrap.sh — arquivo principal: só carrega os outros scripts.

BASH_HOME="$HOME/dev/bash"

source "$BASH_HOME/java.sh"
source "$BASH_HOME/maven.sh"
