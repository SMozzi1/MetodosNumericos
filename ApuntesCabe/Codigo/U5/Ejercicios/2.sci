// Ejercicio 2

x0 = [0 0 0 0 0]';
limite = 10**(-6);

A = [10 1 2 3 4; 1 9 -1 2 -3; 2 -1 7 3 -5; 3 2 3 12 -1; 4 -3 -5 -1 15];
b = [12 -27 14 -17 12]';
solJacobi = jacobi_metodo(A, b, x0, limite);
solGauss = gauss_seidel(A, b, x0, limite);
printf("Soluciones del sistema con Jacobi y Gauss-Seidel respectivamente:\n");
disp(solJacobi);
disp(solGauss);
