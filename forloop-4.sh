#!/bin/bash
for i in `cat /root/data1.txt`
do
	cd /root/jai/"$i"
	ls > /root/data_"$i"

	for j in `cat /root/data_"$i"`
		do
	cd /root/jai/"$i"/$j
	ls > /root/data_"$i"_"$j"
	for k in `cat /root/data_"$i"_"$j"`
		do
	mv /root/jai/"$i"/"$j"/"$k" /root/jai/"$i"/"$j"/"$i"-"$j"_"$k"
	cp /root/jai/"$i"/"$j"/"$i"-"$j"_"$k" /root/attachments	
		done	
	done
done
rm -rvf /root/data_* > /dev/null
