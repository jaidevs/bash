#!/bin/bash
user=root             ###########DB username###############
pass=root             ############DB password#############













mysql -u"$user" -p"$pass" -e "show databases" > /tmp/olddb.txt


while :
do
  read -p "Enter DB name " db
   cat /tmp/olddb.txt | grep -w  $db > /dev/null   
  if [ $? -ne 0 ] ;
  then
	while :
	do
	read -p "Enter user name " un
	if [ -z $un ]
	then echo "Please enter some value or Ctrl+c to exit"
	else
	break
	fi
	done

		while :
        	do
		read -p "Enter DB password " dbp
		if [ -z $dbp ]
        	then echo "Please enter some value or Ctrl+c to exit"
        	else
        	break
        	fi
        	done








mysql -u"$user" -p"$pass" -e "create database $db"
mysql -u"$user" -p"$pass" -e "CREATE USER $un@localhost IDENTIFIED BY '"$dbp"'"
mysql -u"$user" -p"$pass" -e "grant all on $db.* to $un@"localhost""

	break      
else
  echo "Database $db already exist, please choose a different name"
  
fi
done
rm /tmp/olddb.txt
