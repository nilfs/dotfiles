#!/bin/bash

printf '\033[32m%s\033[m\n' 'install aws-tools'

# install aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

rm awscliv2.zip
rm -r aws

# install aws-sso-util
pipx install aws-sso-util