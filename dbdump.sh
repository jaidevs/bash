#!/bin/bash
user=root             ###########DB username###############
pass=root             ############DB password#############
loc_to_save_db_dump=/tmp                                   ##############33dbdump will save in described location, do not put '/' in last.###########33

d=`date +"%m-%d-%Y-%H-%M"`
mysql -u"$user" -p"$pass" -e "show databases" > /tmp/olddb.txt



while :
       do
read -p "Enter DB name " db
                if [ -z $db ]
                then echo "Please enter some value or Ctrl+c to exit"
                else
                break
                fi
                done

filename="$db"_"$d".sql                                                         ##############filename format to decided here###################
cat /tmp/olddb.txt | grep -w $db > /dev/null
 if [ $? -eq 0 ] ;
  then
mysqldump -u"$user" -p"$pass" $db > "$loc_to_save_db_dump"/"$filename"
if [ $? -eq 0 ] ;
  then
echo "DB backup was done, file is at "$loc_to_save_db_dump"/"$filename""
fi
else echo "$db DB does not exist"
fi

