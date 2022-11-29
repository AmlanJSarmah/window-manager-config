#!/bin/bash

# We have changed the ownership of file brightness in /sys/class/backlight/{gpu/cpu} from root to user name using chown {username} brightness

function send_notification() {
	brightness=$(printf "%.0f\n" $(brillo -G))
	dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "brightness-$1" "Brightness: $brightness%" -t 2000
}

case $1 in
up)
	brillo -A 5 -q
	send_notification $1
	;;
down)
	brillo -U 5 -q
	send_notification $1
	;;
esac
