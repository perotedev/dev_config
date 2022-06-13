#!/bin/bash

echo -e "\nChecking snapd package for install postman..."

SEARCH="$(dpkg-query --show -f='${Status} ${Version}\n' snapd 2>/dev/null)"

function error(){
    return 1
}

if [[ "$SEARCH" == *"ok installed"* ]]; then
    echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mpostman\e[00m package..."
    sleep 0.500
    sudo apt update
    sudo snap install postman
else
    echo -e "\e[0;31m* You need to have snapd to install postman!\e[00m"
    error
fi