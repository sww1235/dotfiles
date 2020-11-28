#!/bin/sh

pandoc -s -t html -f markdown $1 | lynx -stdin
