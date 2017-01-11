#!/bin/bash
BATTINFO=`acpi -b`
while true; do
	if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 90:15:00 ]];
	then DISPLAY=:0.0 rofi -e "Bateria baja!! `acpi -b`"
	fi
	sleep 420
done
