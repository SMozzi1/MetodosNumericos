// Ejercicio 11

clf;

function y = g(t)
    y = cos(t);
endfunction

x = raices_chebyshev_ab(4, 0, %pi / 2)';
y = g(x);

disp("Raices del polinomio de Chevyshev a usar como nodos de interpolacion:");
disp(x);

polCub = interpolacion_lagrange(x,y);

disp("Polinomio de interpolacion buscado:");
disp(polCub);

rango = 0:0.01:%pi / 2;
polVal = horner(polCub, rango);
plot2d(rango, g(rango), style=5);
plot2d(rango, polVal, style=2);
xgrid(1);
xtitle("Aproximacion de g", "Eje X", "Eje Y");
legend("g(x)", "Polinomio interpolador")
