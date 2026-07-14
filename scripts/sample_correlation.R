library(DESeq2)
library(pheatmap)


dds <- readRDS(
"results/deseq2/dds.rds"
)


# Extract normalized counts

mat <- assay(
    vst(dds)
)


# Calculate correlation

cor_matrix <- cor(
    mat,
    method="pearson"
)


dir.create(
"results/final_report/plots",
recursive=TRUE,
showWarnings=FALSE
)


png(
"results/final_report/plots/sample_correlation_heatmap.png",
width=1200,
height=1000
)


pheatmap(
    cor_matrix,
    main="Sample Correlation Heatmap",
    border_color=NA
)


dev.off()


cat("Sample correlation heatmap completed\n")
