#!/bin/bash

if [[ "$1" != "-n" ]]; then
  nohup bash "$0" -n > yt-dlp.log 2>&1 &
  exit $?
fi

yt-dlp --download-archive downloaded.txt \
  --playlist-start 1 \
  --limit-rate 20M --sleep-interval 10 --max-sleep-interval 90 \
  --continue --restrict-filenames \
  --output "%(upload_date)s - %(title)s.%(ext)s" https://www.youtube.com/@AlfoMedia
