#! /bin/sh

# from https://unix.stackexchange.com/a/72475/81810

if [ -n "$ZSH_VERSION" ]; then
	PROFILE_SHELL="zsh"
elif [ -n "$BASH_VERSION" ]; then
	PROFILE_SHELL="bash"
elif [ -n "$KSH_VERSION" ]; then
	PROFILE_SHELL="ksh"
elif [ -n "$FCEDIT" ]; then
	PROFILE_SHELL="ksh"
elif [ -n "$PS3" ]; then
	PROFILE_SHELL=i"unknown"
else
	PROFILE_SHELL="sh"
fi

export PAGER=less

if [ "$PROFILE_SHELL" = "sh" ]; then

	# set ENV to a file invoked each time sh is started for interactive use.
	ENV="$HOME/.shrc"
	export ENV

	# Let sh(1) know it's at home, despite /home being a symlink.
	# shellcheck disable=SC2164,SC3013 # ignore CD issue and -ef posix compliance
	if [ "$PWD" != "$HOME" ] && [ "$PWD" -ef "$HOME" ] ; then cd ; fi


elif [ "$PROFILE_SHELL" = "bash" ]; then

	# shellcheck source=./bash/.bashrc
	. "$HOME/.bashrc"
fi



