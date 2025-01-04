#!/bin/bash

USERID=$(id -u)
 
 if [ $USERID -ne 0 ]
  then 
     echo "ERROR:: you must have sudo access to execute this script"
    exit 1 #other than o
fi 

dnf install mysql -y

if [ $? -ne 0 ]
then 
   echo "Installing MYSQL...FAILURE"
   exit 1
else 
 echo "Installing MYSQL...SUCCESS"

fi

if [ $? -ne 0 ]
then 
   echo "Installing GiT...FAILURE"
   exit 1
else 
 echo "Installing GiT...SUCCESS"

fi




