#!/bin/bash
source cli_colours

# Usage
# This will find the first wp-config.php match against a search term.
# Use to find your wordpress config you need.
# e.g.
# ./find_wp_config dev.lon



# Returns the first match path
if [ "$#" -ne 1 ]; then
    echo -e "$0 [SEARCH] - ${Orange} Search the /var/www tree to return the first WP folder that matches the parameter."
    exit 1
fi

DIR="/var/www"
SEARCH=$1
MATCH=`/usr/bin/find $DIR -maxdepth 3 -name wp-config.php | grep "${SEARCH}" | head -1 | xargs dirname`

if [ -z "$MATCH" ]
then
    echo "No match found in ${DIR}"
    exit
else
    export WP_PATH=$MATCH
    echo $MATCH
fi