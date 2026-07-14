
library(clusterProfiler)
library(enrichplot)
library(org.Hs.eg.db)
library(msigdbr)
library(dplyr)
library(ggplot2)


############################
# Input DESeq2 results
############################

res <- read.csv(
    "results/final_report/deseq2_results_annotated.csv",
    stringsAsFactors = FALSE
)


# Remove NA values
res <- res[
    !is.na(res$log2FoldChange) &
    !is.na(res$gene_symbol) &
    res$gene_symbol != "",
]


############################
# Create ranked gene list
############################

gene_list <- res$log2FoldChange

names(gene_list) <- res$gene_symbol


gene_list <- sort(
    gene_list,
    decreasing = TRUE
)


cat(
    "Genes ranked:",
    length(gene_list),
    "\n"
)



############################
# Convert SYMBOL -> ENTREZ
############################


gene_df <- bitr(
    names(gene_list),
    fromType = "SYMBOL",
    toType = "ENTREZID",
    OrgDb = org.Hs.eg.db
)


gene_df <- gene_df[
    !duplicated(gene_df$SYMBOL),
]


gene_list <- gene_list[
    names(gene_list) %in% gene_df$SYMBOL
]


names(gene_list) <- gene_df$ENTREZID[
    match(
        names(gene_list),
        gene_df$SYMBOL
    )
]


gene_list <- sort(
    gene_list,
    decreasing = TRUE
)


cat(
    "Mapped Entrez genes:",
    length(gene_list),
    "\n"
)



############################
# Output folder
############################


dir.create(
    "results/final_report/GSEA",
    recursive = TRUE,
    showWarnings = FALSE
)



############################
# GO Biological Process GSEA
############################


gsea_GO_BP <- gseGO(
    geneList = gene_list,
    OrgDb = org.Hs.eg.db,
    ont = "BP",
    keyType = "ENTREZID",
    minGSSize = 10,
    maxGSSize = 500,
    pvalueCutoff = 0.05,
    verbose = FALSE
)



write.csv(
    as.data.frame(gsea_GO_BP),
    "results/final_report/GSEA/GSEA_GO_BP.csv"
)



png(
    "results/final_report/GSEA/GSEA_GO_BP_dotplot.png",
    width=1200,
    height=900
)

print(
    dotplot(
        gsea_GO_BP,
        showCategory=20
    )
)

dev.off()



############################
# Hallmark GSEA
############################

hallmark <- msigdbr(
    species = "Homo sapiens",
    collection = "H"
)


hallmark_df <- hallmark %>%
    dplyr::select(
        gs_name,
        ncbi_gene
    ) %>%
    dplyr::rename(
        ENTREZID = ncbi_gene
    ) %>%
    dplyr::distinct()


gsea_H <- GSEA(
    geneList = gene_list,
    TERM2GENE = hallmark_df[,c("gs_name","ENTREZID")],
    minGSSize = 10,
    maxGSSize = 500,
    pvalueCutoff = 0.05,
    verbose = FALSE
)


if (length(gsea_H@result) > 0) {

    gsea_result <- gsea_H@result

    # Remove problematic nested columns
    bad_cols <- sapply(
        gsea_result,
        is.list
    )

    gsea_result <- gsea_result[, !bad_cols]


    write.csv(
        gsea_result,
        "results/final_report/GSEA/GSEA_Hallmark.csv",
        row.names = FALSE
    )


    png(
        "results/final_report/GSEA/GSEA_Hallmark_dotplot.png",
        width=1200,
        height=900
    )

    print(
        dotplot(
            gsea_H,
            showCategory=20
        )
    )

    dev.off()

}


cat(
"GSEA completed successfully\n"
)
