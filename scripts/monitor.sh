#!/bin/bash

interno=eDP1
externo=HDMI1

if xrandr | grep "$externo disconnected"; then
	xrandr --output "$externo" --off --output "$interno" --auto
else
	xrandr --output "$interno" --off --output "$extern" --auto
fi
