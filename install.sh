#! /bin/sh
# read command line arguments to determine which parts to install, or all or help

platform='unknown'

detect_os (){
	unamestr=$(uname)

	if [ "$unamestr" = 'Linux' ]; then
		platform='linux'
	elif [ "$unamestr" = 'FreeBSD' ]; then
		platform='freebsd'
	elif [ "$unamestr" = 'Darwin' ]; then
		platform='mac-os'
	fi
}

# install functions

install_vim (){
	ln -sv "$PWD/.vimrc" "$HOME"
	ln -sv "$PWD/.vim" "$HOME"


}

install_profile (){
	# check for existing .profile first (not symlink)
	if [ -f "$HOME/.profile" ] && [ ! -h "$HOME/.profile" ]; then
		# check for old .profile.old file
		if [ -f "$HOME/.profile.old" ]; then
			echo "both $HOME/.profile and $HOME/.profile.old exist and are not symlinks.\
				Delete the un-needed files and rerun install script."
			return 1
		fi
		# if .profile.old doesn't exist, then copy .profile to .profile.old
		mv "$HOME/.profile" "$HOME/.profile.old"
	fi
	# force create symlink
	ln -sf "$PWD/sh/.profile" "$HOME"
	return 0
}

install_bash (){
	install_profile
	if [ "$?" -ne 0 ]; then
		echo ".profile failed to install. Fix issue and rerun install script."
		return 1
	fi
	# bash will use .profile if .bash_profile doesn't exist. We always want to use .profile
	if [ -f "$HOME/.bash_profile" ]; then
		mv "$HOME/.bash_profile" "$HOME/.bash_profile.old"
	fi
		
	ln -sf "$PWD/bash/.bashrc" "$HOME"

	ln -sf "$PWD/bash/.aliases.sh" "$HOME"
	if [ "$platform" = 'mac-os' ]; then

		ln -sf "$PWD/bash/.aliases-mac.sh" "$HOME"
		ln -sf "$PWD/bash/.exports-mac.sh" "$HOME"
	fi
	if [ "$platform" = 'linux' ]; then

		ln -sf "$PWD/bash/.aliases-linux.sh" "$HOME"
		ln -sf "$PWD/bash/.exports-linux.sh" "$HOME"
	fi
	if [ "$platform" = 'freebsd' ]; then

		ln -sf "$PWD/bash/.aliases-freebsd.sh" "$HOME"
		ln -sf "$PWD/bash/.exports-freebsd.sh" "$HOME"
	fi

	return 0


}

install_sh (){
	install_profile
	if [ "$?" -ne 0 ]; then
		echo ".profile failed to install. Fix issue and rerun install script."
		return 1
	fi
	# check for existing .shrc first (not symlink)
	if [ -f "$HOME/.shrc" ] && [ ! -h "$HOME/.shrc" ]; then
		# check for old .shrc.old file
		if [ -f "$HOME/.shrc.old" ]; then
			echo "both $HOME/.shrc and $HOME/.shrc.old exist and are not symlinks.\
				Delete the un-needed files and rerun install script."
			return 1
		fi
		# if .shrc.old doesn't exist, then copy .shrc to .shrc.old
		mv "$HOME/.shrc" "$HOME/.shrc.old"
	fi
	# force create symlink
	ln -sf "$PWD/sh/.shrc" "$HOME"

	# link other useful files
	ln -sf "$PWD/sh/.aliases.sh" "$HOME"
	if [ "$platform" = 'mac-os' ]; then

		ln -sf "$PWD/sh/.aliases-mac.sh" "$HOME"
		ln -sf "$PWD/sh/.exports-mac.sh" "$HOME"
	fi
	if [ "$platform" = 'linux' ]; then

		ln -sf "$PWD/sh/.aliases-linux.sh" "$HOME"
		ln -sf "$PWD/sh/.exports-linux.sh" "$HOME"
	fi
	if [ "$platform" = 'freebsd' ]; then

		ln -sf "$PWD/sh/.aliases-freebsd.sh" "$HOME"
		ln -sf "$PWD/sh/.exports-freebsd.sh" "$HOME"
	fi

	return 0
}

detect_os

if [ "$platform" = 'linux' ]; then
	echo "Installing bash and vim dotfiles for Linux"
	install_vim
	install_bash
	exit 0
elif [ "$platform" = 'freebsd' ]; then
	echo "Installing sh and vim dotfiles for FreeBSD"
	install_vim
	install_sh
	exit 0
elif [ "$platform" = 'mac-os' ]; then
	echo "Installing bash and vim dotfiles for MacOS"
	install_vim
	install_bash
	exit 0
else
	echo "Platform not recognized. Run uname and edit this script with the output"
	exit 1
fi

