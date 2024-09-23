#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

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
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR doesnot exists... please check"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR doesnot exists... please check"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo -e "$G FILES $N: $FILES"

if [ ! -z $FILES ]  # '-z' is true if files are empty, '!' makes the expression false.
then
    echo -e "$G Files are found $N"
    ZIP_File="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip $ZIP_File -@

    # check if file is successfully zipped or not.
    if [ -f $ZIP_File ]
    then
        echo -e "Files are $G successfully zipped $N that are older than $DAYS days"
        # remove the files after zipping.
        while IFS= read -r file     #IFS= Internal Field Seperator here IFS is empty it means it will not ignore white spaces, -r =not  to ignore special characters like /
        do
            echo -e "$Y deleting file $N: $file"
            rm -rf $file   #here deleting one by one file with looping. Actually we can delete this at -name cmd only by using (-exec rm -rf).
        done <<<$FILES
    else
        echo -e "$R Files are not zipped $N"
        exit 1
    fi
else
    echo -e "$Y No files are found older than $DAYS days $N"
fi