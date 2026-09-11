// Ejercicio 9

function y=f(x)
    y = 1 ./ (1 + x^2); 
endfunction

clf();
rango = -5:0.01:5;
y_real = f(rango);

// n = 2
n = 2;
x = linspace(-5,5, n + 1);
P2 = interpolacion_lagrange(x, f(x));
val2 = horner(P2, rango);
plot2d(rango, y_real - val2, style=2); // f(x) - Pn(x)

// n = 4
n = 4;
x = linspace(-5,5, n + 1);
P4 = interpolacion_lagrange(x, f(x));
val4 = horner(P4, rango);
plot2d(rango, y_real - val4, style=3);

// n = 6
n = 6;
x = linspace(-5,5, n + 1);
P6 = interpolacion_lagrange(x, f(x));
val6 = horner(P6, rango);
plot2d(rango, y_real - val6, style=5);

// n = 10
n = 10;
x = linspace(-5,5, n + 1);
P10 = interpolacion_lagrange(x, f(x));
val10 = horner(P10, rango);
plot2d(rango, y_real - val10, style=6);

// n = 14
n = 14;
x = linspace(-5,5, n + 1);
P14 = interpolacion_lagrange(x, f(x));
val14 = horner(P14, rango);
plot2d(rango, y_real - val14, style=13);

xgrid(1);
xtitle("Error de Interpolación (f(x) - Pn(x))", "x", "Error"); 
legend(["n=2", "n=4", "n=6", "n=10", "n=14"], pos="in_lower_right");
