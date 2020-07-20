# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]Ω '


eval "$(thefuck --alias)"

# source exports files if they exist.

[ -f $HOME/.exports ] && source $HOME/.exports
[ -f $HOME/.exports-mac ] && source $HOME/.exports-mac

# source alias files if they exist

[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.aliases-mac ] && source $HOME/.aliases-mac

# source ssh-agent file

[ -f $HOME/.ssh/ssh-agent-env ] && source $HOME/.ssh/ssh-agent-env
