#!/bin/bash

PASSWD="$(zenity --password --title=Gparted)\n"

echo -e $PASSWD | sudo -S /usr/bin/gparted
