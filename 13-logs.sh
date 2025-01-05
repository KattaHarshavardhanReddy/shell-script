#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
H="\e[34m"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
if [ $1 -ne 0 ]
        then
           echo "$2  $R failure"
           exit 1
        else
            echo "$2  $G success"
        fi

}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "Error:: u sud have sudo access"
    exit 1 #other than 0
fi

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]

then 

    dnf install mysql - &>>$LOG_FILE_NAME

    VALIDATE $? "installed mysql"
else
    echo -e " $Y mysql  already installed"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]

then 

    dnf install git -y &>>$LOG_FILE_NAME

      VALIDATE $? "installed git"
else
    echo -e " $H git already install"
fi