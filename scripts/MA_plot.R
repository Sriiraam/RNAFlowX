library(DESeq2)
library(ggplot2)


res <- read.csv(
"results/final_report/deseq2_results_annotated.csv",
stringsAsFactors = FALSE
)


res$Significance <- "NS"

res$Significance[
!is.na(res$padj) &
res$padj < 0.05
] <- "Significant"


dir.create(
"results/final_report/plots",
recursive=TRUE,
showWarnings=FALSE
)


png(
"results/final_report/plots/MA_plot.png",
width=1200,
height=900
)


ggplot(
res,
aes(
x=log10(baseMean+1),
y=log2FoldChange,
color=Significance
)
)+
geom_point(
alpha=0.4,
size=1
)+
theme_classic()+
labs(
title="DESeq2 MA Plot",
x="Mean expression (log10 baseMean)",
y="Log2 Fold Change"
)


dev.off()


cat("MA plot completed\n")
