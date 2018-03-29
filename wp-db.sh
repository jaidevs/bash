#!/bin/bash
for i in `cat /tmp/word.txt | awk -F '|' '{print $2}'`;
do 
cd $i
j=`cat wp-config.php |grep DB_NAME | awk -v FS="('|')" '{print $4}'`
echo "$i|$j" >> /tmp/jai.txt
done

