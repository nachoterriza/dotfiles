#!/bin/bash

if [ "$(id -ur)" != "0" ]; then
    echo -e "Se necesitan permisos de administrador"
    exit 1
else
    cryptsetup --type luks open /dev/sda3 crypto
    mkdir -p /tmp/crypto
    mount -t ext4 /dev/mapper/crypto /tmp/crypto
    chown -R nacho:users /tmp/crypto
    if [ -e /tmp/crypto/README.md ]; then
    	echo -e "Sistema descifrado. Montado en /tmp/crypto"
    else
    	echo -e "Ha habido un error"
    fi
fi
