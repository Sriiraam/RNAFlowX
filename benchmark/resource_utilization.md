# Resource Utilization

## Objective

This document summarizes computational resources used during RNAFlowX execution.

---

## Major Compute Tasks

| Process | CPU | Memory | Description |
|----------|-----|--------|-------------|
| FastQC | Low | Low | Raw QC |
| fastp | Moderate | Moderate | Adapter trimming |
| STAR | High | High | Genome alignment |
| SAMtools | Moderate | Low | BAM indexing |
| featureCounts | Moderate | Moderate | Gene quantification |
| DESeq2 | Moderate | Moderate | Differential expression |
| MultiQC | Low | Low | Report aggregation |

---

## Expected Bottlenecks

The computationally intensive stages are:

- STAR genome alignment
- STAR genome indexing
- DESeq2 statistical analysis

---

## Parallelization

RNAFlowX executes independent samples concurrently using the Nextflow dataflow model.

Benefits include:

- improved throughput
- efficient CPU utilization
- scalable execution

---

## Monitoring

Execution statistics are available in:

- trace.txt
- report.html
- timeline.html

These reports allow identification of:

- long-running processes
- CPU utilization
- memory allocation
- execution bottlenecks

