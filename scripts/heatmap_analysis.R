library(DESeq2)
library(pheatmap)
library(RColorBrewer)


############################
# Load normalized counts
############################

counts <- read.csv(
"results/final_report/vst_counts.csv",
row.names=1
)


############################
# Select top variable genes
############################

gene_var <- apply(
counts,
1,
var
)


top_genes <- names(
sort(
gene_var,
decreasing=TRUE
)[1:50]
)


heatmap_data <- counts[
top_genes,
]


############################
# Create output folder
############################

dir.create(
"results/final_report/plots",
showWarnings=FALSE
)



############################
# Heatmap
############################


png(
"results/final_report/plots/top50_variable_genes_heatmap.png",
width=1400,
height=1200
)


pheatmap(
heatmap_data,
scale="row",
cluster_rows=TRUE,
cluster_cols=TRUE,
show_rownames=TRUE,
color=colorRampPalette(
brewer.pal(11,"RdBu")
)(100),
fontsize_row=8
)


dev.off()


cat(
"Heatmap completed\n"
)
