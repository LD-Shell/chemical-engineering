#!/bin/bash

# Parameters
num_points=120          # Number of data points
substrate_min=0.5      # Minimum value for substrate concentration
substrate_max=20.0      # Maximum value for substrate concentration
rate_min=0.2           # Minimum value for reaction rate
rate_max=13.0           # Maximum value for reaction rate
output_file="mich-men-random_csv_data.csv" # Output file name

# Create the CSV file with headers
echo "substrate_conc,reaction_rates" > $output_file

# Generate random data points
for i in $(seq 1 $num_points); do
  substrate=$(awk -v min=$substrate_min -v max=$substrate_max 'BEGIN { printf("%.2f", min + (rand() * (max - min))) }')
  rate=$(awk -v min=$rate_min -v max=$rate_max 'BEGIN { printf("%.2f", min + (rand() * (max - min))) }')
  echo "$substrate,$rate" >> $output_file
done

# Confirm generation
echo "Generated $num_points random data points in $output_file"
