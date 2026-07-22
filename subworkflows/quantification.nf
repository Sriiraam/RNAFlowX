include { QUANTIFICATION } from '../workflows/quantification'

workflow QUANTIFY {

    take:
    bam
    gtf

    main:
    counts = QUANTIFICATION(
        bam,
        gtf
    )

    emit:
    counts
}
