#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ] #here checking it is directory or not by using "-d",if we want to check multiple then use 'AND' 'OR'
then
    echo -e "$SOURCE_DIR $G exists $N"
else
    echo -e "$SOURCE_DIR $R not exists $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "FILES :$FILES"

#while loop is used for read the output/files. 
#don't use the word line, it is reserved word.

while IFS= read -r file     #IFS= Internal Field Seperator here IFS is empty it means it will not ignore white spaces, -r =not to ignore special characters like /
do
    echo "deleting file : $file"
    rm -rf $file   #here deleting one by one file with looping. Actually we can delete this at -name cmd only by using (-exec rm -rf).
done <<<$FILES