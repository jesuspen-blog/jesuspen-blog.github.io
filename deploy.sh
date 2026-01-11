#!/bin/bash

echo "---------------------------------------"
echo "Step 1: Rendering Quarto Project..."
echo "---------------------------------------"
quarto render

# Check if render was successful
if [ $? -eq 0 ]; then
    echo "---------------------------------------"
    echo "Step 2: Pushing to GitHub..."
    echo "---------------------------------------"
    
    git add .
    
    # Use the current date/time as the commit message
    current_time=$(date "+%Y-%m-%d %H:%M:%S")
    git commit -m "Site update: $current_time"
    
    git push origin main
    
    echo "---------------------------------------"
    echo "Success! Your blog is updating."
    echo "---------------------------------------"
else
    echo "Render failed. Please check your .qmd files for errors."
    exit 1
fi