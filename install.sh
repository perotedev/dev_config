#!/bin/bash

SELECTED_TOOLS=( "$@" )
SCRIPTS_FOLDER="./apps_scripts"

# scripts sequence order
function installTools(){
    ############## install git ##############
    if [[ "${SELECTED_TOOLS[@]}" =~ "git" ]]; then
        $SCRIPTS_FOLDER/git.sh
    fi

    ############## install htop ##############
    if [[ "${SELECTED_TOOLS[@]}" =~ "htop" ]]; then
        $SCRIPTS_FOLDER/htop.sh
    fi

    ############### install vim ##############
    if [[ "${SELECTED_TOOLS[@]}" =~ "vim" ]]; then
        $SCRIPTS_FOLDER/vim.sh
    fi

    ############## install npm ##############
    if [[ "${SELECTED_TOOLS[@]}" =~ "npm" ]]; then
        $SCRIPTS_FOLDER/npm.sh
    fi

    ############## install nvm ##############
    if [[ "${SELECTED_TOOLS[@]}" =~ "nvm" ]]; then
        $SCRIPTS_FOLDER/nvm.sh
    fi

    ############## install angular-cli #############
    if [[ "${SELECTED_TOOLS[@]}" =~ "angular-cli" ]]; then
        $SCRIPTS_FOLDER/angular-cli.sh
    fi

    ############## install snapd #############
    if [[ "${SELECTED_TOOLS[@]}" =~ "snapd" ]]; then
        $SCRIPTS_FOLDER/snapd.sh
    fi

    ############## install code #############
    if [[ "${SELECTED_TOOLS[@]}" =~ "code" ]]; then
        $SCRIPTS_FOLDER/code.sh
    fi
    
    ############## install docker #############
    if [[ "${SELECTED_TOOLS[@]}" =~ "docker" ]]; then
        $SCRIPTS_FOLDER/docker.sh
    fi

    ########## install docker-compose #########
    if [[ "${SELECTED_TOOLS[@]}" =~ "docker-compose" ]]; then
        $SCRIPTS_FOLDER/docker-compose.sh
    fi

    ############## install studio #############
    if [[ "${SELECTED_TOOLS[@]}" =~ "studio" ]]; then
        $SCRIPTS_FOLDER/studio.sh
    fi

    ############## install postman #############
    if [[ "${SELECTED_TOOLS[@]}" =~ "postman" ]]; then
        $SCRIPTS_FOLDER/postman.sh
    fi

    ############## install scrcpy #############
    if [[ "${SELECTED_TOOLS[@]}" =~ "scrcpy" ]]; then
        $SCRIPTS_FOLDER/scrcpy.sh
    fi

    ########## install brave-browser ##########
    if [[ "${SELECTED_TOOLS[@]}" =~ "brave-browser" ]]; then
        $SCRIPTS_FOLDER/brave-browser.sh
    fi

    ############## install zsh #############
    if [[ "${SELECTED_TOOLS[@]}" =~ "zsh" ]]; then
        $SCRIPTS_FOLDER/zsh.sh
    fi
}

installTools