// Ejercicio 3

function matIt = crea_matriz(n)
    A = zeros(n,n);
    diagSup = -1 * ones(1, n-1);
    diagonal = 2 * ones(1,n);
    A = diag(diagonal) + diag(diagSup, -1) + diag(diagSup, 1);
    disp(A);
    
    L = tril(A, -1);
    D = diag(diag(A));
    N = L + D;
    disp(N)
    
    I = eye(n,n);
    matIt = I - inv(N)*A
endfunction

disp(crea_matriz(5));
