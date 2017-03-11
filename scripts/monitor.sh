#!/bin/bash

interno=eDP-1
externo=HDMI-1

if xrandr | grep "$externo disconnected"; then
	xrandr --output "$externo" --off --output "$interno" --auto
    cp /home/nacho/.config/i3/opts/edp1 /home/nacho/.config/i3/conky
    cp /home/nacho/.config/rofi/opts/edp1 /home/nacho/.config/rofi/config
	/home/nacho/scripts/checkBatt.sh
else
	xrandr --output "$interno" --off --output "$extern" --auto
    cp /home/nacho/.config/i3/opts/hdmi /home/nacho/.config/i3/conky
    cp /home/nacho/.config/rofi/opts/hdmi /home/nacho/.config/rofi/config
	pactl load-module module-bluez5-discover
fi
