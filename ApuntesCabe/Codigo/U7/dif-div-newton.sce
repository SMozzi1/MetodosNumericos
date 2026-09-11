// Diferencias divididas de Newton

function DD = dif_div(x, y)
    [filX, colX] = size(x);
    n = colX;
    if n == 1 then
        DD = y(1);
    elseif n == 2 then
        DD = (y(2) - y(1)) / (x(2) - x(1));
    else 
        DD = (dif_div(x(2:n), y(2:n)) - dif_div(x(1:n-1), y(1:n-1))) / (x(n) - x(1));
    end
endfunction

function polNew = dif_div_newton(x,y)
    [filX, colX] = size(x)
    if filX <> 1 then
        error("dif_div_newton: Los puntos x deben ser dados como vector fila.");
        abort;
    end
    [filY, colY] = size(y);
    if filY <> 1 then
        error("dif_div_newton: Los puntos y deben ser dados como vector fila.");
        abort;
    end
    if colY <> colX then
        error("dif_div_newton: Los vectores x e y deben tener la misma cantidad de componentes.");
        abort;
    end
    
    n = colX;
    polAux = poly(0,"x"); // x
    polNew = dif_div(x, y); 
    for k = n - 1:-1:1
        polNew = dif_div(x(1:k), y(1:k)) + (polAux - x(k))* polNew;
    end 
endfunction
