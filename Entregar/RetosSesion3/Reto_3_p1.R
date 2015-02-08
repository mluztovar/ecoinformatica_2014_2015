multiplicacion<-1
##input <- scan(file="", n=5, sep= " ") ## con file="" indicamos que se va a leer de teclado, n=5 que va a leer 5 numeros como maximo y sep indica como se van a separar los valores introducidos
##input <- c(1,2,3,3,2) ##creamos un vector de datos directamente desde el script
for (indice in 1:5){
  input <- scan(file="", n=1)
  multiplicacion <- multiplicacion * input
  ##multiplicacion <- multiplicacion * input[indice] ##descomentar si se descomenta la linea 2 o la 3
}
print(multiplicacion)