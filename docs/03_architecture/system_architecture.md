# RNAFlowX System Architecture


## Overview

RNAFlowX is a modular Nextflow-based RNA sequencing analysis workflow.

The architecture follows a reproducible workflow-engine design separating:

- Workflow orchestration
- Process modules
- Configuration
- Analysis scripts
- Documentation
- Testing


## Architecture
main.nf

|
|

workflows/

|
|

modules/

|
|

Bioinformatics tools



## Components


### Workflow Layer

Location:

workflows/


Responsible for:

- Pipeline logic
- Channel connections
- Execution order


### Module Layer

Location:

modules/


Contains:

- FastQC
- fastp
- STAR
- SAMtools
- featureCounts


### Configuration Layer

Files:

nextflow.config

conf/


Responsible for:

- CPUs
- Memory
- Profiles
- Runtime settings


### Analysis Layer

Future:

scripts/

Contains:

- DESeq2
- GSEA
- Visualization


### Testing Layer

Location:

tests/


Responsible for:

- Pipeline validation
- Regression testing


## Reproducibility

RNAFlowX uses:

- Nextflow workflow engine
- Version controlled code
- Fixed reference genome
- Documented tool versions
