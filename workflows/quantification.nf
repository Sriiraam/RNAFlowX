include { FEATURECOUNTS } from '../modules/featurecounts'


workflow QUANTIFICATION {

    take:
    bam
    annotation


    main:

    counts = FEATURECOUNTS(
        bam,
        annotation
    )


    emit:
    counts

}
