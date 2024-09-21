#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR exists"
else
    echo "$SOURCE_DIR not exists"
    exit 1
fi
