#!/bin/bash
DATE=`date '+%Y-%m-%d %H:%M:%S'`
cat /etc/mtab | grep '/var/www/mac-token/sites/default/files' > /dev/null
if [ $? -ne 0 ] ;
then
fil=`ls -a /var/www/mac-token/sites/default/files | wc -l`
   if [ "$fil" -gt 2 ]
   then  
       mv /var/www/mac-token/sites/default/files /home/ubuntu/files-tmp/
       mkdir /var/www/mac-token/sites/default/files
       /usr/local/bin/s3fs -o allow_other macedu-static  /var/www/mac-token/sites/default/files
       rsync -avzo --stats /home/ubuntu/files-tmp/files/ /var/www/mac-token/sites/default/files/ > /dev/null 2>&1
       rm -rf /home/ubuntu/files-tmp/files/
       echo "s3fs is not mounted on $DATE , but mounted now:- " >> /scripts/log/s3fs.log
       df -kh | grep '/var/www/mac-token/sites/default/files' >> /scripts/log/s3fs.log

   else
       echo "s3fs is not mounted on $DATE , but mounted now:- " >> /scripts/log/s3fs.log
       df -kh | grep '/var/www/mac-token/sites/default/files' >> /scripts/log/s3fs.log
       /usr/local/bin/s3fs -o allow_other macedu-static  /var/www/mac-token/sites/default/files

   fi

#echo "Alert: Auto mount attemptinng s3 " | mail -s "Alert: Macmilan server"  rishu.ranjan@ebizontek.com prabhat.mishra@ebizontek.com  jaidev.singh@ebizontek.com

else 
echo "S3fs is mounted, checked on $DATE , nothing to do" >> /scripts/log/s3fs.log

fi

