#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "u sud have sudo access"
fi

dnf install myql -y