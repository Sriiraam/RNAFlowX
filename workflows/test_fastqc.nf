include { FASTQC_RAW } from '../modules/fastqc_raw'


workflow TEST_FASTQC {

    take:
    reads

    main:

    FASTQC_RAW(reads)

}
