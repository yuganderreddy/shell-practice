#!/bin/bash

#installation of GIT using shell-script.

USERID=$(id -u)

#echo "userid is :$USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with Root privileges..."
    exit 1
fi

dnf list installed gittt -y
 if [ $? -ne 0 ]
    then
    echo "git is not installed, it is going to install....."
    dnf install git -y
    if [ $? -ne 0 ]
        then
        echo "git installation is not successfull, please check it...."
        exit 1
        else
        echo "git installation is successfull...."
    fi
    else 
    echo "git is already installed...."
fi    