#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}  #if $3 is empty, default is 14 days.

USAGE() {
    echo -e "$R USAGE $N :: 19-backup.sh <sourcedir> <destdir> <days(optional)>"
}
#check the source and destination paths are provided.
#Args should be minimum 2 and maximum 3, should not give above 4 if they give will not consider.

if [ $# -lt 2 ]
then
    USAGE
fi