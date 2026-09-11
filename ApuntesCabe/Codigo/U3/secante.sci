// Dada una funcion, un dos puntos x0, x1, una tolerancia de error y un maximo
// de iteraciones, la funcion devuelve una raiz de la funcion, usando el metodo
// de la secante.
function raiz = secante(f, x0, x1, eps, maxIter)
    it = 0;
    xAnt = x0;
    xSig = x1;
    encontreRaiz = 0;
    fAnt = f(xAnt);
    fSig = f(xSig);

    while ((encontreRaiz == 0) & (it < maxIter))
        if fSig - fAnt == 0 then
            error("f(xn) - f(xn-1) = 0");
            abort;
        end
        
        xNueva = xSig - fSig*((xSig - xAnt) / (fSig - fAnt));
        fNueva = f(xNueva);
        if ((abs(xNueva - xSig) < eps) & (abs(fNueva) < eps)) then
            encontreRaiz = 1;
            raiz = xNueva
        else
            xAnt = xSig;
            xSig = xNueva;
            fAnt = fSig;
            fSig = fNueva;
            it = it + 1;
        end
    end

    if (encontreRaiz == 0) then
        error("Se supero el maximo de iteraciones y no se encontro raiz");
        abort;
    end
endfunction
