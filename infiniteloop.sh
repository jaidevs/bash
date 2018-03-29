#!/bin/bash
while :
do
read -p "Enter user name " un
if [ -z $un ];
then echo "Please enter some value or Ctrl+c to exit"
else
break
fi
done
