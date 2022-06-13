#!/bin/bash

function checksIfPackageIsInstalled(){
    SEARCH="$(dpkg-query --show -f='${Status} ${Version}\n' $1 2>/dev/null)"

    if [[ "$SEARCH" == *"ok installed"* ]]; then
        VERSION_APP="${SEARCH//'install ok installed '/}"
        echo -e "\n\e[0;36m* The \e[0;33m$1\e[0;36m package already installed in version \e[0;33m$VERSION_APP\e[00m"
        return 0
    else
        return 1
    fi
}

checksIfPackageIsInstalled $1