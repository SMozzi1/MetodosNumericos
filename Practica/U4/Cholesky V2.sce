clc
clear
// A = Ut * U
function [U,ind] = cholesky(A)
// Factorización de Cholesky.
// Trabaja únicamente con la parte triangular superior.
//
// ind = 1  si se obtuvo la factorización de Cholesky.
//     = 0  si A no es definida positiva
//
//******************
eps = 1.0e-8
//******************

n = size(A,1)
U = zeros(n,n)

t = A(1,1)
if t <= eps then
    printf('Matriz no definida positiva.\n')
    ind = 0
    return
end
// calculo diagonal de U
U(1,1) = sqrt(t)
// calculo de la fila j de u (la que está a la derecha de nuestra diagonal)
U(1,2:n) = A(1,2:n)/U(1,1)
// En cada iteracion primero nos vemos obligados a hallar la diagonal de U y como esto se halla multiplicando la columna k de Ut por la fila k de U entonces tenemos todas las entradas al cuadrado (despejamos al pasar restando al valor de la entrada kk de A)
for k = 2:n
    t = A(k,k) - U(1:k-1,k)'*U(1:k-1,k)
    if t <= eps then
        printf('Matriz no definida positiva.\n')
        ind = 0
        return
    end
    U(k,k) = sqrt(t)
    // ahora nos gustaria hallar cada fila j de U
    U(k,k+1:n) = ( A(k,k+1:n) - U(1:k-1,k)'*U(1:k-1,k+1:n) )/U(k,k)
end
ind = 1

endfunction


// el código parece algo complejo pero literalmente sale de que calculamos cada entrada de a multiplicando una fila de Ut con una columna de U y despejando.
A = [4 1 1; 8 2 2; 1 2 3]

[U,ind] = cholesky(A)
disp(U)
disp(ind)


B = [5 2 1 0; 2 5 2 0; 1 2 5 2; 0 0 2 5]
disp(B)
[U,ind] = cholesky(B)
disp(U)
disp(ind)

C = [5 2 1 0; 2 -4 2 0; 1 2 2 2; 0 0 2 5]
disp(C)
[U,ind] = cholesky(C)


