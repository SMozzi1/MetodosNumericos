// Polinomio de Chebyshev

// Raíces del polinomio de Chebyshev.
function y = raices_chebyshev(n)
    // Entrada: n = grado del polinomio de Chebyshev
    // Salida: vector con las raices del polinomio de Chebyshev
    for i=0:(n-1)
        y(i+1)=cos((2*i+1)*%pi/(2*n));
    end
endfunction

// Raíces del polinomio de Chebyshev para un intervalo [a,b].
function y = raices_chebyshev_ab(n,a,b)
    for i=0:(n-1)
        y(i+1)=cos((2*i+1)*%pi/(2*n));
    end
    y = ((b-a)*y + (b+a))/2;
endfunction

function w = pol_chebyshev(x,n)
    // Entrada: n = número natural; x = número real
    // Salida: Polinomio de Chebyshev de grado n evaluado en x
    if n==0 then
        w = 1
    elseif n==1 then
        w = x
    elseif n==2 then
        w = 2*x.^2-1
    else
        w = 2*x.*pol_chebyshev(x,n-1)-pol_chebyshev(x,n-2)
    end
endfunction
