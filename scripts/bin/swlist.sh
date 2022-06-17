#!/bin/sh

# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

INPUT_PATH="/"
USER=$(whoami)
WIDTH=$(tput cols)

RIGHT_COL_1_WIDTH=10
VERTICALS_WIDTH=3
EOL_WIDTH=1
LEFT_COL_WIDTH=$(( $WIDTH - $RIGHT_COL_1_WIDTH - $VERTICALS_WIDTH - $EOL_WIDTH ))

SCRIPT_NAME=$0
SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

FLAG_VERBOSE=NO
FLAG_RAW=NO
RUN_STANDARD=NO
RUN_EXECUTABLE=NO



# ┌──────────────────────────────────────┐ 
# │       Define Colour Variables        │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

cli_colours() {
    # Reset
    NC='\033[0m'                  # NO Colour (reset)

    # Regular Colors
    Black='\033[0;30m'         # Black
    Red='\033[0;31m'           # Red
    Green='\033[0;32m'         # Green
    Yellow='\033[0;33m'        # Yellow
    Orange='\033[0;34m'        # Orange
    Purple='\033[0;35m'        # Purple
    Cyan='\033[0;36m'          # Cyan
    White='\033[0;37m'         # White

    # Bold
    B_Black='\033[1;30m'       # Black
    B_Red='\033[1;31m'         # Red
    B_Green='\033[1;32m'       # Green
    B_Yellow='\033[1;33m'      # Yellow
    B_Orange='\033[1;34m'      # Orange
    B_Purple='\033[1;35m'      # Purple
    B_Cyan='\033[1;36m'        # Cyan
    B_White='\033[1;37m'       # White

    # Underline
    U_Black='\033[4;30m'       # Black
    U_Red='\033[4;31m'         # Red
    U_Green='\033[4;32m'       # Green
    U_Yellow='\033[4;33m'      # Yellow
    U_Orange='\033[4;34m'      # Orange
    U_Purple='\033[4;35m'      # Purple
    U_Cyan='\033[4;36m'        # Cyan
    U_White='\033[4;37m'       # White

    # High Intensity
    I_Black='\033[0;90m'       # Black
    I_Red='\033[0;91m'         # Red
    I_Green='\033[0;92m'       # Green
    I_Yellow='\033[0;93m'      # Yellow
    I_Orange='\033[0;94m'      # Orange
    I_Purple='\033[0;95m'      # Purple
    I_Cyan='\033[0;96m'        # Cyan
    I_White='\033[0;97m'       # White

    # Bold High Intensity
    H_Black='\033[1;90m'       # Black
    H_Red='\033[1;91m'         # Red
    H_Green='\033[1;92m'       # Green
    H_Yellow='\033[1;93m'      # Yellow
    H_Orange='\033[1;94m'      # Orange
    H_Purple='\033[1;95m'      # Purple
    H_Cyan='\033[1;96m'        # Cyan
    H_White='\033[1;97m'       # White

    # Background
    BG_Black='\033[40m'        # Black
    BG_Red='\033[41m'          # Red
    BG_Green='\033[42m'        # Green
    BG_Yellow='\033[43m'       # Yellow
    BG_Orange='\033[44m'       # Orange
    BG_Purple='\033[45m'       # Purple
    BG_Cyan='\033[46m'         # Cyan
    BG_White='\033[47m'        # White

    # High Intensity backgrounds
    BG_I_Black='\033[0;100m'   # Black
    BG_I_Red='\033[0;101m'     # Red
    BG_I_Green='\033[0;102m'   # Green
    BG_I_Yellow='\033[0;103m'  # Yellow
    BG_I_Orange='\033[0;104m'  # Orange
    BG_I_Purple='\033[0;105m'  # Purple
    BG_I_Cyan='\033[0;106m'    # Cyan
    BG_I_White='\033[0;107m'   # White

}
export -f cli_colours

# ┌──────────────────────────────────────┐ 
# │           Printing Outputs           │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

usage_header() {
    printf "${Green}Usage: ${NC}$SCRIPT_NAME ${H_Orange} [-h] [-v] [-e] ${Cyan}Path\n"
}

usage(){
    printf "\n"
    usage_header
    print_line "-" $WIDTH
    usage_flag -h --help "Show this help"
    usage_flag -v --verbose "Increase output verbosity"
    usage_flag -s --standard "Search standard program locations"
    usage_flag -e --executable "Find all executable (+x) files on system"
    usage_flag -i --inputpath "Change folder to search in [/]"
    usage_flag -r --raw "raw output."
    print_line "-" $WIDTH
}

usage_flag(){
    SHORT=$1
    LONG=$2
    INFO=$3
    printf "${Green}%3s  %-20s ${White}| ${Purple}%s\n" "${SHORT}" "${LONG}" "${INFO}"
}

print_line(){
    printf ${NC}"$1"'%.s' $(eval "echo {1.."$(($2))"}");
    printf "\n"
}

header()
{

    if [ $FLAG_RAW = "YES" ]; then
        return 0
    fi

    MESSAGE=("$@")

    printf "${Red}Software Lister${NC}\n\n"
    printf "${NC}User: ${USER}\n"
    printf "${Cyan}%s\n" "${MESSAGE[@]}"; echo

    print_line "-" $WIDTH
    printf "${Green}%-${LEFT_COL_WIDTH}s${White} | ${Yellow}%-${RIGHT_COL_1_WIDTH}s \n" "File" "Executable"
    print_line "-" $WIDTH
}

# ┌──────────────────────────────────────┐ 
# │          Process Arguments           │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
process_arguments()
{

    POSITIONAL_ARGS=()
    if [ $# -eq 0 ]; then 
        usage 
    fi

    while [ $# -gt 0 ]; do
        case $1 in
            -v|--verbose)
                eval FLAG_VERBOSE="YES"
                shift # past argument
                ;;
            -r|--raw)
                eval FLAG_RAW="YES"
                shift # past value
                ;;
            -s|--standard)
                eval RUN_STANDARD="YES"
                shift # past value
                ;;
            -e|--executables)
                eval RUN_EXECUTABLE="YES"
                shift # past value
                ;;
            -h|--help)
                usage
                shift # past value
                ;;
            --default)
                usage
                shift # past argument
                ;;
            -*|--*)
                echo "Unknown option $1"
                exit 1
                ;;
            *)
                POSITIONAL_ARGS+=("$1") # save positional arg
                shift # past argument
                ;;
        esac
    done

}

# ┌──────────────────────────────────────┐ 
# │           Search functions           │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
search_executables()
{
    if [[ ${RUN_EXECUTABLE} != "YES" ]]; then
        return 0
    fi

    header "Searching for all files with executable permissions set (+111)" $INPUT_PATH

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        find $INPUT_PATH -type f -executable -exec sh -c 'check_permissions "$0" "$1"' {} "$FLAG_RAW" \;;
    else
        find $INPUT_PATH -type f -perm +111 -exec sh -c 'check_permissions "$0" "$1"' {} "$FLAG_RAW" \;;
    fi

}

search_standard()
{
    if [[ ${RUN_STANDARD} != "YES" ]]; then
        return 0
    fi

    declare -a PathList=(
        "/usr/local/sbin"           # Admin - Built from Source
        "/usr/local/bin"            # User - Built from Source
        "/usr/local"                # Built from Source
        "/usr/bin"                  # Package Managed
        "/opt"                      # Installed Self-Contained
        "/usr"                      # Installed Self-Contained
        "/bin"                      # OS Essentials
        "/sbin"                     # OS Boot loader
        "~"                         # User Home folder
        "~/Applications"            # MacOS User Applications
        "/usr/share/applications"   # Ubuntu Apps
        "/Applications"             # MacOS Apps
    )

    header "Searching for all executables in common linux locations." "${PathList[@]}"

    for INPUT_PATH in "${PathList[@]}"; do
        if [ -d $INPUT_PATH ]; then
            find $INPUT_PATH -type f -perm +111 -exec sh -c 'check_permissions "$0" "$1"' {} "$FLAG_RAW" \;;
        fi
    done

}

# ┌──────────────────────────────────────┐ 
# │           EXTERNAL SUBSHELL          │░
# │           Checker functions          │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
check_permissions()
{
    cli_colours
    WIDTH=$(tput cols)
    RIGHT_COL_1_WIDTH=10
    VERTICALS_WIDTH=3
    EOL_WIDTH=1
    LEFT_COL_WIDTH=$(( $WIDTH - $RIGHT_COL_1_WIDTH - $VERTICALS_WIDTH - $EOL_WIDTH ))

    FILE=$1
    FLAG_RAW=$2

    test -x $FILE && EXEXCUTABLE="YES" || EXEXCUTABLE=""

    if [ ${FLAG_RAW} = "YES" ]; then
        printf "${FILE} \n";
    else
        printf "${Green}%-${LEFT_COL_WIDTH}s${White} | ${Green}%5s ${White}%s\n" "${FILE}" "${EXEXCUTABLE}";
    fi

}
# export to be able to run with a 'find' command
export -f check_permissions

# ┌──────────────────────────────────────┐ 
# │          Run all functions           │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
cli_colours
process_arguments $*

search_standard
search_executables