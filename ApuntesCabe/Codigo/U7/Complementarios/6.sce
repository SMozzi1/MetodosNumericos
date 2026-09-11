// Ejercicio 6

function [a, err] = min_cuadrados_mult(x, v, y, funciones)
    // Entrada: vector x, v e y de datos experimentales, y una lista con
    // las funciones phi dadas.
    // Salida: coeficientes de a.
    m = length(x);
    p = length(funciones);
    A = zeros(m, p);
    for fi = 1:m
        for col = 1:p
            A(fi, col) = funciones(col)(x(fi), v(fi));
        end
    end
    b = y';
    matMinCuad = A' * A;
    TIMinCuad = A' * b;
    a = resuelve_sist_elim_gauss_piv(matMinCuad, TIMinCuad);
    errVector = A*a- b;
    err = norm(errVector,2);
endfunction

// Funciones phi

function y = phi1(x, v)
    y = 1;
endfunction

function y = phi2(x ,v)
    y = x;
endfunction

function y = phi3(x ,v)
    y = v;
endfunction

listaFunc = list(phi1, phi2, phi3);

x = [0, 0, 1, 2, 2, 2];
v = [0, 1, 0, 0, 1, 2];
y = [1.42, 1.85, 0.78, 0.18, 0.60, 1.05];

[coef, err] = min_cuadrados_mult(x, v, y, listaFunc);

function y = f(x, v)
    y = coef(1) + coef(2)*x + coef(3)*v;
endfunction

disp(coef);

// Grafica

set(gca(), "auto_clear", "off");
rango = 0:0.1:2
plot3d(rango, f(rango, rango), style = 5);
