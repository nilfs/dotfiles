#!/bin/bash

# global variables
# DOTFILES_DIR=`pwd`
# DOTFILES_HOME=$HOME
SCRIPT_FILE="temp-install.sh"

# インストールスクリプトを構築
make build-install SCRIPT_FILE=$SCRIPT_FILE

. $SCRIPT_FILE
rm $SCRIPT_FILE