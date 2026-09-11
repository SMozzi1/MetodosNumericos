// 2021

// Definimos las funciones del metodo de minimos cuadrados para los polinomios.
function y = phi1(x), y = 1; endfunction
function y = phi2(x), y = x; endfunction
function y = phi3(x), y = x^2; endfunction
function y = phi4(x), y = x^3; endfunction

// Creamos la lista de funciones para cada polinomio
funcGrado1 = list(phi1, phi2);
funcGrado2 = list(phi1, phi2, phi3);
funcGrado3 = list(phi1, phi2, phi3, phi4);

// Variable independiente (Meses 1 a 12)
x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

// Precios del año 2021
y2021 = [145.61, 151.12, 157.27, 164.72, 172.29, 182.91, 185.12, 188.62, 190.09, 197.99, 204.32, 207.97];

// Precios del año 2022
y2022 = [209.92, 225.82, 265.71, 295.24, 301.62, 311.80, 327.39, 343.10, 366.54, 385.20, 407.77, 428.42];

// Polinomios
[coefGrado1, err1] = min_cuadrados(x, y2021, funcGrado1);
[coefGrado2, err2] = min_cuadrados(x, y2021, funcGrado2);
[coefGrado3, err3] = min_cuadrados(x, y2021, funcGrado3);

polGrado1 = poly(coefGrado1, "x", "coeff");
polGrado2 = poly(coefGrado2, "x", "coeff");
polGrado3 = poly(coefGrado3, "x", "coeff");

printf("Errores con el polinomio lineal, cuadratico y cubico:");
disp(err1);
disp(err2);
disp(err3);

// Grafica

rango = 1:0.01:12; 

y_g1 = horner(polGrado1, rango);
y_g2 = horner(polGrado2, rango);
y_g3 = horner(polGrado3, rango);

clf;
plot2d(x, y2021, style=-1); 
plot2d(rango, y_g1, style=2); 
plot2d(rango, y_g2, style=3);
plot2d(rango, y_g3, style=5);

xgrid(1);
xtitle("Mínimos Cuadrados 2021", "Eje X", "Eje Y");
legend(["Datos", "Grado 1", "Grado 2", "Grado 3"], pos="in_upper_left");

// Como el error 3 es menor, la aproximacion que mas se ajusta es la cubica.
