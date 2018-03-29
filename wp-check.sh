#!/bin/bash
wp=4.7
cd /tmp
wget https://wordpress.org/download/
i=`cat /tmp/index.html | grep Version | sed -e 's/[^0-9. ]*//g' -e  's/ \+/ /g' | awk '{print $1}'`
compare_result=`echo $i'>'$wp | bc -l`
if [ $compare_result -gt 0 ]; then
echo "Time to update wordpress" | mail -s "Start Doing wordpress update" "jaidev.singh@ebizontek.com"
fi
rm /tmp/index.html*
