#!/bin/bash

function getSnapVersion(){
    snap_version=""
    counter=0

    for char in ${SEARCH[@]}; do
        if [ $counter == 1 ]; then
            snap_version=$char
            break
        fi
        counter=$(expr $counter + 1)
    done
}

function checksIfPackageIsInstalled(){
    SEARCH="$(snap list --all | grep $1 2>/dev/null)"

    if [[ "$SEARCH" == *"$1"* ]]; then
        getSnapVersion
        echo -e "\n\e[0;36m* The \e[0;33m$1\e[0;36m package already installed in version \e[0;33m$snap_version\e[00m"
        return 0
    else
        return 1
    fi
}

checksIfPackageIsInstalled $1