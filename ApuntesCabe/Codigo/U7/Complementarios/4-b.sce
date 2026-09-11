// Ejercicio 4 b

// Minimos cuadrados

function [Q, R] = factorizacion_QR(A)
    [m, n] = size(A);
    Q = zeros(m,n);
    R = eye(n,n);

    for k = 1:n
        suma = 0
        for i = 1: k - 1
            suma = suma + (A(:,k)' * Q(:,i)) * Q(:,i);
        end
        vk = norm(A(:,k) - suma);
        Q(:,k) = (A(:,k) - suma) / vk;
        R(k,k) = vk;
        for j = k + 1 :n
            R(k, j) = A(:,j)' * Q(:, k);
        end
    end
endfunction

function [a, err] = min_cuadrados_QR(x, y, funciones)
    // Entrada: vector x e y de datos experimentales, y una lista con
    // las funciones phi dadas.
    // Salida: coeficientes de a.
    m = length(x);
    p = length(funciones);
    A = zeros(m, p);
    for fi = 1:m
        for col = 1:p
            A(fi, col) = funciones(col)(x(fi));
        end
    end
    b = y';
    [Q, R] = factorizacion_QR(A);
    a = inv(R) * Q' * b;
    errVector = A*a- b;
    err = norm(errVector,2);
endfunction

// Funciones para definir los polinomios

function y = phi1(x); y = 1; endfunction
function y = phi2(x); y = x; endfunction
function y = phi3(x); y = x^2; endfunction
function y = phi4(x); y = x^3; endfunction
function y = phi5(x); y = x^4; endfunction
function y = phi6(x); y = x^5; endfunction
function y = phi7(x); y = x^6; endfunction
function y = phi8(x); y = x^7; endfunction
function y = phi9(x); y = x^8; endfunction
function y = phi10(x); y = x^9; endfunction

funcP3 = list(phi1, phi2, phi3, phi4);
funcP5 = list(phi1, phi2, phi3, phi4, phi5, phi6);
funcP7 = list(phi1, phi2, phi3, phi4, phi5, phi6, phi7, phi8);
funcP9 = list(phi1, phi2, phi3, phi4, phi5, phi6, phi7, phi8, phi9, phi10);

// Tabla de datos

x = 1:10;
y = [32.9, 30.8, 26.4, 24.2, 19.2, 16.5, 19.3, 21, 23, 26.2];

// Coeficientes de los polinomios

coeffP3 = min_cuadrados_QR(x,y,funcP3);
coeffP5 = min_cuadrados_QR(x,y,funcP5);
coeffP7 = min_cuadrados_QR(x,y,funcP7);
coeffP9 = min_cuadrados_QR(x,y,funcP9);

// Polinomios

P3 = poly(coeffP3, "x", "coeff");
P5 = poly(coeffP5, "x", "coeff");
P7 = poly(coeffP7, "x", "coeff");
P9 = poly(coeffP9, "x", "coeff");

// Graficacion

rango = 1:0.1:10
polVal3 = horner(P3, rango);
polVal5 = horner(P5, rango);
polVal7 = horner(P7, rango);
polVal9 = horner(P9, rango);

clf;
plot2d(x,y, style= -1);
plot2d(rango, polVal3, style=2);
plot2d(rango, polVal5, style=3);
plot2d(rango, polVal7, style=5);
plot2d(rango, polVal9, style=6);
xgrid(1);
legend("Datos" ,"P3", "P5", "P7", "P9");
