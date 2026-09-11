// Ejercicio 1

function [x1, x2] = raices_robustas(a,b,c)
    if b < 0 then
        x1 = -2*c / (-b+sqrt(b^2 - 4*a*c))
        x2 = (-b + sqrt(b^2 -4*a*c)) / (2*a)
        
    end
    
    if b >=0 then
        x1 = -2*c / (-b-sqrt(b^2 - 4*a*c))
        x2 = (-b + sqrt(b^2 -4*a*c)) / (2*a)
    end
    
endfunction

// Ejercicio 2


// Metodo de Newton
// f funcion a aproximar
// h 
// x0 el punto alrededor del que aproximamos
// tol es el valor maximo de error que aceptamos (condicion de parada)
// max_iter cantidad maxima de iteraciones que vamos a permitir

function [x, iter] = newtonN(f,h,x0,tol,max_iter)
    x = x0;
    iter = 0;
    error_paso = tol + 1;
    while (error_paso >= tol) & (iter < max_iter)
        f_val = f(x);
        f_x_h = f(x + h);
        df_val = (f_x_h - f_val) / h; // calculo derivada
        x_prev = x;
        x_new = x_prev - f_val / df_val;
        error_paso = abs(x_new - x_prev);
        x = x_new
        iter = iter + 1;
    end
    if (iter == max_iter) & (error_paso >= tol) then
        disp("Se llego a la cantidad maxima de iteraciones permitidas sin converger");
    end
endfunction

function [x, iter] = newtonOP(f,h,x0,tol,max_iter)
    x = x0;
    iter = 0;
    dx = tol + 1;
    while (abs(dx) >= tol) & (iter < max_iter)
        f_val = f(x);
        f_x_h = f(x + h);
        df_val = (f_x_h - f_val) / h; // calculo derivada
        dx = f_val / df_val
        x = x - dx;
        iter = iter + 1;
    end
    if (iter == max_iter) & (abs(dx) >= tol) then
        disp("Se llego a la cantidad maxima de iteraciones permitidas sin converger");
    end
endfunction
