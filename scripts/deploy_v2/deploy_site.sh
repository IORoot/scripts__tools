#!/bin/bash
source cli_colours.sh

    DB_NAME="1"
    DB_USER="two"
    DB_PASS="thrreeeee"

    WP_PATH=`./find_wp_instance.sh`

    echo $WP_PATH

    WP_VARS=`./get_db_details.sh $WP_PATH`

    echo $WP_VARS

    ./dump_db.sh $WP_VARS