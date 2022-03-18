#!/bin/bash

if [ -f ~/.ssh/config ]; then
    printf "Already Installed\n"
else
    cp $INSTALL_DIR/scripts/dotfiles/.ssh-config ~/.ssh/config
    printf "DONE\n"
fi