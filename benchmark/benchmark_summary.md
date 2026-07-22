# RNAFlowX Benchmark Summary

## Benchmark Overview

This benchmark summarizes the execution characteristics of the RNAFlowX v1.0.0 RNA-seq workflow executed using Nextflow DSL2.

---

## Pipeline Configuration

| Item | Value |
|------|-------|
| Workflow | RNAFlowX |
| Version | v1.0.0 |
| Workflow Engine | Nextflow DSL2 |
| Executor | Local |
| Dataset | GEO GSE330905 |
| Samples | 8 paired-end RNA-seq samples |
| Reference Genome | GRCh38 Primary Assembly |
| Annotation | GENCODE v49 |
| Alignment | STAR |
| Quantification | featureCounts |
| Differential Expression | DESeq2 |
| Reporting | MultiQC |

---

## Benchmark Artifacts

The following execution artifacts were generated automatically by Nextflow.

| Artifact | Description |
|-----------|-------------|
| report.html | Overall execution report |
| timeline.html | Task execution timeline |
| trace.txt | Process-level execution statistics |
| dag.html | Workflow dependency graph |

---

## Benchmark Purpose

The benchmark demonstrates:

- workflow reproducibility
- execution monitoring
- task dependency visualization
- execution traceability
- production-ready reporting

---

## Notes

Benchmark artifacts were generated using Nextflow built-in reporting features.

These reports can be regenerated using:

```bash
nextflow run main.nf -resume
```

with timeline, report, trace and DAG reporting enabled.
