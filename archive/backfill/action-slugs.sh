# gh run list --limit 1000 > action-runs.txt

filename="action-runs.txt"

echo "Processing file: $filename"

while read -r line; do
    echo "Processing run ID: $line"
    gh run view "$line" --log | grep "Z data/"
done < "$filename"
