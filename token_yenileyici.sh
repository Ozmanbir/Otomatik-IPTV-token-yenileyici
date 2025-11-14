#!/bin/bash

M3U_URL="https://s.catcast.tv/content/49918/index.m3u8?token=YOURTOKEN"

while true; do
    echo "Token yenileniyor..."
    DATE=$(date)
    curl -s "$M3U_URL" -o m3u_playlist.m3u8
    echo "$DATE - Yenilendi" >> log.txt
    sleep 3600
done
