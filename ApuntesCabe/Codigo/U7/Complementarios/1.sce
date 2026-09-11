// Ejercicio 1

// Las funciones phi del metodo de minimos cuadrados seran solo las x
// elevadas a 2, 3 y 4, esto ya que queremos un polinomio de grado 4, pero
// ademas queremos que p4(0) = 0, por ende el coeficiente a0 debe ser 0
// pero como p4'(0) = 0, el coeficiente a1 tambien debe ser 0.

function y = phi1(x), y = x^2; endfunction
function y = phi2(x), y = x^3; endfunction
function y = phi3(x), y = x^4; endfunction

listaFunc = list(phi1, phi2, phi3);

// Datos de la tabla

x = [-2.0, -1.6, -1.2, -0.8, -0.4, 0, 0.4, 0.8, 1.2, 1.6, 2.0];
y = [1.50, 0.99, 0.61, 0.27, 0.02, -0.0096, 0.065, 0.38, 0.63, 0.98, 1.50];

// Coeficientes del polinomio

[a, err] = min_cuadrados(x, y, listaFunc);

coefPol = [0, 0, a(1), a(2), a(3)];

polResultante = poly(coefPol, "x", "coeff");

disp("Polinomio buscado y su error:");
disp(polResultante);
disp(err);

// Graficacion

clf
rango = -2: 0.1: 2
polVal = horner(polResultante, rango);
plot2d(x, y, style=-1);
plot2d(rango, polVal, style=2);
xgrid(1);
