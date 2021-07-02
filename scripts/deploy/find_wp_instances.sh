#!/bin/bash

# Returns the first match path

if [ "$#" -ne 1 ]; then
    echo "$0 [SEARCH]"
    exit 1
fi

DIR="/var/www"
SEARCH=$1
MATCH=`/usr/bin/find $DIR -maxdepth 3 -name wp-config.php | grep "${SEARCH}" | head -1`

if [ -z "$MATCH" ]
then
    exit
else
    echo $MATCH
fi