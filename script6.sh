#!/bin/bash

#define input, output files and number of iterations parameters as arguments
input_file=$1
output_file=$2
iterations=$3


#declare function to Perform subdomain enumeration
subdomain_enumeration(){

	for (( i = 0; i < iterations; i++ )); do
		#read domains from input file in the first iteration 
		if [[ $i -eq 0 ]]; then
			subfinder -dl "$input_file" -o "$output_file"
		#read domains from the previous output file
		else
			cat $output_file | amass enum -o "$output_file.txt"
			sort -u "$output_file.txt" > "$output_file"
		fi

	done
}
# Count unique subdomains
count=$(wc -l "$output_file")

# Print unique subdomains count
echo "Unique Subdomains: $count"

echo "Subdomains saved to $output_file"
