#!/bin/bash

echo -e "\nChecking snapd package for install vscode..."

SEARCH="$(dpkg-query --show -f='${Status} ${Version}\n' snapd 2>/dev/null)"

function installExtensions(){
    local extensions=(
        pkief.material-icon-theme # Material Icon Theme
        shakram02.bash-beautify # Bash Beautify
        angular.ng-template # Angular Language Service
        johnpapa.angular2 # Angular Snippets (Version 13)
        mikael.angular-beastcode # Angular 10 Snippets - TypeScript, Html, Angular Material, ngRx, RxJS & Flex Layout
        alexiv.vscode-angular2-files # Angular Files
        formulahendry.auto-rename-tag # Auto Rename Tag
        formulahendry.auto-close-tag # Auto Close Tag
        steoates.autoimport # Auto Import
        bmewburn.vscode-intelephense-client # PHP Intelephesense
        brapifra.phpserver # PHP Server
        thekalinga.bootstrap4-vscode # Bootstrap 4, Font awesome 4, Font Awesome 5
        zaczero.bootstrap-v4-snippets # Bootstrap v4 Snippets
        hansuxdev.bootstrap5-snippets # Bootstrap 5 & Font Awesome Snippets
        anbuselvanrocky.bootstrap5-vscode # Bootstrap 5 Quick Snippets
        ms-vscode.cpptools # C/C++
        ms-dotnettools.csharp # C#
        kreativ-software.csharpextens # C# Extensions
        formulahendry.code-runner # Code Runner
        zignd.html-css-class-completion # IntelliSense for CSS class names in HTML
        geyao.html-snippets # Html Snippets
        xabikos.javascriptsnippets # JavaScript (ES6) code snippets
        vscjava.vscode-java-pack # Extension Pack for Java
        ms-toolsai.jupyter # Jupyter
        ryannaddy.laravel-artisan # Laravel Artisan
        onecentlin.laravel-blade # Laravel Blade Snippets
        onecentlin.laravel5-snippets # Laravel Snippets
        ritwickdey.liveserver # Live Server
        ms-azuretools.vscode-docker # Docker
        vincaslt.highlight-matching-tag # Highlight Matching Tag
        eg2.vscode-npm-script # npm
        christian-kohler.npm-intellisense # npm Instellisense
        xdebug.php-debug # PHP Debug
        zobo.php-intellisense # PHP Intellisense
        mehedidracula.php-namespace-resolver # PHP Namespace Resolver
        ms-ceintl.vscode-language-pack-pt-br # Portuguese (Brazil) Language Pack for Visual Studio Code
        ms-python.python # Python
        natqe.reload # Reload
        visualstudioexptteam.vscodeintellicode # IntelliCode
        formulahendry.vscode-mysql # MySQL
        toba.vsfire # Firebase
        hasanakg.firebase-snippets # Firebase Snippets
        chflick.firecode # Firestore Rules
        mongodb.mongodb-vscode # MongoDB for VS Code
        dracula-theme.theme-dracula # Dracula Official
    )

    for extension in "${extensions[@]}"; do
        code --install-extension $extension
    done
}

function error(){
    return 1
}

if [[ "$SEARCH" == *"ok installed"* ]]; then
    path_script=$(pwd)
    path_script="${path_script//'/apps_scripts'}"
    $path_script/checks_pkg_snapd.sh "code"
    status=$?

    if [ $status == 0 ]; then
        error
    else
        echo -e "\n\e[01;32m---|\e[00m Installing \e[01;33mvscode\e[00m package..."
        sleep 0.500
        sudo snap install --classic code
        installExtensions  
    fi
else
    echo -e "\e[0;31m* You need to have snapd to install code!\e[00m"
    error
fi
