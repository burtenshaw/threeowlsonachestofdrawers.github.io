#!/bin/bash

# Function to remove styling in braces
remove_styling() {
    local file=$1
    # Use sed to remove the styling in braces
    sed -i -E 's/\{\.alignnone[^\}]*\}//g' "$file"
}

# Change to the directory containing the markdown files
cd $1

# Loop through all markdown files
for file in *.markdown; do
    echo "Processing $file"
    # Extract the title from the Jekyll header
    title=$(grep -m 1 '^title: ' "$file" | sed -e 's/title: //' -e 's/ /-/g')
    # make title alphanumeric
    title=$(echo "$title" | sed -e 's/[^[:alnum:][:space:]]//g')
    echo "Title: $title"
    # Remove styling in braces
    remove_styling "$file"

    new_name=$(echo "$file" | sed -e "s/.markdown/-$title.markdown/")
    echo "New name: $new_name"

    # Rename the file
    mv "$file" "$new_name"
done
