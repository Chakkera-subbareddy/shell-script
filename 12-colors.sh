#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

Validate(){
     if [ $1 -ne 0 ]
        then 
            echo -e "$2...$R FAILURE"
            exit 1
        else 
            echo -e "$2...$G SUCCESS"
        fi
}
 
 if [ $USERID -ne 0 ]
  then 
     echo "ERROR:: you must have sudo access to execute this script"
    exit 1 #other than o
fi 
dnf list installed mysql

if [ $? -ne 0 ]
then  # not installed 
        dnf install mysql -y
        Validate $? "Installing MySQL"    
 else 
            echo -e "MYSQL is already ...$Y INSTALLED"
 fi 

dnf list installed Git
 if [ $? -ne 0 ] 
 then # not installed 
        dnf install Git -y
        Validate $? "Installing Git"      
else 
     echo -e "Git is already ...$Y INSTALLED"
 fi 

 


 











