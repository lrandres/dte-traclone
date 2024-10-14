#!/bin/bash

filename="action-runs.txt"

echo "Processing file: $filename"

while read -r line; do
    # Extract the run ID (7th column)
    run_id=$(echo "$line" | awk '{print $7}')
    
    # Debugging: Print the run ID being processed
    echo "Processing run ID: $run_id"
    
    # Fetch the logs using gh run view and search for "Z data/"
    gh run view "$run_id" --log | grep "Z data/"
done < "$filename"
