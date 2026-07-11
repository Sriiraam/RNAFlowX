process SAMTOOLS_INDEX {

    tag "$sample_id"

    publishDir "${params.outdir}/star", mode: "copy"


    input:
    tuple val(sample_id),
          path(bam)


    output:
    tuple val(sample_id),
          path("${bam}.bai")


    script:
    """
    samtools index ${bam}
    """


    stub:
    """
    touch ${bam}.bai
    """
}
