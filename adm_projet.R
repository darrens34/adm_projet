# Importation des packages

library(FactoMineR)
library(factoextra)
library(tidyr)

# Importation des données

files = list.files(path = "data/", pattern="*.csv")
for (i in 1:length(files)){
  files[i] = paste("data/",files[i],sep="")
}
df = do.call(rbind, lapply(files, function(x) read.csv2(x, sep = ";", stringsAsFactors = FALSE)))

files = list.files(path = "data/", pattern="*-train.csv")
for (i in 1:length(files)){
  files[i] = paste("data/",files[i],sep="")
}
df_train = do.call(rbind, lapply(files, function(x) read.csv2(x, sep = ";", stringsAsFactors = FALSE)))

files = list.files(path = "data/", pattern="*-test.csv")
for (i in 1:length(files)){
  files[i] = paste("data/",files[i],sep="")
}
df_test = do.call(rbind, lapply(files, function(x) read.csv2(x, sep = ";", stringsAsFactors = FALSE)))

# 1) ACP

df = na.exclude(df_train[,1:29])
res_pca <- PCA(df[,3:29], ncp = 5, scale.unit = TRUE, graph=TRUE)

# 2) PCR