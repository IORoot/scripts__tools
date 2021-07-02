#!/bin/bash
source cli_colours.sh

    SEARCH=$1
    
    WP_PATH=`./find_wp_instance.sh $SEARCH`

    WP_VARS=`./get_db_details.sh $WP_PATH`

    ./dump_db.sh $WP_VARS