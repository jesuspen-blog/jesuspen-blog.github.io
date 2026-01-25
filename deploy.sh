#!/bin/bash

echo "Rendering Quarto Project..."
quarto render

if [ $? -eq 0 ]; then
    # Optional: ensure .nojekyll exists if using docs/
    touch docs/.nojekyll 
    
    git add .
    
    # Check if there are actually changes to commit
    if git diff-index --quiet HEAD --; then
        echo "No changes detected. Nothing to push."
    else
        current_time=$(date "+%Y-%m-%d %H:%M:%S")
        git commit -m "Site update: $current_time"
        git push origin main
        echo "Success! Your blog is updating."
    fi
else
    echo "Render failed."
    exit 1
fi