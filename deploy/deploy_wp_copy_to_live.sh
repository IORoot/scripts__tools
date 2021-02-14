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
    cli_text "RED" "Usage: $0 DESTINATION" >&2
    exit 1
fi


copy_files_to_tmp() {

}