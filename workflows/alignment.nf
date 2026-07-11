include { STAR_ALIGN } from '../modules/star_align'
include { SAMTOOLS_INDEX } from '../modules/samtools_index'


workflow ALIGNMENT {

    take:
    reads
    star_index

    main:

    bam = STAR_ALIGN(reads, star_index)

    SAMTOOLS_INDEX(bam)


    emit:
    bam
}
