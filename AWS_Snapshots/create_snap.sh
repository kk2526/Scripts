#!bin/bash

read -p " Your Instance ID, Please !:" Id

aws ec2 describe-volumes --filters Name=attachment.instance-id,Values=$Id --output text --query 'Volumes[*].VolumeId' | awk '{print $1}' | while read line; #To get VolumeId associated with your InstanceID

do 
echo $line

aws ec2 create-snapshot --volume-id $line --description "$(date +%d)"   #Create snapshots of all VolumeId's 

done 