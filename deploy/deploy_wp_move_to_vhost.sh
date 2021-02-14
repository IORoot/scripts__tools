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
    cli_text "RED" "Usage: $0 USER@TARGET VHOST" >&2
    exit 1
fi

TARGET=$1
VHOST=$2


declare_input_filenames() {

    if [[ ! -z "${WPDBNAME}" ]]; 
    then
        DB_FILES=${WPDBNAME}-`date '+%y%m%d'`.sql.gz
        SITE_FILES=${WPDBNAME}-`date '+%y%m%d'`.tar.gz
    fi

}


ssh_move_to_vhost() {
    ssh ${TARGET} "mv /tmp/${DB_FILES} /var/www/vhosts/${VHOST}/; mv /tmp/${SITE_FILES} /var/www/vhosts/${VHOST}/"
}


cli_header "SSH Moving files to vHost directory"
declare_input_filenames
ssh_move_to_vhost
