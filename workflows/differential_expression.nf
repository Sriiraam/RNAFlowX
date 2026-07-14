include { MERGE_COUNTS } from '../modules/merge_counts'
include { DESEQ2 } from '../modules/deseq2'


workflow DIFFERENTIAL_EXPRESSION {

    take:
    counts
    metadata


    main:

    matrix = MERGE_COUNTS(counts)


    results = DESEQ2(
        matrix,
        metadata
    )

}
