
library(ggplot2)   
library(ggalluvial) 
library(tidyverse)
library(randomcoloR)
library(reshape2)
palette <- c("#DC0000B2","#F39B7BF2","#8491B4B2","#4DBBD5B2","#00A087B2")
data <- read.csv("GROUPAVERAGE.csv", row.names = 1)
data$Phylum <- factor(rownames(data), levels = c("N","D","L","M","H"), ordered = T)
data_draw <- melt(data,id.vars='Phylum') 

p1 <- ggplot(data_draw,aes(variable, value)) +
  geom_bar(aes(fill = Phylum), stat = "identity",color="black", # stat = "identity"
           position = "fill", width = 0.6,data=data_draw)+  # position = "fill
  scale_fill_manual(values=c(palette))+ 
  labs(y = "Relative abundance ",x="sample")+ 
  theme(text=element_text(family='serif'),
        axis.title=element_text(size=14,face="plain",color="black", vjust = 0.45, hjust = 0.5), 
        axis.text = element_text(size=10,face="plain",color="black"),
        legend.title=element_text(size=14,face="bold",color="black"),
        legend.text = element_text(size=14,face='bold',color="black"), 
        legend.position = "right", 
        panel.background = element_blank() 
        )+
  scale_y_continuous(expand = c(0,0))+  
  theme(plot.margin = unit(c(2,1,1,1), "lines")) + 
  theme(axis.ticks.length=unit(0.1, "cm"), 
        axis.text.x = element_text(margin=unit(c(0.5,0.5,0.5,0.5), "cm"), hjust = 1, angle = 60), 
        axis.text.y = element_text(margin=unit(c(0.5,0.5,0.5,0.5), "cm")))
p1

