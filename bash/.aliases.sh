#!/bin/bash

# shellcheck source=./bash/.aliases-mac.sh
if [ -e "$HOME/.aliases-mac.sh" ]; then
	. "$HOME/.aliases-mac.sh"
fi
# shellcheck source=./bash/.exports-mac.sh
if [ -e "$HOME/.exports-mac.sh" ]; then
	. "$HOME/.exports-mac.sh"
fi
# shellcheck source=./bash/.aliases-linux.sh
if [ -e "$HOME/.aliases-linux.sh" ]; then
	. "$HOME/.aliases-linux.sh"
fi
# shellcheck source=./bash/.exports-linux.sh
if [ -e "$HOME/.exports-linux.sh" ]; then
	. "$HOME/.exports-linux.sh"
fi
# shellcheck source=./bash/.aliases-freebsd.sh
if [ -e "$HOME/.aliases-freebsd.sh" ]; then
	. "$HOME/.aliases-freebsd.sh"
fi
# shellcheck source=./bash/.exports-freebsd.sh
if [ -e "$HOME/.exports-freebsd.sh" ]; then
	. "$HOME/.exports-freebsd.sh"
fi

