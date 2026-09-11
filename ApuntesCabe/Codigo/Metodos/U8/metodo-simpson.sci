// Regla de Simpson

function y = simpson(f, a, b)
    // Entrada: f funcion, [a, b] intervalo en el cual evaluar la integral
    // de f.
    // Salida: aproximacion de la integral de f en a,b por metodo de Simpson.
     h = (b - a) / 2;
     y = (h/3) *(f(a) + 4* f(a + h) + f(b));
endfunction

function y = simpson_compuesto(f, a, b, n)
    // Entrada: f funcion, [a, b] intervalo en el cual evaluar la integral
    // de f, n cantidad de subintervalos, debe ser n par.
    // Salida: aproximacion de la integral de f en a,b por metodo compuesto de
    // Simpson.
     h = (b - a) / n;
     y = f(a) + 4 * f(a + h) + f(b);
     for j = 2:2:n-1
         y = y + 2* f(a + h*j) + 4* f(a + h*(j + 1));
     end
     y = (h / 3) * y;
endfunction
