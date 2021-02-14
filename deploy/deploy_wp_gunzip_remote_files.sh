#!/bin/bash

# STEP 05.

PWD=`/bin/pwd`
WWW="/var/www/vhosts/"

# Import common functions.
import_common() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    source ${DIR}/deploy/deploy_functions.sh   
}
import_common

# Must have destination
if [ "$#" -ne 2 ]; then
    cli_text "RED" "Usage: $0 USER@TARGET VHOST" >&2
    exit 1
fi

TARGET=$1
VHOST=$2

ssh_unzip_remote_files() {
    cli_text "${GREEN}Unzipping files in ${WWW}${VHOST}/ ${NC}"
    ssh ${TARGET} "gunzip ${WWW}${VHOST}/*.gz" & spinner
}

uncompress_tar_file() {
    cli_text "${GREEN}Untarring tar files in ${WWW}${VHOST}/ ${NC}"
    ssh ${TARGET} "tar -xf ${WWW}${VHOST}/*.tar" & spinner
}


cli_header "Unzipping Remote Files"
ssh_unzip_remote_files
uncompress_tar_file