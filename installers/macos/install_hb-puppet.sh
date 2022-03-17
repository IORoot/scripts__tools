#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Caskroom/puppet-agent ]; then
        printf "Already Installed\n"
    else
        brew list --cask puppet-agent 1>/dev/null || brew install puppetlabs/puppet/puppet-agent                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi