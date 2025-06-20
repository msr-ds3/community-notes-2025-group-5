#!/bin/bash

# set start and end timestamps in milliseconds
# loop through ratings files, extract and filter by createdAtMillis (column 3)
# merge filtered files, keeping the header from the first file only

start_milli=1611360000000  # Jan 23, 2021 00:00:00 UTC
end_milli=1627775999000    # July 31, 2021 23:59:59 UTC

zip_dir="C:/Users/ds3/coursework/week4/project/aisha/data"
output_dir="filtered_data"
mkdir -p "$output_dir"

for i in $(seq -w 0 19); do
    unzip -p "$zip_dir/ratings-000${i}.zip" | awk -F'\t' -v min="$start_milli" -v max="$end_milli" \
    'NR == 1 || ($3 >= min && $3 <= max)' > "$output_dir/filtered_ratings_${i}.tsv"
done

head -n 1 "$output_dir/filtered_ratings_00.tsv" > complete_filtered_ratings.tsv
for i in $(seq -w 0 9); do
    tail -n +2 "$output_dir/filtered_ratings_0${i}.tsv" >> complete_filtered_ratings.tsv
done

echo "Merging complete. Final file: complete_filtered_ratings.tsv"


