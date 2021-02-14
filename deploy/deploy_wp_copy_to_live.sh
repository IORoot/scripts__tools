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

    rsync -a /tmp/${DB_FILES} ${TARGET}:/tmp
    cli_text "${GREEN}DB Files sent to ${TARGET}:/tmp/${DB_FILES} ${NC}"

    rsync -a /tmp/${SITE_FILES} ${TARGET}:/tmp
    cli_text "${GREEN}SITE Files sent to ${TARGET}:/tmp/${DB_FILES} ${NC}"
    
}


check_wp_config_exists
cli_header "rSync Dumps to Remote Target"
read_dbname
declare_input_filenames
rsync_files