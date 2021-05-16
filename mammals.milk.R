rm(list=ls(all=TRUE)) #Remove objetos da memória do R

#Instala bibliotecas necessarias
install.packages('cluster.datasets') #Biblioteca para chamar o conjunto de dados

#Carrega bibliotecas
library(cluster.datasets)

#Carrega o conjunto de dados leite de mamiferos para a memoria
data(all.mammals.milk.1956)
dados <-all.mammals.milk.1956

summary(dados) #Visualiza resumo descritivo das variaveis

rownames(dados) <- dados$name #Adiciona o nome de cada animal ao nome da linha

dados$name <- NULL #Exclui a coluna nome, pois nos algoritmos de clusters so entram variaveis numericas ou factor

#Nao ha necessidade padronizar os dados pois todos estao em percentual
#mas caso fosse necessario o comando seria scale() Exemplo:
dados_transformados <- scale(dados)
dados_transformados

#Calcula distancia eucliciana de cada animal com todos os demais e guarda em uma matriz de distancias
distancias <- dist(dados, method = 'euclidean')
distancias

View(as.matrix(distancias))

#Agrupa os animais a partir da matriz de distancias
clusterizacao <- hclust(distancias, method = 'ward.D')
clusterizacao

#Plota o dendrograma
plot(clusterizacao,ylab = 'Distancia Euclidiana')
