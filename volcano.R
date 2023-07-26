library(ggExtra)
library(ggplot2)
library(ggforce)
library(ggrepel)
library(EnhancedVolcano)
library(dplyr)
treat1 <- read.csv("volcano2.csv", header = T, row.names = 1)
treat1$name <- rownames(treat1)
foldchange = 1
padj = 0.05
treatsig <- treat1[(treat1$raw.pval <=0.1 & (treat1$log2.FC. >= 1 | treat1$log2.FC. <= -(foldchange))),]
treatup <- treat1[(treat1$raw.pval <=0.1 & (treat1$log2.FC. >= 1)),]
treatdown <- treat1[treat1$raw.pval <=0.1 & (treat1$log2.FC. <= -(foldchange)),]
size1 <- 3*treat1$X.log10.p.
treat1name <- as.data.frame(slice_min(treat1,order_by = raw.pval, n = 10))$name

p1 <- EnhancedVolcano(treat1, 
                lab = rownames(treat1), 
                pointSize = size1, 
                x = 'log2.FC.',
                y = 'raw.pval',
                selectLab = c("tryptophan", "dUDP", "alpha-guaiaconic acid","indolepyruvate"),
                labSize = 4,
                max.overlaps = 20,
                drawConnectors = F,
                widthConnectors = 1.0,
                labCol = 'black',
                labFace = 'bold',
                boxedLabels = FALSE,
                colAlpha = 0.5,
                pCutoff = 0.10, 
                FCcutoff = 1,   
                cutoffLineWidth = 0.8,
                xlim = c(-10, 10),
                ylim = c(0, 5),
                hline = c(0.01,0.001), hlineCol = c("hotpink", "purple"), hlineType = c('longdash','dotdash'), hlineWidth = c(1,1),
               # shape = c(15,18,17),
                border = 'full',
                borderWidth = 1.0,
                borderColour = 'black',
                gridlines.major = FALSE,
                gridlines.minor = FALSE,
                title = '' 
)
p1
p10 <- ggMarginal(p1,type = "histogram" , groupFill = T)
p10



