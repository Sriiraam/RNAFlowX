include { ALIGNMENT } from '../workflows/alignment'

workflow ALIGN {

    take:
    trimmed_reads
    star_index

    main:
    bam = ALIGNMENT(
        trimmed_reads,
        star_index
    )

    emit:
    bam
}
