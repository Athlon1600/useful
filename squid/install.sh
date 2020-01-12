#!/usr/bin/env bash

sudo apt-get update
sudo apt -y install squid

wget https://raw.githubusercontent.com/Athlon1600/useful/master/squid/squid-open.conf -O /etc/squid/squid.conf
squid -k reconfigure
