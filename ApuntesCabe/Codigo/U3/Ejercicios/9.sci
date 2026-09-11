// Ejercicio 9

function z1 = f1(x,y)
    z1 = 1 + (x**2) - (y**2) + exp(x)*cos(y);
endfunction

function z2 = f2(x,y)
    z2 = 2*x*y + exp(x)*sin(y);
endfunction

function z = sistema(v)
    z(1) = f1(v(1), v(2));
    z(2) = f2(v(1), v(2));
endfunction

x0 = [-1; 4];
eps = 1e-5;
maxIter = 50;

sol = newton_multivariable(sistema,x0, eps, maxIter);
disp(sol(1));
disp(sol(2));
