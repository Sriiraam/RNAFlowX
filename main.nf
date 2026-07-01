nextflow.enable.dsl = 2

include { FASTQC_RAW } from './modules/fastqc_raw'

workflow {
Channel
    .fromFilePairs("data/test_fastq/*_{R1,R2}.fastq.gz", checkIfExists: true)
    .map { id, reads -> tuple(id, reads[0], reads[1]) }
    .set { fastq_ch }

FASTQC_RAW(fastq_ch)
}