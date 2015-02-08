input <- scan(file="", n=10, sep= " ") ## con file="" indicamos que se va a leer de teclado, n=5 que va a leer 5 numeros como maximo y sep indica como se van a separar los valores introducidos
##input <- c(15,24,30,23,20,14,10,19,26,25) ##creamos un vector de datos directamente desde el script

media <- mean(input)
print(media)