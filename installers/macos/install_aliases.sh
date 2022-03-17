#!/bin/bash

if [ -L ~/.aliases ]; then
    printf "Already Installed\n"
else
    ln -s $INSTALL_DIR/scripts/dotfiles/.aliases ~/.aliases
    printf "DONE\n"
fi