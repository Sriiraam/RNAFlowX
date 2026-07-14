# RNAFlowX Container

## Build

docker build -t rnaflowx:1.0 -f containers/Dockerfile .

## Test

docker run rnaflowx:1.0 STAR --version
docker run rnaflowx:1.0 fastp --version
docker run rnaflowx:1.0 multiqc --version

## Software Environment

Base:
Ubuntu 24.04

Tools:
- FastQC
- fastp
- STAR 2.7.11b
- samtools
- featureCounts
- MultiQC

R:
- DESeq2
- pheatmap
- ggplot2
