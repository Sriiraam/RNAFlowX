## Workflow Scope :

Dataset:
GSE330905

Comparison:
PBS vs Gluconate

Organism:
Human

Reference:
GRCh38 + GENCODE v50

## Pipeline Stages

SRA Download
      ↓
FASTQ Validation
      ↓
FastQC
      ↓
STAR Alignment
      ↓
featureCounts
      ↓
DESeq2
      ↓
MultiQC
      ↓
Final Report

## Modules

# RNAFlowX Pipeline Modules

## Module 1: Download

Input:

* SRR accession

Output:

* FASTQ files

Tool:

* fasterq-dump

---

## Module 2: Quality Control

Input:

* FASTQ files

Output:

* FastQC reports

Tool:

* FastQC

---

## Module 3: Alignment

Input:

* FASTQ files
* STAR index

Output:

* Sorted BAM

Tool:

* STAR

---

## Module 4: Quantification

Input:

* BAM
* GTF

Output:

* Gene count matrix

Tool:

* featureCounts

---

## Module 5: Differential Expression

Input:

* Count matrix
* Sample manifest

Output:

* Differential expression results

Tool:

* DESeq2

---

## Module 6: Reporting

Input:

* QC metrics
* DE results

Output:

* Final project report

Tool:

* MultiQC

## Output Structure

results/

├── download/
├── qc/
├── alignment/
├── counts/
├── deseq2/
├── reports/
└── multiqc/

## Nextflow Channel Flow

sample_manifest.csv
        │
        ▼
    Channel
        │
        ▼
 Download
        │
        ▼
 FASTQ Channel
        │
 ┌──────┴──────┐
 ▼             ▼
FastQC      STAR
               │
               ▼
             BAM
               │
               ▼
        featureCounts
               │
               ▼
         Count Matrix
               │
               ▼
            DESeq2
               │
               ▼
            Results

## v1.0 Deliverables

FastQC Reports

Aligned BAM Files

Gene Count Matrix

Differential Expression Table

Volcano Plot

PCA Plot

MultiQC Report