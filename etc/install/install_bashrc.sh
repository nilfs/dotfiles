#!/bin/bash

grep "\. ${DOTFILES_DIR}/.bashrc" ~/.bashrc >/dev/null
if [ $? -ne 0 ]; then
    # .bashrc not initialized
    printf '\033[32m%s\033[m\n' 'bashrc initializing...'
    echo ". ${DOTFILES_DIR}/.bashrc" >> ~/.bashrc
fi

. ~/.bashrc
