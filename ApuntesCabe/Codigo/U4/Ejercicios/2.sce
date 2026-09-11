// Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
// dada la matriz de coeficientes A y el vector b.
// La función implementa el método de Eliminación Gaussiana sin pivoteo.  

function [x,a] = gausselim(A,b)
[nA,mA] = size(A) 
[nb,mb] = size(b)

if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
elseif mA<>nb then
    error('gausselim - dimensiones incompatibles entre A y b');
    abort;
end;

a = [A b]; // Matriz aumentada

cantSumas = 0;
cantMult = 0;
cantDiv = 0;

// Eliminación progresiva
n = nA;
for k=1:n-1
    for i=k+1:n // i indice filas.
        for j=k+1:n+1 // j indice columnas, incluyendo el vector b.
            a(i,j) = a(i,j) - (a(k,j)*a(i,k)/a(k,k));
            cantSumas = cantSumas + 1;
            cantMult = cantMult + 1;
            cantDiv = cantDiv + 1;
        end
        for j=1:k
            a(i,j) = 0;  // no hace falta para calcular la solución x
        end
    end
end

printf("Cantidad de sumas = %d;\nCantidad de multiplicaciones = %d;\nCantidad de divisones = %d;\n", cantSumas, cantMult, cantDiv);

// Sustitución regresiva
x(n) = a(n,n+1)/a(n,n);
for i = n-1:-1:1
    sumk = 0
    for k=i+1:n
        sumk = sumk + a(i,k)*x(k);
    end;
    x(i) = (a(i,n+1)-sumk)/a(i,i);
end;

endfunction

// Ejercicio 2) d)-------------------------------------------------------------

function [T, g] = my_eliminacion_gauss(A,b)
    [nA,mA] = size(A) 
    [nb,mb] = size(b)

    if nA<>mA then
        error('gausselim - La matriz A debe ser cuadrada');
        abort;
    elseif mA<>nb then
        error('gausselim - dimensiones incompatibles entre A y b');
        abort;
    end;

    n = nA;
    a = [A b]

    for k = 1: n - 1 // Ecuacion k
        for i = k + 1: n // Fila i
            mult = a(i, k) / a(k, k);
            a(i,k) = 0;
            for j = k + 1: n + 1 // Columna j
                a(i,j) = a(i,j) - mult * a(i,j);
            end 
        end
    end

    T = a(1 : n, 1 : n)
    g = a(: , n + 1);
endfunction

function x = sustitucion_regresiva_superior(A, b)
    [n, m] = size(A);
    if n <> m then
        error("La matriz A debe ser cuadrada.");
        abort;
    end
    for i = n:-1:1
        suma = 0;
        if i <> n then
            for j = i+1:n
                suma = suma + A(i,j) * x(j);
            end
        end
        x(i) = (1/A(i,i))*(b(i) - suma);
    end
endfunction

function x = gauss(A, b)
    [T, g] = my_eliminacion_gauss(A, b);
    x = sustitucion_regresiva_superior(T, g);
endfunction

// Ejemplos de aplicación 2) b)------------------------------------------------

A1 = [1 1 0 3; 2 1 -1 1; 3 -1 -1 2; -1 2 3 -1]
b1 = [4 1 -3 4]'
[x1,a1] = gausselim(A1,b1)
myGaussX1 = gauss(A1,b1);
printf("Sistema 1\n");
disp(myGaussX1)
disp(x1)
disp(a1)

A2 = [1 -1 2 -1; 2 -2 3 -3; 1 1 1 0; 1 -1 4 3]
b2 = [-8 -20 -2 4]'
[x2,a2] = gausselim(A2,b2)
myGaussX2 = gauss(A2,b2);
printf("\nSistema 2\n");
disp(myGaussX1)
disp(x2) // Debe dar Nan o Inf por dividir por 0.
disp(a2)

A3 = [1 1 0 4; 2 1 -1 1; 4 -1 -2 2; 3 -1 -1 2]
b3 = [2 1 0 -3]'
[x3,a3] = gausselim(A3,b3)
myGaussX3 = gauss(A3,b3);
printf("\nSistema 3\n");
disp(myGaussX3)
disp(x3)
disp(a3)
