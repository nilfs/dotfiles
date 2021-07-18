#!/bin/sh
VERSION=0.8.1

if [ ! -e $DOTFILES_HOME/.asdf ]; then
	printf '\033[32m%s\033[m\n' 'install asdf'
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v$VERSION
else
	printf '\033[32m%s\033[m\n' 'update asdf'
	asdf update
fi