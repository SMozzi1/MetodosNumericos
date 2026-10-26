

function [U,L,P, x] = gausselimPiv(A, b)
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
x = zeros(n);
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

// resolucion Ax = b => PAx = Pb => LUx = Pb
// por lo tanto definiendo Ux = y tengo que resolver
// L * y = P*b por un lado y luego (considerando que esto me da el vector solucion y).
// U * x = y de donde obtengo el valor de x
// Conceptualmente lo que yo entiendo es que al resolver primero el 
// sistema Ly = Pb estoy encontrando los valores de y para los cuales
// esa ecuacion es verdadera. Pero ademas sabemos que Ux = y por la 
// definicion que dimos antes. por lo tanto al dar los valores encontrad
// os de y como la solucion estoy hallando los valores de x para los cua
// les todo el sistema tiene sentido.

// de este modo al resolver Ux = y como y es el vector de soluciones 
// cuyos valores vuelven verdadero Ly = Pb estoy resolviendo
// el sistema entero en partes


function [y] = sustProg(A, b)
    // sustitucion progresiva (Ly = Pb)
    [fa,ca] = size(A);
    n = fa;
    y = zeros(n);
    b_ord = P * b;
    y(1) = b_ord(1); // Notamos que todo L(k,k) = 1.
    for k=2 : n
        sumk = 0;
        for i = 1 : k-1 
            sumk = sumk + L(k,i) * y(i);
        end
        y(k) = b_ord(k) - sumk;
    end
endfunction

function [x] = sustReg(A, y)
    // sustitucion regresiva (Ux = y)
    [fa,ca] = size(A);
    n = fa;
    x = zeros(n)
    x(n) = y(n) / U(n,n);
    for k = n-1 : -1: 1
        sumk = 0;
        for i = k+1 : n
            sumk = sumk + U(k,i) * x(i);
        end;
        x(k) = (y(k) - sumk) / U(k,k);
    end
endfunction

A=[1 2 -2 1; 4 5 -7 6; 5 25 -15 -3; 6 -12 -6 22];
b = [1 2 0 1]'
[U, L, P] = gausselimPiv(A);
disp(A);
disp(U);
disp(L);
disp(P);
disp(P*A);
disp(L*U);
bt = [1 2 0 1]';
bt_ord = P * bt;
y = sustProg(L, bt);
x = sustReg (U, y);

disp (x);
