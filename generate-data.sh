#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filename> <num_records>"
    exit 1
fi

# Extract arguments
filename="$1"
num_records="$2"

# Function to generate a random 32-bit integer
generate_random_integer() {
    echo $((RANDOM << 15 | RANDOM))
}

# Function to generate a random 100-byte ASCII string
generate_random_ascii_string() {
    tr -dc '[:print:]' </dev/urandom | head -c 100
}

# Start time measurement
start_time=$(date +%s)

# Generate the dataset
for ((i = 1; i <= num_records; i++)); do
    random_integer1=$(generate_random_integer)
    random_integer2=$(generate_random_integer)
    random_ascii_string=$(generate_random_ascii_string)
    echo "$random_integer1 $random_integer2 $random_ascii_string" >> "$filename"
done

# End time measurement
end_time=$(date +%s)

# Calculate the elapsed time
elapsed_time=$((end_time - start_time))

echo "Benchmark took $elapsed_time seconds to complete."