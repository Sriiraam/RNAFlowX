process FASTQC_TRIMMED {

    tag "$sample_id"

    publishDir "${params.outdir}/fastqc/trimmed", mode: "copy"

    input:
    tuple val(sample_id),
          path(read1),
          path(read2)

    output:
    path("*_fastqc.html")
    path("*_fastqc.zip")

    script:
    """
    fastqc \
        --threads ${task.cpus} \
        ${read1} \
        ${read2}
    """
    stub:
    """
    touch ${sample_id}_R1.trim_fastqc.html
    touch ${sample_id}_R1.trim_fastqc.zip
    touch ${sample_id}_R2.trim_fastqc.html
    touch ${sample_id}_R2.trim_fastqc.zip
    """
}
