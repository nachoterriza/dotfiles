#!/bin/bash

PASSWD="$(zenity --password --title=Wireshark)\n"

echo -e $PASSWD | sudo -S /usr/bin/wireshark
