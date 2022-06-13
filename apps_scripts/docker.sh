#!/bin/bash

path_script=$(pwd)
path_script="${path_script//'/apps_scripts'}"
$path_script/checks_pkg_dpkg.sh "docker"
status=$?

function error(){
    return 1
}

if [ $status == 0 ]; then
    error
else 
    echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mdocker\e[00m package..."
    sleep 0.500
    sudo apt-get install docker -y
    sudo usermod -aG docker $USER
fi