nextflow.enable.dsl=2


include { MERGE_COUNTS } from './modules/merge_counts'


workflow {

    counts = Channel
        .fromPath("results/featurecounts/*_gene_counts.txt")
        .collect()


    MERGE_COUNTS(counts)

}
