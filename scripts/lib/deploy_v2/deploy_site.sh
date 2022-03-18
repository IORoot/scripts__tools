#!/bin/bash
source cli_colours

    SEARCH=$1

    # Find the installation we want.
    WP_PATH=`./find_wp_config.sh $SEARCH`

    # Grab the wp-config variables and make an ENV varible.
    WP_VARS=`./read_wp_config.sh $WP_PATH`

    # Dump Database with ENV varible.
    ./dump_db.sh $WP_VARS