#install.packages("ggalluvial")
library(ggplot2)
library(ggalluvial)
library(ggsci)
library(scales)

E <- read.csv(file = "msea_ora_result.csv", header = T)
G <- E[,-3]
E
A <- to_lodes_form(G[,1:ncol(G)],
                   axes = 1:ncol(G),
                   id = "label")
show_col(pal_aaas("default")(10))
pal_aaas("default")(10)
head(A)
col <- rep(c("#3B4992FF" ,"#E64B35FF" ,"#008B45FF", "#631879FF" ,"#008280FF", "#BB0021FF","#5F559BFF" ,"#A20056FF" ,"#808180FF" ,"#E64B35FF", "#4DBBD5FF", "#00A087FF" ,"#3C5488FF" ,"#F39B7FFF", "#8491B4FF","#91D1C2FF", "#DC0000FF","#7E6148FF"),2)

col2 <- c("#3B4992FF" ,"#EE0000FF" ,"#008B45FF", "#631879FF" ,"#008280FF", "#BB0021FF","#5F559BFF" ,"#A20056FF" ,"#808180FF" ,"#E64B35FF", "#4DBBD5FF", "#00A087FF" ,"#3C5488FF" ,"#F39B7FFF", "#8491B4FF","#91D1C2FF", "#DC0000FF","#7E6148FF","yellowgreen","green", "yellow1","yellow3","seagreen","seagreen2","lightblue","lightblue2","magenta","magenta4","goldenrod1","darkseagreen1","deeppink1","chartreuse","chartreuse4","cadetblue","cadetblue1","cadetblue3","tomato","tomato3")

col4 <- rep(c(c(colorRampPalette(c("red","blue"))(5)),c(colorRampPalette(c("yellow","grey"))(5)),c(colorRampPalette(c("orange","lightblue"))(10))))

col3 <- c("#3B4992FF"  ,"#008B45FF", "#631879FF" ,"#008280FF","#5F559BFF" ,"#A20056FF" ,"#808180FF" ,"#E64B35FF", "#4DBBD5FF", "#00A087FF" ,"#3C5488FF" ,"#F39B7FFF", "#8491B4FF","#91D1C2FF","magenta4", "cadetblue3","cadetblue",col4)

ggplot(A,
       aes(x = x, stratum = stratum, alluvium = label, fill = stratum, label = stratum)) +
  scale_x_discrete(expand = c(0, 0)) + 
  geom_flow(width = 0.33) + 
  geom_stratum(alpha = .9) + 
  geom_text(stat = "stratum", size = 3,color="black") +
  scale_fill_manual(values = col) +
  xlab("") + ylab("") +
  theme_bw() + 
  theme(panel.grid =element_blank()) + 
  theme(panel.border = element_blank()) +
  theme(axis.line = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        legend.position = "none") + 
  ggtitle("pathways")

