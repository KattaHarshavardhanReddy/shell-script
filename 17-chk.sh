#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

S_D=$1  # Source directory
D_D=$2 # Destination directory
DAYS=${3:-14} #if user is not providing no. of days, we are tacking 14 as default

Logs_folder="/home/ec2-user/sss-logs"
Logs_file=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$Logs_folder/$Logs_file-$TIMESTAMP.log"

mkdir -p /home/ec2-user/sss-logs

VALIDATE(){
       if [ $1 -ne 0 ]
        then
            echo -e "$2 $R fail"
            exit 1
        else
            echo -e "$2 $G success"
        fi
}

USAGE(){
    echo -e "$R USAGE :: sh 17-chk.sh <S_D> <D_D> <DAYS>"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d "S_D" ]
then
    echo -e "$S_D is not available"
    exit 1
fi

if [ ! -d "D_D" ]
then
    echo -e "$D_D is not available"
    exit 1
fi

echo "script is executed at $TIMESTAMP" &>>$LOG_FILE_NAME