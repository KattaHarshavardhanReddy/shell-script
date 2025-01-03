#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: u sud have sudo access"
    exit 1 #other than 0
fi
dnf install git -y

if [ $? -ne 0 ]
then
    echo "installation failure"
    exit 1
else
    echo "installation success"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "installation failure"
    exit 1
else
    echo "installation success"
fi