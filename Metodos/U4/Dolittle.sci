// Por lo que entiendo del metodo tenes que ir construyendo las filas de 
// y las columnas de L simultaneamente ya que son las que se utilizan parael proximo elemento. El chiste está en aprovechar que la matriz U al ser la matriz escalonada y que la matriz L en L(1,1) tiene un 1 entonces en la matriz U la primer fila serán exactamente los elementos de la primer fila de la matriz A. luego con la primer fila de A podemos entonces calcular la primer columna de L pues el elemento U(1,1) será el valor por el cual se tendría que dividir si estuviesemos escalonando común.

// Como para cada valor si expresamos la sumatoria solo necesitaremos datos desconocidos cuando lleguemos al termino actual. es decir k= i ó k=j (dependiendo cual era menor). Pero todos los anteriores terminos de la sumatoria son datos conocidos. es sobre esto que se apoya el metodo dolittle 

function [U,L] = dolittle(A)
    [ia,ja] = size(A);
    n = ia;
    U = zeros(n,n);
    L = zeros(n,n);
    for i = 1: n
        L(i,i) = 1;
    end
    U(1,:) = A(1,:); // primer fila de U
    L(:,1) = A(:,1) / U(1,1); // primer columna de L
// metodo dolittle

for k = 2: n
    U(k,k:n) = A(k,k:n) - L(k, 1:k-1) * U(1:k-1,k:n);
    L(k+1:n,k) = (A(k+1:n,k) - L(k+1:n, 1:k-1) * U(1:k-1,k)) / U(k,k);
end
    
endfunction

function [y] = sustProg(A, b)
    // sustitucion progresiva (Ly = Pb)
    [fa,ca] = size(A);
    n = fa;
    y = zeros(n);
    y(1) = b(1); // Notamos que todo L(k,k) = 1.
    for k=2 : n
        sumk = 0;
        for i = 1 : k-1 
            sumk = sumk + A(k,i) * y(i);
        end
        y(k) = b(k) - sumk;
    end
endfunction

function [x] = sustReg(A, y)
    // sustitucion regresiva (Ux = y)
    [fa,ca] = size(A);
    n = fa;
    x = zeros(n)
    x(n) = y(n) / A(n,n);
    for k = n-1 : -1: 1
        sumk = 0;
        for i = k+1 : n
            sumk = sumk + A(k,i) * x(i);
        end;
        x(k) = (y(k) - sumk) / A(k,k);
    end
endfunction

A = [1 2 3 4; 1 4 9 16; 1 8 27 64; 1 16 81 256];
b = [2 10 44 190]'

// Sabemos que LU = A entonces LUx = b => Ly = b con y = Ux
[U,L] = dolittle(A);
y = sustProg(L,b);
x = sustReg(U,y);

disp(A);
disp(U);
disp(L);
disp(b);
disp(x);
