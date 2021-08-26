#!/bin/sh

pandoc -s -t html -f markdown "$1" --metadata title="$1" | lynx -stdin
