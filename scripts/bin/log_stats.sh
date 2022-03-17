#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 LOGFILE RESULTCOUNT" >&2
  exit 1
fi


LOGFILE=$1
RESULTCOUNT=$2
LINECOUNT=`wc -l < ${LOGFILE}`
TEMPFILE=/tmp/log_stat_top
TEMPFILE2=/tmp/log_stat_top2

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREY='\033[0;90m'
NC='\033[0m' # No Color

UNIQIPS=`grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ${LOGFILE} | sort -n | uniq -c | wc -l`
grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ${LOGFILE} | sort -n | uniq -c | sort -nr | head -n ${RESULTCOUNT} > ${TEMPFILE}

printf "\n${RED}Log Stats - Top ${RESULTCOUNT} IPs in file${NC}\n"
echo "----------------------------------------"
printf "${GREEN}Log Lines: ${NC}${LINECOUNT}\n"
printf "${GREEN}Unique IPs: ${NC}${UNIQIPS}\n"
echo "----------------------------------------"
printf "${NC}%-20s %-20s %-20s %-20s \n" "IP Address" "Request Count" "% of Requests" "Total Bytes"

while read -r line
do
    IPCOUNT=`echo $line | cut -d " " -f 1`
    IPPERCENT=`echo "scale=9;(100 / ${LINECOUNT}) * ${IPCOUNT}"  | bc`
    IPADDRESS=`echo $line | cut -d " " -f 2`
    grep "${IPADDRESS}" ${LOGFILE} > ${TEMPFILE2}
    BYTECOUNT=`sed -n -e 's/.* [0-9]\{3\} \([[:digit:]]\+\).*/\1/p' ${TEMPFILE2} | paste -sd+ | bc`
    
    printf "${CYAN}%-20s ${GREY}%-20s ${BLUE}%-20s ${GREY}%-20s \n" "${IPADDRESS}" "${IPCOUNT} requests" "${IPPERCENT}%" "${BYTECOUNT}"
done < "${TEMPFILE}"

rm ${TEMPFILE}
rm ${TEMPFILE2}