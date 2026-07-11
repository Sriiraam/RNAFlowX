process STAR_ALIGN {

    tag "$sample_id"

    publishDir "${params.outdir}/star", mode: "copy"

    cpus 16
    memory '32 GB'

    input:
    tuple val(sample_id),
          path(read1),
          path(read2)

    path star_index

    output:
    tuple val(sample_id),
          path("${sample_id}.Aligned.sortedByCoord.out.bam")


    script:
    """
    STAR \
        --runThreadN ${task.cpus} \
        --genomeDir ${star_index} \
        --readFilesIn ${read1} ${read2} \
        --readFilesCommand zcat \
        --outSAMtype BAM SortedByCoordinate \
        --outFileNamePrefix ${sample_id}.
    """


    stub:
    """
    touch ${sample_id}.Aligned.sortedByCoord.out.bam
    """
}
