#!/bin/bash

(
while true
do

folder=$(pwd)

printf "##### FREE SPACE #####\n"
df -h | awk {'printf "%-10s %20s %20s\n", $1, $2, $4'}

printf "\n##### LARGEST FOLDERS #####\n"
du -a /dev/ | sort -n -r | head -n 10

printf "\n##### FOLDERS AND SUB-FOLDERS #####\n"
du -a $folder | sort -n 

sleep 15

done )
