// Dada una funcion y un punto x, la funcion devuelve la evaluacion de la 
// derivada primera de f en el punto x.
function y = derivada_primera(f, x, h)
    y = (f(x+h) - f(x-h)) / (2*h);
endfunction

// Dada una funcion, un punto x0 incial, una tolerancia eps de error, una
// cantidad maxima de iteraciones y un paso h para obtener la derivada numerica,
// la funcion devuelve una raiz de f aplicando el metodo de Newton.
function raiz = metodo_newton(f, x0, eps, maxIter, h)
    encontreRaiz = 0;
    it = 0;
    xAnt = x0;

    while ((encontreRaiz == 0) & (it < maxIter))
        fDer = derivada_primera(f, xAnt, h);
        if fDer <> 0 then
            xSig = xAnt - f(xAnt)/fDer;
        else
            error("La derivada se anulo en un punto de la iteracion");
            abort;
        end
        
        // Paramos si la distancia entre las iteraciones es menor
        // a eps y si la cercania al cero es menor a eps.
        if ((abs(xSig - xAnt) < eps) & (abs(f(xSig)) < eps)) then
            encontreRaiz = 1;
            raiz = xSig;
        else
            xAnt = xSig;
            it = it + 1;
        end
    end
    
    if (encontreRaiz == 0) then
        error("Se alcanzo el maximo de iteraciones y no se encontro la raiz.");
        abort;
    end
endfunction
