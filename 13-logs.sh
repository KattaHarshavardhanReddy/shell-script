#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
H="\e[34m"
Logs_folder="/var/log/shellscript-log"

VALIDATE(){
if [ $1 -ne 0 ]
        then
           echo "$2  $R failure"
           exit 1
        else
            echo "$2  $G success"
        fi

}

if [ $USERID -ne 0 ]
then
    echo "Error:: u sud have sudo access"
    exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ]

then 

    dnf install mysql -y

    VALIDATE $? "installed mysql"
else
    echo -e " $Y mysql  already installed"
fi

dnf list installed git

if [ $? -ne 0 ]

then 

    dnf install git -y

      VALIDATE $? "installed git"
else
    echo -e " $H git already install"
fi