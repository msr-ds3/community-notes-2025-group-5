#!/bin/bash


baseUrl="https://ton.twimg.com/birdwatch-public-data/2025/06/16/noteRatings/ratings-"
outputDir="$HOME/C:\Users\ds3\Desktop\coursework\week4\project\aisha\data\birdwatch-ratings"

mkdir -p "$outputDir"

for i in {0..19}; do
    num=$(printf "%05d" $i)
    url="${baseUrl}${num}.zip"
    echo "Downloading $url..."
    curl -s -O "$url" -o "${outputDir}/ratings-${num}.zip"
done
 
echo "All downloads complete."
 