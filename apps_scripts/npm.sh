#!/bin/bash

echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mnpm\e[00m package..."
sleep 0.500
sudo apt-get install npm -y

# install nvm for manage node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm