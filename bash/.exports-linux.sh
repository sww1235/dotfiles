#!/bin/bash

# setting up default editor
export VISUAL=vim
export EDITOR="$VISUAL"



# Go related stuff
export GOPATH="$HOME/projects"
export PATH="$PATH:$GOPATH/bin"

# rust related stuff

rustBin="$HOME/.cargo/bin"

export PATH="$rustBin:$PATH"


eval "$(thefuck --alias)"

