// Esta función obtiene la solución del sistema de ecuaciones 
// lineales A*x=b, dada la matriz de coeficientes A y el vector b.
// La función implementa el método de Eliminación Gaussiana con 
// pivoteo parcial.

function [x,a] = gausselimPP(A,b)
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
    n = nA;    // Tamaño de la matriz
    
    // Eliminación progresiva con pivoteo parcial
    for k=1:n-1 // Ecuacion k
        kpivot = k;
        amax = abs(a(k,k));  //pivoteo
        for i=k+1:n // Busco el maximo
            if abs(a(i,k))>amax then
                kpivot = i;
                amax = a(i,k);
            end;
        end;

        temp = a(kpivot,:); // Guardo la fila del pivote
        a(kpivot,:) = a(k,:); // En la fila del pivote pongo la fila k actual
        a(k,:) = temp; // En la fila actual pongo el pivote.
        
        for i=k+1:n // Fila i
            for j=k+1:n+1 // Columna j
                a(i,j) = a(i,j) - a(k,j)*a(i,k)/a(k,k);
            end;
            for j=1:k // Voy haciendo 0 los elementos a izq del pivote
                a(i,j) = 0;  // no hace falta para calcular la solución x
            end
        end;
    end;
    
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

// Ejemplo de aplicación
A1 = [0 2 3; 2 0 3; 8 16 -1]
b1 = [7 13 -3]'
[x1,a1] = gausselimPP(A1, b1)
disp(x1)
disp(a1)

A2 = [1 -1 2 -1; 2 -2 3 -3; 1 1 1 0; 1 -1 4 3]
b2 = [-8 -20 -2 4]'
[x2,a2] = gausselimPP(A2,b2)
disp(x2)
disp(a2)
