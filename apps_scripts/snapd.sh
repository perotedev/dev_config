#!/bin/bash

path_script=$(pwd)
path_script="${path_script//'/apps_scripts'}"
$path_script/checks_pkg_dpkg.sh "snapd"
status=$?

function error(){
    return 1
}

if [ $status == 0 ]; then
    error
else 
    echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33msnapd\e[00m package..."
    sleep 0.500

    if [ -f "/etc/apt/preferences.d/nosnap.pref" ]; then
        sudo rm /etc/apt/preferences.d/nosnap.pref
    fi

    sudo apt update
    sudo apt-get install snapd -y
fi