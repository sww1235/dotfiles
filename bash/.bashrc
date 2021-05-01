#!/bin/bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]Ω '


eval "$(thefuck --alias)"

# source ssh-agent file
# mainly for void linux

[ -f "$HOME/.ssh/ssh-agent-env" ] && source $HOME/.ssh/ssh-agent-env
