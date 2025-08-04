#!/bin/bash

echo " Checking README.md for referenced .png images..."

# Step 1: Extract referenced .png paths
grep -o 'docs/[^)]*\.png' README.md | sort -u > referenced_images.txt

echo " Found image references:"
cat referenced_images.txt
echo ""

# Step 2: Check for missing files
missing=0

while IFS= read -r file
do
    if [ ! -f "$file" ]
    then
    {
        echo " MISSING: $file"
        missing=$((missing + 1))
    }
    fi
done < referenced_images.txt

if [ $missing -eq 0 ]
then
    echo " All referenced images exist."
else
    echo " $missing missing image(s) found."
fi

# Step 3: Check for unreferenced .png files
echo ""
echo " Checking for unreferenced .png files in docs/..."

for img in docs/*.png
do
    grep -q "$img" referenced_images.txt || echo " Unreferenced: $img"
done

echo ""
echo " Image check complete."
