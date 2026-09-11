// Regla del trapecio

function y = trapecio(f, a, b)
    // Entrada: f funcion, [a, b] intervalo en el cual evaluar la integral
    // de f.
    // Salida: aproximacion de la integral de f en a,b por metodo del trapecio.
     h = b - a;
     y = (h/2) *(f(a) + f(b));
endfunction

function y = trapecio_compuesto(f, a, b, n)
    // Entrada: f funcion, [a, b] intervalo en el cual evaluar la integral
    // de f, n cantidad de subintervalos
    // Salida: aproximacion de la integral de f en a,b por metodo del trapecio
    // compuesto.
     h = (b - a) / n;
     y = (1/2) * f(a) + (1/2) * f(b);
     for j = 1:n-1
         y = y + f(a + h*j);
     end
     y = h * y;
endfunction
