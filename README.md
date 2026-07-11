# RNAFlowX

## Automated Bulk RNA-seq Analysis Workflow

RNAFlowX is a reproducible Nextflow-based workflow for processing paired-end bulk RNA sequencing data from raw FASTQ files to gene-level quantification.

## Overview

The workflow automates:

FASTQ
→ Quality Control
→ Read Trimming
→ Alignment
→ BAM Processing
→ Gene Quantification


## Tools

| Step | Tool |
|---|---|
| QC | FastQC |
| Trimming | fastp |
| Alignment | STAR |
| BAM Processing | SAMtools |
| Quantification | featureCounts |
| Workflow Engine | Nextflow |


## Features

- Modular Nextflow architecture
- Reproducible execution
- Configurable resources
- Automated processing of multiple samples


## Input

Paired-end RNA sequencing FASTQ files


## Output

- Quality reports
- Alignment files
- Gene count tables


## Version

Current release: v1.0.0
