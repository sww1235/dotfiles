# general non bash specific info

# custom prompt

export PS1="Ω:"

# Source other files
. ~/.aliases
. ~/.exports

# OS specific files

# check for macos 10
if [$(uname) -eq "Darwin"]; then
	. ~/.aliases-mac
	. ~/.exports-mac	
fi

