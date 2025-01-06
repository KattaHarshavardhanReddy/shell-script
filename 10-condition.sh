#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo -e "$R U need sudo access"
    exit 1
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then
    echo "installation $R fail"
    exit 1
else
    echo "installation $G success"
fi