#!/bin/bash

USERID=$(id -u)

# for color codes.
R="\e[31m"
G="\e[32m"
N="\e[0m"
N="\e[0m"

CHECK_ROOT() {
    if [ $USERID -ne 0 ]
    then
        echo -e "$R please run the script with root privileges $N"
        exit 1
    fi
    
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 is not installed successfully $N"
        exit 1
    else
        echo -e "$G $2 is installed successfully $N" 
    fi

}

CHECK_ROOT

# sh 15-loops.sh git mysql postfix nginx
for package in $@   #$@ refers to all the variables/args passed to it.
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it..."
        dnf install $package -y
        VALIDATE $? "installing $package"
    else
        echo "$package is installed, no worries..."
    fi
    
done