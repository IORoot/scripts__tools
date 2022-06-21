#!/bin/bash

# Dependencies
# pandoc ✘, rust ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/neofetch ]; then
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
    wget -O /usr/local/bin/neofetch2 https://raw.githubusercontent.com/IORoot/neofetch/master/neofetch 
    chmod +x  /usr/local/bin/neofetch2
fi

# Config file
if [ -L ~/.config/neofetch/config.conf ]; then
    printf "Already Installed\n"
else
    mv ~/.config/neofetch/config.conf ~/.config/neofetch/config.conf.orig
    ln -s $INSTALL_DIR/scripts/dotfiles/.neofetch_config.conf ~/.config/neofetch/config.conf
    printf "DONE\n"
fi