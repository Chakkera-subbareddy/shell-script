#!/bin/bash

USERID=$(id -u)

Validate(){
     if [ $1 -ne 0 ]
        then 
            echo "$2...FAILURE"
            exit 1
        else 
            echo "$2...SUCCESS"
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
            echo "MYSQL is already ...INSTALLED"
 fi 

dnf list installed Git
 if [ $? -ne 0 ] 
 then # not installed 
        dnf install Git -y
        Validate $? "Installing Git"      
else 
     echo "Git is already ...INSTALLED"
 fi 
 


 











