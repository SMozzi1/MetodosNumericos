// Ejercicio 3

function y = f(x)
    y = ((x**2)/4) - sin(x);
endfunction

x0 = 3;
x1 = 1;
eps = 1e-2
maxIter = 100

raiz = secante(f,x0,x1,eps,maxIter);
disp(raiz);
