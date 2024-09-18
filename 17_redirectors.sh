#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOG_FOLDER

USERID=$(id -u)

# for color codes.
R="\e[31m"
G="\e[32m"
N="\e[0m"
N="\e[0m"

CHECK_ROOT() {
    if [ $USERID -ne 0 ]
    then
        echo -e "$R please run the script with root privileges $N" | tee -a $LOG_FILE
        exit 1
    fi
    
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 is not installed successfully $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$G $2 is installed successfully $N" | tee -a $LOG_FILE
    fi

}

USAGE() {
    echo -e "$R USAGE:: $N sudo sh 17-redirectors.sh package1 package2 ..." | tee -a $LOG_FILE
    exit 1
}

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

# sh 15-loops.sh git mysql postfix nginx
for package in $@   #$@ refers to all the variables/args passed to it.
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$R $package is not installed, going to install it...$N" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "installing $package"
    else
        echo -e "$G $package is installed, no worries...$N" | tee -a $LOG_FILE
    fi
    
done