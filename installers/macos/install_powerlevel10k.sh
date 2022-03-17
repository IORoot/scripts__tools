#!/bin/bash

source $INSTALL_DIR/installers/helpers.sh

if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    printf "Already Installed\n"
else
    # Clone into custom themes
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    cp $INSTALL_DIR/scripts/dotfiles/.p10k.zsh ~/.p10k.zsh

    printf "DONE\n"
fi