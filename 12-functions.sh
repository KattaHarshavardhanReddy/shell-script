#!/bin/bash

USERID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
        then
           echo "$2 failure"
           exit 1
        else
            echo "$2 success"
        fi

}

if [ $USERID -ne 0 ]
then
    echo "Error:: u sud have sudo access"
    exit 1 #other than 0
fi

dnf list installed mysqlj

if [ $? -ne 0 ]

then 

    dnf install mysql -y

    VALIDATE $? "installed mysql"
else
    echo "mysql  already installed"
fi

dnf list installed git

if [ $? -ne 0 ]

then 

    dnf install git -y

      VALIDATE $? "installed git"
else
    echo " git already install"
fi