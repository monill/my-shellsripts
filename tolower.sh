#!/usr/bin/env bash

#Convert UPPERCASE files and directories do lowercase

if ! [[ -x $(command -v rename) ]]; then
    echo "Rename not installed... Starting install"
    apt-get -qq update
    apt-get install -qq rename > /dev/null
else
    find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
fi
