#!/bin/bash

SELECTED_TOOLS=( "$@" )
SCRIPTS_FOLDER="./apps_scripts"
INSTALLEDS_TOOLS=0

# some settings need to restart your PC
function rebootToApplyChanges(){
    local option=${1^^}

    case $option in
        "Y") echo -e "Restarting your PC now, please wait...\n" && reboot ;;
        "N") echo -e "Restart your computer manually as soon as possible...\n" ;;
        *) echo -e "Restart your computer manually as soon as possible...\n" ;;
    esac
}

function setInstalledCount(){
    if [ $1 == 0 ]; then
        INSTALLEDS_TOOLS=$(expr $INSTALLEDS_TOOLS + 1)
    fi
}

# scripts sequence order
function installTools(){

    if [ ${#SELECTED_TOOLS[@]} -gt 0 ]; then
        echo -e "\n\e[01;32m---|\e[00m Updating repositories..."
        sudo apt update
    fi

    ############## install git ############## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "git" ]]; then
        $SCRIPTS_FOLDER/git.sh
    fi

    ############## install htop ############## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "htop" ]]; then
        $SCRIPTS_FOLDER/htop.sh
    fi

    ############### install vim ############## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "vim" ]]; then
        $SCRIPTS_FOLDER/vim.sh
    fi

    ############## install npm ############## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "npm" ]]; then
        $SCRIPTS_FOLDER/npm.sh
    fi

    ########### install angular-cli ########### ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "angular-cli" ]]; then
        $SCRIPTS_FOLDER/angular-cli.sh
    fi

    ############## install snapd ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "snapd" ]]; then
        $SCRIPTS_FOLDER/snapd.sh
    fi

    ############## install vscode ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "vscode" ]]; then
        $SCRIPTS_FOLDER/vscode.sh
    fi
    
    ############## install docker ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "docker" ]]; then
        $SCRIPTS_FOLDER/docker.sh
        setInstalledCount $?
    fi

    ########## install docker-compose ######### ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "docker-compose" ]]; then
        $SCRIPTS_FOLDER/docker-compose.sh
        setInstalledCount $?
    fi

    ############## install android-studio ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "android-studio" ]]; then
        $SCRIPTS_FOLDER/android-studio.sh
    fi

    ############## install postman ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "postman" ]]; then
        $SCRIPTS_FOLDER/postman.sh
    fi

    ############## install scrcpy ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "scrcpy" ]]; then
        $SCRIPTS_FOLDER/scrcpy.sh
    fi

    ########## install brave-browser ########## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "brave-browser" ]]; then
        $SCRIPTS_FOLDER/brave-browser.sh
    fi

    ######### install speedtest-cli ######### ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "speedtest-cli" ]]; then
        $SCRIPTS_FOLDER/speedtest-cli.sh
    fi
    
    ############## install zsh ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "zsh" ]]; then
        $SCRIPTS_FOLDER/zsh.sh
    fi
}

function finishScript(){
    if [ ${#SELECTED_TOOLS[@]} -gt 0 ]; then
        echo -e "\n😇 Install process complete!\n"
    else
        echo -e "\n😵 You have not selected tools to install!\n"
    fi

    if [ $INSTALLEDS_TOOLS -gt 0 ]; then
        echo -ne "\e[0;33m>> You need to restart your computer to finish some settings. Do it now? [Y/N]:\e[00m "
        read decision
        rebootToApplyChanges $decision
    fi
}

installTools
finishScript