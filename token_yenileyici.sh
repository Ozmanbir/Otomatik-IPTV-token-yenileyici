#!/bin/bash

# Kanalın temel linki (tokensiz)
BASE_URL="https://s.catcast.tv/content/49918/index.m3u8"

# Çıkış dosyası
OUTPUT_FILE="guncel_link.m3u8"

echo "Token yenileniyor..."

# Catcast token API çağrısı
TOKEN=$(curl -s "https://s.catcast.tv/token" | jq -r '.token')

# Token alınamadıysa hata ver
if [ -z "$TOKEN" ]; then
    echo "Token alınamadı!"
    exit 1
fi

# Yeni M3U8 linkini oluştur
FULL_URL="${BASE_URL}?token=${TOKEN}"

# Güncel linki dosyaya kaydet
echo "$FULL_URL" > "$OUTPUT_FILE"

# Log tut
echo "$(date) -> Token yenilendi" >> log.txt

echo "Yeni link hazır:"
echo "$FULL_URL"
