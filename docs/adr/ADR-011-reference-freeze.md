# ADR-011 Reference Freeze

## Status

Accepted

## Decision

RNAFlowX v1.0 will use:

* GRCh38 Primary Assembly
* GENCODE Release 50 Annotation

## Reference Files

Genome:
GRCh38.primary_assembly.genome.fa

Annotation:
gencode.v50.annotation.gtf

## Rationale

* Current human reference standard
* Compatible with STAR alignment
* Compatible with DESeq2 downstream analysis
* Publicly available and reproducible

## Consequences

Reference versions are frozen for RNAFlowX v1.0.

Any future upgrade requires a new ADR and full re-validation.
