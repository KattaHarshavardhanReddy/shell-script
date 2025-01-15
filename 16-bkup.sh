#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

S_D=$1  # Source directory
D_D=$2 # Destination directory
DAYS=${3:-14} #if user is not providing no. of days, we are tacking 14 as default

Logs_folder="/home/ec2-user/ss-logs"
Logs_file=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$Logs_folder/$Logs_file-$TIMESTAMP.log"



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
    echo -e "$R USAGE :: sh 16-bkup.sh <S_D> <D_D> <DAYS>"

}

mkdir -p /home/ec2-user/ss-logs

if [ $# -lt 2 ]
then
    USAGE
fi


echo "script is executed at $TIMESTAMP" &>>$LOG_FILE_NAME