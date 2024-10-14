#!/bin/bash

filename="action-runs.txt"

# Debugging: Print the file being processed
echo "Processing file: $filename"

# Loop through each line in the file
while read -r line; do
    # Extract only the first field (assumed to be the run ID)
    run_id=$(echo "$line" | awk '{print $1}')
    
    # Debugging: Print the run ID being processed
    echo "Processing run ID: $run_id"
    
    # Use gh run view to fetch the log and grep for "Z data/"
    gh run view "$run_id" --log | grep "Z data/"
done < "$filename"
