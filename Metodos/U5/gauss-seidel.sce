// Gauss-Seidel
// xi^{k+1} = 1/aii (bi - sum_{j=1}^{i-1} aij xj^{k+1}
//                      - sum_{j=i+1}^{n} aij xj^{k})

function x = gauss(A,b,x0,eps)
    n = size(A,1);
    D = diag(A);
    x = x0;
    err = eps + 1;
    count = 0;
    while (err>eps)
        xk = x;
          for i=1:n
          x(i) = (b(i)- A(i,:)*x + D(i)*x(i))/D(i);
          end
        err = norm(x-xk);
        count = count + 1;
    end
    disp(count,"Iter Gauss-Seidel");
endfunction

function x = sor_tridiagonal(A, b, x0, eps)
    n = size(A, 1);
    
    // Cálculo del w 
    D = diag(A);
    T_j = eye(n,n) - diag(1./D) * A;
    rho = max(abs(spec(T_j)));
    w = 2 / (1 + sqrt(1 - rho^2));
    
    //Iteraciones 
    x = x0;
    err = eps + 1;
    count = 0;
    
    while (err > eps)
        xk = x;
        
        // Fila 1
        x(1) = (1-w)*x(1) + w*(b(1) - A(1,2)*x(2)) / A(1,1);
        
        // medio
        for i = 2:(n-1)
            x(i) = (1-w)*x(i) + w*(b(i) - A(i,i-1)*x(i-1) - A(i,i+1)*x(i+1)) / A(i,i);
        end
        
        // ultima
        x(n) = (1-w)*x(n) + w*(b(n) - A(n,n-1)*x(n-1)) / A(n,n);
        
        // Verificación de convergencia con norma infinito
        err = norm(x - xk, %inf);
        count = count + 1;
    end
    
    disp(w, "Omega óptimo");
    disp(count, "Iteraciones:");
endfunction
