#!/bin/zsh

echo "\nANSI Colours - 30s";
for (( i = 30; i < 38; i++ )); do echo -e "\033[0;"$i"m Normal: (0;$i); \033[1;"$i"m Light: (1;$i) \033[0m"; done
echo "\nANSI Colours - 40s";
for (( i = 40; i < 48; i++ )); do echo -e "\033[0;"$i"m Normal: (0;$i); \033[1;"$i"m Light: (1;$i) \033[0m"; done
echo "\nANSI Colours - 90s";
for (( i = 90; i < 96; i++ )); do echo -e "\033[0;"$i"m Normal: (0;$i); \033[1;"$i"m Light: (1;$i) \033[0m"; done
echo "\nANSI Colours - 100s";
for (( i = 100; i < 108; i++ )); do echo -e "\033[0;"$i"m Normal: (0;$i); \033[1;"$i"m Light: (1;$i) \033[0m"; done
echo ""
echo "\nShell Colours\n"
for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%21)):#3}:+$'\n'}; done