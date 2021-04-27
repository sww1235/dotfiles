#!/bin/bash

# Arduino library fix
export PATH=$PATH:/Applications/Arduino.app/Contents


#Go related stuffs
export GOROOT=/usr/local/go
export GOPATH=/Users/Stephen/Projects
export PATH=$PATH:$GOPATH/bin

export PATH=/usr/local/sbin:$PATH

# setting up default editor
export VISUAL=vim
export EDITOR=$VISUAL


#The fuck command

eval "$(thefuck --alias)"
