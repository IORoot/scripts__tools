#!/bin/bash

if [ -L ~/.paths ]; then
    printf "Already Installed\n"
else
    ln -s $INSTALL_DIR/scripts/dotfiles/.paths ~/.paths
    printf "DONE\n"
fi