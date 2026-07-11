include { FEATURECOUNTS } from '../modules/featurecounts'


workflow QUANTIFICATION {

    take:
    bam
    annotation


    main:

    FEATURECOUNTS(
        bam,
        annotation
    )

}
