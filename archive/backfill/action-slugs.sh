#!/bin/bash

filename="action-runs.txt"    # The input file containing the run data
output_file="action-slugs.txt" # The file where slugs and timestamps will be saved

echo "Processing file: $filename"

# Clear the output file before appending new data
> "$output_file"

# Loop through each line in the file
while read -r line; do
    # Extract the timestamp (1st column) and slug (2nd column)
    timestamp=$(echo "$line" | awk '{print $1}')
    slug=$(echo "$line" | awk '{print $2}')
    
    # Debugging: Print the timestamp and slug being processed
    echo "Processing: $timestamp $slug"
    
    # Append the timestamp and slug to the output file
    echo "$timestamp $slug" >> "$output_file"
done < "$filename"

echo "Slugs saved to $output_file"
