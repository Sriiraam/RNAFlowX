# RNAFlowX

A production-ready RNA-Seq analysis pipeline built with Nextflow DSL2.

---

## Features

- FastQC
- fastp
- STAR
- featureCounts
- DESeq2
- MultiQC
- Docker support
- GitHub Actions CI
- AWS-ready configuration
- Modular DSL2 architecture

---

## Pipeline

FASTQ
 ↓
FastQC
 ↓
fastp
 ↓
FastQC
 ↓
STAR
 ↓
SAMtools
 ↓
featureCounts
 ↓
DESeq2
 ↓
MultiQC

---

## Requirements

Nextflow >=26
Java 17
Docker (optional)

---

## Quick Start

git clone ...

cd RNAFlowX

nextflow run main.nf

---

## Docker

docker build -t rnaflowx:1.0 \
-f containers/Dockerfile .

nextflow run main.nf -profile docker

---

## Testing

nextflow run main.nf \
-config tests/integration/test.config \
-config conf/ci.config \
-stub-run

---

## Project Structure

modules/
workflows/
conf/
containers/
tests/
docs/

---

## Results

results/

---

## Version

1.0.0

---

## License

MIT

