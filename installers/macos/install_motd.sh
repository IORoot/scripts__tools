#!/bin/bash

if [ -f /usr/local/bin/motd ]; then
    printf "Already Installed\n"
else
    sudo ln -s $INSTALL_DIR/scripts/bin/motd/motd /usr/local/bin/motd
    printf "DONE\n"
fi