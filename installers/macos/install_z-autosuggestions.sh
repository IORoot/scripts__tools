#!/bin/bash

if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    printf "Already Installed\n"
else
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions                    #
    printf "DONE\n"
fi
