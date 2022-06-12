#!/bin/bash

TOOLS_TO_INSTALL=( "$@" )
MENU_OPTIONS=()
SELECTED_TOOLS=()
SCRIPTS_FOLDER="./apps_scripts"

# scripts sequence order
function installTools(){
    # install git
    if [[ "${SELECTED_TOOLS[@]}" =~ "git" ]]; then
        sudo $SCRIPTS_FOLDER/git.sh
    fi

    # install htop
    if [[ "${SELECTED_TOOLS[@]}" =~ "htop" ]]; then
        sudo $SCRIPTS_FOLDER/htop.sh
    fi

    echo -e "\n😇 Install process complete!\n"
}

function filterSelectedTools(){
    local selected_options=( "$@" )

    for option in "${selected_options[@]}"; do
        SELECTED_TOOLS+=("${TOOLS_TO_INSTALL[$(expr $option - 1)]}")
    done

    installTools
}

function setMenuOptions(){
    local list_count=1

    for tool in "${TOOLS_TO_INSTALL[@]}"; do
        MENU_OPTIONS+=($list_count "$tool  " on)
        list_count=$(expr $list_count + 1)
    done
}

function selectToolsMenu(){
    cmd=(whiptail --title "Select tools to install" --ok-button "Install" --notags --checklist "Press 'tab' to navigate in menu and 'space' to select/deselect a tool" 16 40 8)
    setMenuOptions
    choices=$("${cmd[@]}" "${MENU_OPTIONS[@]}" 2>&1 >/dev/tty)
    status=$?
    clear
    selecteds=${choices//'"'/}

    if [ $status = 0 ]; then
        filterSelectedTools $selecteds
    else
        echo -e "Script closed!\n"
    fi
}

selectToolsMenu