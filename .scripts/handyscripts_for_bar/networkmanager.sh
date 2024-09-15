#!/usr/bin/env dash

    CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
    if [ "$CONNAME" = "" ]; then
        CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
    fi

	if [ "$CONNAME" != "" ]; then    
            printf " "
        else
	    printf " "
	fi 
