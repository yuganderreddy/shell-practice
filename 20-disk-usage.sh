#!/bin/bash

DISK_USAGE= $(df -hT | grep xfs)
DISK_THRESOLD=5 #In Real Projects, usually it is 75.

while IFS= read -r line     #IFS= Internal Field Seperator here IFS is empty it means it will not ignore white spaces, -r =not to ignore special characters like /
do
    echo $file
    echo $line
done <<<$DISK_USAGE
