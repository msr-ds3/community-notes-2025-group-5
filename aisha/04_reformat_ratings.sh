# # #!/bin/bash

# #check out rating format
# date -d "2021-01-23T00:00:00Z" +%s000
# #Jan 23-  1611360000000
 
# date -d "2021-07-31T23:59:59Z" +%s000
# #july 27- 1627775999000
 
# unzip -p ratings-00000.zip |head

# zip_dir="C:\\Users\\ds3\\coursework\\week4\\project\\aisha\\data"
 
# #loop through ratings files, extract and filter
# for i in $(seq -w 0 19);do
#     unzip -p "$zip_dir/ratings-000${i}.zip" | awk -F'\t' 'NR == 1 || ($3 >= 1611360000000 && $3 <= 1627775999000)' > filtered_ratings_${i}.tsv
# done
 
# #manually moved it to folder for organization
# #check no of lines in filtered_notes
# wc -l filtered_data/filtered_notes.tsv
 
 
# #manually deleted empty files after filtered data
# #merge remaining rating files, merging headers
# head -n 1 filtered_data/filtered_ratings_00.tsv > complete_filtered_ratings.tsv
# for i in $(seq -w 0 9); do
#     tail -n +2 filtered_data/filtered_ratings_0${i}.tsv >> complete_filtered_ratings.tsv
# done

#!/bin/bash

# Set start and end timestamps in milliseconds
start_milli=1611360000000  # Jan 23, 2021 00:00:00 UTC
end_milli=1627775999000    # July 31, 2021 23:59:59 UTC

# Directory paths
zip_dir="C:/Users/ds3/coursework/week4/project/aisha/data"  # Update with the correct path to your zip files
output_dir="filtered_data"  # Directory to store filtered files
mkdir -p "$output_dir"  # Create the output directory if it doesn't exist

# Loop through ratings files, extract and filter by createdAtMillis (column 3)
for i in $(seq -w 0 19); do
    unzip -p "$zip_dir/ratings-000${i}.zip" | awk -F'\t' -v min="$start_milli" -v max="$end_milli" \
    'NR == 1 || ($3 >= min && $3 <= max)' > "$output_dir/filtered_ratings_${i}.tsv"
done

# Merge filtered files, keeping the header from the first file only
head -n 1 "$output_dir/filtered_ratings_00.tsv" > complete_filtered_ratings.tsv
for i in $(seq -w 0 9); do
    tail -n +2 "$output_dir/filtered_ratings_0${i}.tsv" >> complete_filtered_ratings.tsv
done

echo "Merging complete. Final file: complete_filtered_ratings.tsv"


