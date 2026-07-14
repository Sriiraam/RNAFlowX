library(dplyr)

res <- read.csv(
"results/final_report/deseq2_results_annotated.csv",
stringsAsFactors = FALSE
)


dir.create(
"results/final_report/tables",
recursive = TRUE,
showWarnings = FALSE
)


# significant DEGs

deg <- res %>%
filter(
!is.na(padj),
padj < 0.05
)


write.csv(
deg,
"results/final_report/tables/significant_DEGs.csv",
row.names = FALSE
)


# upregulated

up <- deg %>%
filter(log2FoldChange > 0)


write.csv(
up,
"results/final_report/tables/upregulated_DEGs.csv",
row.names = FALSE
)


# downregulated

down <- deg %>%
filter(log2FoldChange < 0)


write.csv(
down,
"results/final_report/tables/downregulated_DEGs.csv",
row.names = FALSE
)


cat("DEG tables generated\n")
cat("Significant:", nrow(deg),"\n")
cat("Up:", nrow(up),"\n")
cat("Down:", nrow(down),"\n")
