// Ejercicio 1

// Lineal
x1=[0.2,0.4]
y1=[1.2214, 1.4918]
// Cubica
x2=[0,0.2,0.4,0.6]
y2=[1,1.2214,1.4918,1.8221]

// Lagrange--------------------------------------------------------------------

lineal = interpolacion_lagrange(x1,y1)
cubica = interpolacion_lagrange(x2,y2)

printf("Método de Lagrange.\nInterpolacion lineal\n");
disp(horner(lineal, 1/3));
printf("Interpolacion cubica\n");
disp(horner(cubica, 1/3));

/* 
El error en el caso lineal es: 
    err(x) = f(x) - lineal(x) = (x - 0.2) * (x - 0.4) / 2 * exp(cx)
ya que la segunda derivada de exp(x) es exp(x), ademas cx esta entre 0.2 y 0.4.
Como exp(x) crece el valor mas alto que puede tomar es el de 0.4, asi
podemos acotar el error tomando cx = 0.4, luego
    err(x) <= (x - 0.2) * (x - 0.4) / 2 * exp(0.4)
Finalmente en 1/3 una cota del error es:
    err(1/3) <= (1/3 - 0.2) * (1/3 - 0.4) / 2 * exp(0.4)
*/
printf("Cota del error lineal:\n");
disp(abs((1/3 - 0.2) * (1/3 - 0.4) / 2 * exp(0.4)))
printf("Error lineal exacto:\n");
disp(abs(exp(1/3) - horner(lineal, 1/3)));

// Con un razonamiento analogo conseguimos la cota de la interpolacion cubica.

printf("Cota del error cubico:\n");
disp(abs((1/3 - 0) * (1/3 - 0.2) * (1/3 - 0.4) * (1/3 - 0.6)/ 24 * exp(0.6)))
printf("Error cubico exacto:\n");
disp(abs(exp(1/3) - horner(cubica, 1/3)));

// Newton----------------------------------------------------------------------

lineal = dif_div_newton(x1,y1)
cubica = dif_div_newton(x2,y2)

printf("Método de Newton.\nInterpolacion lineal\n");
disp(horner(lineal, 1/3));
printf("Interpolacion cubica\n");
disp(horner(cubica, 1/3));

// Errores

printf("Cota del error lineal:\n");
disp(abs((1/3 - 0.2) * (1/3 - 0.4) / 2 * exp(0.4)))
printf("Error lineal exacto:\n");
disp(abs(exp(1/3) - horner(lineal, 1/3)));

printf("Cota del error cubico:\n");
disp(abs((1/3 - 0) * (1/3 - 0.2) * (1/3 - 0.4) * (1/3 - 0.6)/ 24 * exp(0.6)))
printf("Error cubico exacto:\n");
disp(abs(exp(1/3) - horner(cubica, 1/3)));

