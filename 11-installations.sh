#!/bin/bash

#installation of GIT using shell-script.

USERID=$(id -u)

echo "userid is :$USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with Root privileges..."
fi

dnf list installed git -y
 if [ $? -ne 0 ]
 then
    echo "git is not installed, it is going to install....."
    dnf install git -y
else 
    echo "git is already installed...."
fi    