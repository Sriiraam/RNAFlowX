# ADR-005 Dataset Selection

## Status

Accepted

## Decision

RNAFlowX will use GSE330905 as the official demonstration dataset.

## Dataset Information

GEO Accession:
GSE330905

BioProject:
PRJNA1465899

SRA Study:
SRP700373

Organism:
Homo sapiens

Platform:
Illumina NovaSeq 6000

Library Layout:
PAIRED

Assay:
Bulk RNA-seq

Experimental Design:
PBS vs Gluconate

Replicates:
4 Control
4 Treatment

## Rationale

The dataset satisfies all RNAFlowX requirements:

- Human
- GRCh38 compatible
- Bulk RNA-seq
- Paired-End sequencing
- Public FASTQ availability
- Biological replicates
- Clean treatment/control design
- Suitable for differential expression analysis

## Consequences

RNAFlowX development, testing and validation will use this dataset.