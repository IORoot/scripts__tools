#!/bin/bash

if [ -L ~/.gitconfig ]; then
    printf "Already Installed\n"
else
    ln -s $INSTALL_DIR/scripts/dotfiles/.gitconfig ~/.gitconfig

    git config --global core.excludesFile '~/.gitignore_global'
    git config pull.rebase false
    
    printf "DONE\n"
fi