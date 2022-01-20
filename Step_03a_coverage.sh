#!/bin/bash
#SBATCH --chdir=./
#SBATCH --job-name=ca_depth
#SBATCH --partition quanah
#SBATCH --nodes=1 --ntasks=3
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --mail-user=arrice@ttu.edu
#SBATCH --mail-type=ALL

samtools depth -a KU29800_Prescott_final.bam KU29801_Prescott_final.bam KU29802_Pinal_final.bam KU29804_Pinal_final.bam \
KU29807_Pinal_final.bam KU29810_Huachuca_final.bam KU29813_Huachuca_final.bam KU29814_Huachuca_final.bam \
KU30946_Coconino_final.bam KU30948_Pinalenos_final.bam KU30950_Pinalenos_final.bam KU30951_Coconino_final.bam \
KU30952_Coconino_final.bam KU30957_SantaRita_final.bam KU30958_SantaRita_final.bam KU31305_Pinalenos_final.bam \
KU31308_SantaRita_final.bam KU31310_Prescott_final.bam KU31311_Apache_final.bam KU31313_Chiricahua_final.bam \
KU31315_Apache_final.bam KU31316_SantaCatalina_final.bam KU31406_SantaCatalina_final.bam KU31410_Chiricahua_final.bam \
KU31415_Apache_final.bam KU314210_Chiricahua_final.bam KU31426_SantaCatalina_final.bam > sitta_coverage.txt

# break up the depth files into single column files for each individual (locations dropped)

while read -r name1 number1; do
	number2=$((number1 + 2));
  cut sitta_coverage.txt -f $number2 > ${name1}_depth.txt;
done < popmap.txt
