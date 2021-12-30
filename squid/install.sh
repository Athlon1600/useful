#!/usr/bin/env bash

CENTOS=0

if [ -f "/etc/centos-release" ]; then
    CENTOS=1
fi

if [ $CENTOS -eq 1 ]; then
    sudo yum check-update
    sudo yum -y install squid wget
else
    sudo apt-get update
    sudo apt -y install squid
fi

wget https://raw.githubusercontent.com/Athlon1600/useful/master/squid/squid-open.conf -O /etc/squid/squid.conf
squid -k reconfigure
