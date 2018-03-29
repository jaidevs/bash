#!/bin/bash
IFS=""
read -p "Enter user name " un
read -p "Enter DB name " db
read -p "Enter DB password " dbp
for i in `cat /jaidev/123/scripts/db_sanitization_query-drupal.txt`;
do
echo $i
mysql -u$un -p$dbp $db -e $i
done
