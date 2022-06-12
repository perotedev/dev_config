#!/bin/bash

AVAILABLE_SCRIPTS=()
 
function checksAvailableAppScripts(){
    echo -e "\n😁 Checking available scripts..."
    SEARCH_DIR=./apps_scripts
    SCRIPTS_COUNT=0

    for element in "$SEARCH_DIR"/*; do
        SCRIPT_NAME="${element//'./apps_scripts/'/}"
        echo -ne "\e[0;32m* $SCRIPT_NAME\e[00m                                            \r"

        SCRIPT_NAME="${SCRIPT_NAME//'.sh'/}"
        AVAILABLE_SCRIPTS+=("$SCRIPT_NAME")
        SCRIPTS_COUNT=$(expr $SCRIPTS_COUNT + 1)
        sleep 0.500
    done

    echo -e ">> $SCRIPTS_COUNT availables scripts!                                         \r"
}

checksAvailableAppScripts
echo -e ""
read -n 1 -s -r -p "Press any key to continue... "
./config.sh ${AVAILABLE_SCRIPTS[@]}