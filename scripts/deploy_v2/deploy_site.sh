#!/bin/bash
source cli_colours.sh

    WP_PATH=`./find_wp_instance.sh $1`

    echo $WP_PATH

    WP_VARS=`./get_db_details.sh $WP_PATH`

    echo $WP_VARS

    ./dump_db.sh $WP_VARS