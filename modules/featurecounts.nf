process FEATURECOUNTS {

    tag "$sample_id"

    publishDir "${params.outdir}/featurecounts", mode: "copy"


    input:
    tuple val(sample_id),
          path(bam)

    path annotation


    output:

      tuple val(sample_id),
      path("${sample_id}_gene_counts.txt"),
      path("${sample_id}_gene_counts.txt.summary")

    script:
    """
   featureCounts \
    -T ${task.cpus} \
    -p \
    -a ${annotation} \
    -o ${sample_id}_gene_counts.txt \
    ${bam}
    """
   stub:
   """
   touch ${sample_id}_gene_counts.txt
   touch ${sample_id}_gene_counts.txt.summary
   """
}
