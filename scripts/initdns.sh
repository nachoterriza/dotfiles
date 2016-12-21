#!/bin/bash

sudo dnscrypt-proxy --local-address=127.0.0.1:40 -R dnscrypt.org-fr --edns-payload-size=4096 --ephemeral-keys --logfile=/var/log/dnscrypt-proxy.log --user=dnscrypt --daemonize
