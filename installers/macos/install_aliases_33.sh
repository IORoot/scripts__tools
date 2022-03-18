#!/bin/bash

if [ -L ~/.aliases ]; then
    printf "Already Installed\n"
else
    ln -s $INSTALL_DIR/scripts/dotfiles/.aliases_33 ~/.aliases_33
    printf "DONE\n"
fi