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

//function x = gaussSor(A,b,x0,eps)
//    n = size(A,1);
//    D = diag(A);
//    x = x0;
//    err = eps + 1;
//    count = 0;
//    T = 
//    w = 2 / (1 + sqrt(1 - (max(abs(spec(A))))^2));
//    while (err>eps)
//        xk = x;
//          for i=1:n
//          x(i) = (1-w)*x(i) + ((b(i) - A(i,:) * x + D(i)*x(i))*w/D(i);
//          end
//        err = norm(x-xk);
//        count = count + 1;
//    end
//    disp(count,"Iter Gauss-Seidel-Sor");
//endfunction


function x = sor_tridiagonal(A, b, x0, eps)
    n = size(A, 1);
    
    // 1. Cálculo del w óptimo (válido por ser tridiagonal y def. positiva)
    D = diag(A);
    T_j = eye(n,n) - diag(1./D) * A;
    rho = max(abs(spec(T_j)));
    w = 2 / (1 + sqrt(1 - rho^2));
    
    // 2. Iteraciones SOR ultra-optimizadas
    x = x0;
    err = eps + 1;
    count = 0;
    
    while (err > eps)
        xk = x;
        
        // Fila 1: Solo mira a su derecha (superdiagonal)
        x(1) = (1-w)*x(1) + w*(b(1) - A(1,2)*x(2)) / A(1,1);
        
        // Filas centrales: Miran exactamente un paso atrás y un paso adelante
        for i = 2:(n-1)
            x(i) = (1-w)*x(i) + w*(b(i) - A(i,i-1)*x(i-1) - A(i,i+1)*x(i+1)) / A(i,i);
        end
        
        // Fila n: Solo mira a su izquierda (subdiagonal)
        x(n) = (1-w)*x(n) + w*(b(n) - A(n,n-1)*x(n-1)) / A(n,n);
        
        // Verificación de convergencia con norma infinito
        err = norm(x - xk, 'inf');
        count = count + 1;
    end
    
    disp(w, "Omega óptimo calculado:");
    disp(count, "Iteraciones SOR Tridiagonal:");
endfunction
