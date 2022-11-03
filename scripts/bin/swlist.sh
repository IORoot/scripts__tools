#!/bin/sh

export INPUT_PATH="/"
export USER=$(whoami)
export WIDTH=$(tput cols)

export RIGHT_COL_1_WIDTH=10
export RIGHT_COL_2_WIDTH=30
export RIGHT_COL_3_WIDTH=6
export RIGHT_COL_4_WIDTH=20
export VERTICALS_WIDTH=3
export EOL_WIDTH=1
export LEFT_COL_WIDTH=$(( $WIDTH - $RIGHT_COL_1_WIDTH - $VERTICALS_WIDTH - $RIGHT_COL_2_WIDTH - $VERTICALS_WIDTH - $RIGHT_COL_3_WIDTH - $VERTICALS_WIDTH - $RIGHT_COL_4_WIDTH - $VERTICALS_WIDTH - $EOL_WIDTH ))

SCRIPT_NAME=$0
SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

FLAG_VERSIONS="NO"
FLAG_EXECUTABLE="NO"
FLAG_RAW="NO"
FLAG_MIMETYPE="NO"
FLAG_SUID="NO"
RUN_STANDARD="NO"
RUN_EXECUTABLE="NO"



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
    printf "Search for applications with the +s SUID permissions\n"
    print_line "-" $WIDTH
    print_header "Search Methods"
    usage_flag -s --standard "Search standard program locations (overrides [path])"
    usage_flag -e --executable "Find all executable (+x) files on system"
    print_line "-" $WIDTH
    print_header "Display Parameters"
    usage_flag -r --raw "raw output."
    usage_flag -x --exec "Check if file is executable. (automatically set with -e)"
    usage_flag -t --type "Check if file is binary or text"
    usage_flag -u --suid "Check if file has SUID / SGID bit set (superuser/supergroup)"
    usage_flag -v --versions "Run commands with '--version' to find version number"
    print_line "-" $WIDTH
    usage_flag -h --help "Show this help"
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

print_header(){
    printf ${Yellow}"$1";
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
    printf "${Green}%-${LEFT_COL_WIDTH}s${White} | ${Yellow}%-${RIGHT_COL_1_WIDTH}s ${NC}| ${Yellow}%${RIGHT_COL_2_WIDTH}s ${NC}| ${Yellow}%${RIGHT_COL_3_WIDTH}s ${NC}| ${Yellow}%${RIGHT_COL_4_WIDTH}s \n" "File" "Executable" "Mimetype" "SUID" "Version"
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

    # Is last parameter a path? 
    if [ -d "${@: -1}" ]; then 
        INPUT_PATH="${@: -1}"
    fi

    while [ $# -gt 0 ]; do
        case $1 in
            -v|--versions)
                eval FLAG_VERSIONS="YES"
                shift # past argument
                ;;
            -r|--raw)
                eval FLAG_RAW="YES"
                shift # past value
                ;;
            -x|--exec)
                eval FLAG_EXECUTABLE="YES"
                shift # past value
                ;;
            -t|--type)
                eval FLAG_MIMETYPE="YES"
                shift # past value
                ;;
            -u|--suid)
                eval FLAG_SUID="YES"
                shift # past value
                ;;
            -s|--standard)
                eval RUN_STANDARD="YES"
                shift # past value
                ;;
            -e|--executables)
                eval RUN_EXECUTABLE="YES"
                eval FLAG_EXECUTABLE="YES"
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
# │        Search for Executables        │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
search_executables()
{
    if [[ ${RUN_EXECUTABLE} != "YES" ]]; then
        return 0
    fi

    header "Searching for all files with executable permissions set (/111)" $INPUT_PATH

    find $INPUT_PATH -type f -perm /111 -exec sh -c 'run_checks "$0" "$1" "$2" "$3" "$4" "$5"' {} "$FLAG_RAW" "$FLAG_EXECUTABLE"  "$FLAG_VERSIONS" "$FLAG_MIMETYPE" "$FLAG_SUID" \;;

}

# ┌──────────────────────────────────────┐ 
# │      Search Standard Locations       │░
# │      (override input path)   )       │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
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
            find $INPUT_PATH -type f -perm /111 -exec sh -c 'run_checks "$0" "$1" "$2" "$3" "$4" "$5"' {} "$FLAG_RAW" "$FLAG_EXECUTABLE" "$FLAG_VERSIONS" "$FLAG_MIMETYPE" "$FLAG_SUID" \;;
        fi
    done

}

# ┌──────────────────────────────────────┐ 
# │           EXTERNAL SUBSHELL          │░
# │           Checker functions          │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
run_checks()
{
    cli_colours

    FILE=$1
    FLAG_RAW=$2
    FLAG_EXECUTABLE=$3
    FLAG_VERSIONS=$4
    FLAG_MIMETYPE=$5
    FLAG_SUID=$6

    if [ "$FLAG_EXECUTABLE" == "YES" ]; then
        check_permissions
    fi

    if [ "$FLAG_MIMETYPE" == "YES" ]; then
        check_mimetype
    fi

    if [ "$FLAG_SUID" == "YES" ]; then
        check_suid
    fi

    if [ "$FLAG_VERSIONS" == "YES" ]; then
        check_versions
    fi

    if [ ${FLAG_RAW} = "YES" ]; then
        printf "${FILE} \n";
    else
        printf "${Green}%-${LEFT_COL_WIDTH}s${White} | ${Green}%10s ${White}| ${White}%30s ${White}| ${Red}%6s ${White}| ${Cyan}%20s \n" "${FILE}" "${EXECUTABLE}" "${MIMETYPE}" "${SUIDSET}" "${VERSION}";
    fi

}
export -f run_checks

# ┌──────────────────────────────────────┐ 
# │           TEST IF EXECUTABLE         │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
check_permissions()
{
    test -x $FILE && EXECUTABLE="YES" || EXECUTABLE="NO"
    
}
# export to be able to run with a 'find' command loop
export -f check_permissions

check_versions()
{
    VERSION=$(${FILE} --version 2> /dev/null | head -n 1 | grep -o '[0-9.]*' | head -n 1)
}
export -f check_versions

check_mimetype()
{
    MIMETYPE=$(file -b --mime-type $FILE | head -n 1)
}
export -f check_mimetype

check_suid()
{
    IS_SET=$(find "$FILE" -perm +4000);
    if [ -n "$IS_SET" ]; then
        SUIDSET="Y"
    else
        SUIDSET="-"
    fi
}
export -f check_suid

# ┌──────────────────────────────────────┐ 
# │          Run all functions           │░
# └──────────────────────────────────────┘░
#  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
cli_colours
process_arguments $*
search_standard
search_executables