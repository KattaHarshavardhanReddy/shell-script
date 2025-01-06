#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "U need sudo access"
    exit 1
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then
    echo "installation fail"
    exit 1
else
    echo "installation success"
fi