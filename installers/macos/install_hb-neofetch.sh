#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -f /opt/homebrew/bin/neofetch ]; then
        printf "Already Installed\n"
    else
        brew list neofetch 1>/dev/null || brew install neofetch                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi


#  Install CUSTOM version )from forked github repo
if [ ! -f /usr/local/bin/neofetch2 ]; then
    sudo wget -O /usr/local/bin/neofetch2 https://raw.githubusercontent.com/IORoot/neofetch/master/neofetch 
    sudo chmod +x  /usr/local/bin/neofetch2
fi

# Config file
if [ -L ~/.config/neofetch/config.conf ]; then
    printf "Already Installed\n"
else
    sudo mv ~/.config/neofetch/config.conf ~/.config/neofetch/config.conf.orig
    sudo ln -s $INSTALL_DIR/scripts/dotfiles/.neofetch_config.conf ~/.config/neofetch/config.conf
    printf "DONE\n"
fi