include { FASTQC_RAW } from '../modules/fastqc_raw'
include { FASTP_TRIM } from '../modules/fastp_trim'
include { FASTQC_TRIMMED } from '../modules/fastqc_trimmed'


workflow PREPROCESSING {


    take:
    reads


    main:


    raw_qc = FASTQC_RAW(reads)


    fastp_result = FASTP_TRIM(reads)


    trimmed_qc = FASTQC_TRIMMED(
        fastp_result.trimmed_reads
    )


    emit:

   
trimmed_reads = fastp_result.trimmed_reads

raw_qc = raw_qc

trimmed_qc = trimmed_qc

}
