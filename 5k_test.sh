#!/bin/bash

# Compile the program
gcc -g -O3 --std=c99 -fopenmp -Wall -o par_gauss par_gauss.c

# Number of threads to test
THREADS="1 2 4 8 16 32 64 128"

# Input file (change this to your input file or size)
INPUT=5000

# Run the program with different numbers of threads
for THREAD_COUNT in $THREADS; do
    export OMP_NUM_THREADS=$THREAD_COUNT
    echo "Running with $THREAD_COUNT threads:"
    srun ./par_gauss $INPUT
    echo ""
done

