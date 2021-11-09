#!/bin/bash
i=1
sp="/-\|"
echo -n ' '
>>log.txt
>log.txt
cat servers.txt |  while read output
do
    (echo "$output" | tr "\n" " " ; ping -c 3 "$output" | tail -1| awk '{print $4}' | cut -d '/' -f 2)  >> log.txt
    if [ $? -eq 0 ]; then
    	:
    	#echo "$(tail -n 1 log.txt)"
    else
    	echo "node $output is down"
    fi
    printf "\b${sp:i++%${#sp}:1}"
 
done
printf "\b"
echo "best three servers are :" 
sort -k2 -n log.txt | head -3
