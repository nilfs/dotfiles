#!/bin/bash

printf '\033[32m%s\033[m\n' 'install pipx'

pip install --user pipx
python -m pipx ensurepath