write(c("pop1", "pop2", "stat", "chr", "start", "end", "number_sites", "number_variable_sites", "calculated_stat"), ncolumns=9, file=output_name, sep="\t")

# calculate heterozygosity for each individual
heterozygosity(input_file, populations, output_name, filename_simple)

# calculate theta, pi, and Tajima D for each population
for(a in 1:length(unique(populations$PopName))) {
        a_pop <- unique(populations$PopName)[a]

        # subset vcf input
        a_input <- cbind(input_file[,1:3], input_file_genotypes[,populations$PopName == a_pop])

        # calculate only for pops with > 1 individual
        if(ncol(a_input) > 4) {
                # calculate stats per pop
                pi_tajima_theta(a_input, a_pop, output_name, filename_simple)
        }
}

# calculate differentiation statistics for each pairwise comparison
all_combinations <- combn(unique(populations$PopName), 2)
for(a in 1:ncol(all_combinations)) {
        # define populations
        a_pop1 <- all_combinations[1,a]
        a_pop2 <- all_combinations[2,a]

        # subset vcf inputs
        a_input1 <- input_file_genotypes[,populations$PopName == a_pop1]
        a_input2 <- input_file_genotypes[,populations$PopName == a_pop2]


        # calculate only in comparisons where both pops have > 1 individual
        if(!is.null(ncol(a_input1)) & !is.null(ncol(a_input2))) {

                # remove sites that are not either invariant or bi-allelic SNPs
                a_input1 <- a_input1[nchar(input_file[,2]) == 1 & nchar(input_file[,3]) == 1, ]
                a_input2 <- a_input2[nchar(input_file[,2]) == 1 & nchar(input_file[,3]) == 1, ]

                differentiation(a_input1, a_input2, a_pop1, a_pop2, output_name, filename_simple)
        }
}
