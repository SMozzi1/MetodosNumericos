// Ejercicio 10

function y = sistema(x)
    y(1, 1) = x(1)**2 + x(1)*(x(2)**3)-9;
    y(2, 1) = 3*(x(1)**2)*x(2)-4-(x(2)**3);
endfunction

eps = 1e-5
maxIter = 50;
x0 = [1.2; 2.5];
x1 = [-2; 2.5];
x2 = [-1.2; -2.5];
x3 = [2; -2.5];

sol0 = newton_multivariable(sistema, x0, eps, maxIter);
sol1 = newton_multivariable(sistema, x1, eps, maxIter);
sol2 = newton_multivariable(sistema, x2, eps, maxIter);
sol3 = newton_multivariable(sistema, x3, eps, maxIter);

printf("Soluciones con vector inicio a\n")
disp(sol0);

printf("Soluciones con vector inicio b\n")
disp(sol1);

printf("Soluciones con vector inicio c\n")
disp(sol2);

printf("Soluciones con vector inicio d\n")
disp(sol3);
