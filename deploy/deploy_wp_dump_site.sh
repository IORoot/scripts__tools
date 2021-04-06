#!/bin/bash


PWD=`/bin/pwd`

# Import common functions.
source deploy_functions.sh   



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

    for item in "${SOURCE[@]}"
    do
        SOURCES="$SOURCES .${item} "
    done

    cli_text "Sources: ${SOURCES}"
}


compress_site(){
    /usr/bin/tar -czf /tmp/${TARFILE}.gz -C ${PWD} ${SOURCES} & spinner
    cli_text "${GREEN}Tarred all files into /tmp/${TARFILE}.gz ${NC}"
}


cli_header "Wordpress WP-Content Dump"
declare_sources
declare_output_filename
compress_site