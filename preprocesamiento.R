# como cargar datos desde un URL?
# https://stackoverflow.com/questions/37469435/read-data-from-url
# El siguiente codigo carga datos desde el repositorio UCI Machine Learning repository.

#guardo la URL en una variable

URL<-"https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"

#veamos cual es el link
URL


#cargo el CSV. en particular este archivo no tiene encabezado, es decir, no tiene una linea inicial con los nombres de los atributos.

data <- read.csv(URL,
              header = FALSE)
data

# STR muestra el tipo de atributo y luego als 10 primeras observaciones
str(data) # resumen de atributos, dice algunos valores y los rangos


dim(data)
#[1] 569  32

#plot(data) # no es capaz de procesar la informacion porque son muchas dimensiones



#como desordenar un dataframe
#https://stackoverflow.com/questions/6422273/how-to-randomize-or-permute-a-dataframe-rowwise-and-columnwise
# vamos a muestrar 10 instancias al azar
s<-sample(1:569,size = 569, replace = FALSE)
s
#[1] 116 138 444   8 543 550 188 187 268  32
desordenados<-data[s,]
desordenados

dim(desordenados)

#seleccionamos 1 atributo
desordenados[,1]
#seleccionamos 2 atributos
desordenados[,1:2]
#eliminamos 1 atributos
x<-desordenados[,-c(1,2)]
dim(x)
head(x)
tail(x)
str(x)
#recuperando las categorias
y<-desordenados[,2]
## cual es la clase del objeto "y"
class(y)
#### podemos ver como los factores estan almacenados en la memoria
as.numeric(y)


######################## normalizacion  ########

str(x)

norm <- as.data.frame(apply(x, 2, function(x) (x - min(x))/(max(x)-min(x))))

norm
summary(x)
summary(norm)

###################### datos faltantes #######

install.packages("mlbench")
library("mlbench")
dim(BostonHousing)
BostonHousing$rad
head(BostonHousing$rad)

BostonHousing[sample(1:nrow(BostonHousing), 40), "rad"] <- NA
BostonHousing[sample(1:nrow(BostonHousing), 40), "ptratio"] <- NA



is.na(BostonHousing$rad)
is.na(BostonHousing$ptratio)
which(is.na(BostonHousing$rad))

sindatosfaltantes<-na.omit(BostonHousing)
dim(sindatosfaltantes)
#[1] 429  14
#77/506

##############   outliers   #########
boxplot(norm)
boxplot(norm$V16)
v16<-norm$V16

outliers<-norm[norm$V16 > 0.8,]
outliers$V16
which(norm$V16 < 0.8)
#[1] 116 484
norm[c(116,484),]

boxplot(outliers$V16)
