# WBNU-local-adaptation
Sitta carolinensis in sky island ecosystems from Arizona. 

Step_01_setup.sh -> Creates all the files and folders that are needed to begin. Run all of this interactively. 

Step_02_align.sh -> This filters, trims, and aligns data to reference genome. Requires input basenames.txt to run. All fastq files should be gzipped and in the format: basename_R1.fastq.gz, basename_R2.fastq.gz, etc. Put it in the 10_align_scripts directory and run it from there. Takes 5.5 hours. 

Step_02b_extract_filtering_info.sh -> Does exactly what it says. Run this interactively. Takes ~5 seconds. 

Step_03a_coverage.sh -> uses samtools to measure alignment coverage from bam files. Requires a popmap.txt file in the 01_bam_files folder. Make that before you run this as a submission script. Takes 3.5 hours. 





Step_03b_plot_coverage.r -> Uses R to plot the output from 03a_coverage.sh
###### Haven't done this yet ##############


Step_04_create_genotype_scripts.r -> Uses R script that makes *THREE* slurm array scripts and a bunch of helper text files for genotyping in GATK. Requires popmap.txt and wbnu.fasta.fai files for job creation. Once the scripts have been made, run them one a time. The first one takes several hours. Second one takes 2.5 hours. Third one takes ~6 hours.

Step_05a_concatenate_vcf_files.sh --> Go into the 03_vcf directory and make this script to combine all vcfs from the same chromosome into single vcf files. But before running it, make a vcf_cat.txt file and ONLY include scaffolds that have more than one .vcf and .vcf.indx file. If you try to concatenate .vcf files that dont require it, you will overwrite them. Takes 5 minutes. 

Step_05b_concatenate_vcf_files.sh --> Just copy and paste these two lines to concatenate those big chromosomes. 
