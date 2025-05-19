#!/bin/bash

# Make the script executable by running: chmod +x rename_dash_to_underscore.sh
# Run the script: ./rename_dash_to_underscore.sh /path/to/your/directory

# Check if a directory path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory-path>"
  exit 1
fi

# Navigate to the provided directory
cd "$1" || exit

# Loop through each file in the directory
for file in *.js; do
  # Replace dashes with underscores
  new_file=$(echo "$file" | tr '-' '_')
  # Rename the file
  mv "$file" "$new_file"
done

echo "File renaming completed."
