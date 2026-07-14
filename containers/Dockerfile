FROM ubuntu:24.04

LABEL maintainer="RNAFlowX"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    python3 \
    python3-pip \
    r-base \
    default-jre \
    fastqc \
    samtools \
    subread \
    && rm -rf /var/lib/apt/lists/*


# fastp
RUN wget http://opengene.org/fastp/fastp \
    -O /usr/local/bin/fastp && \
    chmod a+x /usr/local/bin/fastp


# STAR
RUN wget https://github.com/alexdobin/STAR/archive/2.7.11b.tar.gz && \
    tar -xzf 2.7.11b.tar.gz && \
    cp STAR-2.7.11b/bin/Linux_x86_64_static/STAR /usr/local/bin/ && \
    rm -rf STAR*


# Python tools
RUN pip3 install --break-system-packages multiqc pandas


# R packages
RUN R -e "install.packages('BiocManager', repos='https://cloud.r-project.org')" && \
    R -e "BiocManager::install(c('DESeq2','pheatmap'))" && \
    R -e "install.packages('ggplot2', repos='https://cloud.r-project.org')"


WORKDIR /workspace
