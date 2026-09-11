// Ejercicio 5

/*
Conocemos los valores de la x de la tabla, que estos son [0, 1, 2, 3], ademas
conocemos y0 = 1, y1 = 3, y2 = 3. Calculemos y3.
*/

x = [1,2,3]

L1 = Lk(x,1)
L2 = Lk(x,2)
L3 = Lk(x,3)

c1 = horner(L1,2.5)
c2 = horner(L2,2.5)
c3 = horner(L3,2.5)

y3 = (3 - c1*3 - c2*3) / c3

xx = [0,1,2,3]
yy = [1,3,3,y3]

p = interpolacion_lagrange(xx,yy)

res = horner(p, 2.5)

printf("El resultado de P0,1,2,3(2.5)= ")
disp(res);
printf("\n");
