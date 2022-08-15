#!/bin/bash

if [ -f "/opt/homebrew/bin/brew" ]; then
    printf "Already Installed\n"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    printf "DONE\n"
fi