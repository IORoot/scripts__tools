#!/bin/bash

WWW="/var/www/vhosts/"

# Import common functions.
source deploy_functions.sh   


# Must have destination
if [ -z "${TARGET}" ]; then
    cli_text "RED" "No Target has been set" >&2
    exit 1
fi

if [ -z "${VHOST}" ]; then
    cli_text "RED" "No Vhost has been set" >&2
    exit 1
fi

ssh_unzip_remote_files() {
    cli_text "${GREEN}Unzipping files in ${WWW}${VHOST}/ ${NC}"
    ssh ${TARGET} "sudo -s bash -c \"gunzip ${WWW}${VHOST}/*.gz\"" & spinner
}

uncompress_tar_file() {
    cli_text "${GREEN}Untarring tar files in ${WWW}${VHOST}/ ${NC}"
    ssh ${TARGET} "cd ${WWW}${VHOST}; tar -xf *.tar;" & spinner
}

change_ownership() {
    cli_text "${GREEN}Changing owner to www-data:www-data ${NC}"
    ssh ${TARGET} "cd ${WWW}${VHOST}; chown -Rf www-data:www-data *" & spinner  
}


cli_header "Unzipping Remote Files"
ssh_unzip_remote_files
uncompress_tar_file
change_ownership