#!/bin/bash

if [ -L ~/.zshrc ]; then
    printf "Already Installed\n"
else
    cp ~/.zshrc ~/.zshrc-`date '+%y%m%d'`
    rm ~/.zshrc
    ln -s $INSTALL_DIR/scripts/dotfiles/.zshrc.ubuntu ~/.zshrc
    printf "DONE\n"
fi
