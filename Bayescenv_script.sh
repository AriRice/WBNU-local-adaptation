#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=bayescenv_test
#SBATCH --nodes=1 --ntasks=1
#SBATCH --partition quanah
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --mail-user=arrice@ttu.edu
#SBATCH --mail-type=ALL

workdir=/lustre/work/arrice/bayescenv-1.1/test

./bayescenv test_bayescenv.txt -env scaled_temps.txt -o test -nbp 10 -pilot 2000 -thin 10 -n 5000 -burn 10000

./bayescenv test_bayescenv.txt -env scaled_precip.txt -o test -nbp 10 -pilot 2000 -thin 10 -n 5000 -burn 10000
