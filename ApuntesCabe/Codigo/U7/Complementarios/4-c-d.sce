// Ejercicio 4 c y d
 
/*
    En ambos metodos Scilab dio un warning diciendo que la matriz a invertir
estaba cerca de ser singular, por ende, de no tener inversa, esto se debe
a que la matriz A es la matriz de Vandermonde que sabemos esta mal condicionada.
Entonces a la hora de invertir tanto A en 4a y R en 4b Scilab nos da el warning.

    Para aproximar los datos el polinomio que mas se aproxima es el P9 del
metodo sin la factorizacion QR, esto se debe a que desde el vamos, mientras 
mas grande sea el grado del polinomio mas se acercara a los puntos.
La eleccion de usarlo sin la factorizacion QR viene a que cuando se calcula
la inversa A * A' en Scilab no hay tantos errores debido al metodo que emplea
este para calcular la inversa. Por otro lado cuando calculamos la factorizacion
QR de A tambien tenemos errores numericos, mas los que se le suma al calcular
la inversa de R.
*/
