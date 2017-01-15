#!/bin/bash

aws ec2 describe-snapshots --owner self --output text > snap_desc  #To redirect all snapshot details into a file
today_date=$(date +%d)

while read line
do 

SNAP_ID=$(echo $line | awk '{print $6}')                           #To get snapshot-id
SNAP_DATE=$(echo $line | awk '{print $2}')                         #To get snapshot date of creation
sleep 5

if [ "$SNAP_DATE" == "$today_date" ]; then                         
	aws ec2 delete-snapshot --snapshot-id $SNAP_ID
	echo "Snapshot deleted with ID: $SNAP_ID and previous month date: $SNAP_DATE"
fi
 
done < snap_desc