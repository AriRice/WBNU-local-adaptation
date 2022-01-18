# You'll be copying and pasting this script into the command line. So...
# Start an interactive session and wait to be logged in to a computer node

interactive -c 1 -p quanah

# Move to your working directory for the project.
cd /lustre/scratch/arrice/WBNU_project_round2

# Make directories for organization during analyses (copy and paste the following lines)
mkdir 00_fastq
mkdir 01_cleaned
mkdir 01_bam_files
mkdir 02_vcf
mkdir 03_vcf
mkdir 04_filtered_vcf_100kbp
mkdir 05_filtered_vcf_50kbp
mkdir 06_related_files
mkdir 10_align_script
mkdir 12_filter_scripts
mkdir 13_convert_scripts

# Now transfer your raw data files for this project to the directory 00_fastq

cp /wherever_the_files_are/*.gz /lustre/scratch/arrice/WBNU_project_round2/00_fastq

# I use the cp command and not mv because I don't want to delete the files from their original locations. 
# This might take a few minutes because these are very big files. 
# You can check filezilla or open another terminal window to see the files being copied. 
# Since some of these sequences had poor coverage, a few were resequenced. Copy those into the same directory.

cp /wherever_the_redos_are/*.gz /lustre/scratch/arrice/WBNU_project_round2/00_fastq

#Now create a new directory within the 00_fastq folder and move stuff there. 
#I'm sure there's a shorter, easier way of doing this, but I'm not. 

mkdir Concatenate
mv 29802* Concatenate/
mv 29804* Concatenate/
mv 29807* Concatenate/
mv 29810* Concatenate/
mv 30946* Concatenate/
mv 30948* Concatenate/
mv 30951* Concatenate/
mv 30952* Concatenate/
mv 30957* Concatenate/
mv 30958* Concatenate/
mv 31308* Concatenate/
mv 31310* Concatenate/
mv 31311* Concatenate/
mv 31313* Concatenate/
mv 31315* Concatenate/
mv 31316* Concatenate/
mv 31406* Concatenate/
mv 31410* Concatenate/
mv 31415* Concatenate/
cd Concatenate

#Now put a prefix in all files in this folder so you know they're the originals. 
 for I in $(ls); do mv ${I} Original_${I};done
 
#Now you will concatenate files, one at a time








*Up to here*


#####################################
#####################################
#####################################
##### make a file map in the style (and same name) of the file "rename_samples.txt" for your samples
##### and put it in your 00_fastq directory
#####################################
#####################################
#####################################

#####################################
#####################################
#####################################
##### make a sample name file in the style (and same name) of the file "camp_popmap.txt" for your samples
##### and put it in the main working directory
##### This file is essentially just the names of the samples in your study.
##### Make sure the names and numbers are in the same order as the file map you just created.
##### The names in the first column should be in the format "C-###"
##### If the sample number is less than 3 digits, add the appropriate number of preceding zeros to make it three digits.
#####################################
#####################################
#####################################

#####################################
#####################################
#####################################
##### make a mtDNA name conversion file in the style (and same name) of the file "camp_mtdna_name.txt" for your samples
##### and put it in the 01_mtDNA directory
##### Make sure the names and numbers are in the same order as the file map you created.
##### The names in the first column should be in the format "C-###__mtDNA.fastq.gz"
#####################################
#####################################
#####################################

# move to the fastq directory
cd /lustre/scratch/jmanthey/04_relatedness_test/00_fastq/

# rename the files in a numbered fashion
while read -r name1 name2; do
	mv $name1 $name2
done < rename_samples.txt

# move to your main working directory and copy the genome index file there 
cd /lustre/scratch/jmanthey/04_relatedness_test/
cp /home/jmanthey/denovo_genomes/camp_sp_genome_filtered.fasta.fai .







