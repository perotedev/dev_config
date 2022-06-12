#!/bin/bash

ACTUAL_DIRECTORY=$(pwd)

function createDesktopIcon(){
    echo '[Desktop Entry]' > android-studio.desktop
    echo 'Encoding=UTF-8' >> android-studio.desktop
    echo 'Version=1.0' >> android-studio.desktop
    echo 'Type=Application' >> android-studio.desktop
    echo 'Terminal=false' >> android-studio.desktop
    echo 'Exec=/opt/android-studio/bin/studio.sh' >> android-studio.desktop
    echo 'Name=Android Studio' >> android-studio.desktop
    echo 'Icon=/opt/android-studio/bin/studio.svg' >> android-studio.desktop
    sudo mv android-studio.desktop /usr/share/applications/
}

function installAndroidStudio(){
    echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mstudio\e[00m package..."
    sleep 0.500
    sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -y
    curl --location --request GET "https://drive.google.com/uc?export=download&id=1-n9H48iSAGB2Y2OB0iS4zhVOytEkcG4G" --output android-studio.tar.gz
    curl --location --request GET "https://drive.google.com/uc?export=download&id=1GEwQCRaO-PiJMsguV4qqG82u-zYVr-U9" --output lombok.tar.gz
    sudo mv android-studio.tar.gz /opt/
    cd /opt && sudo tar -xvzf android-studio.tar.gz
    cd $ACTUAL_DIRECTORY
}

function installLombokPlugin(){
    curl --location --request GET "https://drive.google.com/uc?export=download&id=1GEwQCRaO-PiJMsguV4qqG82u-zYVr-U9" --output lombok.tar.gz
    sudo mv lombok.tar.gz /opt/android-studio/plugins/
    cd /opt/android-studio/plugins && sudo tar -xvzf lombok.tar.gz
    cd $ACTUAL_DIRECTORY
}

installAndroidStudio
installLombokPlugin
createDesktopIcon

# https://drive.google.com/file/d/1GEwQCRaO-PiJMsguV4qqG82u-zYVr-U9/view   - lombok
# https://drive.google.com/file/d/1-n9H48iSAGB2Y2OB0iS4zhVOytEkcG4G/view   - android-studio
