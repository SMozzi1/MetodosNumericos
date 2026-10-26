function TR = crear_tridiagonal(sup, med, inf, n)
  TR =  sup * diag(ones(n-1,1),1) + med * eye(n,n) + inf * diag(ones(n-1,1),-1)
endfunction

function x = Sor(A,b,x0,iter,tol,w)
    n = size(A,1)
    x = x0;
    x0(1) = (1-w)*x0(1) + w*(b(1)-A(1,2:n)*x0(2:n))/A(1,1);
    for i = 2:1:n-1
        x0(i) = (1-w)*x0(i) + w*(b(i) - A(i,1:i-1)*x0(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i);
    end
    x0(n) = (1-w)*x0(n) + w*(b(n) - A(n,1:n-1)*x0(1:n-1))/A(n,n);
    it = 1;
    err = norm(x0-x);
    
    while(err > tol && it < iter)
        x = x0;
        x0(1) = (1-w)*x0(1) + w*(b(1)-A(1,2:n)*x0(2:n))/A(1,1);
        for i = 2:1:n-1
            x0(i) = (1-w)*x0(i) + w*(b(i) - A(i,1:i-1)*x0(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i);
        end
        x0(n) = (1-w)*x0(n) + w*(b(n) - A(n,1:n-1)*x0(1:n-1))/A(n,n);
        it =it + 1;
        err = norm(x0-x);
    end
    disp(it)
endfunction

function x = SORpresa(A,b,x0,eps,iter,w)
    n = size(A,1);
    x = x0;
    cont = 0;
    delta = 2*eps; // para la primera iteracion
    suma = 0;
    invD = 1 ./ diag(A);
    A = A - eye(A) .* A; // borra la diagonal de A
    
    while (delta > eps && cont < iter)
        xk = x;
        for i = 1:n
            suma = sum(A(i,1:n) .* x(1:n)');
            x(i) = (1-w) * x(i) + w * invD(i)*(b(i)-suma);
        end
        cont = cont + 1;
        delta = norm(x-xk);
    end
    disp("Iteraciones = "+string(cont));
endfunction


function x = SORpresa_largo(A,b,x0,eps,iter,w)
    n = size(A,1);
    cont = 1;
    
    suma = 0;
    invD = 1 ./ diag(A);
    A = A - eye(A) .* A; // borra la diagonal de A
    x = x0;
    
    suma = sum(A(1,2:n) .* x0(2:n)');
    x0(1) = (1-w) * x0(1) + w * invD(1)*(b(1)-suma)
    
    for i = 2:n-1
      suma = sum(A(i,1:n) .* x0(1:n)');
      x0(i) = (1-w) * x0(i) + w * invD(i)*(b(i)-suma);
    end
    
    suma = sum(A(n,1:n) .* x0(1:n)');
    x0(n) = (1-w) * x0(n) + w * invD(n)*(b(n)-suma)
    delta = norm(x0-x);
    
    while (delta > eps && cont < iter)
      x = x0;
      suma = sum(A(1,1:n) .* x0(1:n)');
      x0(1) = (1-w) * x0(1) + w * invD(1)*(b(1)-suma)
      
      for i = 2:n-1
        suma = sum(A(i,1:n) .* x0(1:n)');
        x0(i) = (1-w) * x0(i) + w * invD(i)*(b(i)-suma);
      end
      
      suma = sum(A(n,1:n) .* x0(1:n)');
      x0(n) = (1-w) * x0(n) + w * invD(n)*(b(n)-suma)
      cont = cont + 1;
      delta = norm(x0-x);
    end
    disp("Iteraciones = "+string(cont));
endfunction

function w = omega_opt(A)
    // A es Definida Positiva y Tridiagonal
    n = size(A,1);
    T_j = eye(n,n) - diag(1./diag(A))*A;
    autovalores = spec(T_j);
    rho = max(abs(autovalores)); // Se puede usar eigs
    w = 2/(1 + sqrt(1-rho**2));
endfunction

A = crear_tridiagonal(-1,4,-1, 200);
       
b = zeros(1,200)';
b(200) = 1;
       
x0 = zeros(1,200)';

//invN = crear_tridiagonal(0,4,-1,20);
//disp(invN);
//matrizpicada = eye(20,20) - invN * A;
//disp("");
//disp(matrizpicada);
//disp(spec(matrizpicada));

w = omega_opt(A);

tic();
z1 = SORpresa_largo(A,b,x0,1e-6,1000,w);
t1 = toc();
//
disp("Tiempo :" + string(t1));
//disp("Respuesta: ");
//disp(z1);
//disp("Producto: ");
//disp(A*z1);

disp("");
tic();
z2 = Sor(A,b,x0,1000,1e-6,w);
t2 = toc();
//
disp("Tiempo :" + string(t2));
//disp("Respuesta: ");
//disp(z2);
//disp("Producto: ");
//disp(A*z2);
tic();
z1 = SORpresa(A,b,x0,1e-6,1000,w);
t3 = toc();
disp("Tiempo :" + string(t3));


