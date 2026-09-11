// Ejercicio 11.

function solve()
    A = [16 -12 8 -16; -12 18 -6 9; 8 -6 5 -10; -16 9 -10 46];
    printf("Matriz A\nCatedra 1\n")
    [U,ind] = cholesky1(A);
    disp(U)
    disp(ind)
    printf("Catedra 2\n")
    [U,ind] = cholesky2(A);
    disp(U)
    disp(ind)
    printf("Propio\n")
    U = cholesky(A);
    disp(U)
    
    B = [4 1 1; 8 2 2; 1 2 3]
    printf("Matriz B\nCatedra 1\n")
    [U,ind] = cholesky1(B);
    disp(U)
    disp(ind)
    printf("Catedra 2\n")
    [U,ind] = cholesky2(B);
    disp(U)
    disp(ind)
    printf("Propio\n")
    U = cholesky(B);
    disp(U)
    
    C = [1 2; 2 4]
    printf("Matriz C\nCatedra 1\n")
    [U,ind] = cholesky1(C);
    disp(U)
    disp(ind)
    printf("Catedra 2\n")
    [U,ind] = cholesky2(C);
    disp(U)
    disp(ind)
    printf("Propio\n")
    U = cholesky(C);
    disp(U)
    
endfunction

solve();
