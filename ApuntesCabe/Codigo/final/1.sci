format(23)

h = 1/3333;
disp(h);
hSum = 0
for i = 1:3333
    hSum = hSum + h; 
end

hMult = h * 3333;

printf("Resultado con suma:\n");
disp(hSum);

printf("Resultado con multiplicacion:\n");
disp(hMult);

// El resultado exacto de ambas operaciones es 1, sin embargo, el valor de la
// suma no es exacto, esto se debe a que el error propagado de la operacion
// suma es el error de cada operando. El numero h no es exacto en la 
// aritmetica de punto flotante, por ende al sumar en cada paso
// tenemos que considerar este error.
// Por otro lado la multiplicacion se calcula de manera exacta ya que
// el error relativo en la multiplicacion es la suma de los errores
// relativos de los numeros con los cuales se opera. Ahora bien 3333 es exacto
// h no pero los errores son menores que en la suma ya que se realiza una 
// sola operacion, por ende los errores de redondeo tienen lugar en una
// sola operacion.

/* Resultados

   0.00030003000300030005
Resultado con suma:

   0.9999999999999342748 
Resultado con multiplicacion:

   1.

*/
