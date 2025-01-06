#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Logs_folder="/var/log/shellscript-logs"
Logs_file=$(echo $0 | cat -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$Logs_Folder/$Logs_File-$TIMESTAMP.log"

VALIDATE(){
       if [ $1 -ne 0 ]
        then
            echo -e "$2 $R fail"
            exit 1
        else
            echo -e "$2 $G success"
        fi
}

echo "script is executed at $TIMESTAMP" &>>$Logs_file

if [ $USERID -ne 0 ]
then
    echo -e "$R U need sudo access"
    exit 1
fi

dnf list installed mysql &>>$Logs_file
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$Logs_file
        
        VALIDATE $? "mysql installed"
else
    echo -e " $G mysql already installed $N"

fi


dnf list installed git &>>$Logs_file
if [ $? -ne 0 ]
then
    dnf install git -y &>>$Logs_file
        
        VALIDATE $? "git installed" 
          
else
    echo -e " $G git already installed $N"
fi