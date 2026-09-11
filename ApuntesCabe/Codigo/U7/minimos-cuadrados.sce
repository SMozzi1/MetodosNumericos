// Minimos cuadrados

function [a, err] = min_cuadrados(x, y, funciones)
    // Entrada: vector x e y de datos experimentales, y una lista con
    // las funciones phi dadas.
    // Salida: coeficientes de a.
    m = length(x);
    p = length(funciones);
    A = zeros(m, p);
    for fi = 1:m
        for col = 1:p
            A(fi, col) = funciones(col)(x(fi));
        end
    end
    b = y';
    matMinCuad = A' * A;
    TIMinCuad = A' * b;
    a = resuelve_sist_elim_gauss_piv(matMinCuad, TIMinCuad);
    errVector = A*a- b;
    err = norm(errVector,2);
endfunction
