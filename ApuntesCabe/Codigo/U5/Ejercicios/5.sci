// Ejercicio 5

function w = omega_optimo(A)
    [filA, colA] = size(A);
    if filA <> colA then
        error("omega_optimo: Matriz no cuadrada.");
        abort;
    end
    n = filA;
    Tj = eye(n,n) - diag((1./diag(A)))* A; // Matriz de iteracion de Jacobi.
    radioEspectralTj = max(abs(spec(Tj)));
    w = 2 / (1+ sqrt(1 - ((radioEspectralTj)**2)));
endfunction

A = [4 3 0; 3 4 -1; 0 -1 4];
b = [24 30 -24]';
eps = 10**(-7);
x0 = [0 0 0]'
w = omega_optimo(A);

solGauss = gauss_seidel(A,b,x0,eps);
disp(solGauss);
solRel = metodo_relajacion(A,b,w ,x0,eps);
disp(solRel);
