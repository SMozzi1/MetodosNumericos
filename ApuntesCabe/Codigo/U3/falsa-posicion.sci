// Dada una funcion, un intervalo [a,b] y una tolerancia de error, la funcion
// retorna una raiz de f(x) = 0 usando el metodo de la falsa posicion.
function raiz = falsa_posicion(f, a, b, eps)
    fA = f(a);
    fB = f(b);
    if fA*fB < 0 then
        encontreRaiz = 0;
        while (encontreRaiz == 0)
            if (fB - fA == 0) then
                error("f(b) - f(a) = 0");
                abort;
            end
            c = b - fB*((b-a)/(fB-fA));
            fC = f(c);
            if (abs(fC) < eps) then
                encontreRaiz = 1;
                raiz = c;
            else 
                if fC*fA < 0 then
                    b = c;
                    fB = fC;
                else
                    a = c;
                    fA = fC;
                end
            end
        end
    else
        error("f(a) y f(b) deben tener distinto signo y ninguno puede ser la raiz");
        abort;
    end
    
    if (encontreRaiz == 0) then // No deberia pasar pues siempre converge
        error("No se encontro raiz");
        abort;
    end
endfunction
