#!/bin/bash

interno=eDP1
externo=HDMI1

if xrandr | grep "$externo disconnected"; then
	xrandr --output "$externo" --off --output "$interno" --auto
    cp /home/nacho/.config/i3/opts/edp1 /home/nacho/.config/i3/conky
	/home/nacho/scripts/checkBatt.sh
else
	xrandr --output "$interno" --off --output "$extern" --auto
    cp /home/nacho/.config/i3/opts/hdmi /home/nacho/.config/i3/conky
	pactl load-module module-bluez5-discover
fi
