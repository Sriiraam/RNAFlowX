process FASTP_TRIM {

    tag "$sample_id"

    publishDir "${params.outdir}/fastp", mode: "copy"

    input:
    tuple val(sample_id), path(read1), path(read2)

    output:
    tuple val(sample_id),
          path("${sample_id}_R1.trim.fastq.gz"),
          path("${sample_id}_R2.trim.fastq.gz")

    script:
    """
    fastp \
        -i ${read1} \
        -I ${read2} \
        -o ${sample_id}_R1.trim.fastq.gz \
        -O ${sample_id}_R2.trim.fastq.gz \
        --thread ${task.cpus} \
        --html ${sample_id}.fastp.html \
        --json ${sample_id}.fastp.json
    """
}