#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
       if [ $1 -ne 0 ]
        then
            echo -e "$2 $R fail"
            exit 1
        else
            echo -e "$2 $G success"
        fi
}

if [ $USERID -ne 0 ]
then
    echo -e "$R U need sudo access"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
        
        VALIDATE $? "mysql installed"
else
    echo -e " $G mysql already installed $N"

fi


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
        
        VALIDATE $? "git installed" 
          
else
    echo -e " $G git already installed $N"
fi