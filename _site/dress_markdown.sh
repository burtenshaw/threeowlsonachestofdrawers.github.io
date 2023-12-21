#!/bin/bash

# Directory containing Markdown files
MD_DIR="site/_posts"

# Iterate over all Markdown files in the specified directory
for md_file in "$MD_DIR"/*.markdown; do
    if [ -f "$md_file" ]; then
        echo "Updating $md_file..."

        # Add header to the beginning of the file
        sed -i '1s/^/---\nlayout: post\ntitle:  "The Limits of My Language (2015)"\ndate:   2023-12-14 20:49:11 +0100\ncategories: jekyll update\n---\n\n/' "$md_file"

        # Remove the Post navigation section and everything after it
        sed -i '/## Post navigation {#post-navigation .screen-reader-text}/,$d' "$md_file"

        # Remove all styling references
        sed -i '/::{/d' "$md_file"
    fi
done
