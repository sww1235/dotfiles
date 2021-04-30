#!/bin/sh

if [ -e "$HOME/.aliases-mac.sh" ]; then
	. "$HOME/.aliases-mac.sh"
fi
if [ -e "$HOME/.exports-mac.sh" ]; then
	. "$HOME/.exports-mac.sh"
fi
if [ -e "$HOME/.aliases-linux.sh" ]; then
	. "$HOME/.aliases-linux.sh"
fi
if [ -e "$HOME/.exports-linux.sh" ]; then
	. "$HOME/.exports-linux.sh"
fi
if [ -e "$HOME/.aliases-freebsd.sh" ]; then
	. "$HOME/.aliases-freebsd.sh"
fi
if [ -e "$HOME/.exports-freebsd.sh" ]; then
	. "$HOME/.exports-freebsd.sh"
fi

