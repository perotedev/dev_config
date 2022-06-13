#!/bin/bash

path_script=$(pwd)
path_script="${path_script//'/apps_scripts'}"
$path_script/checks_pkg_dpkg.sh "scrcpy"
status=$?

function error(){
    return 1
}

if [ $status == 0 ]; then
    error
else 
    echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mscrcpy\e[00m package..."
    sleep 0.500
    sudo apt-get install adb -y
    sudo apt-get install scrcpy -y
fi