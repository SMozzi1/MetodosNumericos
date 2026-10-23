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
