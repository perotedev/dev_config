#!/bin/bash

echo -e "Checking npm package for install angular-cli..."

SEARCH="$(dpkg-query --show -f='${Status} ${Version}\n' npm 2>/dev/null)"

function error(){
    return 1
}

if [[ "$SEARCH" == *"ok installed"* ]]; then
    echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mangular-cli\e[00m package..."
    sleep 0.500
    sudo npm install -g @angular/cli
else
    echo -e "\e[0;31m* You need to have npm to install angular-cli!\e[00m"
    error
fi