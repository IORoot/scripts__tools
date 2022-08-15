#!/bin/bash

# Dependencies
# Required: gettext ✔, gnutls ✘, libassuan ✘, libgcrypt ✘, libgpg-error ✘, libksba ✘, libusb ✘, npth ✘, pinentry ✘

if [ -f "/opt/homebrew/bin/brew" ]; then

    if [ -d /usr/local/Cellar/gnupg ]; then
        printf "Already Installed\n"
    else
        brew list gnupg 1>/dev/null || brew install gnupg                  #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi