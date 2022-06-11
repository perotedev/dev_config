#!/bin/bash

AVAILABLE_SCRIPTS=()
APPS_NOT_FOUND=()
APPS_INSTALLEDS=()

function divider(){
    echo -e "\n###################################################"
}

function showNotInstalledTools(){
    if [ ${#APPS_NOT_FOUND[@]} -gt 0 ]; then
        echo -e "\n😱 Not installed tools:"
        echo -e "${APPS_NOT_FOUND[@]}\n"
    fi
}

function checksIfAppIsInstalled(){
    SEARCH="$(dpkg-query --show -f='${Status} ${Version}\n' $1 2>/dev/null)"

    if [[ "$SEARCH" == *"ok installed"* ]]; then
        VERSION_APP="${SEARCH//'install ok '/}"
        APPS_INSTALLEDS+=("$1")
        echo -e "\e[0;32m* $1\e[00m - $VERSION_APP"
    else
        APPS_NOT_FOUND+=("$1")
        # echo -e "\e[0;31m* $1\e[00m - not installed"
    fi
    sleep 1
}

function checksInstalledsApps(){
    echo -e "\n🧐 Checking installed tools..."

    for element in "${AVAILABLE_SCRIPTS[@]}"; do
        checksIfAppIsInstalled $element
    done
    
    showNotInstalledTools
}
 
function checksAvailableAppScripts(){
    SEARCH_DIR=./apps_scripts
    echo -e "\n😁 Checking available scripts..."

    for element in "$SEARCH_DIR"/*; do
        SCRIPT_NAME="${element//'./apps_scripts/'/}"
        echo -e "\e[0;33m* $SCRIPT_NAME\e[00m"

        SCRIPT_NAME="${SCRIPT_NAME//'.sh'/}"
        AVAILABLE_SCRIPTS+=("$SCRIPT_NAME")
        sleep 1
    done
}

checksAvailableAppScripts
checksInstalledsApps

# echo -e "\n${AVAILABLE_SCRIPTS[@]}"