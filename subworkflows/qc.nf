include { PREPROCESSING } from '../workflows/preprocessing'

workflow QC {

    take:
    fastq_ch

    main:
    trimmed_reads = PREPROCESSING(fastq_ch)

    emit:
    trimmed_reads
}
