// Ejercicio 5
// El ejercicio necesita de que el metodo de la potencia sea ejecutado
// previamente.

function solve()
    A1 = [6 4 4 1; 4 6 1 4; 4 1 6 4; 1 4 4 6];
    printf("Sistema 1: Solucion catedra:\n");
    [a1Cat, v1Cat] = mpotencia(A1, [2; 1; 4; -1], 10e-8, 100);
    disp(a1Cat);
    disp(v1Cat);
    printf("Solucion propia:\n");
    [v1, a1] = metodo_potencia(A1, [2; 1; 4; -1], 10e-8, 100);
    disp(a1);
    disp(v1);
    printf("Autovalor maximo:");
    disp(max(spec(A1)));
    
    A2 = [12 1 3 4; 1 -3 1 5; 3 1 6 -2; 4 5 -2 -1];
    printf("Sistema 2: Solucion catedra:\n");
    [a2Cat, v2Cat] = mpotencia(A2, [2; 1; 4; -1], 10e-8, 100);
    disp(a2Cat);
    disp(v2Cat);
    printf("Solucion propia:\n");
    [v2, a2] = metodo_potencia(A2, [2; 1; 4; -1], 10e-8, 100);
    disp(a2);
    disp(v2);
    printf("Autovalor maximo:");
    disp(max(spec(A2)));
endfunction
