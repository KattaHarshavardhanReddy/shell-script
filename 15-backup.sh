#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if user is not providing no. of days, we are tacking 14 as default

Logs_folder="/home/ec2-user/shellscript-logs"
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
    echo -e "$R USAGE::$N sh 15-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR is not found"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo -e "$DEST_DIR is not found"
    exit 1
fi

echo "script is executed at $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ] #true if there are files to zip
then
    echo "Files are: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo -e "Successfully zipped the files older than $DAYS"
        while read -r filepath #here filepath is the variable name, we can give any name
        do
            echo "Deleting files: $filepath" &>>$LOG_FILE_NAME
            rm -rf $filepath
            echo "Deleted files: $filepath"
        done <<< $FILES

    else
        echo -e "$R Error:: $N Fail to zip the files"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi