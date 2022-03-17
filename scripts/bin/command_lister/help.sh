#!/bin/bash

# Grab the symlinks REAL location, grab the folder too.
SCRIPT_DIR=`readlink \`which help\``
DIRNAME=`dirname $SCRIPT_DIR`
COMMANDFOLDER="${DIRNAME}/commands"

VIEW='list'

source cli_colours


header()
{
    printf "${Red}Andy P's Command List${NC}\n"
    printf "${Red}------------------------------------------------------------------------------------------------------------------------${NC}\n"
    printf "${Cyan}%-10s ${Cyan}%-20s ${Cyan}%-30s ${Cyan}%s\n" "Category" "Command" "Parameters" "Description"
    printf "${Red}------------------------------------------------------------------------------------------------------------------------${NC}\n"
}


get_category_list()
{
    # get unique list of all categories from first lines
    FILELIST=$(ls ${COMMANDFOLDER})
    CATEGORIES=''
    for i in $FILELIST; 
    do  
        CATEGORY=$(sed '1q;d' ${COMMANDFOLDER}/$i)
        CATEGORIES="${CATEGORIES} ${CATEGORY}" 
    done
}


remove_duplicate_categories()
{
    # Find each UNIQUE word and remove duplicates
    CATEGORIES=$( echo "$CATEGORIES" | tr ' ' '\n' | sort | uniq )
}

get_this_categories_filelist()
{
    # Find the list of all files that has a first line with the category in it.
    FILELIST=$(grep -l ${COMMANDFOLDER}/* -e $i | awk -F/ '{ print $NF }')
}


set_file_contents_variables()
{
    CATEGORY=$(sed '1q;d' ${COMMANDFOLDER}/$i)
    COMMAND=$(sed '2q;d' ${COMMANDFOLDER}/$i)
    PARAMS=$(sed '3q;d' ${COMMANDFOLDER}/$i)
    DESC=$(sed '4q;d' ${COMMANDFOLDER}/$i)
}


set_category_header()
{
    # Don't repeat categories.
    if [ "$PREVIOUS" != "$CATEGORY" ];
    then
        PREVIOUS=$CATEGORY
        NEWLINE=1
    else
        CATEGORY=''
        NEWLINE=0
    fi;
}


print_command()
{
    spacer_line
    printf "${NC}%-10s ${Orange}%-20s ${Green}%-30s ${Purple}%s\n" "${CATEGORY}" "${COMMAND}" "${PARAMS}" "${DESC}"
    
}

spacer_line()
{
    if [ $NEWLINE -eq 1 ]; then
        printf "\n"
    fi
}


loop_through_fileslist()
{
    # Loop through each file
    for i in $FILELIST; 
    do  
        set_file_contents_variables
        set_category_header
        print_command
    done
}


loop_through_categories()
{
    # Loop through each category
    for i in $CATEGORIES;
    do
        PREVIOUS=''
        get_this_categories_filelist
        loop_through_fileslist
    done
}

footer()
{
    printf "${Red}------------------------------------------------------------------------------------------------------------------------${NC}\n"
}

header
get_category_list
remove_duplicate_categories
loop_through_categories
footer