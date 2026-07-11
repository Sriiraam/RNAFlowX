# Changelog

All notable changes to this project will be documented here.

## [v1.0.0] - 2026-07-11

### Added

- Automated bulk RNA-seq analysis workflow using Nextflow
- Raw FASTQ quality control using FastQC
- Adapter and quality trimming using fastp
- Post-trimming quality assessment
- Genome indexing and alignment using STAR
- BAM sorting and indexing using SAMtools
- Gene-level quantification using featureCounts

### Pipeline Inputs

- Paired-end RNA sequencing FASTQ files
- Human reference genome

### Pipeline Outputs

- FastQC quality reports
- Trimmed FASTQ files
- STAR aligned BAM files
- BAM index files
- Gene count matrices

### Infrastructure

- Modular Nextflow workflow architecture
- Configurable execution profiles
- Reproducible analysis structure
