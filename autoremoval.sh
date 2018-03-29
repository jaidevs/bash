#!/bin/bash
k=`ls /tmp/jai | wc -l`
if [ "$k" -gt 2 ]
then
cd /tmp/jai
deletedata=`ls -t1 | tail -n +3`
ls -t1  | tail -n +3 | xargs rm -rf
p=`df -kh | grep /dev/sda1 | awk '{print $4}'`
echo "removed folder is $deletedata, space left is $p" | mail -s fedex-autoremoval-backup jaidev.singh@ebizontek.com
fi

