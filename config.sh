#!/bin/bash

AVAILABLE_SCRIPTS=()
APPS_NOT_FOUND=()
APPS_INSTALLEDS=()

function showNotInstalledTools(){
    if [ ${#APPS_NOT_FOUND[@]} -gt 0 ]; then
        echo -e "\n😱 Not installed tools:"

        for element in "${APPS_NOT_FOUND[@]}"; do
            echo -e "\e[0;31m* $element\e[00m"
        done

        echo -e ">> ${#APPS_NOT_FOUND[@]} not installed tools!"
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
    sleep 0.500
}

function checksInstalledsApps(){
    echo -e "\n🧐 Checking installed tools..."

    for element in "${AVAILABLE_SCRIPTS[@]}"; do
        checksIfAppIsInstalled $element
    done
    
    echo -e ">> ${#APPS_INSTALLEDS[@]} installed tools!"
    
    showNotInstalledTools
}
 
function checksAvailableAppScripts(){
    echo -e "\n😁 Checking available scripts..."
    SEARCH_DIR=./apps_scripts
    SCRIPTS_COUNT=0

    for element in "$SEARCH_DIR"/*; do
        SCRIPT_NAME="${element//'./apps_scripts/'/}"
        echo -ne "\e[0;33m* $SCRIPT_NAME\e[00m                     \r"

        SCRIPT_NAME="${SCRIPT_NAME//'.sh'/}"
        AVAILABLE_SCRIPTS+=("$SCRIPT_NAME")
        SCRIPTS_COUNT=$(expr $SCRIPTS_COUNT + 1)
        sleep 1
    done

    echo -e ">> $SCRIPTS_COUNT availables scripts!                            \r"
}

function installTools(){

}

function selectToolsForInstall(){
    
}

checksAvailableAppScripts
checksInstalledsApps

# echo -e "\n${AVAILABLE_SCRIPTS[@]}"