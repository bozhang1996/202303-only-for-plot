
library(ggplot2)
library(lattice)
library(RColorBrewer)
library(ggpmisc)
library(ggpubr)
library(grid) 
library(scales) 
library(ggbreak)
library(ggforce)
mydata <- read.csv("22.csv", header = T)
par(mfrow = c(1,5))
mydata <- mydata[c(1:40),]
ggplot(mydata, aes(Serum22,Trpm, fill = group)) + # fill = gpoup
  geom_point(shape = 19, color = "magenta2", stroke = 0.6, alpha = 0.8, size = 4)+
  scale_size(range = c(1,10)) +
  theme_bw() +
  geom_smooth(method = "lm", formula = y ~ x, alpha = 0.4,
              fill = "darkorchid", 
              color = "purple",
              linetype = 1,
              linewidth = 3)+
stat_cor(method = "pearson", aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~"))) 
#+theme(panel.grid=element_blank())
p
runif(15,21.25,24.70) 

p1<-ggplot(mydata,aes(Serum22,Trpm, fill = group))+
  theme_bw()+
  geom_point(size=5)+
  geom_smooth(method = 'lm', se= T)+
  stat_cor(method = "pearson", aes(label = paste(..rr.label.., ..p.label.., sep = "~`,`~"))) 
  # stat_poly_eq(aes(label = ..eq.label..),
  #              formula = formula,parse = F, geom = "text")
  # theme(axis.title= element_text(size=14))+
  # ylab("Y")+xlab("H")
  # theme(axis.text.x = element_text(size = 12, color = "black"))+
  # theme(axis.text.y = element_text(size = 12, color = "black"))
p1

p2 <- ggplot(mydata,aes(Serum22,Trpm, fill = group))+
  geom_point(shape=21,size=3,alpha=0.5)+

  geom_smooth(method = "lm",aes(color=group),  
              formula = y ~ x,
              linetype=1,alpha=0.5)+
  stat_poly_eq(formula = y ~ x, 
               aes(color=group,label = paste(after_stat(eq.label),
                                             ..rr.label..,sep = "~~~")), parse = TRUE) +
  theme_bw()+
  theme(panel.grid=element_blank(),
        legend.title = element_blank())+
  labs(x=NULL,y=NULL)
p2
p3 <- p2+facet_grid(~group, scales = "free")+
  theme(legend.position = "none") +
  ylim(0,5)
p3
