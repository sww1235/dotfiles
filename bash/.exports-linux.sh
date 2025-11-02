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

# pipx related stuff

pipxPath="$HOME/.local/bin"

export PATH="$pipxPath:$PATH"

# fix for KiCAD dark mode, so I don't have to launch via a terminal every time
export GTK_THEME=Adwaita:dark
