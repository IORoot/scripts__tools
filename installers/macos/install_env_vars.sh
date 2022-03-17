#!/bin/bash

if [ -L ~/.env_vars ]; then
    printf "Already Installed\n"
else
    ln -s $INSTALL_DIR/scripts/dotfiles/.env_vars ~/.env_vars
    printf "DONE\n"
fi