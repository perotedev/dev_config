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
    sudo apt update

    ############## install git ############## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "git" ]]; then
        $SCRIPTS_FOLDER/git.sh
        setInstalledCount $?
    fi

    ############## install htop ############## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "htop" ]]; then
        $SCRIPTS_FOLDER/htop.sh
        setInstalledCount $?
    fi

    ############### install vim ############## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "vim" ]]; then
        $SCRIPTS_FOLDER/vim.sh
        setInstalledCount $?
    fi

    ############## install npm ############## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "npm" ]]; then
        $SCRIPTS_FOLDER/npm.sh
        setInstalledCount $?
    fi

    ########### install angular-cli ########### ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "angular-cli" ]]; then
        $SCRIPTS_FOLDER/angular-cli.sh
        setInstalledCount $?
    fi

    ############## install snapd ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "snapd" ]]; then
        $SCRIPTS_FOLDER/snapd.sh
        setInstalledCount $?
    fi

    ############## install code ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "code" ]]; then
        $SCRIPTS_FOLDER/code.sh
        setInstalledCount $?
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

    ############## install studio ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "studio" ]]; then
        $SCRIPTS_FOLDER/studio.sh
        setInstalledCount $?
    fi

    ############## install postman ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "postman" ]]; then
        $SCRIPTS_FOLDER/postman.sh
        setInstalledCount $?
    fi

    ############## install scrcpy ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "scrcpy" ]]; then
        $SCRIPTS_FOLDER/scrcpy.sh
        setInstalledCount $?
    fi

    ########## install brave-browser ########## ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "brave-browser" ]]; then
        $SCRIPTS_FOLDER/brave-browser.sh
        setInstalledCount $?
    fi

    ######### install speedtest-cli ######### ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "speedtest-cli" ]]; then
        $SCRIPTS_FOLDER/speedtest-cli.sh
        setInstalledCount $?
    fi
    
    ############## install zsh ############# ok
    if [[ "${SELECTED_TOOLS[@]}" =~ "zsh" ]]; then
        $SCRIPTS_FOLDER/zsh.sh
        setInstalledCount $?
    fi
}

function finishScript(){
    echo -e "\n😇 Install process complete!\n"

    if [ $INSTALLEDS_TOOLS -gt 0 ]; then
        echo -ne "\e[0;33m>> You need to restart your computer to finish some settings. Do it now? [Y/N]:\e[00m "
        read decision
        rebootToApplyChanges $decision
    fi
}

installTools
finishScript