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

./bayescenv test_bayescenv.txt -env scaled_temps.txt -o WBNU_temps -nbp 20 -pilot 5000 -thin 10 -n 5000 -burn 50000

# ./bayescenv = the command
# test_bayescenv.txt = The genotype input file
# -env scaled_temps.txt = environmental input file
# -o WBNU_temps = output file prefix
# -nbp 20 = 20 pilot runs. Currently set to default. 
# -pilot 5000 = length of pilot runs. Currently set to default. 
# -thin 10 = Thinning interval size. Currently set to default. 
# -n 5000 = Number of output iterations. Currently set to default. 
# -burn 50000 = Burn-in length. Currently set to default. 

# Other things you can change:
# -pr_jump 0.1  	Prior probability for non neutral models, default is 0.1
# -pr_pref 0.5	Prior preference for the locus-specific model, default is 0.5.
