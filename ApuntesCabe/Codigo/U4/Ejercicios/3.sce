function x = sustitucion_regresiva(A, b)
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

function X = gauss_multiple(A, B)
    [filasA, colsA] = size(A);
    [filasB, colsB] = size(B);
    if (filasA <> colsA) then
        error("gauss_multiple: La matriz A debe ser cuadrada.");
        abort;
    end
    if (filasB <> colsA) then
        error("gauss_multiple: Tamaños de solucion invalidos.");
        abort;
    end

    matAum = [A, B];
    filAum = filasA;
    colAum = colsA + colsB;

    // Gauss
    for k = 1 : filAum - 1 // Ecuacion k
        for i = k + 1 : filAum // Fila i
            mult = matAum(i,k) / matAum(k,k);
            for j = k + 1 : colAum // Columna j
                matAum(i, j) = matAum(i, j) - mult * matAum(k, j) 
            end
        end
    end

    A = matAum(1: filasA, 1: colsA);
    for i = 1 : colsB
        X( : ,i) = sustitucion_regresiva(A, matAum(1: filasA, colsA + i))
    end
endfunction

function aInv = inversa(A)
    n = size(A);
    if (n(1) <> n(2)) then
        error("inversa: La matriz A debe ser cuadrada.");
        abort;
    end
    B = eye(n(1), n(1));
    aInv = gauss_multiple(A, B);
endfunction

A = [1 2 3; 3 -2 1; 4 2 -1]
B = [14 9 -2; 2 -5 2; 5 19 12]
X = gauss_multiple(A,B)
disp(X)

printf("Inversa de A:\n");
aInv = inversa(A);
disp(aInv)
