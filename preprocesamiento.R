# como cargar datos desde un URL?
# https://stackoverflow.com/questions/37469435/read-data-from-url
# El siguiente codigo carga datos desde el repositorio UCI Machine Learning repository.

#guardo la URL en una variable

URL<-"https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wpbc.data"

#cargo el CSV. en particular este archivo no tiene encabezado, es decir, no tiene una linea inicial con los nombres de los atributos.

X <- read.csv(URL,
              header = FALSE)
