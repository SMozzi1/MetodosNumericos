// Ejercicio 3

function solve()
    A = [1 -1 0; -2 4 -2; 0 -1 1]; // Declaramos asi la matriz y luego sumamos eps.
    for k = 0:10
        eps = 0.1*k;
        A(3,3) = 1 + eps;
        car = poly(A, "x"); // Calcula el caracteristico
        printf("Polinomio caracteristico con k = %d", k);
        disp(car);
        printf("Aproximacion de raices:");
        disp(roots(car));
        printf("Autovalores:");
        disp(spec(A));
        printf("\n---------\n");
    end
endfunction
