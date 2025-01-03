#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: u sud have sudo access"
    exit 1 #other than 0
fi
dnf install gitv -y

dnf install mysql -y