// Ejercicio 10

x = raices_chebyshev(4)';
y = exp(x);

disp("Raices del polinomio de Chevyshev a usar como nodos de interpolacion:");
disp(x);

p3 = interpolacion_lagrange(x,y);

disp("Polinomio de interpolacion usando las raices del polinomio de Chevyshev:");
disp(p3);

rango = -1:0.01:1;
polVal = horner(p3, rango);
plot2d(rango, exp(rango) - polVal, style=5);
xgrid(1);
xtitle("Error e^x - P3(x)", "Eje X", "Eje Y");
