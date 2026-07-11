# RNAFlowX Pipeline Architecture

## Workflow Scope

Dataset:
GSE330905

Biological Comparison:
PBS vs Gluconate treatment

Organism:
Homo sapiens

Reference Genome:
GRCh38

Annotation:
GENCODE v50


## Pipeline Version

Current Release:

RNAFlowX v1.0.0


## Pipeline Objective

RNAFlowX is an automated Nextflow workflow designed for reproducible bulk RNA-seq processing.

The workflow performs:

- Raw read quality assessment
- Adapter and quality trimming
- Post-trimming quality validation
- Genome alignment
- BAM processing
- Gene-level quantification


## Current Production Workflow

FASTQ
 |
FastQC RAW
 |
fastp
 |
FastQC Trimmed
 |
STAR Alignment
 |
SAMtools Indexing
 |
featureCounts
 |
Gene Count Matrix
 
### current architecture


results/

├── fastqc/
│
├── star/
│
├── featurecounts/
│
└── multiqc/
        |
        └── multiqc_report.html
