// Sea el sistema Ax=b con

A =  [10, 3, 1; 2, -10, 3; 1 3 10];
b = [14; -5; 14];

// Con el vector inicial nulo, y una tolerancia de error de 1e-5, apliquemos
// Jacobi y Gauss-Seidel a este sistema para obtener la solucion. Sabemos
// que ambos metodos convergen pues A es diagonal dominante.

x0= [0; 0; 0];
eps = 1e-5;

solGS = gauss_seidel(A,b,x0, eps);
solJ = metodo_jacobi(A,b,x0, eps);

printf("Soluciones del sistema con Gauss-Seidel y Jacobi resp.\n");
disp(solGS);
disp(solJ);

// Ahora bien, queremos determinar la tasa de convergencia usando el radio
// espectral, para esto calculamos la matriz de iteracion de los dos metodos.
// Esta matriz en ambos metodos es I - inv(N)*A.
// En el caso de Jacobi es N = diag(A)
I = eye(3,3);
nJac = diag(diag(A));
itJac = I - inv(nJac)*A;
radEspJac = max(abs(spec(itJac)));

// En el caso de Gauss-Seidel es N = diag(A) + L con L matriz con los elementos
// debajo de la diagonal de A.
L = tril(A, -1);
D = diag(diag(A));
nGauss = L + D;
itGauss = I - inv(nGauss)*A;
radEspGauss = max(abs(spec(itGauss)));

printf("Los radios espectrales de las matrices de iteracion de Jacobi y Gauss-Seidel son:\n");
disp(radEspJac);
disp(radEspGauss);

// Al ser mas chico el radio espectral de la matriz de iteracion del metodo
// de Gauss-Seidel sabemos que este es el metodo que mas rapido converge.

//-----------------------------------------------------------------------------

// Queremos encontrar un parametro de relajacion w que mejore la tasa de
// convergencia. Esto es si Tw es la matriz de iteracion del metodo SOR,
// buscamos un w tal que el radio espectral de Tw sea minimo.

// Hagamos una funcion que dada una matriz A y el w, me devuelva
// el radio espectral de Tw
function rho = radio_espectral_sor(A, w)
    L = tril(A, -1);
    D = diag(diag(A));
    U = triu(A, 1);
    tw = inv(D + w*L)*((1-w)*D-(w*U));
    rho = max(abs(spec(tw)));
endfunction

// Ahora hagamos una funcion que prueba algunos parametros w y encuentre 
// el que me da un menor radio espectral para tw.
function [w, minRho] = min_radio_espectral(A)
    // Inicializamos en 100 ya que sabemos que al menos Gauss-Seidel tiene
    // un rho menor.
    minRho = 100; 
    w = 0;
    for i=0:0.1:2
        rhoAct = radio_espectral_sor(A, i);
        if rhoAct < minRho then
            minRho = rhoAct;
            w = i;
        end
    end
endfunction

// Ejecutamos la funcion con A y obtenemos
[w, minRho] = min_radio_espectral(A);
printf("Un parametro w que acelera la convergencia con los metodos de relajacion es:\n");
disp(w);
printf("En este caso el radio espectral de Tw es es:\n");
disp(minRho);

// Usemos este w encontrado para aplicar el metodo de relajacion.
solRelax = metodo_relajacion(A, b, w, x0, eps);
printf("La solucion es:\n");
disp(solRelax);
