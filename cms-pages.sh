#!/bin/bash
read -p "Enter ServerName " SerNam
read -p "Enter DocumentRoot " DocRoot
for i in `cat /tmp/jai/input.txt | awk -F '.pagedemo.co' '{print $1}' | awk -F '//' '{print $2}'`;
do 
cd $DocRoot
mkdir $i
cd $i
wget http://"$i".pagedemo.co
sed -i -e 's/nofollow/follow/g' index.html
sed -i -e 's/noindex/index/g' index.html
echo "$SerNam/$i" > /tmp/sendmail.txt
done
echo /tmp/sendmail.txt

