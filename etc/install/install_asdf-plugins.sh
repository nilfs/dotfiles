#!/bin/sh

printf '\033[32m%s\033[m\n' 'install asdf plugins'

asdf plugin add ruby

asdf plugin add nodejs
asdf install nodejs 14.17.3

asdf plugin add python
asdf install python 3.9.6
