#!/bin/bash

# Dependencies
# Required: gettext ✔, gnutls ✘, libassuan ✘, libgcrypt ✘, libgpg-error ✘, libksba ✘, libusb ✘, npth ✘, pinentry ✘

if [ -f "/usr/local/bin/brew" ]; then

    if [ -d /usr/local/Cellar/gnupg@1.4 ]; then
        printf "Already Installed\n"
    else
        brew list gnupg@1.4 1>/dev/null || brew install gnupg@1.4                   #
        printf "DONE\n"
    fi

else
    printf "HOMEBREW Not Installed\n"
fi