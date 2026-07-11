include { PREPROCESSING } from './preprocessing'
include { ALIGNMENT } from './alignment'
include { QUANTIFICATION } from './quantification'


workflow RNASEQ {


    Channel
    .fromFilePairs(params.reads, checkIfExists: true)
    .map { id, reads -> tuple(id, reads[0], reads[1]) }
    .set { fastq_ch }


    trimmed_reads = PREPROCESSING(fastq_ch)


    bam = ALIGNMENT(
        trimmed_reads,
        file(params.star_index)
    )


    counts = QUANTIFICATION(
        bam,
        file(params.gtf)
    )

}
