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
}