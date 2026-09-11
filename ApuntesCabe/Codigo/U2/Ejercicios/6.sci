// Ejercicio 6 b

func = "exp(x)";
a = 0;
n1 = -2;
n2 = 2;
orden = 10
h = 0.1

val1 = miTaylor(func, a, orden, n1, h);
val2 = miTaylor(func, a, orden, n2, h);
val2 = 1 / val2;
valExact = exp(-2);

disp(val1);
disp(val2);
disp(valExact);
