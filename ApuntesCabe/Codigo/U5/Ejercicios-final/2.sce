// Consideremos el sistema Ax= b con:

A = [10, 5, 0, 0; 5, 10, -4, 0; 0, -4, 8, -1; 0, 0, -1, 5];
b = [6; 25; -11; -11];

// Dado el factor de escala w, la matriz A, la funcion devuelve el radio
// espectral de la matriz del metodo de relajacion
function rho = r_SOR(w, A)
    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);
    tw = inv(D + w*L)*((1-w)*D - w*U);
    rho = max(abs(spec(tw)));
endfunction

// Usando r_SOR determinemos el w para el cual el metodo de relajacion
// converge mas rapidamente que Gauss-Seidel graficamente.

factoresPrueba = [0:0.01:3];
rhoPrueba = [0:0.01:3]; // Inicializamos el vector
k = 1;

for i = 0:0.01:3
    rhoPrueba(k) = r_SOR(i, A);
    k = k + 1;
end

clf();
xgrid(1);
plot2d(factoresPrueba, rhoPrueba)

// Graficamente se puede ver que un intervalo de parametros en el que el metodo
// SOR converge mas rapidamente que Gauss-Seidel (esto es factor 1), 
// es (1, 1.46) aproximadamente.

// Como el sistema tiene matriz de coeficientes tridiagonal y definida positiva
// esto ultimo lo vemos viendo que sus autovalores son estrictamente positivos
// con el comando:
disp(spec(A));
// Por ende existe un parametro optimo para este sistema y es:
// w = 2/(1 + sqrt(1-(rho(Tj))^2)) con Tj = I - inv(D)*A con D = diag(A)

// Resolvamos el sistema con el metodo de Gauss-Seidel con
eps = 10**(-6);
x0 = [0,0,0,0]'
disp("Solucion del sistema con Gauss-Seidel:")
disp(gauss_seidel(A, b, x0, eps));

// Ahora resolvamos el sistema con el w optimo y el metodo SOR:
// Dada una matriz tridiagonal definida positiva la funcion devuelve
// el factor optimo para el metodo SOR
function w = omega_optimo(A)
    [n,m] = size(A);
    Dinv = inv(diag(diag(A)));
    I = eye(n,n)
    Tj = I - Dinv*A;
    rho = max(abs(spec(Tj)))
    w = 2 / (1 + sqrt(1-rho**2))
endfunction

wOpt = omega_optimo(A);

disp("Solucion del sistema con SOR:")
disp(metodo_relajacion(A, b, wOpt, x0, eps));
