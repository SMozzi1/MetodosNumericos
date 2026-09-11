// Definimos las funciones del metodo de minimos cuadrados para los polinomios.
function y = phi1(x), y = 1; endfunction
function y = phi2(x), y = x; endfunction
function y = phi3(x), y = x^2; endfunction
function y = phi4(x), y = x^3; endfunction

// Creamos la lista de funciones para cada polinomio
funcGrado1 = list(phi1, phi2);
funcGrado2 = list(phi1, phi2, phi3);
funcGrado3 = list(phi1, phi2, phi3, phi4);

// Tabla de datos de experimentales.
x = [0, 0.15, 0.31, 0.5, 0.6, 0.75];
y = [1, 1.004, 1.31, 1.117, 1.223, 1.422];

// Polinomios.
[coefGrado1, err1] = min_cuadrados(x, y, funcGrado1);
[coefGrado2, err2] = min_cuadrados(x, y, funcGrado2);
[coefGrado3, err3] = min_cuadrados(x, y, funcGrado3);

polGrado1 = poly(coefGrado1, "x", "coeff");
polGrado2 = poly(coefGrado2, "x", "coeff");
polGrado3 = poly(coefGrado3, "x", "coeff");

disp("Polinomio de grado 1 y su error:");
disp(polGrado1);
disp(err1);

disp("Polinomio de grado 2 y su error:");
disp(polGrado2);
disp(err2);

disp("Polinomio de grado 3 y su error:");
disp(polGrado3);
disp(err3);
