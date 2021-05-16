#Remove objetos da memória do R
rm(list=ls(all=TRUE)) 

#Instala bibliotecas 
install.packages('cluster.datasets') 

#Carrega bibliotecas
library(cluster.datasets)

#Carrega o conjunto de dataframe para um dataframe
data(all.mammals.milk.1956)
dataframe <-all.mammals.milk.1956

#Visualiza sumario dos dados
summary(dataframe) 

#Adiciona o nome de cada animal ao nome da linha
rownames(dataframe) <- dataframe$name

#Exclui a coluna nome
dataframe$name <- NULL

#Calcula distancia eucliciana de cada animal
distance <- dist(dataframe, method = 'euclidean')

#Agrupa os animais a partir da matriz de distance
cluster <- hclust(distance, method = 'ward.D')

#Plota o dendrograma
plot(cluster,ylab = 'Distancia Euclidiana')

#Selecione o valor de k no dendrograma
rect.hclust(cluster , k = 7)
