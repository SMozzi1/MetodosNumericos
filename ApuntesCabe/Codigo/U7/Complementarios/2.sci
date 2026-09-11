// Ejercicio 2

// a, b

x = [-1, -1/3, 1/3, 1];
y = exp(x);

polInt = interpolacion_lagrange(x, y);

valPol1 = horner(polInt, -0.9);
valPol2 = horner(polInt, 0.01);
valExac1 = exp(-0.9);
valExac2 = exp(0.01);

printf("Valor p(-0.9) y su valor exacto:");
disp(valPol1);
disp(valExac1);

printf("Valor p(0.01) y su valor exacto:");
disp(valPol2);
disp(valExac2);

// e

xCheb = raices_chebyshev(4)';
yCheb = exp(xCheb);

polIntCheb = interpolacion_lagrange(xCheb, yCheb);

printf("Nodos usando las raices del polinomio de Chebyshev");
disp(xCheb);
printf("Polinomio de interpolacion usando tales nodos");
disp(polIntCheb);

// g

rango = -1:0.01:1;
valReal = exp(rango);
valCheb = horner(polIntCheb, rango);
valEqui = horner(polInt, rango);

clf;
plot2d(rango, abs(valReal - valCheb), style = 3);
plot2d(rango, abs(valReal - valEqui), style = 5);
xgrid(1);
legend("Chebyshev", "Equiespaciados");

// Podemos ver que los errores de los equiespaciados son mayores que los
// de Chebyshev, esto se debe al fenomeno de Runge.
