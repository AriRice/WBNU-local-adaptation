# Go into one of your filtering output folders. 
# See all the vcfs? You're going to combine them all into one file, but take out some of the unnecessary headers/ information lines. 

# Create the new vcf, and make sure that the filename specifies what it'll be used for. 
grep "#" Scaffold_10.recode.vcf > Sitta_GEA.vcf
for i in $( ls *recode.vcf ); do grep -v "#" $i >> Sitta_GEA.vcf; done

# Now move it to your computer for downstream analyses in R! 
