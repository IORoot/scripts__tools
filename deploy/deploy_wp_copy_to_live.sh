#!/bin/bash

PWD=`/bin/pwd`

# Import common functions.
import_common() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    source ${DIR}/deploy/deploy_functions.sh   
}
import_common



# Must have destination
if [ "$#" -ne 1 ]; then
    cli_text "RED" "Usage: $0 USER@TARGET" >&2
    exit 1
fi

TARGET=$1

declare_input_filenames() {

    if [[ ! -z "${WPDBNAME}" ]]; 
    then
        DB_FILES=${WPDBNAME}-`date '+%y%m%d'`.sql.gz
        SITE_FILES=${WPDBNAME}-`date '+%y%m%d'`.tar.gz
    fi

}

rsync_files() {

    cli_text "${GREEN}Syncing DB Files to ${TARGET}:/tmp/${DB_FILES} ${NC}"
    rsync -a /tmp/${DB_FILES} ${TARGET}:/tmp & spinner
    cli_text "${GREEN}DB Files sent. ${NC}"

    cli_text "${GREEN}Syncing SITE Files to ${TARGET}:/tmp/${DB_FILES} ${NC}"
    rsync -a /tmp/${SITE_FILES} ${TARGET}:/tmp & spinner
    cli_text "${GREEN}SITE Files sent. ${NC}"
    
}


cli_header "rSync Dumps to Remote Target"
check_wp_config_exists
read_dbname
declare_input_filenames
rsync_files