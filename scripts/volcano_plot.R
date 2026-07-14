library(ggplot2)
library(ggrepel)


res <- read.csv(
"results/final_report/deseq2_results_annotated.csv",
stringsAsFactors=FALSE
)


res <- res[
!is.na(res$log2FoldChange) &
!is.na(res$padj),
]


res$Significance <- "NS"


res$Significance[
res$padj < 0.05 &
res$log2FoldChange > 1
] <- "Up"


res$Significance[
res$padj < 0.05 &
res$log2FoldChange < -1
] <- "Down"



dir.create(
"results/final_report/plots",
recursive=TRUE,
showWarnings=FALSE
)



top_genes <- res[
order(res$padj),
][1:10,]



png(
"results/final_report/plots/volcano_plot.png",
width=1200,
height=900
)



ggplot(
res,
aes(
x=log2FoldChange,
y=-log10(padj),
color=Significance
)
)+

geom_point(
alpha=0.6,
size=1.5
)+

geom_text_repel(
data=top_genes,
aes(label=gene_symbol),
size=4
)+

theme_bw()+

labs(
title="RNAFlowX Differential Expression Volcano Plot",
x="log2 Fold Change",
y="-log10 Adjusted P-value"
)



dev.off()


cat(
"Volcano plot completed\n"
)
