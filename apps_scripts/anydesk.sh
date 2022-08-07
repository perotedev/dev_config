#!/bin/bash

path_script=$(pwd)
path_script="${path_script//'/apps_scripts'}"
$path_script/checks_pkg_dpkg.sh "anydesk"
status=$?

function error(){
    return 1
}

if [ $status == 0 ]; then
    error
else 
    echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33manydesk\e[00m package..."
    sleep 0.500
    sudo apt update
    #  this is if anydesk service don1t works: file libpangox not found 
    wget http://ftp.us.debian.org/debian/pool/main/p/pangox-compat/libpangox-1.0-0_0.0.2-5.1_amd64.deb
    sudo apt install ./libpangox-1.0-0_0.0.2-5.1_amd64.deb
    sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
    sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
    sudo apt update
    sudo apt-get install anydesk -y
fi
