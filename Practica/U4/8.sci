


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
    for i=k+1:n
        if (abs(U(i,k)) > pivot) then
            pivot = U(i,k);
            filaPiv = i;
        end
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
    for j=k+1 : n
        L(j,k) = U(j,k) / U(k,k);
        U(j,k:n) = U(j, k:n) - L(j,k) * U(k,k:n);
    end
 end
endfunction

// Este fragmento de codigo se lo pedí al chat porque me voy a morir de angustia si 
// defino a mano dos matrices de numeros decimales

// Definición de la matriz a) del Ejercicio 8
A = [1.012, -2.132, 3.104; -2.132, 4.096, -7.013; 3.104, -7.013, 0.014]; //[cite: 3]

disp("--- Factorización nativa LU para la Matriz A ---");
[L_a, U_a, P_a] = lu(A);
disp("Matriz L nativa:");
disp(L_a);
disp("Matriz U nativa:");
disp(U_a);
disp("Matriz P nativa:");
disp(P_a);

disp("--- Factorización con gausselimPiv para la Matriz A ---");
[U_mi_a, L_mi_a, P_mi_a] = gausselimPiv(A);
disp("Matriz L propia:");
disp(L_mi_a);
disp("Matriz U propia:");
disp(U_mi_a);
disp("Matriz P propia:");
disp(P_mi_a);


// Definición de la matriz b) del Ejercicio 8
B = [2.1756, 4.0231, -2.1732, 5.1967; -4.0231, 6.0000, 0, 1.1973; -1.0000, 5.2107, 1.1111, 0; 6.0235, 7.0000, 0, 4.1561]; //[cite: 3]

disp("--- Factorización nativa LU para la Matriz B ---");
[L_b, U_b, P_b] = lu(B);
disp("Matriz L nativa:");
disp(L_b);
disp("Matriz U nativa:");
disp(U_b);
disp("Matriz P nativa:");
disp(P_b);

disp("--- Factorización con gausselimPiv para la Matriz B ---");
[U_mi_b, L_mi_b, P_mi_b] = gausselimPiv(B);
disp("Matriz L propia:");
disp(L_mi_b);
disp("Matriz U propia:");
disp(U_mi_b);
disp("Matriz P propia:");
disp(P_mi_b);
