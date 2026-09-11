// Dado un sistema de ecuaciones no lineales f, un vector columna x0, una 
// tolerancia y un maximo de iteraciones, la funcion devuelve la solucion
// del sistema aplicando el metodo de newton.
function raiz = newton_multivariable(f, x0, eps, maxIter)
    xAnt = x0;
    fAnt = f(x0);
    J = numderivative(f, xAnt);
    encontreSol = 0;
    it = 0;
    
    while ((encontreSol == 0) & (it < maxIter))
        if det(J) <> 0 then
            xSig = xAnt - inv(J)* fAnt;
        else
            error("Matriz Jacobiana singular");
            abort;
        end
        
        fSig = f(xSig);
        if ((norm(xSig - xAnt) < eps) & (norm(fSig) < eps)) then
            encontreSol = 1;
            raiz = xSig;
        else
            xAnt = xSig;
            fAnt = fSig;
            J = numderivative(f, xAnt);
            it = it + 1;
        end
    end
    
    if encontreSol == 0 then
        error("No se encontro solucion en el maximo de iteraciones dado.");
        abort;
    end
endfunction
