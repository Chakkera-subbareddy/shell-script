#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

N="\e[0m"

LOGS_FOLDER="/var/log/shell-script-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

Validate(){
     if [ $1 -ne 0 ]
        then 
            echo -e "$2...$R FAILURE $N"
            exit 1
        else 
            echo -e "$2...$G SUCCESS $N"
        fi
}

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME
 
 if [ $USERID -ne 0 ]
  then 
     echo "ERROR:: you must have sudo access to execute this script"
    exit 1 #other than o
fi 
dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then  # not installed 
        dnf install mysql -y &>>$LOG_FILE_NAME
        Validate $? "Installing MySQL"    
 else 
            echo -e "MYSQL is already ...$Y INSTALLED $N"
 fi 

dnf list installed Git &>>$LOG_FILE_NAME
 if [ $? -ne 0 ] 
 then # not installed 
        dnf install Git -y &>>$LOG_FILE_NAME
        Validate $? "Installing Git"      
else 
     echo -e "Git is already ...$Y INSTALLED $N"
 fi 
 

