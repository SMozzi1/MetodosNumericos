function x = gauss_tridiagonal(A, b)
    [filasA, colsA] = size(A);
    [filasB, colsB] = size(b);
    if filasA <> colsA then
        error("gauss_tridiagonal: La matriz A debe ser cuadrada.");
        abort;
    end
    if filasA <> filasB | colsB <> 1 then
        error("gauss_tridiagonal: Dimension de b incorrecta.");
        abort;
    end
    
    for k = 1: filasA - 1 // Ecuacion k
        pivoteo = 0;
        if abs(A(k,k)) < abs(A(k + 1, k)) then
            tempA = A(k, :); // Hago el pivoteo con la ec. k+1
            A(k, :) = A(k + 1, :);
            A(k + 1, :) = tempA;
            
            tempB = b(k);
            b(k) = b(k + 1);
            b(k + 1) = tempB;
            
            pivoteo = 1;
        end
        mult = A(k + 1, k) / A(k, k);
        A(k + 1, k) = 0;
        A(k + 1, k + 1) = A(k + 1, k + 1) - A(k, k + 1) * mult;
        if pivoteo == 1 then
            if k + 2 <= colsA then
                A(k + 1, k + 2) = - A(k, k + 2) * mult; // Si hay pivoteo hay un 0 en esta posicion
            end
        end
        b(k + 1) = b(k + 1) - b(k) * mult; 
    end
    
    for i = filasA:-1:1
        suma = 0;
        if i <> filasA then
            for j = i+1:filasA
                suma = suma + A(i,j) * x(j);
            end
        end
        x(i) = (1/A(i,i))*(b(i) - suma);
    end
endfunction

A = [1 2 0 0; 3 2 1 0 ; 0 5 6 7; 0 0 8 9];
b = [1 2 3 4]';
disp(gauss_tridiagonal(A,b));

