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
    echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mandroid-studio\e[00m package..."
    sleep 0.500
    sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -y
    curl --location --request GET "https://r2---sn-gpv7kn7d.gvt1.com/edgedl/android/studio/ide-zips/2021.2.1.15/android-studio-2021.2.1.15-linux.tar.gz?mh=BA&pl=25&shardbypass=sd&redirect_counter=1&cm2rm=sn-5jupvopo4v-h5ve7z&req_id=7cef7bec5ff034e7&cms_redirect=yes&mip=170.246.227.251&mm=42&mn=sn-gpv7kn7d&ms=onc&mt=1655048946&mv=u&mvi=2&rmhost=r4---sn-gpv7kn7d.gvt1.com" --output android-studio.tar.gz
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

function error(){
    return 1
}

if [ -f "/opt/android-studio/bin/studio.sh" ]; then
    echo -e "\n\e[0;36m* The \e[0;33mandroid-studio\e[0;36m package already installed!\e[00m"
    error
else
    installAndroidStudio
    installLombokPlugin
    createDesktopIcon
fi


# https://drive.google.com/file/d/1GEwQCRaO-PiJMsguV4qqG82u-zYVr-U9/view   - lombok
# https://drive.google.com/file/d/1-n9H48iSAGB2Y2OB0iS4zhVOytEkcG4G/view   - android-studio
