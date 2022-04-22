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
mkdir 10_align_script
mkdir 12_filter

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
 
#Now you will concatenate files, one at a time. What a pain. 
cat Original_29802_S20_Pinal_R1.fastq.gz Original_29802_S77_L002_R1_001.fastq.gz > 29802_S20_Pinal_R1.fastq.gz
cat Original_29804_S17_Pinal_R1.fastq.gz Original_29804_S76_L002_R1_001.fastq.gz > 29804_S17_Pinal_R1.fastq.gz
cat Original_29807_S16_Pinal_R1.fastq.gz Original_29807_S75_L002_R1_001.fastq.gz > 29807_S16_Pinal_R1.fastq.gz
cat Original_29810_S21_Huachuca_R1.fastq.gz Original_29810_S78_L002_R1_001.fastq.gz > 29810_S21_Huachuca_R1.fastq.gz
cat Original_30946_S1_Coconino_R1.fastq.gz Original_30946_S65_L002_R1_001.fastq.gz > 30946_S1_Coconino_R1.fastq.gz
cat Original_30948_S14_Pinalenos_R1.fastq.gz Original_30948_S74_L002_R1_001.fastq.gz > 30948_S14_Pinalenos_R1.fastq.gz
cat Original_30951_S2_Coconino_R1.fastq.gz Original_30951_S66_L002_R1_001.fastq.gz > 30951_S2_Coconino_R1.fastq.gz
cat Original_30952_S26_Coconino_R1.fastq.gz Original_30952_S83_L002_R1_001.fastq.gz > 30952_S26_Coconino_R1.fastq.gz
cat Original_30957_S23_SantaRita_R1.fastq.gz Original_30957_S80_L002_R1_001.fastq.gz > 30957_S23_SantaRita_R1.fastq.gz
cat Original_30958_S24_SantaRita_R1.fastq.gz Original_30958_S81_L002_R1_001.fastq.gz > 30958_S24_SantaRita_R1.fastq.gz
cat Original_31308_S25_SantaRita_R1.fastq.gz Original_31308_S82_L002_R1_001.fastq.gz > 31308_S25_SantaRita_R1.fastq.gz
cat Original_31310_S22_Prescott_R1.fastq.gz Original_31310_S79_L002_R1_001.fastq.gz > 31310_S22_Prescott_R1.fastq.gz
cat Original_31311_S3_Apache_R1.fastq.gz Original_31311_S67_L002_R1_001.fastq.gz > 31311_S3_Apache_R1.fastq.gz
cat Original_31313_S4_Chiricahua_R1.fastq.gz Original_31313_S68_L002_R1_001.fastq.gz > 31313_S4_Chiricahua_R1.fastq.gz
cat Original_31315_S5_Apache_R1.fastq.gz Original_31315_S69_L002_R1_001.fastq.gz > 31315_S5_Apache_R1.fastq.gz
cat Original_31316_S6_SantaCatalina_R1.fastq.gz Original_31316_S70_L002_R1_001.fastq.gz > 31316_S6_SantaCatalina_R1.fastq.gz
cat Original_31406_S71_L002_R1_001.fastq.gz Original_31406_S7_SantaCatalina_R1.fastq.gz > 31406_S7_SantaCatalina_R1.fastq.gz
cat Original_31410_S72_L002_R1_001.fastq.gz Original_31410_S8_Chiricahua_R1.fastq.gz > 31410_S8_Chiricahua_R1.fastq.gz
cat Original_31415_S73_L002_R1_001.fastq.gz Original_31415_S9_Apache_R1.fastq.gz > 31415_S9_Apache_R1.fastq.gz
cat Original_29802_S20_Pinal_R2.fastq.gz Original_29802_S77_L002_R2_001.fastq.gz > 29802_S20_Pinal_R2.fastq.gz
cat Original_29804_S17_Pinal_R2.fastq.gz Original_29804_S76_L002_R2_001.fastq.gz > 29804_S17_Pinal_R2.fastq.gz
cat Original_29807_S16_Pinal_R2.fastq.gz Original_29807_S75_L002_R2_001.fastq.gz > 29807_S16_Pinal_R2.fastq.gz
cat Original_29810_S21_Huachuca_R2.fastq.gz Original_29810_S78_L002_R2_001.fastq.gz > 29810_S21_Huachuca_R2.fastq.gz
cat Original_30946_S1_Coconino_R2.fastq.gz Original_30946_S65_L002_R2_001.fastq.gz > 30946_S1_Coconino_R2.fastq.gz
cat Original_30948_S14_Pinalenos_R2.fastq.gz Original_30948_S74_L002_R2_001.fastq.gz > 30948_S14_Pinalenos_R2.fastq.gz
cat Original_30951_S2_Coconino_R2.fastq.gz Original_30951_S66_L002_R2_001.fastq.gz > 30951_S2_Coconino_R2.fastq.gz
cat Original_30952_S26_Coconino_R2.fastq.gz Original_30952_S83_L002_R2_001.fastq.gz > 30952_S26_Coconino_R2.fastq.gz
cat Original_30957_S23_SantaRita_R2.fastq.gz Original_30957_S80_L002_R2_001.fastq.gz > 30957_S23_SantaRita_R2.fastq.gz
cat Original_30958_S24_SantaRita_R2.fastq.gz Original_30958_S81_L002_R2_001.fastq.gz > 30958_S24_SantaRita_R2.fastq.gz
cat Original_31308_S25_SantaRita_R2.fastq.gz Original_31308_S82_L002_R2_001.fastq.gz > 31308_S25_SantaRita_R2.fastq.gz
cat Original_31310_S22_Prescott_R2.fastq.gz Original_31310_S79_L002_R2_001.fastq.gz > 31310_S22_Prescott_R2.fastq.gz
cat Original_31311_S3_Apache_R2.fastq.gz Original_31311_S67_L002_R2_001.fastq.gz > 31311_S3_Apache_R2.fastq.gz
cat Original_31313_S4_Chiricahua_R2.fastq.gz Original_31313_S68_L002_R2_001.fastq.gz > 31313_S4_Chiricahua_R2.fastq.gz
cat Original_31315_S5_Apache_R2.fastq.gz Original_31315_S69_L002_R2_001.fastq.gz > 31315_S5_Apache_R2.fastq.gz
cat Original_31316_S6_SantaCatalina_R2.fastq.gz Original_31316_S70_L002_R2_001.fastq.gz > 31316_S6_SantaCatalina_R2.fastq.gz
cat Original_31406_S71_L002_R2_001.fastq.gz Original_31406_S7_SantaCatalina_R2.fastq.gz > 31406_S7_SantaCatalina_R2.fastq.gz
cat Original_31410_S72_L002_R2_001.fastq.gz Original_31410_S8_Chiricahua_R2.fastq.gz > 31410_S8_Chiricahua_R2.fastq.gz
cat Original_31415_S73_L002_R2_001.fastq.gz Original_31415_S9_Apache_R2.fastq.gz > 31415_S9_Apache_R2.fastq.gz

# Now move all the concatenated files back to where you're going to work with them. 
for I in $(ls | grep -v "Original"); do mv ${I} ../${I}; done

# Now you'll tweak the names a bit. Just to remove useless information. 
# Create a rename_samples.txt and run the following command:

while read -r name1 name2; do mv $name1 $name2
done < rename_samples.txt

# Move back to your main directory. 
# make a basenames.txt file and put it there. 

# Copy the reference genome into someplace safe. Like your home directory. 
