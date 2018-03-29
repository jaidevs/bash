#!/bin/bash
j=`df -kh | grep no | wc -l`
if [ "$j" -lt 5 ]
then 
#sh /home/bitnami/script/s3-mount.sh >> /scripts/scr.log
echo "plz mount"
else
echo "everything is ok" 
fi

