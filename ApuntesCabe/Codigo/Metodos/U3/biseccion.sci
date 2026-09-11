// Dada una funcion, un intervalo [a,b] y una toleracia de error, la funcion
// devuelve una raiz de la funcion en ese intervalo.
function raiz = biseccion(f, a, b, eps)
    fa = f(a);
    fb = f(b);

    if fa*fb < 0 then
        encontreRaiz = 0;
        while ~encontreRaiz
            c = (a + b) / 2;
            fc = f(c);
            if fc == 0 | b - c <= eps then
                raiz = c;
                encontreRaiz = 1;
            else 
                if fc*fb < 0 then
                    a = c;
                    fa = fc;
                else
                    b = c;
                    fb = fc;
                end
            end
        end
    else
        error("Intervalo invalido: f(a) y f(b) deben tener signos opuestos");
    end
endfunction
