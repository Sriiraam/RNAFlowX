# ADR-012 Environment Freeze

## Status

Accepted

## Decision

RNAFlowX v1.0 development environment is:

* Windows 11
* WSL2 Ubuntu
* OpenJDK 17.0.19
* Nextflow 26.04.4

## Rationale

Provides a lightweight and reproducible environment for workflow development.

Docker support will be introduced in a future release.

## Consequences

All workflow development for RNAFlowX v1.0 will target this environment.

Changes to the execution environment require a new ADR.
