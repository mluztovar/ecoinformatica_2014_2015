totalNumeros <- 10
sumaTotal <- 0
for(indice in 1:totalNumeros){
  numero <- scan(file="",n = 1)
  sumaTotal <- sumaTotal + numero
}
media <- sumaTotal / totalNumeros
print(paste("La temperatura media es: ",media))