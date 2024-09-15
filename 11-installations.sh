#!/bin/bash

#installation of GIT using shell-script.

USERID=$(id -u)

echo "userid is :$USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with Root privileges..."
fi