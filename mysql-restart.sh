#!/bin/bash
ps -ef | grep /usr/sbin/mysqld | grep -v grep > /dev/null
if [ $? -ne 0 ] ;
then
echo hello
service mysql start
fi

