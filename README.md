# WBNU-local-adaptation
Sitta carolinensis in sky island ecosystems from Arizona. 

Step_01_setup.sh -> Creates all the files and folders that are needed to begin. Run all of this interactively. 

Step_02_align.sh -> This filters, trims, and aligns data to reference genome. Requires input basenames.txt to run. All fastq files should be gzipped and in the format: basename_R1.fastq.gz, basename_R2.fastq.gz, etc. This script took 5.5 hours to run. 

Step_02b_extract_filtering_info.sh -> Does exactly what it says. Run this interactively. Took ~5 seconds. 

Step_03a -> uses samtools to measure alignment coverage from bam files. Requires a popmap.txt file. Make that before you run this submission script. 





