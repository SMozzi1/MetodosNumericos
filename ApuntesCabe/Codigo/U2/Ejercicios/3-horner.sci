// Funcion que dado un polinomio y un punto, devuelve la evaluacion del
// polinomio en el punto y la evaluacion de la derivada del polinomio en ese
// punto
function [val, deriv] = miHorner(p, x0)
    n = degree(p);
    val = coeff(p, n); // bn = an
    if n == 0 then
        deriv = 0;
    else
        deriv = val; // Voy a aplicar el algorimo horner en q para obtener 
        // q(x0) y luego P'(x0)
    end

    for i=n-1:-1:0
        bi = coeff(p,i) + x0*val;
        val = bi;
        if i <> 0 then
            deriv = val + x0*deriv;
        end
    end
endfunction
