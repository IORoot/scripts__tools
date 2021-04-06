#!/bin/bash

# Import common functions.
source deploy_functions.sh

read_deploy_json()
{
    FILE=".deploy.json"

    if [ ! -f "${FILE}" ]; then
        echo "$FILE doesn't exist in this folder."
        cli_text "RED" "Cannot read ${FILE}, Please make sure you are in a root WordPress directory and have this file."
        exit 1
    fi
    cli_text "GREEN" ".deploy.json Found."

    TARGET="$( jq -r '.target' "$FILE" )"
}

read_deploy_json