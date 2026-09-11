// Interpolacion de Lagrange

function polLk = Lk(x, k)
    [filX, colX] = size(x);
    r = [x(1:k-1) x(k+1:colX)];
    p = poly(r, "x", "roots");
    pk = horner(p, x(k));
    polLk = p / pk;
endfunction

function polLagr = interpolacion_lagrange(x, y)
    [filX, colX] = size(x);
    if filX <> 1 then
        error("interpolacion_lagrange: Los puntos x deben ser dados como vector fila.");
        abort;
    end
    [filY, colY] = size(y);
    if filY <> 1 then
        error("interpolacion_lagrange: Los puntos y deben ser dados como vector fila.");
        abort;
    end
    if colY <> colX then
        error("interpolacion_lagrange: Los vectores x e y deben tener la misma cantidad de componentes");
        abort;
    end
    
    n = colX;
    polLagr = 0;
    for k = 1:n
        polLagr = polLagr + Lk(x,k)*y(k)
    end
endfunction
