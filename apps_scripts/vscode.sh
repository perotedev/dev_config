#!/bin/bash

echo -e "\nChecking snapd package for install code..."

SEARCH="$(dpkg-query --show -f='${Status} ${Version}\n' snapd 2>/dev/null)"

function error(){
    return 1
}

if [[ "$SEARCH" == *"ok installed"* ]]; then
    echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mcode\e[00m package..."
    sleep 0.500
    sudo snap install --classic code
else
    echo -e "\e[0;31m* You need to have snapd to install code!\e[00m"
    error
fi