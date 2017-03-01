#!/bin/bash

umount /tmp/crypto
cryptsetup close crypto
rm -fr /tmp/crypto
