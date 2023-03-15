#!/bin/bash
file="$HOME/.vall_dict"

p=0
r=0
while true; do
	line="$(shuf -n1 ${file})"
    if [ "$(shuf -i 0-1 -n 1)" = "0" ]; then 
	    prompt="$(echo $line | cut -d'|' -f1)"
	    awnser="$(echo $line | cut -d'|' -f2)"
    else
	    prompt="$(echo $line | cut -d'|' -f2)"
	    awnser="$(echo $line | cut -d'|' -f1)"
    fi

	printf "\033[37m${p}/${r}p \033[37;1m${prompt}\033[0m > \033[36m"
	read ans
	printf "\033[0m"
	ans=$(echo "$ans"|awk '{print tolower($0)}')
	awnser=$(echo "$awnser"|awk '{print tolower($0)}')
	if [ "$ans" = "$awnser" ]; then 
		printf "  \033[32m•\033[0m Awesome, +1!\n"
		p=$((p+1))
	else
		printf "  \033[31m•\033[0m that sounds not quite right\n"
		printf "    >> the correct translation is: ${awnser}\n"
	fi
	r=$((r+1))
done

