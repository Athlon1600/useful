#!/usr/bin/env bash

curl -sSL https://get.docker.com/ | sh &&\
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
sudo apt-get install -y nodejs &&\
sudo apt-get install -y git
