#!/bin/bash

PACKAGES=("docker" "docker-compose" "npm")
APPS_NOT_FOUND=()
APPS_INSTALLEDS=()

# verify if an app is installed
verifyIfAppIsInstalled(){
    echo -e "Checking the \e[01;33m$1\e[00m package..."
    PACK_GREP="$(dpkg -s $1 | grep Package: )"
    PACK_NAME="${PACK_GREP//Package: /}"
    
    if [ "$PACK_NAME" != "$1" ]; then
        APPS_NOT_FOUND+=("$1")
    else
        APPS_INSTALLEDS+=("$1")
    fi
}



