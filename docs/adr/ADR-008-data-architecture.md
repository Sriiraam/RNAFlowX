# ADR-008 Data Architecture

## Status

Accepted

## Decision

RNAFlowX will use metadata-driven execution.

All samples, references and outputs will be tracked using structured metadata files.

## Rationale

Metadata-driven workflows provide:

* Reproducibility
* Traceability
* Automation
* Scalability

## Consequences

Pipeline execution must not depend on hardcoded filenames or paths.
