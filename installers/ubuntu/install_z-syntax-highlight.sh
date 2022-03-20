#!/bin/bash

if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    printf "Already Installed\n"
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting                    #
    printf "DONE\n"
fi