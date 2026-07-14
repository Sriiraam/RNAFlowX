library(clusterProfiler)
library(enrichplot)
library(org.Hs.eg.db)
library(ggplot2)


deg <- read.csv(
"results/final_report/DEG_nominal.csv"
)


genes <- unique(
    deg$gene_symbol
)

genes <- genes[
    genes != "" &
    !is.na(genes)
]


cat(
"Genes used:",
length(genes),
"\n"
)


# Convert symbols to Entrez IDs

gene_df <- bitr(
    genes,
    fromType="SYMBOL",
    toType="ENTREZID",
    OrgDb=org.Hs.eg.db
)


entrez <- unique(gene_df$ENTREZID)


dir.create(
"results/final_report/enrichment",
recursive=TRUE,
showWarnings=FALSE
)


####################
# GO enrichment
####################

ego_BP <- enrichGO(
    gene=entrez,
    OrgDb=org.Hs.eg.db,
    ont="BP",
    pAdjustMethod="BH",
    pvalueCutoff=0.05,
    qvalueCutoff=0.2,
    readable=TRUE
)


ego_MF <- enrichGO(
    gene=entrez,
    OrgDb=org.Hs.eg.db,
    ont="MF",
    readable=TRUE
)


ego_CC <- enrichGO(
    gene=entrez,
    OrgDb=org.Hs.eg.db,
    ont="CC",
    readable=TRUE
)


write.csv(
as.data.frame(ego_BP),
"results/final_report/enrichment/GO_BP_results.csv"
)

write.csv(
as.data.frame(ego_MF),
"results/final_report/enrichment/GO_MF_results.csv"
)

write.csv(
as.data.frame(ego_CC),
"results/final_report/enrichment/GO_CC_results.csv"
)

####################
# KEGG enrichment
####################

ekegg <- enrichKEGG(
    gene = entrez,
    organism = "hsa",
    pAdjustMethod = "BH",
    pvalueCutoff = 0.05
)


ekegg <- setReadable(
    ekegg,
    OrgDb = org.Hs.eg.db,
    keyType = "ENTREZID"
)


write.csv(
as.data.frame(ekegg),
"results/final_report/enrichment/KEGG_results.csv"
)


png(
"results/final_report/enrichment/KEGG_dotplot.png",
width=1200,
height=900
)

print(
dotplot(
ekegg,
showCategory=20
)
)

dev.off()

####################
# Plots
####################

png(
"results/final_report/enrichment/GO_BP_dotplot.png",
width=1200,
height=900
)

print(
dotplot(
ego_BP,
showCategory=20
)
)

dev.off()



png(
"results/final_report/enrichment/GO_MF_dotplot.png",
width=1200,
height=900
)

print(
dotplot(
ego_MF,
showCategory=20
)
)

dev.off()



png(
"results/final_report/enrichment/GO_CC_dotplot.png",
width=1200,
height=900
)

print(
dotplot(
ego_CC,
showCategory=20
)
)

dev.off()
