#!/bin/bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='\u@\h:\WΩ '

# shellcheck source=./bash/.aliases.sh
. "$HOME/.aliases.sh"



# eval "$(thefuck --alias)"

# source ssh-agent file
# mainly for void linux

# shellcheck disable=SC1091
[ -f "$HOME/.ssh/ssh-agent-env" ] && source "$HOME/.ssh/ssh-agent-env"
