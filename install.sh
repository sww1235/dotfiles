#! /bin/sh
# read command line arguments to determine which parts to install, or all or help

INSTALL_VIM=0
INSTALL_BASH=0

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
	ln -sv "$PWD/.vimrc" "$HOME"
	ln -sv "$PWD/.vim" "$HOME"
fi

if [ "$INSTALL_BASH" -eq 1 ]; then
	ln -s bash/.aliases ~/.aliases
	ln -s bash/.bash_profile ~/.bash_profile
	ln -s bash/.exports ~/.exports
	ln -s .profile ~/.profile
fi


