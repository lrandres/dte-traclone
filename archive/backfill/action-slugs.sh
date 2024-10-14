#!/bin/bash

filename="action-runs.txt"

echo "Processing file: $filename"

# Loop through each line in the file
while read -r line; do
    # Extract the run ID (11th column)
    run_id=$(echo "$line" | awk '{print $11}')
    
    # Debugging: Print the run ID being processed
    echo "Processing run ID: $run_id"
    
    # Fetch the logs using gh run view and search for "Z data/"
    gh run view "$run_id" --log | grep "Z data/"
done < "$filename"
