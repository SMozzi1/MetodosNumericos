// Consideremos el sistema de ecuaciones lineales Ax = b
A = [2, -1, 0; -2, -5, -1; -1, 0, 3];
b = [1; -6; 2];

// Resolvamos este sistema por el metodo de Jacobi y Gauss-Seidel, con:
x0 = [0;0;0];
eps = 10**(-6);
xJac = metodo_jacobi(A, b, x0, eps);
xGau = gauss_seidel(A, b, x0, eps);

printf("Solucion con Jacobi\n");
disp(xJac);
printf("Solucion con Gauss-Seidel\n");
disp(xGau);

// Para ver si podemos asegurar la convergencia calculemos
// el radio espectral de las matrices de los metodos.
// Matriz de Jacobi
I = eye(3,3);
D = diag(diag(A));
MJ = I - inv(D)*A;
radEspJ = max(abs(spec(MJ)));

// Matriz de Gauss-Seidel
L = tril(A, -1);
N = L + D;
MGS = I - inv(N)*A;
radEspGS = max(abs(spec(MGS)));

printf("Radio espectral de las matrices de Jacobi y Gauss-Seidel\n");
disp(radEspJ);
disp(radEspGS);

// Como ambos radios espectrales son menores a 1, entonces para todo
// valor incial los metodos convergen a la solucion.

/* Resultados
Solucion con Jacobi

   0.8378382
   0.6756759
   0.9459459
Solucion con Gauss-Seidel

   0.8378379
   0.6756757
   0.945946
Radio espectral de las matrices de Jacobi y Gauss-Seidel

   0.4716495

   0.1825742
*/
