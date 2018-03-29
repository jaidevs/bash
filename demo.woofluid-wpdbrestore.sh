#!/bin/bash
echo "------------------------------------------------------------------" >> /scripts/demo.woofluid/scr.log
DATE=`date +%Y%m%d`
restored_time=`date "+%F %T"`
echo "script was executed at $restored_time"  >> /scripts/demo.woofluid/scr.log
user=root             ###########DB username###############
pass=xoom@tv1         ############DB password#############
db=woofluidnew
un=woofluidnew
mysql -u "$user" -p"$pass" -e "drop database $db"
mysql -u "$user" -p"$pass" -e "create database $db"
mysql -u"$user" -p"$pass" -e "grant all on $db.* to $un@"localhost""
mysql -u"$user" -p"$pass" $db < /scripts/demo.woofluid/woofluidnew-30june.sql
myvar=`mysql -u"$user" -p"$pass" -Nse "SELECT create_time FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = 'woofluidnew' limit 1;"`
k=`echo $myvar | awk '{print $1}' | tr -d '-'`
if [ $DATE -eq $k ]; 
then
 echo "demo.woofluid database was restored." | mail -s "demo.woofluid DB was restored successfully at $restored_time" jaidev.singh@ebizontek.com prabhat.mishra@ebizontek.com  sudeepgoyal@ebizontek.com
else
 echo "demo.woofluid database was not restored, please check." | mail -s "demo.woofluid DB was not restored at $restored_time" jaidev.singh@ebizontek.com prabhat.mishra@ebizontek.com sudeepgoyal@ebizontek.com
fi

