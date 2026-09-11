function d = determinante(A)
    [filasA, colsA] = size(A);
    if (filasA <> colsA) then
        error("determinante: La matriz A debe ser cuadrada.");
        abort;
    end

    // Gauss
    for k = 1 : filasA - 1 // Ecuacion k
        for i = k + 1 : filasA // Fila i
            mult = A(i,k) / A(k,k);
            for j = k + 1 : colsA // Columna j
                A(i, j) = A(i, j) - mult * A(k, j) 
            end
        end
    end

    d = 1
    for i = 1 : filasA
        d = d * A(i,i);
    end
endfunction

A = [1 1 0 3; 2 1 -1 1; 3 -1 -1 2; -1 2 3 -1]
disp(determinante(A))
