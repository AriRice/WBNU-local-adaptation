#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=filter
#SBATCH --nodes=1 --ntasks=1
#SBATCH --partition quanah
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-39
#SBATCH --mail-user=arrice@ttu.edu
#SBATCH --mail-type=ALL

workdir=/lustre/scratch/arrice/WBNU_project_round2

# define input files from helper file during genotyping
input_array=$( head -n${SLURM_ARRAY_TASK_ID} vcf_list.txt | tail -n1 )
# If this script involved thinning, I wouldn't have done concatenation beforehand and would just used helper6.txt instead of a new vcf_list.txt. 

# run vcftools with SNP output for GEA tests such as LFMM and BayeScEnv
vcftools --vcf ${workdir}/03_vcf/${input_array}.g.vcf --max-missing 0.92 --minQ 20 --minGQ 20 --minDP 6 --max-meanDP 30 --min-alleles 2 --max-alleles 2 --maf 0.12 --max-maf 0.49 --remove-indels --recode --recode-INFO-all --out ${workdir}/06a_filter_vcf_GEA/${input_array}

# run vcftools with output for Fst. It'll be the same, except that minor allele frequency will have NO minimum. And max-missing is more lenient. 
vcftools --vcf ${workdir}/03_vcf/${input_array}.g.vcf --max-missing 0.5 --minQ 20 --minGQ 20 --minDP 6 --max-meanDP 30 --min-alleles 2 --max-alleles 2 --max-maf 0.49 --remove-indels --recode --recode-INFO-all --out ${workdir}/06b_filter_vcf_Fst/${input_array}

# What it does:
# VCFtools filters out variants that you're not going to look at for downstream analyses. How one filters should depend on the downstream analyses. 
# "max-missing" excludes SNPs or other variants based on the proportion of missing data. Setting it to 1 means no missing data allowed. 0.5 means that half the samples could have missing data without having that site filtered out. For this set, 0.92 makes the most sense. 
# "minQ" excludes sites (across all samples?) with a quality score below said threshold.
# "minGQ" excludes genotypes (in particular samples?) with a quality score below said threshold. 
# "minDP/maxDP" excludes genotypes above or below a certain read depth. This should be determined based on coverage plots from step 3.  
# "min-meanDP/max-meanDP" excludes genotypes above or below a certain MEAN read depth. This should be determined based on coverage plots from step 3. 
# "min-alleles/max-alleles" limits variants to bi- or tri-allelic sites.
# "maf" includes sites with a minor allele frequency (?) greater than or equal to this value.
# "max-maf" includes sites with a minor allele frequency (?) less than or equal to this value. It is currently set to 0.49.
# "remove-indels" self-explanatory. Can be changed if you ever want to look at indels and not just SNPs. 
# "recode and recode-INFO-all" I don't know. It seems important. Just keep it in there. 


# This is very useful: https://speciationgenomics.github.io/filtering_vcfs/ 
