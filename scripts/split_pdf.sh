#!/usr/bin/bash

# Check for proper usage
if [ "$#" -lt 3 ]; then
	echo "Usage: $0 <input_file> <total_pages> <chunk_size>"
	exit 1
fi

# Get command-line arguments
input_file="$1"
total_pages="$2"
chunk_size="$3"

# Loop through pages in increments of the chunk size
for ((i = 1; i <= total_pages; i += chunk_size)); do
	# Calculate the last page of the current chunk
	start_page=$i
	end_page=$((i + chunk_size - 1))

	# Ensure end_page does not exceed total_pages
	if [ $end_page -gt $total_pages ]; then
		end_page=$total_pages
	fi

	# Generate the output file name
	output_file="output_${start_page}_to_${end_page}.pdf"

	# Run Ghostscript to extract the page range
	gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
		-dFirstPage=$start_page -dLastPage=$end_page \
		-sOutputFile="$output_file" "$input_file"
done
