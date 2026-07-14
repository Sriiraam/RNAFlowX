process FASTP_TRIM {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(read1), path(read2)

    output:

    tuple val(sample_id),
          path("${sample_id}_R1.trim.fastq.gz"),
          path("${sample_id}_R2.trim.fastq.gz"),
          emit: trimmed_reads

    path "${sample_id}.fastp.html"
    path "${sample_id}.fastp.json"

    script:
    """
    fastp \
    -i ${read1} \
    -I ${read2} \
    -o ${sample_id}_R1.trim.fastq.gz \
    -O ${sample_id}_R2.trim.fastq.gz \
    --thread ${task.cpus} \
    --detect_adapter_for_pe \
    --html ${sample_id}.fastp.html \
    --json ${sample_id}.fastp.json
    """
    stub:
    """
    touch ${sample_id}_R1.trim.fastq.gz
    touch ${sample_id}_R2.trim.fastq.gz
    touch ${sample_id}.fastp.html
    touch ${sample_id}.fastp.json
    """
}
