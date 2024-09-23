#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESOLD=5 #In Real Projects, usually it is 75.

while IFS= read -r line     #IFS= Internal Field Seperator here IFS is empty it means it will not ignore white spaces, -r =not to ignore special characters like /
do
    #echo $file
    USAGE=$(echo $line | grep xfs |awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line |grep xfs |awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESOLD ]
    then
        echo "$PARTITION is more than $DISK_THRESOLD, current value is :$USAGE"
    fi
done <<< $DISK_USAGE
