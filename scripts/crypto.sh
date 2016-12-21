#!/bin/bash

SUDO_PASSWD="$(zenity --password --title=Sudo)\n" 2> /dev/null
CR_PASSWD="$(zenity --password --title=UnlockCrypto)\n" 2> /dev/null
echo -e $SUDO_PASSWD | echo -e $CR_PASSWD | sudo -S cryptsetup --type luks open /dev/sda3 crypto
mkdir -p /tmp/crypto
echo -e $SUDO_PASSWD | sudo -S mount -t ext4 /dev/mapper/crypto /tmp/crypto
echo -e $SUDO_PASSWD | sudo -S chown -R nacho:users /tmp/crypto
if [ -e /tmp/crypto/README.md ]; then
	zenity --info --title="Correcty Unlocked" --text="Sistema descifrado. Montado en /tmp/crypto" 2> /dev/null
else
	zenity --error --title="Uncorrecty Unlocked" --text="Ha habido un error" 2> /dev/null
fi
