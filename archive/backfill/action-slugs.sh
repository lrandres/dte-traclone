#!/bin/bash

filename="action-runs.txt"    # The input file containing the run data
output_file="action-slugs.txt" # The file where slugs and timestamps will be saved

echo "Processing file: $filename"

# Clear the output file before appending new data
> "$output_file"

# Loop through each line in the file
while read -r line; do
    # Extract the run ID (11th column) and timestamp (13th column)
    run_id=$(echo "$line" | awk '{print $11}')
    timestamp=$(echo "$line" | awk '{print $13}')
    
    # Debugging: Print the run ID and timestamp being processed
    echo "Processing: $run_id $timestamp"
    
    # Append the run ID (slug) and timestamp to the output file
    echo "$run_id $timestamp" >> "$output_file"
done < "$filename"

echo "Slugs and timestamps saved to $output_file"
