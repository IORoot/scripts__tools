#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -d /usr/local/Caskroom/pe-client-tools ]; then
        printf "Already Installed\n"
    else
        brew list --cask pe-client-tools 1>/dev/null || brew install puppetlabs/puppet/pe-client-tools                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi