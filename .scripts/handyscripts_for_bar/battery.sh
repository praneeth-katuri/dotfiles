#!/usr/bin/env dash

    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

        if [ "$STATUS" = "Charging" ]; then
            printf " "
    	elif [ $CHARGE -le 75 ] && [ $CHARGE -gt 50  ]; then
	    printf " "
	elif [ $CHARGE -le 50 ] && [ $CHARGE -gt 25  ]; then
	    printf " "
	elif [ $CHARGE -le 25 ] && [ $CHARGE -gt 10  ]; then
	    printf " "
	elif [ $CHARGE -le 10 ]; then
	    printf " "
        else
            printf " "
        fi
