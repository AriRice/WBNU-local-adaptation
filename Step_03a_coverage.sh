#!/bin/bash
#SBATCH --chdir=./
#SBATCH --job-name=ca_depth
#SBATCH --partition quanah
#SBATCH --nodes=1 --ntasks=3
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G

samtools depth -a
