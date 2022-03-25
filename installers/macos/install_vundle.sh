#!/bin/bash

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    printf "Already Installed\n"
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
    vim +PluginInstall +qall
    printf "DONE\n"
fi
