#!/bin/bash

interno=eDP1
externo=HDMI1

if xrandr | grep "$externo disconnected"; then
	xrandr --output "$externo" --off --output "$interno" --auto
	feh --bg-scale /home/nacho/Imágenes/ocean.jpg
else
	xrandr --output "$interno" --off --output "$extern" --auto
	feh --bg-scale /home/nacho/Imágenes/Legend/'Blu-ray 3.jpg'
	pactl load-module module-bluez5-discover
fi
