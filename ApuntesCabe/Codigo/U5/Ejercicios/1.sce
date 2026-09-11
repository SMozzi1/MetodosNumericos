// Ejercicio 1

// a---------------------------------------------------------------------------

printf("Veamos si los se puede asegurar la convergencia de estos sistemas\n");
printf("El primer valor es norm(I - inv(N)A) y el segundo rho(I - inv(N)A)\n");

// Sea el sistema Ax=b con 
A = [0, 2, 4; 1, -1, -1; 1, -1, 2];
b = [0; 0.375; 0];
// Queremos ver si con el metodo de Jacobi se puede asegurar la convergencia.
// La matriz N de la formula de iteracion de Jacobi es N = diag(A), sin
// embargo, esta matriz no es invertible, hagamos un cambio de filas
// para conseguir N invertible y veamos si Jacobi converge.

A([1,3], :) = A([3,1], :);
A([1,2], :) = A([2,1], :);
N = diag(diag(A));

// Para ver si converge veamos primero si norm(I - inv(N)A) < 1
I = eye(3,3) // Identidad
jacobi = I - inv(N)*A;
suf = norm(jacobi);
printf("Jacobi sistema 1:\n");
disp(suf);

// Como norm(I - inv(N)A) > 1 no podemos concluir nada, usemos la
// caracterizacion de convergencia calculando el radio espectral.

rho = max(abs(spec(jacobi)));
disp(rho)

// Como P(I- inv(N)*A) < 1, entonces el metodo de Jacobi converge a la 
// solucion del sistema para todo vector inicial.

//----------------------------

// Sea el sistema Ax=b con 
A = [1, -1, 0; -1, 2, -1; 0, -1, 1.1];
b = [0; 1; 0];
// Queremos ver si con el metodo de Jacobi se puede asegurar la convergencia.
// La matriz N de la formula de iteracion de Jacobi es N = diag(A).

N = diag(diag(A));

// Para ver si converge veamos primero si norm(I - inv(N)A) < 1
I = eye(3,3)
jacobi = I - inv(N)*A;
suf = norm(jacobi);
printf("Jacobi sistema 2:\n");
disp(suf);

// Como norm(I - inv(N)A) > 1 no podemos concluir nada, usemos la
// caracterizacion de convergencia calculando el radio espectral.

rho = max(abs(spec(jacobi)));
disp(rho)

// Como P(I- inv(N)*A) < 1, entonces el metodo de Jacobi converge a la 
// solucion del sistema para todo vector inicial.

// b---------------------------------------------------------------------------

// Sea el sistema Ax=b con 
A = [0, 2, 4; 1, -1, -1; 1, -1, 2];
b = [0; 0.375; 0];
// Queremos ver si con el metodo de Gauss-Seidel se puede asegurar la 
// convergencia. La matriz N de la formula de iteracion del metodo es
// N = diag(A) + L, con L la matriz triangular inferior estricta de A, sin
// embargo, esta matriz no es invertible, hagamos un cambio de filas
// para conseguir N invertible.

A([1,3], :) = A([3,1], :);
A([1,2], :) = A([2,1], :);
D = diag(diag(A));
L = tril(A, -1);
N = L + D;

// Para ver si converge veamos primero si norm(I - inv(N)A) < 1
I = eye(3,3) // Identidad
gauss = I - inv(N)*A;
suf = norm(gauss);
printf("Gauss-Seidel sistema 1:\n");
disp(suf);

// Como norm(I - inv(N)A) > 1 no podemos concluir nada, usemos la
// caracterizacion de convergencia calculando el radio espectral.

rho = max(abs(spec(gauss)));
disp(rho)

// Como P(I- inv(N)*A) < 1, entonces el metodo de Gauss-Seidel converge a la 
// solucion del sistema para todo vector inicial.

//----------------------------

// Sea el sistema Ax=b con 
A = [1, -1, 0; -1, 2, -1; 0, -1, 1.1];
b = [0; 1; 0];
// Queremos ver si con Gauss-Seidel se puede asegurar la convergencia.

D = diag(diag(A));
L = tril(A, -1);
N = L + D;

// Para ver si converge veamos primero si norm(I - inv(N)A) < 1
I = eye(3,3)
gauss = I - inv(N)*A;
suf = norm(gauss);
printf("Gauss-Seidel sistema 2:\n");
disp(suf);

// Como norm(I - inv(N)A) > 1 no podemos concluir nada, usemos la
// caracterizacion de convergencia calculando el radio espectral.

rho = max(abs(spec(gauss)));
disp(rho)

// Como P(I- inv(N)*A) < 1, entonces el metodo de Gauss-Seidel converge a la 
// solucion del sistema para todo vector inicial.

// c---------------------------------------------------------------------------

// Encontremos las soluciones para estos sistemas.

x0 = [0 0 0]';
limite = 10**(-2);

// Sistema 1------

A = [0, 2, 4; 1, -1, -1; 1, -1, 2];
b = [0; 0.375; 0];
// Hacemos los cambios de fila que aseguran la convergencia.
A([1,3], :) = A([3,1], :);
A([1,2], :) = A([2,1], :);

b([1,3], :) = b([3,1], :);
b([1,2], :) = b([2,1], :);

solJacobi1 = metodo_jacobi(A, b, x0, limite);
solGauss1 = gauss_seidel(A, b, x0, limite);
printf("Soluciones sistema 1 con Jacobi y Gauss-Seidel:\n");
disp(solJacobi1);
disp(solGauss1);

// Sistema 2------

C = [1 -1 0; -1 2 -1; 0 -1 1.1];
d = [0 1 0]';

solJacobi2 = metodo_jacobi(C, d, x0, limite);
solGauss2 = gauss_seidel(C, d, x0, limite);
printf("Solucion sistema 2 con Jacobi y Gauss-Seidel:\n");
disp(solJacobi2);
disp(solGauss2);
