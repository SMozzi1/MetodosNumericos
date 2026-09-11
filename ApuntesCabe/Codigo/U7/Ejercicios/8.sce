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
x=[4,4.2,4.5,4.7,5.1,5.5,5.9,6.3,6.8,7.1]
y=[102.56,113.18,130.11,142.05,167.53,195.14,224.87,256.73,299.5,326.72]

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

// Grafica
clf(); // Limpiamos la ventana gráfica anterior

// 1. Graficar los Puntos Experimentales (Rojos y con círculos)
// style = -1 pone marcadores (puntos) en vez de líneas
plot2d(x, y, style=-1, rect=[3.5, 50, 7.5, 350]); 

// 2. Definir el rango suave para las curvas
// Usamos un paso pequeño (0.01) para que se vean curvas y no rectas quebradas
rango = 3.5:0.01:7.5; 

// Evaluamos los polinomios en ese rango
y_g1 = horner(polGrado1, rango);
y_g2 = horner(polGrado2, rango);
y_g3 = horner(polGrado3, rango);

// 3. Graficar las curvas de aproximación
// style = 2 (Azul), style = 3 (Verde), style = 5 (Rojo/Otro)
plot2d(rango, y_g1, style=2); 
plot2d(rango, y_g2, style=3);
plot2d(rango, y_g3, style=5);

// 4. Agregamos "cosmética"
xgrid(1); // Rejilla gris
xtitle("Ajuste por Mínimos Cuadrados", "Eje X", "Eje Y"); // Títulos

// Leyenda: Importante para saber cuál es cuál
// El orden de los strings debe coincidir con el orden de graficado
// 1er plot (puntos), 2do (grado 1), 3ro (grado 2), 4to (grado 3)
legend(["Datos", "Grado 1", "Grado 2", "Grado 3"], pos="in_upper_left");
