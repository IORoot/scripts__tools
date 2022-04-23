#!/bin/bash

if [ -d /usr/local/lib/python2.7/site-packages/pwncat-0.1.2.dist-info ]; then
    printf "Already Installed\n"
else
    pip install pwncat
    printf "DONE\n"
fi