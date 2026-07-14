library(DESeq2)
library(ggplot2)


############################
# Load DESeq2 object
############################

dds <- readRDS(
"results/deseq2/dds.rds"
)


############################
# VST transformation
############################

vsd <- vst(
    dds,
    blind=FALSE
)


############################
# PCA data
############################

pcaData <- plotPCA(
    vsd,
    intgroup="condition",
    returnData=TRUE
)


percentVar <- round(
    100 * attr(
        pcaData,
        "percentVar"
    )
)



############################
# Output folder
############################

dir.create(
"results/final_report/plots",
recursive=TRUE,
showWarnings=FALSE
)



############################
# PCA plot
############################

png(
"results/final_report/plots/PCA_plot.png",
width=1200,
height=900
)



ggplot(
pcaData,
aes(
PC1,
PC2,
color=condition,
label=name
)
)+

geom_point(
size=5
)+

geom_text(
vjust=-1,
size=4
)+

xlab(
paste0(
"PC1: ",
percentVar[1],
"% variance"
)
)+

ylab(
paste0(
"PC2: ",
percentVar[2],
"% variance"
)
)+

theme_bw()+

ggtitle(
"RNAFlowX PCA Plot"
)



dev.off()


cat(
"PCA plot completed\n"
)
