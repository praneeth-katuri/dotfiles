#!/bin/bash
for i in $(ls /tmp/mpvSockets/*); do
	echo '{ "command": ["set_property", "pause", true] }' | socat - "$i";
done
