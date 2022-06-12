#!/bin/bash

echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33msnapd\e[00m package..."
sleep 0.500
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt-get install snapd -y