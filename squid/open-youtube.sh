#!/usr/bin/env bash

sudo apt-get update
sudo apt -y install squid

## youtube specific config
wget https://raw.githubusercontent.com/Athlon1600/useful/master/squid/open-youtube.conf -O /etc/squid/squid.conf

squid -k reconfigure
