include { STAR_ALIGN } from '../modules/star_align'
include { SAMTOOLS_INDEX } from '../modules/samtools_index'


workflow ALIGNMENT {

    take:

    reads
    star_index


    main:

    star_results = STAR_ALIGN(
        reads,
        star_index
    )


    bam_ch = star_results.map { sample_id, bam_file, star_log ->
        tuple(sample_id, bam_file)
    }


    star_logs = star_results.map { sample_id, bam_file, star_log ->
        star_log
    }


    SAMTOOLS_INDEX(bam_ch)


    emit:

    bam = bam_ch

 star_logs = star_logs

   
}
