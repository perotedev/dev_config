#!/bin/bash

AVAILABLE_SCRIPTS=()
APPS_NOT_INSTALLED=()
APPS_INSTALLEDS=()

function checksIfAppIsInstalled(){
    SEARCH="$(dpkg-query --show -f='${Status} ${Version}\n' $1 2>/dev/null)"

    if [[ "$SEARCH" == *"ok installed"* ]]; then
        VERSION_APP="${SEARCH//'install ok '/}"
        APPS_INSTALLEDS+=("$1")
        echo -ne "\e[0;32m* $1\e[00m - $VERSION_APP                                                 \r"
    else
        APPS_NOT_INSTALLED+=("$1")
        echo -ne "\e[0;31m* $1\e[00m - not installed                                                 \r"
    fi
    sleep 0.500
}

function checksInstalledsApps(){
    echo -e "\n🧐 Checking installed tools..."

    for element in "${AVAILABLE_SCRIPTS[@]}"; do
        checksIfAppIsInstalled $element
    done
    
    echo -e ">> ${#APPS_INSTALLEDS[@]} installed tools!                                             \r"
    echo -e ">> ${#APPS_NOT_INSTALLED[@]} not installed tools!"
}
 
function checksAvailableAppScripts(){
    echo -e "\n😁 Checking available scripts..."
    SEARCH_DIR=./apps_scripts
    SCRIPTS_COUNT=0

    for element in "$SEARCH_DIR"/*; do
        SCRIPT_NAME="${element//'./apps_scripts/'/}"
        echo -ne "\e[0;33m* $SCRIPT_NAME\e[00m                                            \r"

        SCRIPT_NAME="${SCRIPT_NAME//'.sh'/}"
        AVAILABLE_SCRIPTS+=("$SCRIPT_NAME")
        SCRIPTS_COUNT=$(expr $SCRIPTS_COUNT + 1)
        sleep 0.500
    done

    echo -e ">> $SCRIPTS_COUNT availables scripts!                                         \r"
}

function checkIfAllIsInstalled(){
    if [ ${#APPS_NOT_INSTALLED[@]} -gt 0 ]; then
        echo -e ""
        read -n 1 -s -r -p "Press any key to continue... "
        ./config.sh ${APPS_NOT_INSTALLED[@]}
    else
        echo -e "\n😇 All tools already installed!\n"
    fi
}

checksAvailableAppScripts
checksInstalledsApps
checkIfAllIsInstalled



