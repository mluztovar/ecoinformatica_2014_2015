print(paste("Introduzca el valor umbral: "))
umbral <- scan(file="",n=1) ##leemos el umbral de teclado
numerosMayoresUmbral = 0
print(paste("Introduzca 10 numeros por teclado: "))
for(indice in 1:10){
  numero <- scan(file="",n=1) #leemos un numero de teclado
  if(numero > umbral){
    numerosMayoresUmbral <- numerosMayoresUmbral + 1
  }
}
print(paste("El total de valores que han superado el umbral es: ",numerosMayoresUmbral))