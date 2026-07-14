process DESEQ2 {

    tag "DESeq2 differential expression"

    publishDir "${params.outdir}/deseq2", mode: "copy"


    input:
    path count_matrix
    path metadata


    output:
path "*.csv"
path "*.png"
path "*.rds"

    script:

    """
    Rscript - <<'RSCRIPT'

library(DESeq2)
library(ggplot2)
library(pheatmap)

counts <- read.csv(
    "${count_matrix}",
    row.names=1,
    check.names=FALSE
)

metadata <- read.csv(
    "${metadata}",
    row.names=1
)

counts <- counts[, rownames(metadata)]


dds <- DESeqDataSetFromMatrix(
    countData = round(counts),
    colData = metadata,
    design = ~ condition
)


dds <- DESeq(dds)


res <- results(
    dds,
    contrast=c(
        "condition",
        "Gluconate",
        "PBS"
    )
)


res <- as.data.frame(res)

write.csv(
    res,
    "deseq2_results.csv"
)


normalized <- counts(dds, normalized=TRUE)

write.csv(
    normalized,
    "normalized_counts.csv"
)


vsd <- vst(dds)

vst_matrix <- assay(vsd)

write.csv(
    vst_matrix,
    "vst_counts.csv"
)


# PCA

pca <- plotPCA(
    vsd,
    intgroup="condition",
    returnData=TRUE
)

percentVar <- round(
    100 * attr(pca,"percentVar")
)

png(
    "PCA.png",
    width=800,
    height=600
)

ggplot(
    pca,
    aes(
        PC1,
        PC2,
        color=condition
    )
)+
geom_point(size=4)+
xlab(paste0("PC1: ",percentVar[1],"%"))+
ylab(paste0("PC2: ",percentVar[2],"%"))+
theme_bw()

dev.off()


# Volcano plot

png(
    "volcano_plot.png",
    width=800,
    height=600
)

plot(
    res\$log2FoldChange,
    -log10(res\$padj),
    pch=20,
    main="Gluconate vs PBS",
    xlab="log2 Fold Change",
    ylab="-log10 adjusted p-value"
)

dev.off()


saveRDS(
    dds,
    "dds.rds"
)

RSCRIPT
"""
}
