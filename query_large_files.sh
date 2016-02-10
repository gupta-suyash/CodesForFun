#!/bin/bash

echo "Please enter all the filenames: "
read filenames

while :
do
	echo -n "query>"
	read query

	excase="!exit"
	if [ $query == $excase ]
	then
		break
	fi

	for i in $filenames
	do
		cat -b $i > temp1.txt
		grep -w "$query" temp1.txt > temp2.txt
		awk '{$1=$1}1' temp2.txt > temp3.txt
		echo $i
		#cat temp3.txt
		awk '{print $1}' temp3.txt
		cut -d' ' -f2- temp3.txt > temp4
		cat temp4
	done	
        	
done

