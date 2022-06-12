#!/bin/bash

ACTUALY_DIRECTORY=$(pwd)

echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mzsh\e[00m package..."
sleep 0.500
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"