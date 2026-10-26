function [valor, zn] = potencia(A, z0, eps, maxIter)
    w = A*z0;
    zn = w / norm(w, %inf);
    [x, j] = max(abs(w));
    valor = w(j) / z0(j);
    iter = 1;
    while (iter <= maxIter) & (norm(z0 - zn, %inf) > eps)
        z0 = zn;
        w = A*zn;
        [x,j] = max(abs(w));
        valor = w(j) / zn(j);
        zn = w / norm(w, %inf);
        iter = iter + 1;
    end
    printf("Iteraciones %d\n", iter); 
endfunction


function [valor, zn, hist] = potenciaConErr(A, z0, eps, maxIter)
    hist = zeros(maxIter, 1);
    autovals = spec(A);
    valDom = max(abs(autovals));
    w = A*z0;
    zn = w / norm(w, %inf);
    [x, j] = max(abs(w));
    valor = w(j) / z0(j);
    iter = 1;
    hist(iter) = norm(valDom - valor, %inf);
    while (iter <= maxIter) & (norm(z0 - zn, %inf) > eps)
        z0 = zn;
        w = A*zn;
        [x,j] = max(abs(w));
        valor = w(j) / zn(j);
        zn = w / norm(w, %inf);
        iter = iter + 1;
        hist(iter) = norm(valDom - valor, %inf);
    end
    hist = hist(1:iter-1);
    printf("Iteraciones %d\n", iter); 
endfunction
z0 = rand(4,1);
eps = 1e-8;
A1 = [6 4 4 1; 4 6 1 4; 4 1 6 4; 1 4 4 6];
[val1, vect1,hist1] = potenciaConErr(A1, z0, eps, 1000);
disp(val1, "valor dominante");
disp(vect1, "vector dominante");
disp(hist1, "vector de errores");
A2 = [12 1 3 4; 1 -3 1 5; 3 1 6 -2; 4 5 -2 -1];
[val2, vect2,hist2] = potenciaConErr(A2, z0, eps, 1000);
disp(val2, "valor dominante");
disp(vect2, "vector dominante");
disp(hist2, "vector de errores");
