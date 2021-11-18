if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager", quietly = TRUE)
BiocManager::install("qvalue")
list.of.packages <-c('devtools','RJSONIO','ecodist','gplots','scatterplot3d','usethis', 'httr', 'rcmdchecknew.packages' <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])])
if(length(new.packages)) install.packages(new.packages)
library(devtools)
install_github(repo='MG-RAST/matR',quiet=T)

library(matR)
list_mgp3362<-metadata("mgp3362")$mgp3362
list_mgp3362<-list_mgp3362[c(-11,-22)]
#Récupération des données taxonomiques (request='organism') depuis les hits
#de la base de données RDP (source='RDP') au niveau de l'ordre (group_level='order')
                     #avec une evalue de 1e-15 (evalue=15)
                     biom_phylum<-biomRequest(list_mgp3362,request="organism",source="RDP",
                                              group_level="order",evalue=15,wait=TRUE)
                     ## start stop requested ticket
                     ## 1 1 22 TRUE d7f38782-2d50-4f6d-b1a2-09c27f14445e
                     ## file
                     ## 1 /tmp/Rtmp7fnLNn/file694b82e34f2
                     #Transformation en matrice
                     phylum_matrix<-as.matrix(biom_phylum)
#reachntilloner avec de plus en plus grand, pluis graphique des nobres otus
                     
#facteur diversite par communaute et test (anova ?) ou faire un reg linaire multiple et regarde les pvalue ?
library(FactoMineR)
#PCA and plot.pca 3 fois