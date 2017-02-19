#!/bin/bash

interno=eDP1
externo=HDMI1

if xrandr | grep "$externo disconnected"; then
	xrandr --output "$externo" --off --output "$interno" --auto
	/home/nacho/scripts/checkBatt.sh
else
	xrandr --output "$interno" --off --output "$extern" --auto
	pactl load-module module-bluez5-discover
fi
