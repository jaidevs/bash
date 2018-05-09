#!/bin/bash
while : 
do
sleep 10
j= `top -n1 -b | grep chron | awk '{ print $1 }'`
kill -9 $j
done
