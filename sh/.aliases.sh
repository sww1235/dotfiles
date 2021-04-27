#!/bin/bash

if [ -e "$HOME/.aliases-mac" ]; then
	. "$HOME/.aliases-mac"
fi
if [ -e "$HOME/.exports-mac" ]; then
	. "$HOME/.exports-mac"
fi
if [ -e "$HOME/.aliases-linux" ]; then
	. "$HOME/.aliases-linux"
fi
if [ -e "$HOME/.exports-linux" ]; then
	. "$HOME/.exports-linux"
fi
if [ -e "$HOME/.aliases-freebsd" ]; then
	. "$HOME/.aliases-freebsd"
fi
if [ -e "$HOME/.exports-freebsd" ]; then
	. "$HOME/.exports-freebsd"
fi

