#!/bin/bash

# Sort the data file based on the first column as numbers
time sort -n -k1 -o sorted-data.txt "$1"
