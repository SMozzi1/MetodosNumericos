// Integrales dobles

function y = trapecio_compuesto_2_variables(f, x, a, b, n)
    // Entrada: f funcion de dos variables, variable x para dejar fija
    // en la primer componente de x, a,b numeros del intervalo de integracion
    // n la cantidad de subintervalos a dividir el metodo del trapecio.
    // Salida: aproximacion usando el metodo del trapecio de la integral
    // de f con extremos a y b.
     h = (b - a) / n;
     y = (1/2) * f(x ,a) + (1/2) * f(x, b);
     for j = 1:n-1
         y = y + f(x, a + h*j);
     end
     y = h * y;
endfunction

function y = intg_doble(f, a, b, c, d, n, m)
    // Entrada: f funcion de dos variables, a,b numeros del intervalo de 
    // integracion de la primer integral, c y d funciones dependientes
    // de x, usadas como extremo de la segunda integral, n la cantidad de 
    // subintervalos a dividir el metodo del trapecio en el eje x, y m 
    // la cantidad de subintervalos en el eje y.
    // Salida: aproximacion de la doble integral.
     h = (b - a) / n;
     Ga = trapecio_compuesto_2_variables(f, a, c(a), d(a), m);
     Gb = trapecio_compuesto_2_variables(f, b, c(b), d(b), m);
     y = (1/2) * Ga + (1/2) * Gb;

     for j = 1:n-1
         xj = a + h*j;
         Gj = trapecio_compuesto_2_variables(f, xj, c(xj), d(xj), m);
         y = y + Gj;
     end
     y = h * y;
endfunction
