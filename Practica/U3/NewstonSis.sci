function F = sistema(x)
    F = zeros(2,1);
    // ecuacion 1
    F(1) = x(1)^2 + x(2)^2 - 1;
    // ecuacion 2
    F(1) = x(1)^2 - x(2)^2 - 1;
endfunction

function [x,iter] = newton_sis(F,h,x0,tol,max_iter)
    x = x0
    n = length(x);
    iter = 0;
    error_depaso = tol + 1;
    while(error_depaso >= tol) & (inter < max_iter)
        F_val = F(x); // ahora es f_val es un vector
        J = zeros(n,n) // crea una matriz nxn de ceros
        for j = 1;n
            x_h = x;
            x_h(j) = x_h(j) + h; // el h que nos desplazamos en el ci
            F_x_h = F(x_h);
            J(:,j) = (F_x_h - F_val) / h
        end
        dx = inv(J)*F_val
        x = x - dx;
        iter = iter + 1;
        error_depaso = norm(dx)
           
         
    end
endfunction


