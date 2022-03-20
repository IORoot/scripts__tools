#!/bin/bash

if [ -L ~/.gitignore_global ]; then
    printf "Already Installed\n"
else
    ln -s $INSTALL_DIR/scripts/dotfiles/.gitignore_global ~/.gitignore_global
    printf "DONE\n"
fi