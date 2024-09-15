#!/bin/dash

xset s 240 60

xset dpms 600 600 600

if [ -z "$(pgrep xss-lock)" ]
then
	xss-lock -l -n $HOME/.scripts/lock_and_power/notify_lock.sh -- x_lock
fi
