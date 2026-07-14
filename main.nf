include { PREPROCESSING } from './workflows/preprocessing'
include { ALIGNMENT } from './workflows/alignment'
include { QUANTIFICATION } from './workflows/quantification'
include { MULTIQC } from './modules/multiqc'
include { DIFFERENTIAL_EXPRESSION } from './workflows/differential_expression'


workflow {


    Channel
        .fromFilePairs(params.reads, checkIfExists: true)
        .map { id, reads -> tuple(id, reads[0], reads[1]) }
        .set { fastq_ch }



    preprocess_results = PREPROCESSING(fastq_ch)


    trimmed_reads = preprocess_results.trimmed_reads

    raw_qc = preprocess_results.raw_qc

    trimmed_qc = preprocess_results.trimmed_qc



    /*
     ALIGNMENT
    */

    alignment_result = ALIGNMENT(
        trimmed_reads,
        file(params.star_index)
    )
/*
 QUANTIFICATION
*/

quant_results = QUANTIFICATION(
    alignment_result.bam,
    file(params.gtf)
)

count_files = quant_results.counts
    .map { sample_id, count_file, summary_file ->
        count_file
    }
    .collect()

metadata = file(params.metadata)


DEG = DIFFERENTIAL_EXPRESSION(
    count_files,
    metadata
)    /*
     MULTIQC
    */

    qc_channel = raw_qc
        .mix(trimmed_qc)
        .mix(alignment_result.star_logs)
        .map { item ->
            item instanceof List ? item[1..-1] : item
        }
        .flatten()


    MULTIQC(qc_channel.collect())

}
