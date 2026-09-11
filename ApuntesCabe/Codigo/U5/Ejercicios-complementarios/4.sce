// Ejercicio 4

function A = matriz_tridiagonal(c)
    diagonal = (1+2*c) * ones(1,5);
    diagSupInf = -c * ones(1,4);
    A = zeros(5,5) + diag(diagonal) + diag(diagSupInf, -1) + diag(diagSupInf, 1) 
endfunction

function [L, U] = factLU(c)
    [P,L,U] = fact_LU_pivoteo(matriz_tridiagonal(1));
endfunction

function solve()
    [L,U] = factLU(1);
    x0 = [10, 12, 12, 12, 10]';
    for i = 1:5
        xiTemp = sustitucion_progresiva_inferior(L, x0);
        xi = sustitucion_regresiva_superior(U,xiTemp);
        printf("El vector de temperatura x%d es:\n", i);
        disp(xi);
        x0 = xi;
    end
endfunction

solve();
