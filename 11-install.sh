#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: u sud have sudo access"
    exit 1 #other than 0
fi

dnf list installed git

if [ $? -ne 0 ]

then 

    dnf install git -y

        if [ $? -ne 0 ]
        then
           echo "installation failure"
           exit 1
        else
          echo "installation success"
        fi
else
    echo "Git  already installed"
fi

dnf list installed git

if [ $? -ne 0 ]

then 

    dnf install mysql -y

        if [ $? -ne 0 ]
        then
            echo "installation failure"
            exit 1
        else
             echo "installation success"
        fi
else
    echo " mysql already install"
fi