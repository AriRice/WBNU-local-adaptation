# WBNU-local-adaptation
Sitta carolinensis in sky island ecosystems from Arizona. 

Step_01_setup -> Creates all the files and folders that are needed to begin. Run all of this interactively. 

Step_02_align.sh -> This filters, trims, and aligns data to reference genome. Requires input basenames.txt to run. All fastq files should be gzipped and in the format: basename_R1.fastq.gz, basename_R2.fastq.gz, etc. Put it in the 10_align_scripts directory and run it from there. Takes 5.5 hours. 

Step_02b_extract_filtering_info -> Does exactly what it says. Run this interactively. Takes ~5 seconds. 

Step_03a_coverage.sh -> uses samtools to measure alignment coverage from bam files. Requires a popmap.txt file in the 01_bam_files folder. Make that before you run this as a submission script. Takes 3.5 hours. 

Step_03b_plot_coverage.r -> Uses R to plot the output from 03a_coverage.sh

Step_04_create_genotype_scripts.r -> Uses R script that makes *THREE* slurm array scripts and a bunch of helper text files for genotyping in GATK. Requires popmap.txt and wbnu.fasta.fai files for job creation. Once the scripts have been made, run them one a time. 

The first one uses haplotypecaller to detect SNPs and indels in the alignments between samples and the reference genome. Converts bam files into vcf (variant call format) files and creates a different one for each scaffold/chromosome within each sample. This takes several hours. The second one uses GenomicsDBImport to merge vcf files from different samples into one big alignment per scaffold/chromosome. Takes 2.5 hours. The third one uses GenotypeGVCFS to do group genotyping and reassess SNPs and indels based on data across all samples and not just one. Takes ~6 hours.

Step_05a_concatenate_vcf_files.sh --> This script combines all vcfs from the same chromosome into single vcf files. But before running it in the 03_vcf directory, make a vcf_cat.txt file and ONLY include scaffolds that have more than one .vcf and .vcf.indx file. If you try to concatenate .vcf files that dont require it, you will overwrite them. Takes 5 minutes. 

Step_05b_concatenate_vcf_files --> Concatenates those big chromosomes. Just copy and paste these two lines. Should take a few minutes.

Step_06_filter.sh --> Filter the data into one or more datasets (depending on the type of downstream analyses that will be used). Before running, make sure to create a vcf_list.txt file as well as new folders for each outputted dataset. 

Step_07_squish_em_together --> Concatenating vcfs into one file, for GEA analyses in R. 

Step_08_filtering_windows.sh <- another filtering scheme for a downstream analysis that'll measure Fst across 10kbp sliding windows. Create it in the 12_filter folder. 

Step_09_Create_100kbp_array_script.r <-- Creates a script (and several helper files) that divides everything into 10kbp windows and calculates Fst. Do this in an interactive session within the 04_stats directory. Then, to run said script, you must create 'window_stat_calculations.r', 'calculate_windows.r', and 'popmap_phylo.txt' in this directory. 

Step_10_combine_stats <-- Does the same thing as step 07. Concatenating. Run interactively. 
