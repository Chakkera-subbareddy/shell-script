#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"

N="\e[0m"

SOURCE_DIR=$1
DEST_DTR=$2
DAYS=${3:-14} # if user is not providing no of days, we are taking default 14 days

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"


USAGE(){
    echo -e "$R USAGE:: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ]
then 
    USAGE
fi 

if [ ! -d $SOURCE_DIR ]
then 
    echo -e "SOURCE_DIR Does not exist...Please check"
    exit 1
fi 

if [ ! -d $DEST_DIR ]
then 
    echo -e "DEST_DIR Does not exist...Please check"
    exit 1
fi

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
echo "Files are: $FILES"

if [ -n "$FILES" ] #
then 
   echo "Files are: $FILES"
   ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
   find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
   if [ -f "$ZIP_FILE" ]
   then 
       echo -e "successfully created zip file for files older than $DAYS"
    while read -r filepath # here filepath is the variable name, you can give any name
    do 
      echo "Deleting file: $filepath" &>>$LOG_FILE_NAME
      rm -rf $filepath 
      echo "Deleted files: $filepath"
    done <<< $FILES
    else 
       echo -e "$R Error:: $N Failed to create ZIP file"
       exit 1
    fi 
        
else 
   echo "No files found older than $DAYS"
fi

