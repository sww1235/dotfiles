#! /bin/sh
# read command line arguments to determine which parts to install, or all or help

INSTALL_VIM=0
INSTALL_BASH=0


# install functions

install_vim (){
	ln -sv "$PWD/.vimrc" "$HOME"
	ln -sv "$PWD/.vim" "$HOME"


}

install_bash (){
	# from https://stackoverflow.com/a/27875395
	echo -n "Check to make sure old .bashrc and .bash_profile are good to overwrite (y/n)? "
	old_stty_cfg=$(stty -g)
	stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Careful playing with stty
	if echo "$answer" | grep -iq "^y" ;then
    		#mv "$HOME/.bash_profile" "$HOME/.bash_profile.old"
		#mv "$HOME/.bashrc" "$HOME/.bashrc.old"
		ln -sf "$PWD/bash/.aliases" "$HOME"
		ln -sf "$PWD/bash/.bash_profile" "$HOME"
		ln -sf "$PWD/bash/.exports" "$HOME"
		ln -sf "$PWD/bash/.bashrc" "$HOME"
		#ln -s "$PWD/.profile ~/.profile" "$HOME"
	else
    		return
	fi


}

# loop through arguments and process them
# ideas from https://pretzelhands.com/posts/command-line-flags

for arg in "$@" # all arguments except $0
do
	case $arg in
	-h|--help)
		echo "type -l or --list for list of parts to install or \"all\" to install all parts"
		shift # remove -h or --help from processing
		exit
		;;
	-l|--list)
		echo "vim\nbash"
		shift # remove -l or --list from processing
		exit
		;;
	vim)
		INSTALL_VIM=1
		shift # remove vim from processing
		;;
	bash)
		INSTALL_BASH=1
		shift # remove bash from processing
		;;
	all)
		INSTALL_VIM=1
		INSTALL_BASH=1
		shift # remove all from processing
		;;
	*)
		echo "Argument $1 is not recognized"
		shift
		;;
	esac
done

if [ "$INSTALL_VIM" -eq 1 ]; then
	install_vim
fi

if [ "$INSTALL_BASH" -eq 1 ]; then
	install_bash
fi


