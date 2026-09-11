// Ejercicio 2b)

function solve()
    A = eye(6,6);
    for i = 2:6
        A(1,i) = 1/4;
        A(i,1) = 1/4;
    end
    U = cholesky(A);
    printf("Matriz U de la primera factorizacion de Cholesky:\n");
    disp(U);
    
    B = eye(6,6);
    for i = 1:5
        B(6,i) = 1/4;
        B(i,6) = 1/4;
    end
    T = cholesky(B);
    printf("Matriz T de la segunda factorizacion de Cholesky:\n");
    disp(T);
endfunction

solve();
