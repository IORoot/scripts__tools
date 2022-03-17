#!/bin/bash

if [ -f "/usr/local/bin/brew" ]; then
    printf "Already Installed\n"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    printf "DONE\n"
fi