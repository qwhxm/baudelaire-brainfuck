#!/bin/bash
# A bare-bones command-line client for the baudelaire-brainfuck "web service".
# USAGE: $0 <word>

word="$1"
input="$word"$'\n'  # Input must be terminated with a newline.

curl -G \
    -H 'x-api-key: M0Y67gvRek7x84e5LX3q08z81sFLw7VY8CJq4she' \
    --data-urlencode "input=$input" \
    'https://52pdrsaqtk.execute-api.eu-central-1.amazonaws.com/default/baudelaire-brainfuck'
