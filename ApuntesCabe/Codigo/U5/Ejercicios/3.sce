// Ejercicio 3

function matGauss = matriz_iteracion(n)
    diagSup = -1 * ones(1, n-1);
    diagonal = 2 * ones(1,n);
    A = diag(diagonal) + diag(diagSup, -1) + diag(diagSup, 1);
    
    // Hagamos ahora la inversa de la matriz N segun lo visto en la hoja
    // correspondiente al ejercicio.
    invN = zeros(n,n);
    for i = 1 : n // Filas
        invN(i,i) = 1/2;
        for j = i - 1: -1 : 1 // Columnas
            invN(i,j) = invN(i,j + 1) * 1/2;
        end
    end
    disp(A);
    disp(invN)
    matGauss = eye(n,n) - invN*A;
endfunction
