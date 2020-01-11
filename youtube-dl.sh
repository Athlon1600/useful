#!/usr/bin/env bash

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

sudo apt-get -y install python-minimal
sudo apt-get -y install ffmpeg
