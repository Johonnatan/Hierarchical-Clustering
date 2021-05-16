rm(list=ls(all=TRUE)) #Remove objetos da memória do R

#Instala bibliotecas necessarias
install.packages('cluster.datasets') #Biblioteca para chamar o conjunto de dados

#Carrega bibliotecas
library(cluster.datasets)

#Carrega o conjunto de dados leite de mamiferos
dados <-all.mammals.milk.1956

summary(dados) #Visualiza resumo descritivo das variaveis

rownames(dados) <- dados$name #Adiciona o nome de cada animal ao nome da linha

dados$name <- NULL #Exclui a coluna nome, pois nos algoritmos de clusters so entram variaveis numericas ou factor

#Calcula distancia eucliciana de cada animal com todos os demais e guarda em uma matriz de distancias
distancias <- dist(dados, method = 'euclidean')

#Agrupa os animais a partir da matriz de distancias
clusterizacao <- hclust(distancias, method = 'ward.D')

#Plota o dendrograma
plot(clusterizacao,ylab = 'Distancia Euclidiana')
