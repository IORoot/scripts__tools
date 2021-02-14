#!/bin/bash

# Import common functions.
import_common() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    source ${DIR}/deploy/deploy_functions.sh   
}

read_wp_config_variables() {
    WPDBNAME=`cat wp-config.php | grep DB_NAME | cut -d \' -f 4`
    WPDBUSER=`cat wp-config.php | grep DB_USER | cut -d \' -f 4`
    WPDBPASS=`cat wp-config.php | grep DB_PASSWORD | cut -d \' -f 4`

    cli_text "BLUE" "${NC}DB:${GREEN}$WPDBNAME ${NC}USER:${GREEN}$WPDBUSER ${NC}PASS:${GREEN}$WPDBPASS${NC}" 
}


create_mysql_filename() {
    OUTFILE=./wp-content/${WPDBNAME}-`date '+%m%d%y'`.sql.gz
}


dump_database() {
    mysqldump --no-tablespaces -u${WPDBUSER} -p${WPDBPASS} ${WPDBNAME}  | gzip > ${OUTFILE}
    cli_text "DB Dumped to: ${OUTFILE}"
}



import_common
cli_header "Wordpress MySQL Dump"
check_user
check_wp_config_exists
read_wp_config_variables
create_mysql_filename
dump_database