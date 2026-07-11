include { PREPROCESSING } from './workflows/preprocessing'
include { ALIGNMENT } from './workflows/alignment'
include { QUANTIFICATION } from './workflows/quantification'
include { MULTIQC } from './modules/multiqc'


workflow {


    Channel
        .fromFilePairs(params.reads, checkIfExists: true)
        .map { id, reads -> tuple(id, reads[0], reads[1]) }
        .set { fastq_ch }



    preprocess_results = PREPROCESSING(fastq_ch)


    trimmed_reads = preprocess_results.trimmed_reads

    raw_qc = preprocess_results.raw_qc

    trimmed_qc = preprocess_results.trimmed_qc



    alignment_result = ALIGNMENT(
        trimmed_reads,
        file(params.star_index)
    )



    QUANTIFICATION(
        alignment_result.bam,
        file(params.gtf)
    )



    raw_qc_files = raw_qc.map { sample_id, file ->
    file
}


trimmed_qc_files = trimmed_qc.map { sample_id, file ->
    file
}


star_logs = alignment_result.star_logs



qc_channel = raw_qc_files
    .mix(trimmed_qc_files)
    .mix(star_logs)


MULTIQC(qc_channel)
}
