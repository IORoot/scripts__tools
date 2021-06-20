#!/bin/bash

PWD=`/bin/pwd`

# Import common functions.
source deploy_functions.sh   

# Must have target 
if [ -z "${TARGET}" ]; then
    cli_text "RED" "No Target has been set" >&2
    exit 1
fi



rsync_files() {

    cli_text "${GREEN}Syncing DB Files to ${TARGET}:/tmp/${DB_FILES} ${NC}"
    rsync -a /tmp/${DB_FILES} ${TARGET}:/tmp & spinner
    cli_text "${GREEN}DB Files sent. ${NC}"

    cli_text "${GREEN}Syncing SITE Files to ${TARGET}:/tmp/${SITE_FILES} ${NC}"
    rsync -a /tmp/${SITE_FILES} ${TARGET}:/tmp & spinner
    cli_text "${GREEN}SITE Files sent. ${NC}"
    
}


cli_header "rSync to Remote Target"
declare_input_filenames
rsync_files