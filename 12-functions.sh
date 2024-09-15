#!/bin/bash

#installation of GIT using shell-script.

USERID=$(id -u)

#echo "userid is :$USERID"
VALIDATE() {
    if [ $1 -ne 0 ]
    then
    echo "$2 is not success" 
    else
    echo "$2 is success"
    fi 
}

if [ $USERID -ne 0 ]
then
    echo "Please run the script with Root privileges..."
    exit 1
fi

dnf list installed git -y


 if [ $? -ne 0 ]
then
    echo "git is not installed, it is going to install....."
    dnf install git -y
    VALIDATE $? "installing git"
else 
    echo "git is already installed...."
fi    

#installation of MySql using shell-script.
dnf list installed mysql -y
if [ $? -ne 0 ]
then
    echo "mysql is not installed, it is going to install....."
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else 
    echo "mysql is already installed...."
fi    