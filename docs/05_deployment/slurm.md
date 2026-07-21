# Slurm Deployment

## Overview

RNAFlowX supports execution on Slurm HPC clusters using Nextflow.

## Requirements

- Slurm scheduler
- Nextflow
- Docker/Singularity (if required)
- Shared filesystem

## Running

```bash
nextflow run main.nf -profile slurm
```

## Notes

Process resources are defined in:

conf/slurm.config

## Troubleshooting

- Verify Slurm is installed
- Check queue name
- Verify account permissions
- Use `nextflow config -profile slurm` to validate configuration
