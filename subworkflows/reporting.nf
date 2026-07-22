include { MULTIQC } from '../modules/multiqc'

workflow REPORTING {

    take:
    qc_files

    main:
    MULTIQC(qc_files)

    emit:
    report = MULTIQC.out
}
