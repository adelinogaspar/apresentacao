#!/usr/bin/env bash

# Encode a file to base64 and print it to stdout.
base64-encode() {
    if [ -z "$1" ]; then
        echo "Usage: base64-encode <filename>" >&2
        return 1
    fi

    base64 "$1"
}

# Decode a base64 file into <outputfile>.
base64-decode() {
    if [ -z "$1" ] || [ "$2" != "-o" ] || [ -z "$3" ]; then
        echo "Usage: base64-decode <filename> -o <outputfile>" >&2
        return 1
    fi

    base64 -d "$1" > "$3"
}
