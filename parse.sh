#!/bin/bash

# Base directory where the ?p=XX folders are located
BASE_DIR="websites/www.threeowlsonachestofdrawers.net"

# Target directory for the Markdown files
TARGET_DIR="websites/site/_posts"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Iterate over directories matching the pattern ?p=*
for dir in "$BASE_DIR"/?p=*; do
    if [ -d "$dir" ]; then
        # Extract the directory name (e.g., ?p=69)
        dirname=$(basename "$dir")

        # Path to the HTML file
        html_file="$dir/index.html"

        # Output Markdown file name (e.g., 69.markdown)
        md_file="2023-12-14-${dirname:3}.markdown"  # Remove first 3 characters (?p=)

        if [ -f "$html_file" ]; then
            echo "Converting $html_file to $md_file..."
            pandoc "$html_file" -o "$TARGET_DIR/$md_file"
        else
            echo "No index.html found in $dir"
        fi
    fi
done
