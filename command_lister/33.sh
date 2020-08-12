#!/bin/bash

COMMANDFOLDER='./commands'

# Color in BASH
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
VIEW='summary'
if [ $# -eq 1 ]; then
   VIEW="list"
fi

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREY='\033[0;90m'
NC='\033[0m' # No Color

printf "${RED}ThirtyThree's${NC} Command List \n\n"

printf "${GREEN}Options: \n"
echo "----------------------------------------"
printf "${NC}./33 list \n\n"

printf "${GREEN}Available commands: \n"
echo "----------------------------------------"

# get unique list of all categories from first lines
FILELIST=$(ls ${COMMANDFOLDER})
CATEGORIES=''
for i in $FILELIST; 
do  
    CATEGORY=$(sed '1q;d' ${COMMANDFOLDER}/$i)
    CATEGORIES="${CATEGORIES} ${CATEGORY}" 
done

# Find each UNIQUE word and remove duplicates
CATEGORIES=$( echo "$CATEGORIES" | tr ' ' '\n' | sort | uniq )

# Loop through each category
for i in $CATEGORIES;
do
    # Find the list of all files that has a first line with the category in it.
    FILELIST=$(grep -l ${COMMANDFOLDER}/* -e $i | awk -F/ '{ print $NF }')
    PREVIOUS=''

    # Loop through each file
    for i in $FILELIST; 
    do  
        CATEGORY=$(sed '1q;d' ${COMMANDFOLDER}/$i)
        COMMAND=$(sed '2q;d' ${COMMANDFOLDER}/$i)
        PARAMS=$(sed '3q;d' ${COMMANDFOLDER}/$i)
        DESC=$(sed '4q;d' ${COMMANDFOLDER}/$i)

        # If this is a category heading, output it.
        if [ "$PREVIOUS" != "$CATEGORY" ];
        then
            printf "\n ${BLUE}${CATEGORY}\n"
            PREVIOUS=$CATEGORY
        fi;

        if [ "$VIEW" == "list" ];
        then
            printf "    ${CYAN}%-40s ${GREY}%s\n" "${COMMAND}" "${DESC}"
            continue 1;
        fi;

        # output the command.
        printf "    ${CYAN}${COMMAND} ${NC}${PARAMS}\n"
        printf "            ${GREY}${DESC} \n"

    done

done
