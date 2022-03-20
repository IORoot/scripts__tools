#!/bin/bash

if [ -L ~/.vimrc ]; then
    printf "Already Installed\n"
else
    ln -s $INSTALL_DIR/scripts/dotfiles/.vimrc ~/.vimrc
    printf "DONE\n"
fi