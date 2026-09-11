// Ejercicio 3

// Eliminacion de Gauss con pivoteo parcial------------------------------------

function [x,a] = gausselimPP(A,b)
    [nA,mA] = size(A) 
    [nb,mb] = size(b)
    
    if nA<>mA then
        error('gausselim - La matriz A debe ser cuadrada');
        abort;
    elseif mA<>nb then
        error('gausselim - dimensiones incompatibles entre A y b');
        abort;
    end;
    
    a = [A b]; // Matriz aumentada
    n = nA;    // Tamaño de la matriz
    
    // Eliminación progresiva con pivoteo parcial
    for k=1:n-1 // Ecuacion k
        kpivot = k;
        amax = abs(a(k,k));  //pivoteo
        for i=k+1:n // Busco el maximo
            if abs(a(i,k))>amax then
                kpivot = i;
                amax = a(i,k);
            end;
        end;

        temp = a(kpivot,:); // Guardo la fila del pivote
        a(kpivot,:) = a(k,:); // En la fila del pivote pongo la fila k actual
        a(k,:) = temp; // En la fila actual pongo el pivote.
        
        for i=k+1:n // Fila i
            for j=k+1:n+1 // Columna j
                a(i,j) = a(i,j) - a(k,j)*a(i,k)/a(k,k);
            end;
            for j=1:k // Voy haciendo 0 los elementos a izq del pivote
                a(i,j) = 0;  // no hace falta para calcular la solución x
            end
        end;
    end;
    
    // Sustitución regresiva
    x(n) = a(n,n+1)/a(n,n);
    for i = n-1:-1:1
        sumk = 0
        for k=i+1:n
            sumk = sumk + a(i,k)*x(k);
        end;
        x(i) = (a(i,n+1)-sumk)/a(i,i);
    end;
endfunction

// Gauss-Seidel----------------------------------------------------------------

function x = gauss_seidel(A, b, x0, eps)

    [filasA, colsA] = size(A);
    [filasB, colsB] = size(b);
    [filasX0, colsX0] = size(x0);

    if filasA <> colsA then // Chequeos de tamaño.
        error("gauss_seidel: La matriz A debe ser cuadrada.");
        abort;
    end
    if (filasB <> colsA) | (colsB <> 1) then
        error("gauss_seidel: Tamaño de vector b incorrecto.");
        abort;
    end
    if (filasX0 <> colsA) | (colsX0 <> 1) then
        error("gauss_seidel: Tamaño de vector x0 incorrecto.");
        abort;
    end

    n = filasA; // Inicializacion.
    x = x0;
    xk = x0;
    cont = 0;

    for i = 1:n // Calculo la primer iteracion.
        suma = 0;
        for j = 1:n
            if i<>j then
                suma = suma + A(i,j) * x(j);
            end
        end
        x(i) = (1/A(i,i))*(b(i)-suma)
    end
    cont = 1;

    while abs(norm(x-xk)) > eps // Limite de iteraciones.
        xk = x;
        for i = 1:n
            suma = 0;
            for j = 1:n
                if i<>j then
                    suma = suma + A(i,j) * x(j);
                end
            end
            x(i) = (1/A(i,i))*(b(i)-suma);
        end
        cont = cont + 1;
    end
endfunction

//-----------------------------------------------------------------------------

N = 100;
A = 8 * eye(N,N)+ 2 * diag(ones(N-1, 1), 1) + 2 * diag(ones(N-1, 1), -1) + diag(ones(N-3, 1), 3) + 2 * diag(ones(N-3, 1), -3);
b = ones(N,1);

x0 = zeros(N,1);
eps1 = 10**(-6);
eps2 = 10**(-11);

printf("N = 100\n");

printf("Tiempo: eliminacion de Gauss\n");
tic();
gausselimPP(A,b);
t = toc();
disp(t);

printf("Tiempo: Gauss-Seidel con eps = 10^-6\n");
tic();
gauss_seidel(A,b,x0, eps1);
t = toc();
disp(t);

printf("Tiempo: Gauss-Seidel con eps = 10^-11\n");
tic();
gauss_seidel(A,b,x0, eps2);
t = toc();
disp(t);

//-----------------------------------------------------------------------------

N = 500;
A = 8 * eye(N,N)+ 2 * diag(ones(N-1, 1), 1) + 2 * diag(ones(N-1, 1), -1) + diag(ones(N-3, 1), 3) + 2 * diag(ones(N-3, 1), -3);
b = ones(N,1);

x0 = zeros(N,1);
eps1 = 10**(-6);
eps2 = 10**(-11);

printf("N = 500\n");

printf("Tiempo: eliminacion de Gauss\n");
tic();
gausselimPP(A,b);
t = toc();
disp(t);

printf("Tiempo: Gauss-Seidel con eps = 10^-6\n");
tic();
gauss_seidel(A,b,x0, eps1);
t = toc();
disp(t);

printf("Tiempo: Gauss-Seidel con eps = 10^-11\n");
tic();
gauss_seidel(A,b,x0, eps2);
t = toc();
disp(t);
