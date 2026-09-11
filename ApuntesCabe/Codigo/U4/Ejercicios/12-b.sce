// Ejercicio 12 b

function x = sustitucion_regresiva_superior(A, b)
    [filA, colA] = size(A);
    [filb, colb] = size(b);
    if (filA <> colA) then
        error("sustitucion_regresiva_superior: Matriz no cuadrada");
        abort;
    end
    if (filA <> filb) | (colb <> 1) then
        error("sustitucion_regresiva_superior: Tamanio incorrecto de b");
        abort;
    end

    n = filA;
    for i = n : -1 : 1
        suma = 0;
        if i <> n then
            for j = i+1:n
                suma = suma + A(i,j) * x(j);
            end
        end
        x(i) = (1/A(i,i))*(b(i) - suma);
    end
endfunction

function x = resuelve_sistemas_QR(A, b)
    [filA, colA] = size(A);
    [filb, colb] = size(b);
    if (filA <> filb) | (colb <> 1) then
        error("resuelve_sistemas_QR: Tamanio incorrecto de b");
        abort;
    end

    [Q, R] = factorizacion_QR(A);
    x = sustitucion_regresiva_superior(R, Q' * b);
endfunction

function solve()
    A = [16 -12 8; -12 18 -6; 8 -6 8];
    b = [76; -66; 46];
    disp(resuelve_sistemas_QR(A,b));
endfunction

solve()
