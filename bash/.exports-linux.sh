#!/bin/bash

# setting up default editor
export VISUAL=vim
export EDITOR="$VISUAL"



# Go related stuff
export GOPATH="$HOME/projects"
export PATH="$PATH;$GOPATH/bin"


eval "$(thefuck --alias)"

