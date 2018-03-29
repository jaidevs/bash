#!/bin/bash
ps -ef | grep /usr/sbin/mysqld | grep -v grep > /dev/null
if [ $? -eq 0 ] ;
then
k=`ps -ef | grep /usr/sbin/mysqld |grep -v grep |  awk '{print $2}'`
kill -9 $k
fi
