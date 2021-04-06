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


ssh_move_to_vhost() {

    if ssh ${TARGET} "[ ! -d ${WWW}${VHOST} ]"; then
        cli_text "${RED}Remote folder not found: ${WWW}${VHOST}/ ${NC}"
        exit 1
    fi

    if [[ ! -z "${DB_FILES}" ]]; 
    then
        cli_text "${GREEN}Moving DB Files to ${WWW}${VHOST}/ ${NC}"
        ssh ${TARGET} "mv /tmp/${DB_FILES} ${WWW}${VHOST}/;" & spinner
    fi

    if [[ ! -z "${SITE_FILES}" ]]; 
    then
        cli_text "${GREEN}Moving SITE Files to ${WWW}${VHOST}/ ${NC}"
        ssh ${TARGET} "mv /tmp/${SITE_FILES} ${WWW}${VHOST}/;" & spinner
    fi
}


cli_header "SSH Moving files to vHost directory"
declare_input_filenames
ssh_move_to_vhost