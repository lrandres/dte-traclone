#!/bin/bash

filename="action-runs.txt"    # The input file containing the run data
output_file="action-slugs.txt" # The file where slugs will be saved

echo "Processing file: $filename"

# Clear the output file before appending new slugs
> "$output_file"

# Loop through each line in the file
while read -r line; do
    # Extract the run ID (11th column)
    run_id=$(echo "$line" | awk '{print $11}')
    
    # Debugging: Print the run ID being processed
    echo "Processing run ID: $run_id"
    
    # Append the run ID (slug) to the output file
    echo "$run_id" >> "$output_file"
done < "$filename"

echo "Slugs saved to $output_file"
