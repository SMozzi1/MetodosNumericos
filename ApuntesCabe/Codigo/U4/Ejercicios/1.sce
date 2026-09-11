// Ejercicio 1: Funcion que resuelve un sistema triangular superior e inferior.

// A es la matriz de coeficientes del sistema y b es el lado derecho del
// sistema. El retorno es la solucion del sistema.
function x = sustitucion_regresiva_superior(A, b)
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


function x = sustitucion_regresiva_inferior(A, b)
    x = sustitucion_regresiva_superior(A', b);
endfunction
