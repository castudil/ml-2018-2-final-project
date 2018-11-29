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
dim(data)


plot(data) # no es capaz de procesar la informacion porque son muchas dimensiones
str(data) # resumen de atributos, dice algunos valores y los rangos
data$V2
x<-data[-c(1,2),]
str(x)
dim(x)
