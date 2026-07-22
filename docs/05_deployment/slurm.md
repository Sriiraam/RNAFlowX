# Slurm Deployment

## Overview

RNAFlowX supports execution on High Performance Computing (HPC) environments managed by the Slurm Workload Manager. The pipeline includes a dedicated Slurm execution profile that enables scalable scheduling of RNA-seq analysis tasks while allowing process-specific CPU, memory, and runtime allocation.

The Slurm profile has been implemented and validated using Nextflow configuration validation. Execution of the pipeline requires access to a configured Slurm HPC cluster.

---

## Prerequisites

Before running RNAFlowX on a Slurm cluster, ensure the following components are available:

- Slurm Workload Manager (slurmctld and slurmd)
- Nextflow (DSL2 compatible)
- Java 17 or later
- Shared filesystem accessible by all compute nodes
- Docker, Singularity, or Apptainer (depending on cluster policy)
- Reference genome and annotation files

---

## Slurm Profile

RNAFlowX provides a dedicated Slurm execution profile located at:

```text
conf/slurm.config
```

The profile defines:

- Slurm executor
- Default partition (queue)
- CPU allocation
- Memory allocation
- Wall-time limits
- Process-specific resource overrides

---

## Running RNAFlowX on Slurm

Launch the pipeline using the Slurm execution profile:

```bash
nextflow run main.nf -profile slurm
```

---

## Process Resource Allocation

| Process | CPUs | Memory | Time Limit |
|---------|------|---------|------------|
| STAR_INDEX | 16 | 64 GB | 12 h |
| STAR_ALIGN | 8 | 32 GB | 12 h |
| FEATURECOUNTS | 4 | 16 GB | 4 h |
| DESEQ2 | 4 | 16 GB | 4 h |
| MULTIQC | 2 | 8 GB | 2 h |

Resource allocations can be modified in:

```text
conf/slurm.config
```

---

## Configuration Validation

The Slurm execution profile can be validated without submitting jobs to a cluster.

```bash
nextflow config -profile slurm
```

Expected output:

```text
executor = 'slurm'
```

This confirms that Nextflow correctly recognizes and loads the Slurm execution profile.

---

## Validation Status

The Slurm execution profile has been:

- Successfully implemented
- Validated using `nextflow config -profile slurm`
- Configured with process-specific resource allocation
- Integrated into the RNAFlowX execution profiles

Actual job execution requires a configured Slurm HPC environment with a running Slurm controller and compute nodes.

---

## Troubleshooting

### Verify Slurm installation

```bash
which sbatch
```

### Check Slurm version

```bash
sbatch --version
```

### Validate the Nextflow configuration

```bash
nextflow config -profile slurm
```

### Check available partitions

```bash
sinfo
```

### View submitted jobs

```bash
squeue
```

### Common Issues

| Issue | Possible Cause |
|--------|----------------|
| Slurm profile not found | Incorrect Nextflow profile configuration |
| Jobs remain pending | Insufficient cluster resources or partition limits |
| Unable to submit jobs | Slurm controller unavailable |
| Invalid partition | Queue name does not exist |
| Permission denied | HPC account or project allocation not configured |

---

## References

- Nextflow Documentation: https://www.nextflow.io/docs/latest/executor.html#slurm
- Slurm Workload Manager: https://slurm.schedmd.com/
