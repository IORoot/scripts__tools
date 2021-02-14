#!/bin/bash

# STEP 02.

PWD=`/bin/pwd`

# Import common functions.
import_common() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    source ${DIR}/deploy/deploy_functions.sh   
}



declare_output_filename() {

    if [[ ! -z "${WPDBNAME}" ]]; 
    then
        TARFILE=${WPDBNAME}-`date '+%y%m%d'`.tar
    else
        cli_text "${RED}No WP DB Found.${NC}"
        exit 1
    fi

    cli_text "${CYAN}Output01: ${TARFILE}.gz${NC}"
}


declare_sources() {
    SOURCE1=./wp-content
    SOURCE2=./wp-config.php

    cli_text "Source01: ${SOURCE1}"
    cli_text "Source02: ${SOURCE2}"
}


compress_site(){
    /usr/bin/tar -czf /tmp/${TARFILE}.gz -C ${PWD} ${SOURCE1} ${SOURCE2} & spinner
    cli_text "${GREEN}Tarred all files into /tmp/${TARFILE}.gz ${NC}"
}


import_common
cli_header "Wordpress WP-Content Dump"
check_wp_config_exists
read_dbname
declare_sources
declare_output_filename
compress_site