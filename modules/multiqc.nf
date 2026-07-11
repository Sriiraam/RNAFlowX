process MULTIQC {

    tag "MultiQC Report"

    publishDir "${params.outdir}/multiqc", mode: "copy"


    input:
    path qc_files


    output:
    path "multiqc_report.html"
    path "multiqc_report_data"


    script:
    """
    multiqc \
        . \
        --config ${projectDir}/conf/multiqc_config.yaml \
        --filename multiqc_report.html \
        -o .
    """
}
