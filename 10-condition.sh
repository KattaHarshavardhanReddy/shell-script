#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "U need sudo access"
    exit 1
fi