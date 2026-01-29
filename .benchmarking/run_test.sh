#!/bin/bash
#SBATCH --partition=medium
#SBATCH --mem=16G
#SBATCH --cpus-per-task=4

source activate skim2mito_env

START_TIME=$(date +%s)
echo "Start time: $(date)"

snakemake --profile workflow/profiles/test 

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
echo "End time: $(date)"
echo "Total runtime: ${DURATION} seconds ($(($DURATION / 60)) minutes)"
echo Complete!
