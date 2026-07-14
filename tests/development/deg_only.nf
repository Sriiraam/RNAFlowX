include { DIFFERENTIAL_EXPRESSION } from './workflows/differential_expression'


workflow {

    count_files = Channel
        .fromPath("results/featurecounts/*_gene_counts.txt")
        .collect()


    metadata = file("data/metadata/deseq2_metadata.csv")


    DEG = DIFFERENTIAL_EXPRESSION(
        count_files,
        metadata
    )

}
