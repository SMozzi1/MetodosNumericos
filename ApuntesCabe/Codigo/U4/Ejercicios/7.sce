function [P, L, U] = fact_LU_pivoteo(A)
    [filasA, colsA] = size(A);
    if filasA <> colsA then
        error("fact_LU_pivoteo: La matriz A debe ser cuadrada.");
        abort;
    end

    n = filasA;
    U = A;
    L = eye(n, n);
    P = eye(n, n);

    for k = 1 : n - 1
        indicePivote = k;
        pivMax = abs(U(k,k));
        for i = k + 1 : n
            pivAnalizar = abs(U(i,k));
            if pivAnalizar > pivMax then
                pivMax = pivAnalizar;
                indicePivote = i;
            end
        end

        if indicePivote <> k then
            tempU = U(indicePivote,:); // Guardo la fila del pivote
            U(indicePivote,:) = U(k,:); // En la fila del pivote pongo la fila k actual
            U(k,:) = tempU; // En la fila actual pongo el pivote.

            if k > 1 then
                tempL = L(indicePivote,1: k-1); // En la matriz L cambio las
                L(indicePivote,1:k-1) = L(k,1:k-1); // filas debajo de la diagonal.
                L(k,1:k-1) = tempL;
            end
            
            tempP = P(indicePivote,:);
            P(indicePivote,:) = P(k,:);
            P(k,:) = tempP;
        end
        
        for j = k + 1: n
            L(j, k) = U(j, k) / U(k, k);
            U(j + 1, k : n) = U(j, k : n) - L(j, k) * U(k, k : n);
            U(j, k) = 0;
        end
    end
endfunction
