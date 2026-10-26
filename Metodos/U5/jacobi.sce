// jacobi
// xi^(k+1) = 1/aii (bi - sum_{j=1,j/=i}^{n} aij xj^{k})

function x = jacobi(A,b,x0,eps)
    D = diag(A);
    x = x0;
    err = eps + 1;
    count = 0;
    while (err>eps)
        xk = x;
        x = (b - A*xk + D.*xk) ./D;
        err = norm(x-xk);
        count = count + 1;
    end
    disp(count,"Iter Jacobi");
endfunction


