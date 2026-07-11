include { PREPROCESSING } from './workflows/preprocessing'
include { ALIGNMENT } from './workflows/alignment'
include { QUANTIFICATION } from './workflows/quantification'

workflow {

    Channel
    .fromFilePairs(params.reads, checkIfExists: true)
    .map { id, reads -> tuple(id, reads[0], reads[1]) }
    .set { fastq_ch }


    trimmed_reads = PREPROCESSING(fastq_ch)


    bam = ALIGNMENT(
        trimmed_reads,
        file(params.star_index)
    )


    QUANTIFICATION(
        bam,
        file(params.gtf)
    )

}
