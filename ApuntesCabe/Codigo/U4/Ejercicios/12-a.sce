// Ejercicio 12

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


function x = sustitucion_progresiva_inferior(A, b)
    [filA, colA] = size(A);
    [filb, colb] = size(b);
    if (filA <> colA) then
        error("sustitucion_regresiva_inferior: Matriz no cuadrada");
        abort;
    end
    if (filA <> filb) | (colb <> 1) then
        error("sustitucion_regresiva_inferior: Tamanio incorrecto de b");
        abort;
    end

    n = filA;
    for i = 1 : n
        suma = 0;
        if i <> 1 then
            for j = 1:i-1
                suma = suma + A(i,j) * x(j);
            end
        end
        x(i) = (1/A(i,i))*(b(i) - suma);
    end
endfunction

function x = resuelve_sistemas_cholesky(A, b)
    [filA, colA] = size(A);
    [filb, colb] = size(b);
    if (filA <> colA) then
        error("resuelve_sistemas_cholesky: Matriz no cuadrada");
        abort;
    end
    if (filA <> filb) | (colb <> 1) then
        error("resuelve_sistemas_cholesky: Tamanio incorrecto de b");
        abort;
    end

    n = filA;
    U = cholesky(A);
    xTemp = sustitucion_progresiva_inferior(U', b);
    x = sustitucion_regresiva_superior(U, xTemp);
endfunction

function solve()
    A = [16 -12 8; -12 18 -6; 8 -6 8];
    b = [76; -66; 46];
    disp(resuelve_sistemas_cholesky(A,b));
endfunction

solve()
