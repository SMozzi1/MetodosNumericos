function [Q,R] = facotrizacionQR(A, maxIter)
    [m,n] = size(A);
    if m<n then
        printf("No se puede realizar la facotrizacion QR de esta matriz");
        return;
    end
    Q = zeros(m,n);
    R = zeros(n,n);
    
    // caso base
    v = A(:,1);
    Q(:,1) = v / norm(v,%inf);
    iter = 1;
    // iteracion
    k = 2;
    while (k <= n) & (iter < maxIter)
        v = (A(:,k) - (A(:,k)' * Q(:,1:k-1)) * Q(:,1:k-1));
        Q(:,k) = v / norm(v);
        R(1:k,k) = Q(:,1:k)' * A(:,k); // R = Qt * A (Sabemos que A = QR y Q * Qt = I)
        k = k +1;
        iter = iter + 1;
    end
     
endfunction
