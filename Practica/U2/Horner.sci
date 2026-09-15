function x = Horner(p, x0)
    n = degree(p);
    x = coeff(p,n);
    while (n > 0)
        bn = coeff(p,n-1)
        x = bn + x * x0;
        bn = coeff(p, n-1);
        n = n-1;
    end
endfunction
