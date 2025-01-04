#!/bin/bash

USERID=$(id -u)
 
 if [ $USERID -ne 0 ]
  then 
     echo "ERROR:: you must have sudo access to execute this script"
    exit 1 #other than o
fi 
dnf list installed mysql

if [ $? -ne 0 ]
then  # not installed 
        dnf install mysql -y
        if [ $? -ne 0 ]
        then 
            echo "Installing MYSQL...FAILURE"
            exit 1
        else 
            echo "Installing MYSQL...SUCCESS"
        fi
 else 
            echo "MYSQL is already ...INSTALLED"
 fi 




# if [ $? -ne 0 ]
# then 
#    echo "Installing MYSQL...FAILURE"
#    exit 1
# else 
#  echo "Installing MYSQL...SUCCESS"

# fi

# if [ $? -ne 0 ]
# then 
#    echo "Installing GiT...FAILURE"
#    exit 1
# else 
#  echo "Installing GiT...SUCCESS"

# fi

dnf list installed Git
 if [ $? -ne 0 ] 
 then # not installed 
        dnf install Git -y

        if [ $? -ne 0 ]
        then 
            echo "Installing Git...FAILURE"
            exit 1
        else 
            echo "Installing Git...SUCCESS"
        fi
else 
     echo "Git is already ...INSTALLED"
 fi 








