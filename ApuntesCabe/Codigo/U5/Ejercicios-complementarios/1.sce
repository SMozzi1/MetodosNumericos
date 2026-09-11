// Ejercicio 1

// Dada la inversa de la matriz N, el vector de TI b, la matriz de iteracion
// de Gauss-Seidel, y el vector iteracion actual, la funcion devuelve
// el vector de la siguiente iteracion.
// Consideramos tomar todos esos parametros para no calcularlos en cada
// iteracion.
function xk1 = iteracion_gauss_seidel(invN, b, T, xk)
    xk1 = invN*b + T*xk;
endfunction

// Dado el numero n, el vector inicial x0, y un epsilon para terminar las 
// iteraciones, la funcion devuelve la solucion del sistema usando
// Gauss-Seidel, devuelve la matriz de iteracion del metodo, el radio
// espectral de la misma y la cantidad de iteraciones realizadas.
function [x, T, rho, i] = solve(n, x0, eps, elemDiag)
    // Definicion de A y b.
    diagSupInf = -1 * ones(1, n-1);
    diagonal = elemDiag * ones(1,n);
    A = diag(diagonal) + diag(diagSupInf, -1) + diag(diagSupInf, 1);
    A(n,1) = 1;
    A(1,n) = 1;
    b = zeros(n,1);
    b(n,1) = 1;
    
    // Calculo de N = L + D y su inversa
    N = diag(diagonal) + diag(diagSupInf, -1);
    N(n,1) = 1;
    invN = inv(N);
    // Matriz de iteracion
    T = eye(n,n) - invN * A;
    // Radio espectral de T
    rho = max(abs(spec(T)));

    // Resolucion del sistema
    i = 0; // Contador iteraciones
    x = iteracion_gauss_seidel(invN, b, T, x0); // Primera iteracion
    i = i + 1;
    while(norm(x - x0) > eps)
        x0 = x;
        x = iteracion_gauss_seidel(invN, b, T, x0);
        i = i + 1;
    end
endfunction

[x, T, rho, i] = solve(20, zeros(20,1), 10e-8, 2);
printf("Solucion del sistema con n = 20 y elemento diagonal 2\n");
disp(x);
printf("Cantidad de iteraciones\n");
disp(i);
printf("Matriz de iteracion con n = 20\n");
disp(T);
printf("Radio espectral de la matriz\n");
disp(rho);

[x, T, rho, i] = solve(20, zeros(20,1), 10e-8, 4);
printf("Solucion del sistema con n = 20 y elemento diagonal 4\n");
disp(x);
printf("Cantidad de iteraciones\n");
disp(i);
printf("Matriz de iteracion con n = 20\n");
disp(T);
printf("Radio espectral de la matriz\n");
disp(rho);
