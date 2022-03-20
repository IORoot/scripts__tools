#!/bin/bash

source $INSTALL_DIR/installers/helpers.sh

if [ ! -L ~/.p10k.zsh ]; then
    ln -s $INSTALL_DIR/scripts/dotfiles/.p10k.zsh ~/.p10k.zsh
fi

if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    printf "Already Installed\n"
else
    # Clone into custom themes
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    printf "DONE\n"
fi

# MACOS OS ICON COLOURS
typeset -g POWERLEVEL9K_OS_ICON_FOREEGROUND=8
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=255