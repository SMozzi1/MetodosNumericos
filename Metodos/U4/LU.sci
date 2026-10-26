

function [U,L,P] = gausselimPiv(A)
// Esta función descompone la matriz A en LU y da la matriz P tal que PA = LU
// La función implementa el método de Eliminación Gaussiana con pivoteo.  

[nA,mA] = size(A) 

if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
end
n = nA;
U = A
L = zeros(n,n);
P = zeros(n,n);
for i=1:n
    L(i,i) = 1;
    P(i,i) = 1;
end

// Eliminación progresiva

// El chsite del pivote parcial es buscar el mayor de los elementos
// En la columna del pivote y hacer gauss con ese elemento pues
// La division con un numero cercano a cero es computacionalmente problematica

for k=1:n-1
    pivot = abs(U(k,k));
    filaPiv = k;
    //Busqueda del mayor pivot
    [temp,i] = max(abs(U(k+1:n,k)));
    if temp > pivot then
       pivot = U(i,k);
       filaPiv = i + k - 1;
    end
    if (k <> filaPiv) then
        // U
        temp = U(k,k:n);
        U(k,k:n) = U(filaPiv,k:n);
        U(filaPiv,k:n) = temp;
        // L
        temp = L(k,1:k-1);
        L(k, 1:k-1) = L(filaPiv, 1:k-1);
        L(filaPiv, 1:k-1) = temp;
        // P
        temp = P(k,:);
        P(k, :) = P(filaPiv, :);
        P(filaPiv, :) = temp;  
    end
    L(k+1:n, k) = U(k+1:n, k) / U(k,k);
    U(k+1:n, k:n) = U(k+1:n, k:n) - L(k+1:n, k) * U(k, k:n);
    end
endfunction

A=[2 1 1 0; 4 3 3 1; 8 7 9 5; 6 7 9 8];
[U, L, P] = gausselimPiv(A);
disp(A);
disp(U);
disp(L);
disp(P);
disp(P*A);
disp(L*U);
