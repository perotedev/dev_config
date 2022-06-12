#!/bin/bash

echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mgit\e[00m package..."
sleep 0.500
sudo apt-get install git -y

function readGitUser(){
    echo -ne "\n* Type an \e[0;33musername\e[00m for git: "
    read USERGIT
    echo -ne "* Type an \e[0;33memail\e[00m for your git user: "
    read EMAIL_USERGIT
}

function setGitUser(){
    git config --global user.name "$USERGIT"
    git config --global user.email "$EMAIL_USERGIT"
}

function confirmUserGit(){
    echo -e "\nThis is your git user:"
    echo -e "Username: $USERGIT"
    echo -e "Email: $EMAIL_USERGIT"
    echo -ne "\e[0;33m>> It's all correct? [Y/N]:\e[00m "
    read decision
    actionByDecision "gituser" $decision
}

function createGpgKey(){
    echo -ne "\n\e[0;33m>> Do you want create a GPG key for sign your commits? [Y/N]:\e[00m "
    read decision
    actionByDecision "gpgkey" $decision
}

function actionByDecision(){
    local option=${2^^}

    if [ "$1" == "gituser" ]; then
        case $option in
            "Y") setGitUser ;;
            "N") readGitUser && confirmUserGit ;;
            *) echo "Invalid option! Try again..." && confirmUserGit ;;
        esac
    elif [ "$1" == "gpgkey" ]; then
        sleep 0.500
        # TO DO
        # case $option in
        #     "Y") generateGpgKey ;;
        #     "N") sleep 0.500 ;;
        #     *) echo "Invalid option! Try again..." && createGpgKey ;;
        # esac
    fi

}

readGitUser
confirmUserGit