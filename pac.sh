#!/bin/bash

# Name of the zip file
ZIP_FILE="asdf.zip"

rm -f $ZIP_FILE

# Files to add/update
FILES=("config.json" "mac")

# Check if zip command is available
if ! command -v zip &> /dev/null; then
    echo "zip command not found. Please install zip."
    exit 1
fi

# Function to check if a file exists
file_exists() {
    if [ ! -f "$1" ]; then
        echo "Error: File $1 not found."
        return 1
    fi
    return 0
}

# Check if all files exist
for file in "${FILES[@]}"; do
    if ! file_exists "$file"; then
        exit 1
    fi
done

# Add/update files in the zip
if [ -f "$ZIP_FILE" ]; then
    echo "Updating existing $ZIP_FILE"
    zip -u "$ZIP_FILE" "${FILES[@]}"
else
    echo "Creating new $ZIP_FILE"
    zip "$ZIP_FILE" "${FILES[@]}"
fi

# Check if the operation was successful
if [ $? -eq 0 ]; then
    echo "Successfully updated $ZIP_FILE with ${FILES[*]}"
else
    echo "Error occurred while updating $ZIP_FILE"
    exit 1
fi
